// view.js — traduit un état de jeu en primitives lumineuses, plus les effets.

import { rgb, mixColor, scaleColor } from './gfx.js';
import {
  COLS, ROWS, T_EMPTY, T_SOLID, T_BRICK, FUSE, FLAME_TIME, LETHAL_TIME,
  PUSH_SLIDE, STATS, STAT_COUNT, COMMON, UNCOMMON, RARE,
  S_SHIELD, F_CENTER, F_H, MODIFIERS, MOD_COUNT, M_CAMO, hasMod,
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
  shield: rgb('#22d3ee'),
  white: rgb('#ffffff'),
};

// Couleurs des orbes, dérivées de la table de STATS : une seule source.
const STAT_COLOR = STATS.map((s) => rgb(s.color));
const luminance = (c) => c[0] * 0.2126 + c[1] * 0.7152 + c[2] * 0.0722;
// Une orbe très sombre (Précision) disparaîtrait sur le fond : on lui donne un
// liseré blanc pour qu'elle se lise comme une bille d'obsidienne.
const STAT_RIM = STAT_COLOR.map((c) => (luminance(c) < 0.2 ? PAL.white : c));

export const statColor = (i) => STAT_COLOR[i] || PAL.white;
export const statRim = (i) => STAT_RIM[i] || PAL.white;

const MOD_COLOR = MODIFIERS.map((m) => rgb(m.color));
const MOD_RIM = MOD_COLOR.map((c) => (luminance(c) < 0.2 ? PAL.white : c));
export const modColor = (i) => MOD_COLOR[i] || PAL.white;

/**
 * Chaque forme est décrite en cases entières ; on la recentre pour pouvoir la
 * poser n'importe où sans se soucier de ses dimensions.
 */
const MOD_SHAPE = MODIFIERS.map((m) => {
  const xs = m.shape.map((c) => c[0]), ys = m.shape.map((c) => c[1]);
  const cx = (Math.min(...xs) + Math.max(...xs)) / 2;
  const cy = (Math.min(...ys) + Math.max(...ys)) / 2;
  return m.shape.map(([x, y]) => [x - cx, y - cy]);
});

/** Dessine le tetrino d'un modifieur, centré sur (x, y). `cell` = côté d'un carré. */
export function drawTetrino(g, mod, x, y, cell, opts = {}) {
  const color = MOD_COLOR[mod] || PAL.white;
  const rim = MOD_RIM[mod] || PAL.white;
  const alpha = opts.alpha ?? 1;
  const glow = opts.glow ?? 0.9;
  const h = cell * 0.42;
  for (const [ox, oy] of MOD_SHAPE[mod]) {
    const px = x + ox * cell, py = y + oy * cell;
    g.box(px, py, h, h, cell * 0.14, color, { alpha, glow: glow * 0.55, falloff: 12 });
    g.boxOutline(px, py, h, h, cell * 0.14, cell * 0.06, rim,
      { alpha, glow, falloff: 13 });
  }
}

const easeOut = (t) => 1 - Math.pow(1 - t, 3);

// ---------------------------------------------------------------- effets

export class Fx {
  constructor() { this.items = []; }

  clear() { this.items.length = 0; }

  /** Consomme les évènements de simulation et crée les effets correspondants. */
  spawnFromEvents(events) {
    for (const [kind, x, y, arg] of events) {
      switch (kind) {
        case 'boom':
          this.boom(x, y, arg);
          break;
        case 'brick':
          this.burst(x, y, PAL.brickEdge, 10, 2.4);
          break;
        case 'die':
          this.death(x, y, PAL.players[arg] || PAL.white);
          break;
        case 'orb':
          this.ring(x, y, 0.1, 0.5, statRim(arg), 0.4);
          break;
        case 'pick':
          this.burst(x, y, statRim(arg), 12, 2.6);
          this.ring(x, y, 0.15, 0.8, statRim(arg), 0.35);
          break;
        case 'boost':
          // Précision : le +3 mérite d'être vu, on marque la stat touchée.
          this.burst(x, y, statRim(arg), 24, 4.2);
          this.ring(x, y, 0.2, 1.9, statRim(arg), 0.6);
          this.ring(x, y, 0.2, 1.3, PAL.white, 0.42);
          break;
        case 'burn':
          this.burst(x, y, statRim(arg), 6, 2.0);
          break;
        case 'shield':
          this.ring(x, y, 0.3, 1.5, PAL.shield, 0.5);
          this.burst(x, y, PAL.shield, 18, 3.4);
          break;
        case 'push':
          this.burst(x, y, PAL.players[arg] || PAL.white, 6, 1.8);
          break;
        case 'place':
          this.ring(x, y, 0.2, 0.9, PAL.players[arg] || PAL.white, 0.28);
          break;
        case 'modDrop':
          this.ring(x, y, 0.1, 0.7, modColor(arg), 0.5);
          break;
        case 'modPick':
          this.burst(x, y, modColor(arg), 20, 3.4);
          this.ring(x, y, 0.2, 1.4, modColor(arg), 0.5);
          break;
        case 'modBurn':
          this.burst(x, y, modColor(arg), 8, 2.2);
          break;
        case 'power':
          this.ring(x, y, 0.2, 1.2, modColor(arg), 0.4);
          this.burst(x, y, modColor(arg), 14, 3.0);
          break;
        case 'decoyEnd':
          this.burst(x, y, PAL.players[arg] || PAL.white, 12, 2.6);
          break;
      }
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

/**
 * @param {number} alpha avancement dans le tick courant (0..1). La simulation
 *   tourne à pas fixe ; sans ce mélange, un écran à 144 Hz afficherait la même
 *   position pendant plus d'une image sur deux, puis un saut d'un tick entier.
 */
export function drawGame(g, game, fx, time, alpha = 1, viewerId = -1) {
  drawGrid(g, game, time);
  drawOrbs(g, game, time);
  drawDrops(g, game, time);
  drawBombs(g, game, time, viewerId);
  drawFlames(g, game);
  drawDecoys(g, game, time);
  drawPlayers(g, game, time, alpha);
  fx.draw(g);
}

/** Modifieurs au sol : un tetrino qui flotte et tourne lentement sur lui-même. */
function drawDrops(g, game, time) {
  for (const d of game.drops) {
    const bob = Math.sin(time * 2.6 + d.cx * 1.3 + d.cy) * 0.05;
    const pulse = 0.7 + 0.3 * Math.sin(time * 3.4 + d.cx);
    const cell = 0.15 + 0.012 * Math.sin(time * 3 + d.cy);
    drawTetrino(g, d.mod, d.cx + 0.5, d.cy + 0.5 + bob, cell,
      { alpha: 1, glow: 1.1 * pulse });
  }
}

/** Le clone de Leurre : même silhouette que le joueur, mais évidée. */
function drawDecoys(g, game, time) {
  for (const k of game.decoys) {
    const color = PAL.players[k.owner] || PAL.white;
    const flick = 0.55 + 0.45 * Math.sin(time * 18 + k.x);
    g.disc(k.x, k.y, 0.31 * 0.78, scaleColor(color, 0.28),
      { alpha: 0.75, glow: 0.35 * flick, falloff: 8 });
    g.ring(k.x, k.y, 0.31, 0.026, color,
      { alpha: 0.8, glow: 0.7 * flick, falloff: 10 });
  }
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

/**
 * Les orbes se lisent d'abord à la couleur, puis à la rareté : nue en commun,
 * cerclée en peu commun, doublement cerclée et pulsante en rare.
 */
function drawOrbs(g, game, time) {
  for (const o of game.orbs) {
    const color = statColor(o.stat);
    const rim = statRim(o.stat);
    const rarity = STATS[o.stat].rarity;

    // plusieurs orbes sur la même case : on les écarte pour qu'elles se comptent
    const spread = o.i ? 0.17 : 0;
    const ang = o.i * 2.399;
    const cx = o.cx + 0.5 + Math.cos(ang) * spread;
    const cy = o.cy + 0.5 + Math.sin(ang) * spread
      + Math.sin(time * 3 + o.cx * 1.7 + o.cy + o.i) * 0.045;

    const pulse = 0.75 + 0.25 * Math.sin(time * 4 + o.cx + o.i);
    const r = 0.125 - o.i * 0.012;

    g.disc(cx, cy, r, color, { alpha: 1, glow: 0.5 + 0.7 * pulse, falloff: 9 });
    g.ring(cx, cy, r, 0.028, rim, { alpha: 1, glow: 1.1 * pulse, falloff: 11 });
    g.disc(cx, cy, r * 0.34, rim, { alpha: 0.85, glow: 0.9, falloff: 15 });

    if (rarity >= UNCOMMON) {
      g.arc(cx, cy, r + 0.075, 0.03, (time * 1.6 + o.i) % TAU, 2.4, rim,
        { alpha: 0.95, glow: 0.9 * pulse, falloff: 12 });
    }
    if (rarity >= RARE) {
      g.arc(cx, cy, r + 0.135, 0.026, (-time * 1.1 + o.i) % TAU + TAU, 1.9, rim,
        { alpha: 0.9, glow: 1.1 * pulse, falloff: 12 });
      g.disc(cx, cy, r + 0.16, rim, { alpha: 0, glow: 0.5 * pulse, falloff: 5 });
    }
  }
}

function drawBombs(g, game, time, viewerId) {
  for (const b of game.bombs) {
    if (b.dead) continue;

    // Camouflage : invisible pour l'adversaire jusqu'aux dernières secondes.
    // En local les deux joueurs partagent l'écran, il n'y a rien à cacher.
    const owner0 = game.players[b.owner];
    if (viewerId >= 0 && viewerId !== b.owner && owner0 && hasMod(owner0, M_CAMO)
        && b.fuse > 0.5) continue;

    const owner = PAL.players[b.owner] || PAL.white;
    const frac = Math.max(0, Math.min(1, b.fuse / FUSE));
    const urgency = 1 - frac;

    // Poussée : la case est déjà celle d'arrivée, seul l'affichage rattrape.
    const slide = b.st > 0 ? b.st / PUSH_SLIDE : 0;
    const bx = b.x - (b.sdx || 0) * slide;
    const by = b.y - (b.sdy || 0) * slide;

    // battement de plus en plus rapide à l'approche de l'explosion
    const beat = Math.sin(time * (7 + urgency * 26));
    const scale = 1 + beat * (0.035 + urgency * 0.075);
    const r = 0.235 * scale;

    const shell = mixColor(scaleColor(owner, 0.35), PAL.flameHot, urgency * 0.55);
    g.disc(bx, by, r, shell, { alpha: 1, glow: 0.25 + urgency * 1.2, falloff: 8 });
    g.ring(bx, by, r, 0.022, owner, { alpha: 0.9, glow: 0.5, falloff: 13 });

    // coeur incandescent
    g.disc(bx, by, r * 0.34, PAL.flameHot,
      { alpha: 0.35 + urgency * 0.65, glow: 0.6 + urgency * 1.8, falloff: 12 });

    // jauge circulaire de mèche : anneau de fond + arc restant
    const gr = 0.345;
    g.ring(bx, by, gr, 0.045, scaleColor(owner, 0.18), { alpha: 0.85, glow: 0 });
    if (frac > 0.001) {
      const hot = mixColor(owner, PAL.flame, urgency * 0.8);
      g.arc(bx, by, gr, 0.05, 0, frac * TAU, hot,
        { alpha: 1, glow: 1.1 + urgency, falloff: 10 });
    }
  }
}

function drawFlames(g, game) {
  for (const f of game.flames) {
    const cx = f.cx + 0.5, cy = f.cy + 0.5;

    // Brasier de Flammes : dangereux tant qu'il brûle, donc il garde son coeur
    // blanc en permanence — l'inverse d'un souffle ordinaire, qui s'éteint vite.
    if (f.p) {
      const k = Math.min(1, f.t / 0.4);
      const flick = 0.78 + 0.22 * Math.sin(game.time * 17 + f.cx * 3 + f.cy);
      const s = 0.42 * (0.9 + 0.1 * flick);
      g.box(cx, cy, s, s, s * 0.55, PAL.flame,
        { alpha: 0.85 * k, glow: 1.5 * flick * k, falloff: 4.5 });
      g.box(cx, cy, s * 0.5, s * 0.5, s * 0.4, PAL.flameHot,
        { alpha: k, glow: 2.0 * flick * k, falloff: 7 });
      continue;
    }

    const life = f.t / FLAME_TIME;               // 1 -> 0
    const grow = Math.min(1, (1 - life) / 0.1);  // montée quasi instantanée
    // Le coeur blanc marque exactement la fenêtre mortelle ; la traînée orange
    // qui suit n'est que de la braise, traversable sans risque.
    const hot = Math.max(0, Math.min(1, (f.t - (FLAME_TIME - LETHAL_TIME)) / 0.07 + 0.4));
    const embers = Math.pow(life, 1.9);

    const long = 0.5 * grow;
    const thin = 0.32 * grow * (0.55 + hot * 0.45);
    const hx = f.k === F_H ? long : f.k === F_CENTER ? 0.44 * grow : thin;
    const hy = f.k === F_H ? thin : f.k === F_CENTER ? 0.44 * grow : long;

    g.box(cx, cy, hx, hy, Math.min(hx, hy) * 0.9, PAL.flame,
      { alpha: embers * 0.8, glow: (0.5 + 1.4 * hot) * embers, falloff: 4.5 });
    if (hot > 0.01) {
      g.box(cx, cy, hx * 0.62, hy * 0.62, Math.min(hx, hy) * 0.55, PAL.flameHot,
        { alpha: hot, glow: 2.4 * hot, falloff: 6 });
    }
  }
}

function drawPlayers(g, game, time, alpha) {
  for (const p of game.players) {
    if (!p.alive) continue;
    const color = PAL.players[p.id] || PAL.white;
    if (p.invuln > 0 && Math.floor(time * 14) % 2 === 0) continue;

    const x = p.px + (p.x - p.px) * alpha;
    const y = p.py + (p.y - p.py) * alpha;

    const pulse = 0.85 + 0.15 * Math.sin(time * 4 + p.id * 2);
    g.disc(x, y, p.r * 0.78, scaleColor(color, 0.55),
      { alpha: 1, glow: 0.55 * pulse, falloff: 7 });
    g.disc(x, y, p.r * 0.34, PAL.white, { alpha: 0.8, glow: 0.8, falloff: 11 });
    g.ring(x, y, p.r, 0.03, color, { alpha: 1, glow: 0.9 * pulse, falloff: 9.5 });

    // petit repère d'orientation, toujours une primitive
    const d = Math.hypot(p.dirx, p.diry) || 1;
    g.disc(x + (p.dirx / d) * p.r * 0.72, y + (p.diry / d) * p.r * 0.72, 0.045,
      color, { alpha: 1, glow: 1.0, falloff: 16 });

    // Bouclier : un arc par charge restante, en rotation lente.
    const shields = p.stats ? p.stats[S_SHIELD] : 0;
    for (let i = 0; i < shields; i++) {
      const start = (time * 0.9 + (i * TAU) / shields) % TAU;
      g.arc(x, y, p.r + 0.1, 0.035, start, (TAU / shields) * 0.55, PAL.shield,
        { alpha: 0.95, glow: 1.2 * pulse, falloff: 11 });
    }
  }
}
