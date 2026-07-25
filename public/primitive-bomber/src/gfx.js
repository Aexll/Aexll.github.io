// gfx.js — rendu WebGL2 : primitives SDF instanciées + post-traitement bloom.
//
// Tout le jeu est dessiné avec un seul quad instancié. Chaque instance porte une
// forme signée (disque, boîte, contour, arc) évaluée dans le fragment shader, avec
// un halo exponentiel additif. Une passe de bloom en HDR donne l'aspect "brillant".

export const SHAPE = { DISC: 0, BOX: 1, BOX_OUTLINE: 2, ARC: 3 };

const FLOATS_PER_INST = 16;
const MAX_INST = 6000;
const TAU = Math.PI * 2;

// ---------------------------------------------------------------- shaders

const SCENE_VS = `#version 300 es
layout(location=0) in vec2 a_quad;
layout(location=1) in vec4 a_posSize;  // xy = centre monde, zw = demi-étendue du quad
layout(location=2) in vec4 a_color;    // rgb + alpha du coeur
layout(location=3) in vec4 a_params;   // paramètres de la forme
layout(location=4) in vec4 a_style;    // x=forme y=halo z=atténuation w=libre

uniform vec4 u_view;                   // xy = centre caméra, zw = échelle -> clip

out vec2 v_p;
out vec4 v_color;
out vec4 v_params;
out vec4 v_style;

void main() {
  v_p = a_quad * a_posSize.zw;
  vec2 world = a_posSize.xy + v_p;
  gl_Position = vec4((world - u_view.xy) * u_view.zw, 0.0, 1.0);
  v_color = a_color;
  v_params = a_params;
  v_style = a_style;
}`;

const SCENE_FS = `#version 300 es
precision highp float;

in vec2 v_p;
in vec4 v_color;
in vec4 v_params;
in vec4 v_style;

out vec4 fragColor;

const float TAU = 6.28318530718;

float sdCircle(vec2 p, float r) { return length(p) - r; }

float sdRoundBox(vec2 p, vec2 b, float r) {
  r = min(r, min(b.x, b.y));
  vec2 q = abs(p) - b + r;
  return min(max(q.x, q.y), 0.0) + length(max(q, 0.0)) - r;
}

void main() {
  float shape = v_style.x;
  float aa = max(fwidth(v_p.x), 1e-5) * 1.1;  // unités monde par pixel
  float d;
  float mask = 1.0;

  if (shape < 0.5) {
    d = sdCircle(v_p, v_params.x);
  } else if (shape < 1.5) {
    d = sdRoundBox(v_p, v_params.xy, v_params.z);
  } else if (shape < 2.5) {
    d = abs(sdRoundBox(v_p, v_params.xy, v_params.z)) - v_params.w;
  } else {
    float radius = v_params.x;
    d = abs(length(v_p) - radius) - v_params.y * 0.5;
    float sweep = v_params.w;
    if (sweep < TAU - 0.001) {
      // angle 0 en haut, croissant dans le sens horaire
      float a = atan(v_p.x, -v_p.y);
      if (a < 0.0) a += TAU;
      float rel = mod(a - v_params.z + TAU, TAU);
      float angAA = aa / max(radius, 1e-4);
      mask = 1.0 - smoothstep(sweep - angAA, sweep + angAA, rel);
      // extrémité arrondie côté départ
      mask *= smoothstep(-angAA, angAA, rel);
    }
  }

  float core = (1.0 - smoothstep(-aa, aa, d)) * mask;
  float glow = exp(-max(d, 0.0) * v_style.z) * v_style.y * mask;

  float alpha = core * v_color.a;
  vec3 rgb = v_color.rgb * (alpha + glow);

  if (alpha < 0.002 && glow < 0.002) discard;
  fragColor = vec4(rgb, alpha);   // alpha prémultiplié
}`;

// Triangle plein écran sans VBO (gl_VertexID)
const POST_VS = `#version 300 es
out vec2 v_uv;
void main() {
  vec2 p = vec2((gl_VertexID << 1) & 2, gl_VertexID & 2);
  v_uv = p;
  gl_Position = vec4(p * 2.0 - 1.0, 0.0, 1.0);
}`;

const BRIGHT_FS = `#version 300 es
precision highp float;
in vec2 v_uv;
uniform sampler2D u_tex;
uniform float u_threshold;
out vec4 fragColor;
void main() {
  vec3 c = texture(u_tex, v_uv).rgb;
  float l = dot(c, vec3(0.2126, 0.7152, 0.0722));
  float k = max(l - u_threshold, 0.0) / max(l, 1e-4);
  fragColor = vec4(c * k, 1.0);
}`;

const BLUR_FS = `#version 300 es
precision highp float;
in vec2 v_uv;
uniform sampler2D u_tex;
uniform vec2 u_dir;          // décalage en UV (déjà multiplié par le rayon)
out vec4 fragColor;
void main() {
  // gaussienne 9 taps repliée en 5 échantillons bilinéaires
  const float o[3] = float[3](0.0, 1.3846153846, 3.2307692308);
  const float w[3] = float[3](0.2270270270, 0.3162162162, 0.0702702703);
  vec3 c = texture(u_tex, v_uv).rgb * w[0];
  for (int i = 1; i < 3; i++) {
    c += texture(u_tex, v_uv + u_dir * o[i]).rgb * w[i];
    c += texture(u_tex, v_uv - u_dir * o[i]).rgb * w[i];
  }
  fragColor = vec4(c, 1.0);
}`;

const COMPOSITE_FS = `#version 300 es
precision highp float;
in vec2 v_uv;
uniform sampler2D u_scene;
uniform sampler2D u_bloom;
uniform float u_bloomStrength;
uniform float u_exposure;
uniform float u_time;
out vec4 fragColor;

void main() {
  vec3 scene = texture(u_scene, v_uv).rgb;
  vec3 bloom = texture(u_bloom, v_uv).rgb;
  vec3 c = scene + bloom * u_bloomStrength;

  // tonemap exponentiel : les zones chaudes saturent vers le blanc
  c = 1.0 - exp(-c * u_exposure);

  // vignette
  vec2 q = v_uv - 0.5;
  c *= 1.0 - dot(q, q) * 0.85;

  // grain très léger pour casser le banding
  float n = fract(sin(dot(v_uv * 1024.0 + u_time, vec2(12.9898, 78.233))) * 43758.5453);
  c += (n - 0.5) * 0.012;

  fragColor = vec4(max(c, 0.0), 1.0);
}`;

// ---------------------------------------------------------------- utilitaires GL

function compile(gl, type, src) {
  const s = gl.createShader(type);
  gl.shaderSource(s, src);
  gl.compileShader(s);
  if (!gl.getShaderParameter(s, gl.COMPILE_STATUS)) {
    throw new Error('Shader: ' + gl.getShaderInfoLog(s));
  }
  return s;
}

function program(gl, vs, fs) {
  const p = gl.createProgram();
  gl.attachShader(p, compile(gl, gl.VERTEX_SHADER, vs));
  gl.attachShader(p, compile(gl, gl.FRAGMENT_SHADER, fs));
  gl.linkProgram(p);
  if (!gl.getProgramParameter(p, gl.LINK_STATUS)) {
    throw new Error('Programme: ' + gl.getProgramInfoLog(p));
  }
  const u = {};
  const n = gl.getProgramParameter(p, gl.ACTIVE_UNIFORMS);
  for (let i = 0; i < n; i++) {
    const info = gl.getActiveUniform(p, i);
    u[info.name] = gl.getUniformLocation(p, info.name);
  }
  return { p, u };
}

// ---------------------------------------------------------------- renderer

export class Renderer {
  constructor(canvas) {
    const gl = canvas.getContext('webgl2', {
      alpha: false, antialias: false, depth: false, stencil: false,
      premultipliedAlpha: false, powerPreference: 'high-performance',
    });
    if (!gl) throw new Error('WebGL2 n\'est pas disponible sur ce navigateur.');

    this.canvas = canvas;
    this.gl = gl;

    // Cible HDR si possible : sinon on retombe sur du 8 bits (bloom plus discret).
    this.hdr = !!gl.getExtension('EXT_color_buffer_float');
    gl.getExtension('OES_texture_float_linear');

    this.scene = program(gl, SCENE_VS, SCENE_FS);
    this.bright = program(gl, POST_VS, BRIGHT_FS);
    this.blur = program(gl, POST_VS, BLUR_FS);
    this.comp = program(gl, POST_VS, COMPOSITE_FS);

    // --- géométrie instanciée
    this.vao = gl.createVertexArray();
    gl.bindVertexArray(this.vao);

    const quad = gl.createBuffer();
    gl.bindBuffer(gl.ARRAY_BUFFER, quad);
    gl.bufferData(gl.ARRAY_BUFFER, new Float32Array([
      -1, -1, 1, -1, -1, 1,
      -1, 1, 1, -1, 1, 1,
    ]), gl.STATIC_DRAW);
    gl.enableVertexAttribArray(0);
    gl.vertexAttribPointer(0, 2, gl.FLOAT, false, 0, 0);

    this.data = new Float32Array(MAX_INST * FLOATS_PER_INST);
    this.count = 0;

    this.instBuf = gl.createBuffer();
    gl.bindBuffer(gl.ARRAY_BUFFER, this.instBuf);
    gl.bufferData(gl.ARRAY_BUFFER, this.data.byteLength, gl.DYNAMIC_DRAW);
    const stride = FLOATS_PER_INST * 4;
    for (let i = 0; i < 4; i++) {
      const loc = 1 + i;
      gl.enableVertexAttribArray(loc);
      gl.vertexAttribPointer(loc, 4, gl.FLOAT, false, stride, i * 16);
      gl.vertexAttribDivisor(loc, 1);
    }
    gl.bindVertexArray(null);

    this.postVao = gl.createVertexArray();   // VAO vide pour le triangle plein écran

    this.fbos = {};
    this.width = 0;
    this.height = 0;
    this.view = { x: 0, y: 0, w: 20, h: 20 };
    this.pixelsPerUnit = 1;

    this.bloomStrength = 1.15;
    this.exposure = 1.25;
    this.threshold = 0.55;
  }

  // ------------------------------------------------------------ cibles de rendu

  _makeTarget(w, h) {
    const gl = this.gl;
    const tex = gl.createTexture();
    gl.bindTexture(gl.TEXTURE_2D, tex);
    const internal = this.hdr ? gl.RGBA16F : gl.RGBA8;
    const type = this.hdr ? gl.HALF_FLOAT : gl.UNSIGNED_BYTE;
    gl.texImage2D(gl.TEXTURE_2D, 0, internal, w, h, 0, gl.RGBA, type, null);
    gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR);
    gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
    gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_S, gl.CLAMP_TO_EDGE);
    gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_T, gl.CLAMP_TO_EDGE);
    const fb = gl.createFramebuffer();
    gl.bindFramebuffer(gl.FRAMEBUFFER, fb);
    gl.framebufferTexture2D(gl.FRAMEBUFFER, gl.COLOR_ATTACHMENT0, gl.TEXTURE_2D, tex, 0);
    gl.bindFramebuffer(gl.FRAMEBUFFER, null);
    return { tex, fb, w, h };
  }

  _resize() {
    const gl = this.gl;
    const dpr = Math.min(window.devicePixelRatio || 1, 2);
    const w = Math.max(1, Math.round(this.canvas.clientWidth * dpr));
    const h = Math.max(1, Math.round(this.canvas.clientHeight * dpr));
    if (w === this.width && h === this.height) return;

    this.width = w; this.height = h;
    this.canvas.width = w; this.canvas.height = h;

    for (const key of Object.keys(this.fbos)) {
      gl.deleteTexture(this.fbos[key].tex);
      gl.deleteFramebuffer(this.fbos[key].fb);
    }
    const bw = Math.max(1, w >> 2), bh = Math.max(1, h >> 2);
    this.fbos = {
      scene: this._makeTarget(w, h),
      a: this._makeTarget(bw, bh),
      b: this._makeTarget(bw, bh),
    };
  }

  // ------------------------------------------------------------ frame

  /**
   * @param {{x:number,y:number,halfHeight:number}} camera vue en unités monde
   */
  begin(camera) {
    this._resize();
    this.count = 0;
    const aspect = this.width / this.height;
    const hh = camera.halfHeight;
    const hw = hh * aspect;
    this.view = { x: camera.x, y: camera.y, w: hw, h: hh };
    this.pixelsPerUnit = (this.height * 0.5) / hh;
  }

  _push(shape, x, y, hx, hy, p0, p1, p2, p3, color, alpha, glow, falloff) {
    if (this.count >= MAX_INST) return;
    const d = this.data;
    let i = this.count * FLOATS_PER_INST;
    d[i++] = x;  d[i++] = y;  d[i++] = hx; d[i++] = hy;
    d[i++] = color[0]; d[i++] = color[1]; d[i++] = color[2]; d[i++] = alpha;
    d[i++] = p0; d[i++] = p1; d[i++] = p2; d[i++] = p3;
    d[i++] = shape; d[i++] = glow; d[i++] = falloff; d[i++] = 0;
    this.count++;
  }

  // Rayon du quad nécessaire pour contenir le halo (exp(-d*k) < ~1/150).
  _pad(glow, falloff) {
    if (glow <= 0.004) return 0.02;
    return Math.min(5.0 / falloff, 3.0) + 0.02;
  }

  /** Disque plein. opts: {alpha, glow, falloff} */
  disc(x, y, r, color, opts = {}) {
    const glow = opts.glow ?? 0, falloff = opts.falloff ?? 7;
    const pad = this._pad(glow, falloff);
    this._push(SHAPE.DISC, x, y, r + pad, r + pad, r, 0, 0, 0,
      color, opts.alpha ?? 1, glow, falloff);
  }

  /** Boîte pleine à coins arrondis (hx, hy = demi-dimensions). */
  box(x, y, hx, hy, radius, color, opts = {}) {
    const glow = opts.glow ?? 0, falloff = opts.falloff ?? 7;
    const pad = this._pad(glow, falloff);
    this._push(SHAPE.BOX, x, y, hx + pad, hy + pad, hx, hy, radius, 0,
      color, opts.alpha ?? 1, glow, falloff);
  }

  /** Contour de boîte, épaisseur `line` centrée sur le bord. */
  boxOutline(x, y, hx, hy, radius, line, color, opts = {}) {
    const glow = opts.glow ?? 0, falloff = opts.falloff ?? 7;
    const pad = this._pad(glow, falloff) + line;
    this._push(SHAPE.BOX_OUTLINE, x, y, hx + pad, hy + pad, hx, hy, radius, line * 0.5,
      color, opts.alpha ?? 1, glow, falloff);
  }

  /** Arc / anneau. `start` et `sweep` en radians, 0 = haut, sens horaire. */
  arc(x, y, radius, line, start, sweep, color, opts = {}) {
    const glow = opts.glow ?? 0, falloff = opts.falloff ?? 7;
    const ext = radius + line * 0.5 + this._pad(glow, falloff);
    this._push(SHAPE.ARC, x, y, ext, ext, radius, line, start, Math.min(sweep, TAU),
      color, opts.alpha ?? 1, glow, falloff);
  }

  ring(x, y, radius, line, color, opts = {}) {
    this.arc(x, y, radius, line, 0, TAU, color, opts);
  }

  end(time = 0) {
    const gl = this.gl;
    const f = this.fbos;

    // ---- passe scène (HDR)
    gl.bindFramebuffer(gl.FRAMEBUFFER, f.scene.fb);
    gl.viewport(0, 0, f.scene.w, f.scene.h);
    gl.clearColor(0.012, 0.016, 0.035, 1);
    gl.clear(gl.COLOR_BUFFER_BIT);

    if (this.count > 0) {
      gl.enable(gl.BLEND);
      gl.blendFunc(gl.ONE, gl.ONE_MINUS_SRC_ALPHA);

      gl.useProgram(this.scene.p);
      gl.uniform4f(this.scene.u.u_view,
        this.view.x, this.view.y, 1 / this.view.w, -1 / this.view.h);

      gl.bindVertexArray(this.vao);
      gl.bindBuffer(gl.ARRAY_BUFFER, this.instBuf);
      gl.bufferSubData(gl.ARRAY_BUFFER, 0,
        this.data.subarray(0, this.count * FLOATS_PER_INST));
      gl.drawArraysInstanced(gl.TRIANGLES, 0, 6, this.count);
      gl.bindVertexArray(null);
      gl.disable(gl.BLEND);
    }

    // ---- bloom
    gl.bindVertexArray(this.postVao);
    gl.activeTexture(gl.TEXTURE0);

    const draw = (target, prog, tex, setup) => {
      gl.bindFramebuffer(gl.FRAMEBUFFER, target ? target.fb : null);
      gl.viewport(0, 0, target ? target.w : this.width, target ? target.h : this.height);
      gl.useProgram(prog.p);
      gl.bindTexture(gl.TEXTURE_2D, tex);
      if (setup) setup(prog);
      gl.drawArrays(gl.TRIANGLES, 0, 3);
    };

    draw(f.a, this.bright, f.scene.tex, (p) => {
      gl.uniform1i(p.u.u_tex, 0);
      gl.uniform1f(p.u.u_threshold, this.threshold);
    });

    const bw = 1 / f.a.w, bh = 1 / f.a.h;
    const passes = [[bw, 0], [0, bh], [bw * 2.6, 0], [0, bh * 2.6]];
    let src = f.a, dst = f.b;
    for (const [dx, dy] of passes) {
      draw(dst, this.blur, src.tex, (p) => {
        gl.uniform1i(p.u.u_tex, 0);
        gl.uniform2f(p.u.u_dir, dx, dy);
      });
      const t = src; src = dst; dst = t;
    }

    // ---- composition à l'écran
    gl.bindFramebuffer(gl.FRAMEBUFFER, null);
    gl.viewport(0, 0, this.width, this.height);
    gl.useProgram(this.comp.p);
    gl.activeTexture(gl.TEXTURE0);
    gl.bindTexture(gl.TEXTURE_2D, f.scene.tex);
    gl.activeTexture(gl.TEXTURE1);
    gl.bindTexture(gl.TEXTURE_2D, src.tex);
    gl.uniform1i(this.comp.u.u_scene, 0);
    gl.uniform1i(this.comp.u.u_bloom, 1);
    gl.uniform1f(this.comp.u.u_bloomStrength, this.bloomStrength);
    gl.uniform1f(this.comp.u.u_exposure, this.exposure);
    gl.uniform1f(this.comp.u.u_time, time % 1000);
    gl.drawArrays(gl.TRIANGLES, 0, 3);

    gl.activeTexture(gl.TEXTURE0);
    gl.bindVertexArray(null);
  }
}

/** "#rrggbb" -> [r, g, b] linéaires approximatifs, avec gain optionnel. */
export function rgb(hex, gain = 1) {
  const n = parseInt(hex.slice(1), 16);
  return [
    ((n >> 16 & 255) / 255) * gain,
    ((n >> 8 & 255) / 255) * gain,
    ((n & 255) / 255) * gain,
  ];
}

export function mixColor(a, b, t) {
  return [a[0] + (b[0] - a[0]) * t, a[1] + (b[1] - a[1]) * t, a[2] + (b[2] - a[2]) * t];
}

export function scaleColor(c, k) {
  return [c[0] * k, c[1] * k, c[2] * k];
}
