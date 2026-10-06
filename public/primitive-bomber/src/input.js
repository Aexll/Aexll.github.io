// input.js — clavier, quatre jeux de touches, avec détection de front pour la bombe.

/**
 * Un jeu par joueur local. Les deux premiers n'ont pas changé : ce sont ceux
 * que tout le monde connaît. Les deux suivants tiennent sur la même main
 * gauche (TFGH) et sur le pavé numérique, pour que quatre joueurs puissent
 * se partager un clavier sans se gêner.
 */
const SETS = [
  {
    up: ['KeyW'], down: ['KeyS'], left: ['KeyA'], right: ['KeyD'],
    bomb: ['Space'], power: ['KeyE'],
  },
  {
    up: ['ArrowUp'], down: ['ArrowDown'], left: ['ArrowLeft'], right: ['ArrowRight'],
    bomb: ['Enter', 'NumpadEnter', 'ShiftRight'], power: ['ControlRight'],
  },
  {
    up: ['KeyI'], down: ['KeyK'], left: ['KeyJ'], right: ['KeyL'],
    bomb: ['KeyU'], power: ['KeyO'],
  },
  {
    up: ['KeyT', 'Numpad8'], down: ['KeyG', 'Numpad5'],
    left: ['KeyF', 'Numpad4'], right: ['KeyH', 'Numpad6'],
    bomb: ['KeyR', 'Numpad0'], power: ['KeyY', 'NumpadAdd'],
  },
];

export const KEY_SETS = SETS.length;

const BLOCKED = new Set([
  'Space', 'ArrowUp', 'ArrowDown', 'ArrowLeft', 'ArrowRight', 'Enter',
]);

export class Input {
  constructor(target = window) {
    this.keys = new Set();
    this.bombQueued = new Array(KEY_SETS).fill(false);
    this.powerQueued = new Array(KEY_SETS).fill(false);

    target.addEventListener('keydown', (e) => {
      if (BLOCKED.has(e.code) && e.target === document.body) e.preventDefault();
      if (e.repeat) return;
      this.keys.add(e.code);
      for (let i = 0; i < SETS.length; i++) {
        if (SETS[i].bomb.includes(e.code)) this.bombQueued[i] = true;
        if (SETS[i].power.includes(e.code)) this.powerQueued[i] = true;
      }
    });

    target.addEventListener('keyup', (e) => this.keys.delete(e.code));
    window.addEventListener('blur', () => { this.keys.clear(); });
  }

  _axis(set) {
    const on = (list) => list.some((k) => this.keys.has(k));
    return {
      ax: (on(set.right) ? 1 : 0) - (on(set.left) ? 1 : 0),
      ay: (on(set.down) ? 1 : 0) - (on(set.up) ? 1 : 0),
    };
  }

  /** Lit un jeu de touches et consomme les fronts bombe et pouvoir. */
  read(which) {
    const { ax, ay } = this._axis(SETS[which]);
    const bomb = this.bombQueued[which];
    const power = this.powerQueued[which];
    this.bombQueued[which] = false;
    this.powerQueued[which] = false;
    return { ax, ay, bomb, power };
  }

  /** En ligne : tous les jeux de touches pilotent le joueur local. */
  readAny() {
    let ax = 0, ay = 0, bomb = false, power = false;
    for (let i = 0; i < SETS.length; i++) {
      const a = this._axis(SETS[i]);
      ax += a.ax; ay += a.ay;
      bomb = bomb || this.bombQueued[i];
      power = power || this.powerQueued[i];
      this.bombQueued[i] = false;
      this.powerQueued[i] = false;
    }
    return { ax: Math.sign(ax), ay: Math.sign(ay), bomb, power };
  }
}
