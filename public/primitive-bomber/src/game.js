// game.js — simulation pure (aucun rendu, aucun réseau).
//
// L'hôte fait autorité : il exécute `step()` à pas fixe et diffuse des instantanés.
// Le client rejoue localement le même code pour prédire son propre déplacement.

export const COLS = 15;
export const ROWS = 13;

export const T_EMPTY = 0;
export const T_SOLID = 1;
export const T_BRICK = 2;

export const FUSE = 2.4;          // secondes avant explosion
export const FLAME_TIME = 0.5;    // durée d'une flamme à l'écran
// Une flamme ne tue qu'au moment du souffle. Elle reste visible bien plus
// longtemps, mais on peut traverser les braises sans risque.
export const LETHAL_TIME = 0.14;
export const PLAYER_R = 0.31;
export const BOMB_R = 0.36;
export const TICK = 1 / 60;

export const PU_BOMB = 0;
export const PU_FIRE = 1;
export const PU_SPEED = 2;

const BASE_SPEED = 4.0;
const MAX_SPEED = 7.0;
const MAX_RANGE = 8;
const MAX_BOMBS = 8;

// Flamme : 0 = centre, 1 = horizontale, 2 = verticale
export const F_CENTER = 0, F_H = 1, F_V = 2;

export function mulberry32(seed) {
  let a = seed >>> 0;
  return function () {
    a = (a + 0x6D2B79F5) | 0;
    let t = Math.imul(a ^ (a >>> 15), 1 | a);
    t = (t + Math.imul(t ^ (t >>> 7), 61 | t)) ^ t;
    return ((t ^ (t >>> 14)) >>> 0) / 4294967296;
  };
}

const clamp = (v, a, b) => (v < a ? a : v > b ? b : v);

/** Les 5 cases autour de chaque spawn restent libres pour ne pas s'auto-piéger. */
function isSpawnZone(x, y) {
  const near = (sx, sy) => Math.abs(x - sx) + Math.abs(y - sy) <= 2;
  return near(1, 1) || near(COLS - 2, ROWS - 2);
}

function generateMap(seed) {
  const rnd = mulberry32(seed);
  const grid = new Uint8Array(COLS * ROWS);
  const hidden = new Int8Array(COLS * ROWS).fill(-1);

  for (let y = 0; y < ROWS; y++) {
    for (let x = 0; x < COLS; x++) {
      const i = y * COLS + x;
      if (x === 0 || y === 0 || x === COLS - 1 || y === ROWS - 1) grid[i] = T_SOLID;
      else if (x % 2 === 0 && y % 2 === 0) grid[i] = T_SOLID;
      else if (!isSpawnZone(x, y) && rnd() < 0.82) grid[i] = T_BRICK;
      else grid[i] = T_EMPTY;

      if (grid[i] === T_BRICK) {
        const r = rnd();
        if (r < 0.16) hidden[i] = PU_FIRE;
        else if (r < 0.29) hidden[i] = PU_BOMB;
        else if (r < 0.36) hidden[i] = PU_SPEED;
      }
    }
  }
  return { grid, hidden };
}

function makePlayer(id, x, y) {
  return {
    id, x, y, r: PLAYER_R,
    px: x, py: y,         // position au début du tick, pour l'interpolation de rendu
    alive: true,
    maxBombs: 1,
    active: 0,
    range: 2,
    speed: BASE_SPEED,
    dirx: 0, diry: 1,
    invuln: 0.6,          // court sursis au démarrage du round
  };
}

export class Game {
  constructor(seed = 1) {
    this.scores = [0, 0];
    this.reset(seed);
  }

  reset(seed) {
    const { grid, hidden } = generateMap(seed);
    this.seed = seed >>> 0;
    this.grid = grid;
    this.hidden = hidden;
    this.gridVersion = 0;
    this.time = 0;
    this.players = [
      makePlayer(0, 1.5, 1.5),
      makePlayer(1, COLS - 1.5, ROWS - 1.5),
    ];
    this.bombs = [];
    this.flames = [];
    this.powerups = [];
    this.events = [];
    this.over = false;
    this.winner = -1;      // -1 = en cours, 0/1 = gagnant, 2 = égalité
    this.overTimer = 0;
    this._flameSet = new Set();    // toutes les cases en feu : propage les chaînes
    this._lethalSet = new Set();   // seulement celles qui viennent de souffler
  }

  tileAt(x, y) {
    if (x < 0 || y < 0 || x >= COLS || y >= ROWS) return T_SOLID;
    return this.grid[y * COLS + x];
  }

  bombAt(cx, cy) {
    for (const b of this.bombs) if (b.cx === cx && b.cy === cy && !b.dead) return b;
    return null;
  }

  // ------------------------------------------------------------ pas de simulation

  /**
   * @param {number} dt
   * @param {Array<{ax:number, ay:number, bomb:boolean}>} inputs un par joueur
   */
  step(dt, inputs) {
    this.time += dt;

    this._updateFlames(dt);
    this._updateBombs(dt, inputs);

    for (let i = 0; i < this.players.length; i++) {
      const p = this.players[i];
      if (p.invuln > 0) p.invuln -= dt;
      this.movePlayer(p, inputs[i] || { ax: 0, ay: 0 }, dt);
    }

    this._pickups();
    this._deaths();

    if (this.over) this.overTimer += dt;
  }

  _updateFlames(dt) {
    this._flameSet.clear();
    this._lethalSet.clear();
    for (let i = this.flames.length - 1; i >= 0; i--) {
      const f = this.flames[i];
      f.t -= dt;
      if (f.t <= 0) { this.flames.splice(i, 1); continue; }
      const key = f.cy * COLS + f.cx;
      this._flameSet.add(key);
      if (f.t > FLAME_TIME - LETHAL_TIME) this._lethalSet.add(key);
    }
  }

  _updateBombs(dt, inputs) {
    // pose de bombe
    for (let i = 0; i < this.players.length; i++) {
      const inp = inputs[i];
      if (inp && inp.bomb) this.placeBomb(i);
    }

    for (const b of this.bombs) {
      if (b.dead) continue;
      b.fuse -= dt;
      // une flamme qui touche une bombe la fait sauter immédiatement
      if (this._flameSet.has(b.cy * COLS + b.cx)) b.fuse = 0;
    }

    // explosions en chaîne, traitées itérativement
    let guard = 0;
    for (;;) {
      const next = this.bombs.find((b) => !b.dead && b.fuse <= 0);
      if (!next || guard++ > 200) break;
      this._explode(next);
    }

    for (let i = this.bombs.length - 1; i >= 0; i--) {
      const b = this.bombs[i];
      if (b.dead) { this.bombs.splice(i, 1); continue; }
      // un joueur qui a quitté la case de la bombe ne peut plus la traverser
      if (b.pass.size) {
        for (const id of [...b.pass]) {
          const p = this.players[id];
          if (!p || !this._overlapsCell(p, b.cx, b.cy)) b.pass.delete(id);
        }
      }
    }
  }

  placeBomb(playerId) {
    const p = this.players[playerId];
    if (!p || !p.alive || this.over) return null;
    if (p.active >= p.maxBombs) return null;
    const cx = Math.floor(p.x), cy = Math.floor(p.y);
    if (this.tileAt(cx, cy) !== T_EMPTY) return null;
    if (this.bombAt(cx, cy)) return null;

    const bomb = {
      cx, cy,
      x: cx + 0.5, y: cy + 0.5,
      fuse: FUSE,
      range: p.range,
      owner: playerId,
      dead: false,
      pass: new Set([playerId]),
    };
    this.bombs.push(bomb);
    p.active++;
    this.events.push(['place', bomb.x, bomb.y, playerId]);
    return bomb;
  }

  _explode(bomb) {
    bomb.dead = true;
    const owner = this.players[bomb.owner];
    if (owner) owner.active = Math.max(0, owner.active - 1);

    this._addFlame(bomb.cx, bomb.cy, F_CENTER);

    const dirs = [[1, 0, F_H], [-1, 0, F_H], [0, 1, F_V], [0, -1, F_V]];
    for (const [dx, dy, kind] of dirs) {
      for (let i = 1; i <= bomb.range; i++) {
        const x = bomb.cx + dx * i, y = bomb.cy + dy * i;
        const t = this.tileAt(x, y);
        if (t === T_SOLID) break;
        if (t === T_BRICK) {
          this._destroyBrick(x, y);
          this._addFlame(x, y, kind);
          break;
        }
        this._addFlame(x, y, kind);
        const other = this.bombAt(x, y);
        if (other) other.fuse = 0;   // sera traité par la boucle de chaîne
      }
    }
    this.events.push(['boom', bomb.x, bomb.y, bomb.range]);
  }

  _destroyBrick(x, y) {
    const i = y * COLS + x;
    this.grid[i] = T_EMPTY;
    this.gridVersion++;
    const kind = this.hidden[i];
    if (kind >= 0) {
      this.hidden[i] = -1;
      this.powerups.push({ cx: x, cy: y, kind });
    }
    this.events.push(['brick', x + 0.5, y + 0.5, 0]);
  }

  _addFlame(cx, cy, kind) {
    // Ajouté aux deux ensembles : _updateFlames a déjà tourné pour ce tick, et
    // un souffle doit tuer dès l'instant où il apparaît.
    this._flameSet.add(cy * COLS + cx);
    this._lethalSet.add(cy * COLS + cx);
    const existing = this.flames.find((f) => f.cx === cx && f.cy === cy);
    if (existing) {
      existing.t = FLAME_TIME;
      if (kind === F_CENTER) existing.k = F_CENTER;
    } else {
      this.flames.push({ cx, cy, t: FLAME_TIME, k: kind });
    }
    // les bonus au sol sont détruits par le feu
    for (let i = this.powerups.length - 1; i >= 0; i--) {
      const u = this.powerups[i];
      if (u.cx === cx && u.cy === cy) {
        this.powerups.splice(i, 1);
        this.events.push(['burn', cx + 0.5, cy + 0.5, 0]);
      }
    }
  }

  // ------------------------------------------------------------ déplacement

  _overlapsCell(p, cx, cy) {
    const qx = clamp(p.x, cx, cx + 1);
    const qy = clamp(p.y, cy, cy + 1);
    const dx = p.x - qx, dy = p.y - qy;
    return dx * dx + dy * dy < p.r * p.r;
  }

  _blocked(cx, cy, player) {
    const t = this.tileAt(cx, cy);
    if (t !== T_EMPTY) return true;
    const b = this.bombAt(cx, cy);
    if (b && !b.pass.has(player.id)) return true;
    return false;
  }

  /** Repousse le cercle du joueur hors des cases pleines qui l'intersectent. */
  _resolve(p) {
    const cx = Math.floor(p.x), cy = Math.floor(p.y);
    for (let y = cy - 1; y <= cy + 1; y++) {
      for (let x = cx - 1; x <= cx + 1; x++) {
        if (!this._blocked(x, y, p)) continue;
        const qx = clamp(p.x, x, x + 1);
        const qy = clamp(p.y, y, y + 1);
        let dx = p.x - qx, dy = p.y - qy;
        let d = Math.hypot(dx, dy);
        if (d >= p.r) continue;
        if (d > 1e-5) {
          const push = p.r - d;
          p.x += (dx / d) * push;
          p.y += (dy / d) * push;
        } else {
          // centre à l'intérieur : on ressort par le bord le plus proche
          const l = p.x - x, r = x + 1 - p.x, u = p.y - y, dn = y + 1 - p.y;
          const m = Math.min(l, r, u, dn);
          if (m === l) p.x = x - p.r;
          else if (m === r) p.x = x + 1 + p.r;
          else if (m === u) p.y = y - p.r;
          else p.y = y + 1 + p.r;
        }
      }
    }
    p.x = clamp(p.x, p.r, COLS - p.r);
    p.y = clamp(p.y, p.r, ROWS - p.r);
  }

  /** Aimantation douce vers l'axe du couloir : indispensable au feeling bomberman. */
  _align(p, axis, amount) {
    const v = axis === 'x' ? p.x : p.y;
    const target = Math.floor(v) + 0.5;
    const diff = target - v;
    if (Math.abs(diff) < 1e-4) return;
    const move = Math.sign(diff) * Math.min(amount, Math.abs(diff));
    if (axis === 'x') p.x += move; else p.y += move;
    this._resolve(p);
  }

  movePlayer(p, inp, dt) {
    // Mémorisé ici plutôt que dans step() : le client appelle movePlayer
    // directement pour prédire son propre déplacement.
    p.px = p.x;
    p.py = p.y;
    if (!p.alive) return;
    let ax = inp.ax || 0, ay = inp.ay || 0;
    const len = Math.hypot(ax, ay);
    if (len > 1) { ax /= len; ay /= len; }
    if (len > 0.01) { p.dirx = ax; p.diry = ay; }

    const step = p.speed * dt;
    if (ax !== 0) { p.x += ax * step; this._resolve(p); }
    if (ay !== 0) { p.y += ay * step; this._resolve(p); }

    if (ax !== 0 && ay === 0) this._align(p, 'y', step * 0.85);
    else if (ay !== 0 && ax === 0) this._align(p, 'x', step * 0.85);
  }

  _pickups() {
    for (const p of this.players) {
      if (!p.alive) continue;
      const cx = Math.floor(p.x), cy = Math.floor(p.y);
      for (let i = this.powerups.length - 1; i >= 0; i--) {
        const u = this.powerups[i];
        if (u.cx !== cx || u.cy !== cy) continue;
        this.powerups.splice(i, 1);
        if (u.kind === PU_BOMB) p.maxBombs = Math.min(MAX_BOMBS, p.maxBombs + 1);
        else if (u.kind === PU_FIRE) p.range = Math.min(MAX_RANGE, p.range + 1);
        else p.speed = Math.min(MAX_SPEED, p.speed + 0.55);
        this.events.push(['pick', u.cx + 0.5, u.cy + 0.5, u.kind]);
      }
    }
  }

  _deaths() {
    if (this.over) return;
    let died = false;
    for (const p of this.players) {
      if (!p.alive || p.invuln > 0) continue;
      const key = Math.floor(p.y) * COLS + Math.floor(p.x);
      if (this._lethalSet.has(key)) {
        p.alive = false;
        died = true;
        this.events.push(['die', p.x, p.y, p.id]);
      }
    }
    if (!died) return;

    const alive = this.players.filter((p) => p.alive);
    if (alive.length === 1) {
      this.over = true;
      this.winner = alive[0].id;
      this.scores[this.winner]++;
    } else if (alive.length === 0) {
      this.over = true;
      this.winner = 2;
    }
  }

  // ------------------------------------------------------------ réseau

  /** Instantané compact (JSON) envoyé par l'hôte. */
  snapshot() {
    const r2 = (v) => Math.round(v * 100) / 100;
    return {
      t: 's',
      p: this.players.map((p) => [
        r2(p.x), r2(p.y), p.alive ? 1 : 0, p.maxBombs, p.range, r2(p.speed), p.active,
      ]),
      b: this.bombs.map((b) => [b.cx, b.cy, r2(b.fuse), b.range, b.owner]),
      f: this.flames.map((f) => [f.cx, f.cy, r2(f.t), f.k]),
      u: this.powerups.map((u) => [u.cx, u.cy, u.kind]),
      g: this.gridVersion,
      o: this.over ? 1 : 0,
      w: this.winner,
      c: this.scores,
    };
  }

  /**
   * Applique un instantané côté client.
   * @param {object} s
   * @param {number} localId joueur prédit localement (sa position est ignorée ici)
   * @returns {{x:number,y:number}|null} position autoritaire du joueur local
   */
  applySnapshot(s, localId) {
    let authoritative = null;

    for (let i = 0; i < s.p.length && i < this.players.length; i++) {
      const a = s.p[i];
      const p = this.players[i];
      p.alive = a[2] === 1;
      p.maxBombs = a[3];
      p.range = a[4];
      p.speed = a[5];
      p.active = a[6];
      if (i === localId) {
        authoritative = { x: a[0], y: a[1] };
      } else {
        p.tx = a[0]; p.ty = a[1];          // cible interpolée par le rendu
        if (p.x === undefined) { p.x = a[0]; p.y = a[1]; }
      }
    }

    // Bombes : on conserve l'objet existant pour garder une mèche fluide.
    const keep = [];
    for (const [cx, cy, fuse, range, owner] of s.b) {
      let b = this.bombs.find((o) => o.cx === cx && o.cy === cy);
      if (!b) {
        b = { cx, cy, x: cx + 0.5, y: cy + 0.5, dead: false, pass: new Set() };
        // Reproduit la règle de l'hôte : qui est déjà sur la case peut en sortir.
        for (const pl of this.players) {
          if (this._overlapsCell(pl, cx, cy)) b.pass.add(pl.id);
        }
      }
      b.fuse = fuse; b.range = range; b.owner = owner;
      keep.push(b);
    }
    this.bombs = keep;

    this.flames = s.f.map(([cx, cy, t, k]) => ({ cx, cy, t, k }));
    this._rebuildFlameSets();

    this.powerups = s.u.map(([cx, cy, kind]) => ({ cx, cy, kind }));

    this.remoteGridVersion = s.g;
    this.over = s.o === 1;
    this.winner = s.w;
    this.scores = s.c;

    return authoritative;
  }

  /** Avance uniquement les éléments visuels entre deux instantanés (client). */
  interpolate(dt) {
    for (const b of this.bombs) {
      b.fuse = Math.max(0, b.fuse - dt);
      for (const id of [...b.pass]) {
        const p = this.players[id];
        if (!p || !this._overlapsCell(p, b.cx, b.cy)) b.pass.delete(id);
      }
    }
    for (let i = this.flames.length - 1; i >= 0; i--) {
      this.flames[i].t -= dt;
      if (this.flames[i].t <= 0) this.flames.splice(i, 1);
    }
    this._rebuildFlameSets();

    this.time += dt;
    for (const p of this.players) {
      if (p.invuln > 0) p.invuln -= dt;
      if (p.tx === undefined) continue;
      const k = 1 - Math.pow(0.0008, dt);   // lissage exponentiel ~ 20 Hz
      p.x += (p.tx - p.x) * k;
      p.y += (p.ty - p.y) * k;
      // Déjà lissé à chaque image : l'interpolation de tick ne doit pas s'y ajouter.
      p.px = p.x;
      p.py = p.y;
    }
  }

  _rebuildFlameSets() {
    this._flameSet.clear();
    this._lethalSet.clear();
    for (const f of this.flames) {
      const key = f.cy * COLS + f.cx;
      this._flameSet.add(key);
      if (f.t > FLAME_TIME - LETHAL_TIME) this._lethalSet.add(key);
    }
  }

  encodeGrid() {
    let s = '';
    for (let i = 0; i < this.grid.length; i++) s += this.grid[i];
    return s;
  }

  decodeGrid(str) {
    for (let i = 0; i < this.grid.length && i < str.length; i++) {
      this.grid[i] = str.charCodeAt(i) - 48;
    }
  }
}
