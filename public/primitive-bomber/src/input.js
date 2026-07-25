// input.js — clavier, deux jeux de touches, avec détection de front pour la bombe.

const SETS = [
  {
    up: ['KeyW'], down: ['KeyS'], left: ['KeyA'], right: ['KeyD'],
    bomb: ['Space'], power: ['KeyE'],
  },
  {
    up: ['ArrowUp'], down: ['ArrowDown'], left: ['ArrowLeft'], right: ['ArrowRight'],
    bomb: ['Enter', 'NumpadEnter', 'ShiftRight'], power: ['ControlRight'],
  },
];

const BLOCKED = new Set([
  'Space', 'ArrowUp', 'ArrowDown', 'ArrowLeft', 'ArrowRight', 'Enter',
]);

export class Input {
  constructor(target = window) {
    this.keys = new Set();
    this.bombQueued = [false, false];
    this.powerQueued = [false, false];

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

  /** En ligne : les deux jeux de touches pilotent le joueur local. */
  readAny() {
    const a = this._axis(SETS[0]);
    const b = this._axis(SETS[1]);
    const bomb = this.bombQueued[0] || this.bombQueued[1];
    const power = this.powerQueued[0] || this.powerQueued[1];
    this.bombQueued[0] = this.bombQueued[1] = false;
    this.powerQueued[0] = this.powerQueued[1] = false;
    return {
      ax: Math.sign(a.ax + b.ax),
      ay: Math.sign(a.ay + b.ay),
      bomb,
      power,
    };
  }
}
