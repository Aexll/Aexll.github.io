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
export const PUSH_SLIDE = 0.14;   // durée du glissement d'une bombe poussée
export const SHIELD_GRACE = 1.0;  // invulnérabilité offerte après un bouclier absorbé

// Flamme : 0 = centre, 1 = horizontale, 2 = verticale
export const F_CENTER = 0, F_H = 1, F_V = 2;

// ---------------------------------------------------------------- statistiques

export const COMMON = 0, UNCOMMON = 1, RARE = 2;

export const S_BOMBS = 0, S_FIRE = 1, S_SPEED = 2,
             S_LUCK = 3, S_PIERCE = 4, S_PUSH = 5,
             S_SHIELD = 6, S_PRECISION = 7, S_GENERAL = 8;

/**
 * Table unique des statistiques. `color` n'est jamais lu par la simulation :
 * il est là pour que la vue et l'interface n'aient pas leur propre table à
 * garder synchronisée avec celle-ci.
 */
export const STATS = [
  { key: 'bombs',   rarity: COMMON,   color: '#3b82f6', label: 'Bombes',      short: '◉' },
  { key: 'fire',    rarity: COMMON,   color: '#ef4444', label: 'Explosion',   short: '✳' },
  { key: 'speed',   rarity: COMMON,   color: '#22c55e', label: 'Vitesse',     short: '»' },
  { key: 'luck',    rarity: UNCOMMON, color: '#eab308', label: 'Chance',      short: '✦' },
  { key: 'pierce',  rarity: UNCOMMON, color: '#f97316', label: 'Percée',      short: '➤' },
  { key: 'push',    rarity: UNCOMMON, color: '#a855f7', label: 'Poussée',     short: '↦' },
  { key: 'shield',    rarity: RARE, color: '#22d3ee', label: 'Bouclier',  short: '⛨' },
  { key: 'precision', rarity: RARE, color: '#141824', label: 'Précision', short: '◈' },
  { key: 'general',   rarity: RARE, color: '#ffffff', label: 'Général',   short: '★' },
];

export const STAT_COUNT = STATS.length;
export const MAX_STAT = 9;

// ---------------------------------------------------------------- modifieurs

export const M_EMPATHY = 0, M_DETONATOR = 1, M_VERGLAS = 2, M_FLAMES = 3,
             M_SWAP = 4, M_WANDER = 5, M_BARRICADE = 6, M_DECOY = 7,
             M_CAMO = 8, M_FRAG = 9, M_GHOST = 10, M_MORPH = 11;

/**
 * Chaque modifieur porte une forme en carrés — un « tetrino » — qui l'identifie
 * au sol comme dans l'interface. `cd` à 0 signifie utilisable en continu ;
 * `active: false` signifie que l'effet est permanent, sans touche à presser.
 */
export const MODIFIERS = [
  { key: 'empathy', label: 'Empathie', color: '#ff6b9d', active: false, cd: 0,
    shape: [[0, 0], [1, 0], [0, 1], [1, 1]],
    help: 'un rayon qui te toucherait n\'est pas déclenché' },
  { key: 'detonator', label: 'Détonateur', color: '#ff5722', active: true, cd: 0,
    shape: [[0, 0], [1, 0], [2, 0], [3, 0]],
    help: 'fait sauter ta plus ancienne bombe' },
  { key: 'verglas', label: 'Verglas', color: '#7dd3fc', active: false, cd: 0,
    shape: [[0, 0], [1, 0], [2, 0], [1, 1]],
    help: 'les bombes poussées glissent jusqu\'à l\'obstacle' },
  { key: 'flames', label: 'Flammes', color: '#fb923c', active: false, cd: 0,
    shape: [[0, 0], [0, 1], [0, 2], [1, 2]],
    help: 'laisse un brasier de 2 s sur l\'explosion' },
  { key: 'swap', label: 'Swap', color: '#34d399', active: true, cd: 3,
    shape: [[1, 0], [2, 0], [0, 1], [1, 1]],
    help: 'échange ta place avec ta plus ancienne bombe' },
  { key: 'wander', label: 'Baladeuse', color: '#c084fc', active: false, cd: 0,
    shape: [[0, 0], [1, 0], [1, 1], [2, 1]],
    help: 'tes bombes changent de case toutes les 0,5 s' },
  { key: 'barricade', label: 'Barricade', color: '#94a3b8', active: true, cd: 5,
    shape: [[1, 0], [1, 1], [1, 2], [0, 2]],
    help: 'invoque un bloc destructible sous toi' },
  { key: 'decoy', label: 'Leurre', color: '#f0abfc', active: true, cd: 5,
    shape: [[0, 0], [0, 1], [1, 1]],
    help: 'un clone file tout droit jusqu\'au mur' },
  { key: 'camo', label: 'Camouflage', color: '#475569', active: false, cd: 0,
    shape: [[1, 0], [0, 1], [1, 1], [2, 1], [1, 2]],
    help: 'tes bombes sont invisibles jusqu\'aux 0,5 dernières secondes' },
  { key: 'frag', label: 'Fragmentation', color: '#38bdf8', active: false, cd: 0,
    shape: [[0, 0], [1, 0], [2, 0], [0, 1], [2, 1]],
    help: 'un rayon bloqué par un mur dur se scinde de part et d\'autre' },
  { key: 'ghost', label: 'Fantômes', color: '#e2e8f0', active: false, cd: 0,
    shape: [[0, 0], [1, 0], [0, 1], [1, 1], [0, 2]],
    help: 'tu traverses tes propres bombes, pas tes adversaires' },
  { key: 'morph', label: 'Métamorphose', color: '#a3e635', active: true, cd: 10,
    shape: [[0, 0], [1, 0], [2, 0], [1, 1], [1, 2]],
    help: 'transforme toutes les orbes du terrain en bombes' },
];

export const MOD_COUNT = MODIFIERS.length;

export const hasMod = (p, m) => p.mods !== undefined && (p.mods & (1 << m)) !== 0;

const PERSIST_FIRE = 2.0;    // durée du brasier laissé par Flammes
const WANDER_EVERY = 0.5;    // cadence de déplacement de Baladeuse
const CAMO_REVEAL = 0.5;     // les bombes camouflées réapparaissent à ce reste de mèche
const DECOY_LIFE = 6;        // sécurité si le clone ne rencontre jamais de mur

/** Poids de tirage par rareté : commun, peu commun, rare. */
const RARITY_WEIGHTS = [62, 28, 10];

const BASE_SPEED = 4.0;
const MAX_SPEED = 7.0;
const MAX_RANGE = 8;
const MAX_BOMBS = 8;

// Cascade d'orbes : 1/4 pour la première, puis la probabilité est divisée par 2
// à chaque orbe déjà tombée (1/8, 1/16…). Chaque point de Chance décale la
// cascade d'un cran vers le haut, donc double la probabilité de départ.
const ORB_CHANCE = 0.25;
const ORB_DECAY = 0.5;
const ORB_MAX = 8;                // borne de sécurité si la Chance monte très haut

/** Un bloc peut aussi lâcher un modifieur, indépendamment des orbes. */
const MOD_CHANCE = 0.09;

/** Ce que la Précision verse dans la stat qu'elle tire au sort. */
const PRECISION_BONUS = 3;

const lvl = (p, s) => p.stats[s];

export const maxBombsOf = (p) => Math.min(MAX_BOMBS, 1 + lvl(p, S_BOMBS) + lvl(p, S_GENERAL));
export const rangeOf = (p) => Math.min(MAX_RANGE, 2 + lvl(p, S_FIRE) + lvl(p, S_GENERAL));
export const speedOf = (p) =>
  Math.min(MAX_SPEED, BASE_SPEED + (lvl(p, S_SPEED) + lvl(p, S_GENERAL)) * 0.5);
/** Nombre de blocs qu'un rayon d'explosion traverse. */
export const pierceOf = (p) => 1 + lvl(p, S_PIERCE);
/** Nombre de bombes poussées d'un coup. 0 = ne pousse pas. */
export const pushOf = (p) => lvl(p, S_PUSH);
export const luckOf = (p) => lvl(p, S_LUCK);
export const shieldOf = (p) => lvl(p, S_SHIELD);

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
  for (let y = 0; y < ROWS; y++) {
    for (let x = 0; x < COLS; x++) {
      const i = y * COLS + x;
      if (x === 0 || y === 0 || x === COLS - 1 || y === ROWS - 1) grid[i] = T_SOLID;
      else if (x % 2 === 0 && y % 2 === 0) grid[i] = T_SOLID;
      else if (!isSpawnZone(x, y) && rnd() < 0.82) grid[i] = T_BRICK;
      else grid[i] = T_EMPTY;
    }
  }
  return grid;
}

function makePlayer(id, x, y) {
  return {
    id, x, y, r: PLAYER_R,
    px: x, py: y,         // position au début du tick, pour l'interpolation de rendu
    alive: true,
    active: 0,            // bombes posées et pas encore explosées
    stats: new Array(STAT_COUNT).fill(0),
    mods: 0,                             // masque de bits des modifieurs possédés
    cd: new Array(MOD_COUNT).fill(0),    // recharges en cours
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
    this.seed = seed >>> 0;
    this.grid = generateMap(this.seed);
    this.gridVersion = 0;
    this.time = 0;
    this.players = [
      makePlayer(0, 1.5, 1.5),
      makePlayer(1, COLS - 1.5, ROWS - 1.5),
    ];
    this.bombs = [];
    this.flames = [];
    this.orbs = [];
    this.drops = [];       // modifieurs au sol
    this.decoys = [];      // clones lancés par Leurre
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

    for (let i = 0; i < this.players.length; i++) {
      const p = this.players[i];
      for (let m = 0; m < MOD_COUNT; m++) if (p.cd[m] > 0) p.cd[m] -= dt;
      if (inputs[i] && inputs[i].power) this.usePower(i);
    }

    this._updateFlames(dt);
    this._updateBombs(dt, inputs);
    this._updateDecoys(dt);

    for (let i = 0; i < this.players.length; i++) {
      const p = this.players[i];
      if (p.invuln > 0) p.invuln -= dt;
      this.movePlayer(p, inputs[i] || { ax: 0, ay: 0 }, dt);
    }

    this._pickups();
    this._deaths();

    if (this.over) this.overTimer += dt;
  }

  // ------------------------------------------------------------ pouvoirs

  /** Déclenche tous les modifieurs actifs prêts. Une seule touche les couvre tous. */
  usePower(playerId) {
    const p = this.players[playerId];
    if (!p || !p.alive || this.over) return;
    for (let m = 0; m < MOD_COUNT; m++) {
      if (!MODIFIERS[m].active || !hasMod(p, m) || p.cd[m] > 0) continue;
      if (this._activate(p, m)) {
        p.cd[m] = MODIFIERS[m].cd;
        this.events.push(['power', p.x, p.y, m]);
      }
    }
  }

  /** Plus ancienne bombe encore en vie appartenant à ce joueur. */
  _oldestBomb(playerId) {
    return this.bombs.find((b) => !b.dead && b.owner === playerId) || null;
  }

  _activate(p, m) {
    if (m === M_DETONATOR) {
      const b = this._oldestBomb(p.id);
      if (!b) return false;
      b.fuse = 0;
      return true;
    }

    if (m === M_SWAP) {
      const b = this._oldestBomb(p.id);
      if (!b) return false;
      const px = Math.floor(p.x), py = Math.floor(p.y);
      if (this.tileAt(px, py) !== T_EMPTY) return false;
      const bx = b.cx, by = b.cy;
      b.cx = px; b.cy = py; b.x = px + 0.5; b.y = py + 0.5;
      b.st = 0; b.sdx = 0; b.sdy = 0;
      p.x = bx + 0.5; p.y = by + 0.5;
      p.px = p.x; p.py = p.y;
      // On sort de la case où l'on atterrit sans y être bloqué par la bombe.
      b.pass.add(p.id);
      return true;
    }

    if (m === M_BARRICADE) {
      const cx = Math.floor(p.x), cy = Math.floor(p.y);
      if (this.tileAt(cx, cy) !== T_EMPTY || this.bombAt(cx, cy)) return false;
      this.grid[cy * COLS + cx] = T_BRICK;
      this.gridVersion++;
      // Le bloc naît sous le joueur : la résolution de collision l'éjecte aussitôt.
      this._resolve(p);
      return true;
    }

    if (m === M_DECOY) {
      const d = Math.hypot(p.dirx, p.diry) || 1;
      this.decoys.push({
        owner: p.id, x: p.x, y: p.y,
        dx: p.dirx / d, dy: p.diry / d,
        speed: speedOf(p) * 1.15, t: DECOY_LIFE,
      });
      return true;
    }

    if (m === M_MORPH) {
      if (!this.orbs.length) return false;
      for (const o of this.orbs) {
        if (this.bombAt(o.cx, o.cy)) continue;
        this.bombs.push({
          cx: o.cx, cy: o.cy, x: o.cx + 0.5, y: o.cy + 0.5,
          fuse: FUSE, range: rangeOf(p), pierce: pierceOf(p),
          owner: p.id, dead: false, pass: new Set(),
          st: 0, sdx: 0, sdy: 0, gdx: 0, gdy: 0, wt: 0,
          // Ces bombes ne comptent pas dans la limite : sinon la Métamorphose
          // bloquerait la pose de bombes pendant toute leur mèche.
          free: true,
        });
      }
      this.orbs.length = 0;
      return true;
    }

    return false;
  }

  _updateDecoys(dt) {
    for (let i = this.decoys.length - 1; i >= 0; i--) {
      const d = this.decoys[i];
      d.t -= dt;
      const nx = d.x + d.dx * d.speed * dt;
      const ny = d.y + d.dy * d.speed * dt;
      const blocked = this.tileAt(Math.floor(nx + d.dx * PLAYER_R),
                                 Math.floor(ny + d.dy * PLAYER_R)) !== T_EMPTY;
      if (blocked || d.t <= 0) {
        this.events.push(['decoyEnd', d.x, d.y, d.owner]);
        this.decoys.splice(i, 1);
        continue;
      }
      d.x = nx; d.y = ny;
    }
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
      // Un souffle ordinaire ne tue qu'à l'allumage ; le brasier de Flammes est
      // au contraire une zone qui reste dangereuse tant qu'elle brûle.
      if (f.p || f.t > FLAME_TIME - LETHAL_TIME) this._lethalSet.add(key);
    }
  }

  _updateBombs(dt, inputs) {
    for (let i = 0; i < this.players.length; i++) {
      const inp = inputs[i];
      if (inp && inp.bomb) this.placeBomb(i);
    }

    for (const b of this.bombs) {
      if (b.dead) continue;
      b.fuse -= dt;
      if (b.st > 0) b.st = Math.max(0, b.st - dt);
      if (b.st === 0) { this._glide(b); this._wander(b, dt); }
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
    if (p.active >= maxBombsOf(p)) return null;
    const cx = Math.floor(p.x), cy = Math.floor(p.y);
    if (this.tileAt(cx, cy) !== T_EMPTY) return null;
    if (this.bombAt(cx, cy)) return null;

    const bomb = {
      cx, cy,
      x: cx + 0.5, y: cy + 0.5,
      fuse: FUSE,
      range: rangeOf(p),
      pierce: pierceOf(p),
      owner: playerId,
      dead: false,
      pass: new Set([playerId]),
      st: 0, sdx: 0, sdy: 0,   // glissement en cours (poussée)
      gdx: 0, gdy: 0,          // élan conservé par Verglas
      wt: 0,                   // minuterie de Baladeuse
      free: false,             // ne compte pas dans la limite de bombes
    };
    this.bombs.push(bomb);
    p.active++;
    this.events.push(['place', bomb.x, bomb.y, playerId]);
    return bomb;
  }

  /** Case occupée par un joueur, au sens de la grille. */
  _occupies(p, cx, cy) {
    return !!p && p.alive && Math.floor(p.x) === cx && Math.floor(p.y) === cy;
  }

  _explode(bomb) {
    bomb.dead = true;
    const owner = this.players[bomb.owner];
    if (owner && !bomb.free) owner.active = Math.max(0, owner.active - 1);

    const opt = {
      owner,
      empathy: !!owner && hasMod(owner, M_EMPATHY),
      frag: !!owner && hasMod(owner, M_FRAG),
      persist: !!owner && hasMod(owner, M_FLAMES),
    };

    if (!(opt.empathy && this._occupies(owner, bomb.cx, bomb.cy))) {
      this._addFlame(bomb.cx, bomb.cy, F_CENTER, opt.persist);
    }
    for (const [dx, dy] of [[1, 0], [-1, 0], [0, 1], [0, -1]]) {
      this._ray(bomb.cx, bomb.cy, dx, dy, bomb.range, bomb.pierce, bomb.owner, opt, 0);
    }
    this.events.push(['boom', bomb.x, bomb.y, bomb.range]);
  }

  /**
   * Un bras d'explosion. Se rappelle lui-même pour la Fragmentation, d'où la
   * profondeur : sans elle, un couloir de murs durs ferait diverger la récursion.
   */
  _ray(ox, oy, dx, dy, range, pierce, ownerId, opt, depth) {
    const kind = dx !== 0 ? F_H : F_V;

    // Empathie : on inspecte le bras avant de l'allumer. S'il atteint son
    // porteur, il n'est pas déclenché du tout.
    if (opt.empathy) {
      for (let i = 1; i <= range; i++) {
        const x = ox + dx * i, y = oy + dy * i;
        const t = this.tileAt(x, y);
        if (t === T_SOLID) break;
        if (this._occupies(opt.owner, x, y)) return;
        if (t === T_BRICK) break;
      }
    }

    let left = pierce;
    for (let i = 1; i <= range; i++) {
      const x = ox + dx * i, y = oy + dy * i;
      const t = this.tileAt(x, y);

      if (t === T_SOLID) {
        if (opt.frag && depth < 2) {
          // le bras rebondit de part et d'autre depuis la dernière case libre
          const bx = ox + dx * (i - 1), by = oy + dy * (i - 1);
          const rest = range - i + 1;
          this._ray(bx, by, dy, dx, rest, left, ownerId, opt, depth + 1);
          this._ray(bx, by, -dy, -dx, rest, left, ownerId, opt, depth + 1);
        }
        break;
      }

      if (t === T_BRICK) {
        this._destroyBrick(x, y, ownerId);
        this._addFlame(x, y, kind, opt.persist);
        if (--left <= 0) break;   // Percée : le rayon continue au-delà
        continue;
      }

      this._addFlame(x, y, kind, opt.persist);
      const other = this.bombAt(x, y);
      if (other) other.fuse = 0;   // sera traité par la boucle de chaîne
    }
  }

  _destroyBrick(x, y, ownerId) {
    this.grid[y * COLS + x] = T_EMPTY;
    this.gridVersion++;
    this.events.push(['brick', x + 0.5, y + 0.5, 0]);
    this._dropOrbs(x, y, this.players[ownerId]);
    this._dropModifier(x, y);
  }

  /**
   * Tirage indépendant de la cascade d'orbes. On ne fait tomber qu'un modifieur
   * que quelqu'un peut encore obtenir, sinon il resterait au sol sans preneur.
   */
  _dropModifier(cx, cy) {
    if (Math.random() >= MOD_CHANCE) return;
    if (this.drops.some((d) => d.cx === cx && d.cy === cy)) return;
    const pool = [];
    for (let m = 0; m < MOD_COUNT; m++) {
      if (this.players.some((p) => !hasMod(p, m))) pool.push(m);
    }
    if (!pool.length) return;
    const mod = pool[(Math.random() * pool.length) | 0];
    this.drops.push({ cx, cy, mod, bt: this.time });
    this.events.push(['modDrop', cx + 0.5, cy + 0.5, mod]);
  }

  /**
   * Cascade : on tire à 1/4, et chaque succès relance à la moitié de la
   * probabilité précédente. La Chance double la probabilité de départ, ce qui
   * revient à démarrer la cascade un cran plus haut.
   */
  _dropOrbs(cx, cy, breaker) {
    let p = ORB_CHANCE * Math.pow(2, breaker ? luckOf(breaker) : 0);
    let n = 0;
    while (n < ORB_MAX && Math.random() < p) { n++; p *= ORB_DECAY; }
    for (let i = 0; i < n; i++) {
      const stat = this._rollStat();
      if (stat < 0) continue;
      this.orbs.push({
        cx, cy, stat,
        i: this.orbs.filter((o) => o.cx === cx && o.cy === cy).length,
        // Date de naissance : le souffle qui vient de révéler l'orbe ne doit pas
        // la détruire dans la foulée. Voir _addFlame.
        bt: this.time,
      });
      this.events.push(['orb', cx + 0.5, cy + 0.5, stat]);
    }
  }

  /** Tire une rareté selon les poids, puis une stat au hasard dans ce palier. */
  _rollStat() {
    const tiers = [[], [], []];
    for (let i = 0; i < STAT_COUNT; i++) tiers[STATS[i].rarity].push(i);

    let roll = Math.random() * RARITY_WEIGHTS.reduce((a, b) => a + b, 0);
    for (let r = 0; r < 3; r++) {
      roll -= RARITY_WEIGHTS[r];
      if (roll <= 0) return tiers[r][(Math.random() * tiers[r].length) | 0];
    }
    return S_BOMBS;
  }

  _addFlame(cx, cy, kind, persist = false) {
    // Ajouté aux deux ensembles : _updateFlames a déjà tourné pour ce tick, et
    // un souffle doit tuer dès l'instant où il apparaît.
    this._flameSet.add(cy * COLS + cx);
    this._lethalSet.add(cy * COLS + cx);
    const life = persist ? PERSIST_FIRE : FLAME_TIME;
    const existing = this.flames.find((f) => f.cx === cx && f.cy === cy);
    if (existing) {
      existing.t = Math.max(existing.t, life);
      existing.p = existing.p || (persist ? 1 : 0);
      if (kind === F_CENTER) existing.k = F_CENTER;
    } else {
      this.flames.push({ cx, cy, t: life, k: kind, p: persist ? 1 : 0 });
    }
    // Les orbes au sol brûlent — sauf celles nées dans ce même tick, sinon un
    // bloc détruirait l'orbe qu'il vient de libérer, et plus rien n'apparaîtrait.
    for (let i = this.orbs.length - 1; i >= 0; i--) {
      const o = this.orbs[i];
      if (o.cx === cx && o.cy === cy && o.bt < this.time) {
        this.orbs.splice(i, 1);
        this.events.push(['burn', cx + 0.5, cy + 0.5, o.stat]);
      }
    }
    for (let i = this.drops.length - 1; i >= 0; i--) {
      const d = this.drops[i];
      if (d.cx === cx && d.cy === cy && d.bt < this.time) {
        this.drops.splice(i, 1);
        this.events.push(['modBurn', cx + 0.5, cy + 0.5, d.mod]);
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
    if (!b) return false;
    // Fantômes : ses propres bombes le laissent passer, celles des autres non.
    if (b.owner === player.id && hasMod(player, M_GHOST)) return false;
    return !b.pass.has(player.id);
  }

  /** Une case est-elle libre pour qu'une bombe s'y installe ? */
  _bombCanEnter(cx, cy, self) {
    if (this.tileAt(cx, cy) !== T_EMPTY) return false;
    const other = this.bombAt(cx, cy);
    if (other && other !== self) return false;
    for (const p of this.players) if (this._occupies(p, cx, cy)) return false;
    return true;
  }

  _slideBomb(b, dx, dy) {
    b.cx += dx; b.cy += dy;
    b.x = b.cx + 0.5; b.y = b.cy + 0.5;
    b.st = PUSH_SLIDE; b.sdx = dx; b.sdy = dy;
    b.pass.clear();
  }

  /** Verglas : la bombe poursuit sur sa lancée jusqu'au premier obstacle. */
  _glide(b) {
    if (!b.gdx && !b.gdy) return;
    if (this._bombCanEnter(b.cx + b.gdx, b.cy + b.gdy, b)) {
      this._slideBomb(b, b.gdx, b.gdy);
    } else {
      b.gdx = 0; b.gdy = 0;
    }
  }

  /** Baladeuse : saut sur une case adjacente libre, à cadence fixe. */
  _wander(b, dt) {
    const owner = this.players[b.owner];
    if (!owner || !hasMod(owner, M_WANDER)) return;
    b.wt = (b.wt || 0) + dt;
    if (b.wt < WANDER_EVERY) return;
    b.wt = 0;
    const dirs = [[1, 0], [-1, 0], [0, 1], [0, -1]]
      .filter(([dx, dy]) => this._bombCanEnter(b.cx + dx, b.cy + dy, b));
    if (!dirs.length) return;
    const [dx, dy] = dirs[(Math.random() * dirs.length) | 0];
    this._slideBomb(b, dx, dy);
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

  /**
   * Poussée : déplace d'une case la file de bombes située devant le joueur.
   * Le niveau de Poussée fixe le nombre de bombes déplaçables d'un seul coup.
   */
  _tryPush(p, dx, dy) {
    const power = pushOf(p);
    if (!power || (dx === 0 && dy === 0)) return;

    const cx = Math.floor(p.x) + dx, cy = Math.floor(p.y) + dy;
    const first = this.bombAt(cx, cy);
    if (!first || first.pass.has(p.id) || first.st > 0) return;

    // combien de bombes alignées derrière celle-ci ?
    const train = [];
    for (let i = 0; i < power; i++) {
      const b = this.bombAt(cx + dx * i, cy + dy * i);
      if (!b) break;
      if (b.st > 0) return;           // une bombe encore en mouvement bloque tout
      train.push(b);
    }
    if (!train.length) return;
    if (this.bombAt(cx + dx * train.length, cy + dy * train.length)) return; // file trop longue

    const ex = cx + dx * train.length, ey = cy + dy * train.length;
    if (this.tileAt(ex, ey) !== T_EMPTY) return;
    for (const other of this.players) {
      if (other.alive && this._overlapsCell(other, ex, ey)) return;
    }

    const slippery = hasMod(p, M_VERGLAS);
    // de la plus éloignée à la plus proche, pour ne jamais en superposer deux
    for (let i = train.length - 1; i >= 0; i--) {
      const b = train[i];
      this._slideBomb(b, dx, dy);
      // Verglas : la bombe garde son élan et continuera seule, case après case.
      if (slippery) { b.gdx = dx; b.gdy = dy; }
    }
    this.events.push(['push', train[0].x, train[0].y, p.id]);
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

    if (ax !== 0) this._tryPush(p, Math.sign(ax), 0);
    if (ay !== 0) this._tryPush(p, 0, Math.sign(ay));

    const step = speedOf(p) * dt;
    if (ax !== 0) { p.x += ax * step; this._resolve(p); }
    if (ay !== 0) { p.y += ay * step; this._resolve(p); }

    if (ax !== 0 && ay === 0) this._align(p, 'y', step * 0.85);
    else if (ay !== 0 && ax === 0) this._align(p, 'x', step * 0.85);
  }

  _pickups() {
    for (const p of this.players) {
      if (!p.alive) continue;
      const cx = Math.floor(p.x), cy = Math.floor(p.y);
      for (let i = this.orbs.length - 1; i >= 0; i--) {
        const o = this.orbs[i];
        if (o.cx !== cx || o.cy !== cy) continue;
        this.orbs.splice(i, 1);
        this._collect(p, o.stat, cx + 0.5, cy + 0.5);
      }
      for (let i = this.drops.length - 1; i >= 0; i--) {
        const d = this.drops[i];
        if (d.cx !== cx || d.cy !== cy) continue;
        // Un modifieur déjà possédé se laisse sur place : l'adversaire y a droit.
        if (hasMod(p, d.mod)) continue;
        this.drops.splice(i, 1);
        p.mods |= (1 << d.mod);
        this.events.push(['modPick', cx + 0.5, cy + 0.5, d.mod]);
      }
    }
  }

  _collect(p, stat, x, y) {
    p.stats[stat] = Math.min(MAX_STAT, p.stats[stat] + 1);
    this.events.push(['pick', x, y, stat]);
    if (stat !== S_PRECISION) return;

    // La Précision se compte comme les autres, mais son effet est de verser
    // PRECISION_BONUS dans une autre stat tirée au sort — de préférence une
    // qui n'est pas déjà au plafond, sinon le bonus serait perdu.
    const others = [];
    for (let i = 0; i < STAT_COUNT; i++) if (i !== S_PRECISION) others.push(i);
    const room = others.filter((i) => p.stats[i] < MAX_STAT);
    const pool = room.length ? room : others;
    const target = pool[(Math.random() * pool.length) | 0];
    p.stats[target] = Math.min(MAX_STAT, p.stats[target] + PRECISION_BONUS);
    this.events.push(['boost', x, y, target]);
  }

  _deaths() {
    if (this.over) return;
    let died = false;
    for (const p of this.players) {
      if (!p.alive || p.invuln > 0) continue;
      const key = Math.floor(p.y) * COLS + Math.floor(p.x);
      if (!this._lethalSet.has(key)) continue;

      // Le Bouclier encaisse un souffle et laisse un court sursis pour sortir.
      if (p.stats[S_SHIELD] > 0) {
        p.stats[S_SHIELD]--;
        p.invuln = SHIELD_GRACE;
        this.events.push(['shield', p.x, p.y, p.id]);
        continue;
      }
      p.alive = false;
      died = true;
      this.events.push(['die', p.x, p.y, p.id]);
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
        r2(p.x), r2(p.y), p.alive ? 1 : 0, p.active, r2(p.invuln), p.mods,
        // seules les recharges en cours voyagent, il y en a rarement plus d'une
        p.cd.map((v, m) => (v > 0 ? [m, r2(v)] : null)).filter(Boolean),
        ...p.stats,
      ]),
      b: this.bombs.map((b) => [
        b.cx, b.cy, r2(b.fuse), b.range, b.owner, r2(b.st), b.sdx, b.sdy,
      ]),
      f: this.flames.map((f) => [f.cx, f.cy, r2(f.t), f.k, f.p || 0]),
      u: this.orbs.map((o) => [o.cx, o.cy, o.stat, o.i]),
      m: this.drops.map((d) => [d.cx, d.cy, d.mod]),
      d: this.decoys.map((k) => [r2(k.x), r2(k.y), r2(k.dx), r2(k.dy), k.owner]),
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
      p.active = a[3];
      p.invuln = a[4];
      p.mods = a[5];
      p.cd.fill(0);
      for (const [m, v] of a[6]) p.cd[m] = v;
      for (let k = 0; k < STAT_COUNT; k++) p.stats[k] = a[7 + k] || 0;
      if (i === localId) {
        authoritative = { x: a[0], y: a[1] };
      } else {
        p.tx = a[0]; p.ty = a[1];          // cible interpolée par le rendu
        if (p.x === undefined) { p.x = a[0]; p.y = a[1]; }
      }
    }

    // Bombes : on conserve l'objet existant pour garder une mèche fluide.
    const keep = [];
    for (const [cx, cy, fuse, range, owner, st, sdx, sdy] of s.b) {
      let b = this.bombs.find((o) => o.cx === cx && o.cy === cy);
      if (!b) {
        b = { cx, cy, x: cx + 0.5, y: cy + 0.5, dead: false, pass: new Set(),
              pierce: 1, gdx: 0, gdy: 0, wt: 0, free: false };
        // Reproduit la règle de l'hôte : qui est déjà sur la case peut en sortir.
        for (const pl of this.players) {
          if (this._overlapsCell(pl, cx, cy)) b.pass.add(pl.id);
        }
      }
      b.fuse = fuse; b.range = range; b.owner = owner;
      b.st = st; b.sdx = sdx; b.sdy = sdy;
      keep.push(b);
    }
    this.bombs = keep;

    this.flames = s.f.map(([cx, cy, t, k, p]) => ({ cx, cy, t, k, p }));
    this._rebuildFlameSets();

    // `bt` n'est utile qu'à l'hôte : lui seul fait exploser et brûler.
    this.orbs = s.u.map(([cx, cy, stat, i]) => ({ cx, cy, stat, i, bt: 0 }));
    this.drops = s.m.map(([cx, cy, mod]) => ({ cx, cy, mod, bt: 0 }));
    this.decoys = s.d.map(([x, y, dx, dy, owner]) => ({ x, y, dx, dy, owner, t: 1 }));

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
      if (b.st > 0) b.st = Math.max(0, b.st - dt);
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

    // les clones filent tout droit : inutile d'attendre l'instantané suivant
    for (const k of this.decoys) {
      k.x += k.dx * BASE_SPEED * 1.15 * dt;
      k.y += k.dy * BASE_SPEED * 1.15 * dt;
    }

    this.time += dt;
    for (const p of this.players) {
      if (p.invuln > 0) p.invuln -= dt;
      for (let m = 0; m < MOD_COUNT; m++) if (p.cd[m] > 0) p.cd[m] -= dt;
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
      // Un souffle ordinaire ne tue qu'à l'allumage ; le brasier de Flammes est
      // au contraire une zone qui reste dangereuse tant qu'elle brûle.
      if (f.p || f.t > FLAME_TIME - LETHAL_TIME) this._lethalSet.add(key);
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
