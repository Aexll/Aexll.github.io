// view.js — traduit un état de jeu en primitives lumineuses, plus les effets.

import { rgb, mixColor, scaleColor } from './gfx.js';
import {
  COLS, ROWS, T_EMPTY, T_SOLID, T_BRICK, FUSE, FLAME_TIME,
  PU_BOMB, PU_FIRE, PU_SPEED, F_CENTER, F_H,
} from './game.js';

const TAU = Math.PI * 2;

export const PAL = {
  floor: rgb('#080c1c'),
  floorEdge: rgb('#1b2a5e'),
  solid: rgb('#0b1230'),
  solidEdge: rgb('#3f63ff'),
  brick: rgb('#150f30'),
  brickEdge: rgb('#a06bff'),
  players: [rgb('#35f0ff'), rgb('#ff4fd8')],
  flame: rgb('#ff9330'),
  flameHot: rgb('#fff0c8'),
  powerups: [rgb('#ffd166'), rgb('#ff6b4a'), rgb('#6cf7a8')],
  white: rgb('#ffffff'),
};

const easeOut = (t) => 1 - Math.pow(1 - t, 3);

// ---------------------------------------------------------------- effets

export class Fx {
  constructor() { this.items = []; }

  clear() { this.items.length = 0; }

  /** Consomme les évènements de simulation et crée les effets correspondants. */
  spawnFromEvents(events) {
    for (const [kind, x, y, arg] of events) {
      if (kind === 'boom') this.boom(x, y, arg);
      else if (kind === 'brick') this.burst(x, y, PAL.brickEdge, 10, 2.4);
      else if (kind === 'die') this.death(x, y, PAL.players[arg] || PAL.white);
      else if (kind === 'pick') this.burst(x, y, PAL.powerups[arg] || PAL.white, 12, 2.6);
      else if (kind === 'burn') this.burst(x, y, PAL.flame, 6, 2.0);
      else if (kind === 'place') this.ring(x, y, 0.2, 0.9, PAL.players[arg] || PAL.white, 0.28);
    }
  }

  boom(x, y, range) {
    this.ring(x, y, 0.3, Math.max(1.6, range * 0.9), PAL.flameHot, 0.42);
    this.burst(x, y, PAL.flame, 16, 5.5);
    this.items.push({ type: 'flash', x, y, t: 0, dur: 0.18, r: 0.9 });
  }

  death(x, y, color) {
    this.burst(x, y, color, 26, 4.5);
    this.ring(x, y, 0.3, 2.6, color, 0.6);
  }

  ring(x, y, r0, r1, color, dur) {
    this.items.push({ type: 'ring', x, y, r0, r1, color, t: 0, dur });
  }

  burst(x, y, color, n, speed) {
    for (let i = 0; i < n; i++) {
      const a = Math.random() * TAU;
      const v = speed * (0.35 + Math.random() * 0.65);
      this.items.push({
        type: 'spark', x, y, color,
        vx: Math.cos(a) * v, vy: Math.sin(a) * v,
        size: 0.03 + Math.random() * 0.05,
        t: 0, dur: 0.28 + Math.random() * 0.45,
      });
    }
  }

  update(dt) {
    for (let i = this.items.length - 1; i >= 0; i--) {
      const it = this.items[i];
      it.t += dt;
      if (it.t >= it.dur) { this.items.splice(i, 1); continue; }
      if (it.type === 'spark') {
        const drag = Math.pow(0.02, dt);
        it.x += it.vx * dt;
        it.y += it.vy * dt;
        it.vx *= drag; it.vy *= drag;
      }
    }
  }

  draw(g) {
    for (const it of this.items) {
      const k = it.t / it.dur;
      if (it.type === 'ring') {
        const r = it.r0 + (it.r1 - it.r0) * easeOut(k);
        const a = Math.pow(1 - k, 1.7);
        g.ring(it.x, it.y, r, 0.05 + 0.1 * (1 - k), it.color,
          { alpha: a * 0.9, glow: a * 1.5, falloff: 9 });
      } else if (it.type === 'spark') {
        const a = Math.pow(1 - k, 1.4);
        g.disc(it.x, it.y, it.size, it.color, { alpha: a, glow: a * 1.6, falloff: 16 });
      } else if (it.type === 'flash') {
        const a = Math.pow(1 - k, 2);
        g.disc(it.x, it.y, it.r * (0.6 + k), PAL.flameHot,
          { alpha: a * 0.35, glow: a * 2.2, falloff: 3.2 });
      }
    }
  }
}

// ---------------------------------------------------------------- scène

export function drawGame(g, game, fx, time) {
  drawGrid(g, game, time);
  drawPowerups(g, game, time);
  drawBombs(g, game, time);
  drawFlames(g, game);
  drawPlayers(g, game, time);
  fx.draw(g);
}

function drawGrid(g, game, time) {
  for (let y = 0; y < ROWS; y++) {
    for (let x = 0; x < COLS; x++) {
      const cx = x + 0.5, cy = y + 0.5;
      const t = game.grid[y * COLS + x];

      if (t === T_EMPTY) {
        g.box(cx, cy, 0.455, 0.455, 0.1, PAL.floor, { alpha: 1 });
        g.boxOutline(cx, cy, 0.455, 0.455, 0.1, 0.012, PAL.floorEdge,
          { alpha: 0.5, glow: 0.12, falloff: 26 });
      } else if (t === T_SOLID) {
        g.box(cx, cy, 0.5, 0.5, 0.12, PAL.solid, { alpha: 1 });
        const pulse = 0.75 + 0.25 * Math.sin(time * 1.3 + (x + y) * 0.55);
        g.boxOutline(cx, cy, 0.4, 0.4, 0.1, 0.022, PAL.solidEdge,
          { alpha: 0.95, glow: 0.55 * pulse, falloff: 11 });
      } else {
        g.box(cx, cy, 0.44, 0.44, 0.13, PAL.brick, { alpha: 1 });
        g.boxOutline(cx, cy, 0.44, 0.44, 0.13, 0.02, PAL.brickEdge,
          { alpha: 0.9, glow: 0.45, falloff: 13 });
        g.boxOutline(cx, cy, 0.2, 0.2, 0.06, 0.014, PAL.brickEdge,
          { alpha: 0.45, glow: 0.22, falloff: 18 });
      }
    }
  }
}

function drawPowerups(g, game, time) {
  for (const u of game.powerups) {
    const color = PAL.powerups[u.kind] || PAL.white;
    const cx = u.cx + 0.5;
    const cy = u.cy + 0.5 + Math.sin(time * 3 + u.cx * 1.7 + u.cy) * 0.045;
    const pulse = 0.8 + 0.2 * Math.sin(time * 5 + u.cx);

    g.ring(cx, cy, 0.26, 0.035, color, { alpha: 0.9, glow: 0.9 * pulse, falloff: 9 });

    if (u.kind === PU_BOMB) {
      g.disc(cx, cy, 0.11, color, { alpha: 1, glow: 1.1, falloff: 11 });
    } else if (u.kind === PU_FIRE) {
      for (let i = 0; i < 4; i++) {
        const a = time * 1.4 + (i * TAU) / 4;
        g.disc(cx + Math.cos(a) * 0.12, cy + Math.sin(a) * 0.12, 0.045, color,
          { alpha: 1, glow: 1.0, falloff: 15 });
      }
    } else {
      g.arc(cx, cy, 0.13, 0.05, time * 2.2 % TAU, 2.2, color,
        { alpha: 1, glow: 1.0, falloff: 12 });
    }
  }
}

function drawBombs(g, game, time) {
  for (const b of game.bombs) {
    if (b.dead) continue;
    const owner = PAL.players[b.owner] || PAL.white;
    const frac = Math.max(0, Math.min(1, b.fuse / FUSE));
    const urgency = 1 - frac;

    // battement de plus en plus rapide à l'approche de l'explosion
    const beat = Math.sin(time * (7 + urgency * 26));
    const scale = 1 + beat * (0.035 + urgency * 0.075);
    const r = 0.235 * scale;

    const shell = mixColor(scaleColor(owner, 0.35), PAL.flameHot, urgency * 0.55);
    g.disc(b.x, b.y, r, shell, { alpha: 1, glow: 0.25 + urgency * 1.2, falloff: 8 });
    g.ring(b.x, b.y, r, 0.022, owner, { alpha: 0.9, glow: 0.5, falloff: 13 });

    // coeur incandescent
    g.disc(b.x, b.y, r * 0.34, PAL.flameHot,
      { alpha: 0.35 + urgency * 0.65, glow: 0.6 + urgency * 1.8, falloff: 12 });

    // jauge circulaire de mèche : anneau de fond + arc restant
    const gr = 0.345;
    g.ring(b.x, b.y, gr, 0.045, scaleColor(owner, 0.18), { alpha: 0.85, glow: 0 });
    if (frac > 0.001) {
      const hot = mixColor(owner, PAL.flame, urgency * 0.8);
      g.arc(b.x, b.y, gr, 0.05, 0, frac * TAU, hot,
        { alpha: 1, glow: 1.1 + urgency, falloff: 10 });
    }
  }
}

function drawFlames(g, game) {
  for (const f of game.flames) {
    const life = f.t / FLAME_TIME;              // 1 -> 0
    const grow = Math.min(1, (1 - life) / 0.14); // montée très rapide
    const fade = Math.pow(life, 0.55);
    const cx = f.cx + 0.5, cy = f.cy + 0.5;

    const long = 0.5 * grow;
    const thin = 0.33 * grow * (0.6 + fade * 0.4);
    const hx = f.k === F_H ? long : f.k === F_CENTER ? 0.44 * grow : thin;
    const hy = f.k === F_H ? thin : f.k === F_CENTER ? 0.44 * grow : long;

    g.box(cx, cy, hx, hy, Math.min(hx, hy) * 0.9, PAL.flame,
      { alpha: fade * 0.85, glow: 1.6 * fade, falloff: 4.5 });
    g.box(cx, cy, hx * 0.55, hy * 0.55, Math.min(hx, hy) * 0.5, PAL.flameHot,
      { alpha: fade, glow: 2.2 * fade, falloff: 6 });
  }
}

function drawPlayers(g, game, time) {
  for (const p of game.players) {
    if (!p.alive) continue;
    const color = PAL.players[p.id] || PAL.white;
    if (p.invuln > 0 && Math.floor(time * 14) % 2 === 0) continue;

    const pulse = 0.85 + 0.15 * Math.sin(time * 4 + p.id * 2);
    g.disc(p.x, p.y, p.r * 0.78, scaleColor(color, 0.55),
      { alpha: 1, glow: 0.9 * pulse, falloff: 5.5 });
    g.disc(p.x, p.y, p.r * 0.34, PAL.white, { alpha: 0.9, glow: 1.3, falloff: 9 });
    g.ring(p.x, p.y, p.r, 0.03, color, { alpha: 1, glow: 1.3 * pulse, falloff: 8 });

    // petit repère d'orientation, toujours une primitive
    const d = Math.hypot(p.dirx, p.diry) || 1;
    g.disc(p.x + (p.dirx / d) * p.r * 0.72, p.y + (p.diry / d) * p.r * 0.72, 0.045,
      color, { alpha: 1, glow: 1.4, falloff: 14 });
  }
}
