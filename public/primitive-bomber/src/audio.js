// audio.js — musiques et effets sonores.
//
// Deux chaînes distinctes, chacune adaptée à son usage :
//  · les musiques passent par des <audio> en streaming (3 à 4 minutes chacune :
//    les décoder en AudioBuffer coûterait ~90 Mo de RAM par piste) ;
//  · les effets passent par la Web Audio API, seule façon d'avoir des voix
//    superposées avec une variation de hauteur.
//
// Les navigateurs interdisent tout son avant une interaction : `unlock()` est
// appelé au premier clic ou à la première touche.

const SFX_DIR = 'audio/';
const MUSIC_DIR = 'audio/themes/';

// Les variantes B, plus longues et plus graves, sont réservées à un usage futur
// (bombes améliorées) ; seules les A servent aux bombes de base.
const EXPLOSION_A = [
  'AmberEndExplosionA_1.ogg',
  'AmberEndExplosionA_2.ogg',
  'AmberEndExplosionA_3.ogg',
  'AmberEndExplosionA_4.ogg',
];
export const EXPLOSION_B = [
  'AmberEndExplosionB_1.ogg',
  'AmberEndExplosionB_2.ogg',
  'AmberEndExplosionB_3.ogg',
  'AmberEndExplosionB_4.ogg',
];

const RESTART = 'GameRestart.ogg';
const MENU_THEME = 'Menu.ogg';
const GAME_THEMES = ['Game1.ogg', 'Game2.ogg', 'Game3.ogg', 'Game4.ogg', 'Game5.ogg'];

const MUSIC_VOLUME = 0.4;
const SFX_VOLUME = 0.85;
const FADE_TIME = 0.9;          // secondes, pour les fondus entre musiques
const MAX_EXPLOSION_VOICES = 4; // une réaction en chaîne peut saturer la sortie

class Track {
  constructor(url) {
    this.el = new Audio(url);
    this.el.loop = true;
    this.el.preload = 'none';
    this.el.volume = 0;
    this.target = 0;
    this.playing = false;
  }

  fadeTo(target, immediate = false) {
    this.target = target;
    if (immediate) this.el.volume = target;
    if (target > 0 && !this.playing) {
      this.playing = true;
      // Sur un onglet resté silencieux, play() peut être rejeté : sans catch,
      // la promesse non gérée remonterait en erreur console à chaque tentative.
      this.el.play().catch(() => { this.playing = false; });
    }
  }

  update(dt) {
    if (this.el.volume === this.target) {
      if (this.target === 0 && this.playing) {
        this.el.pause();
        this.playing = false;
      }
      return;
    }
    const step = dt / FADE_TIME;
    const d = this.target - this.el.volume;
    const v = Math.abs(d) <= step ? this.target : this.el.volume + Math.sign(d) * step;
    this.el.volume = Math.max(0, Math.min(1, v));
  }
}

export class AudioSystem {
  constructor() {
    this.enabled = true;
    this.unlocked = false;
    this.ctx = null;
    this.sfxGain = null;
    this.buffers = new Map();
    this.tracks = new Map();
    this.current = null;          // clé de la piste en cours
    this.gameTheme = null;        // thème tiré pour la partie en cours
    this.voices = [];             // explosions en cours, pour limiter la casse

    for (const name of [MENU_THEME, ...GAME_THEMES]) {
      this.tracks.set(name, new Track(MUSIC_DIR + name));
    }
  }

  /** À appeler depuis un vrai geste utilisateur. Idempotent. */
  unlock() {
    if (this.unlocked) return;
    this.unlocked = true;
    try {
      const Ctx = window.AudioContext || window.webkitAudioContext;
      this.ctx = new Ctx();
      this.sfxGain = this.ctx.createGain();
      this.sfxGain.gain.value = this.enabled ? SFX_VOLUME : 0;
      this.sfxGain.connect(this.ctx.destination);
      for (const f of [...EXPLOSION_A, RESTART]) this._load(f);
    } catch {
      this.ctx = null;            // pas de Web Audio : le jeu reste jouable
    }
    if (this.current) this._apply();
  }

  async _load(file) {
    if (!this.ctx || this.buffers.has(file)) return;
    this.buffers.set(file, null);           // réserve la place pendant le fetch
    try {
      const res = await fetch(SFX_DIR + file);
      const buf = await this.ctx.decodeAudioData(await res.arrayBuffer());
      this.buffers.set(file, buf);
    } catch {
      this.buffers.delete(file);
    }
  }

  _play(file, { volume = 1, rate = 1, pan = 0 } = {}) {
    if (!this.enabled || !this.ctx) return;
    const buf = this.buffers.get(file);
    if (!buf) return;
    if (this.ctx.state === 'suspended') this.ctx.resume();

    const src = this.ctx.createBufferSource();
    src.buffer = buf;
    src.playbackRate.value = rate;
    const gain = this.ctx.createGain();
    gain.gain.value = volume;

    let node = src;
    if (this.ctx.createStereoPanner) {
      const panner = this.ctx.createStereoPanner();
      panner.pan.value = pan;
      node.connect(panner);
      node = panner;
    }
    node.connect(gain);
    gain.connect(this.sfxGain);
    src.start();
    return src;
  }

  // ------------------------------------------------------------ effets

  /**
   * @param {number} range portée de la bombe : plus elle est grande, plus c'est gros
   * @param {number} pan -1 (gauche) à 1 (droite), selon la position sur la carte
   */
  explosion(range = 2, pan = 0) {
    const now = performance.now();
    this.voices = this.voices.filter((t) => now - t < 120);
    if (this.voices.length >= MAX_EXPLOSION_VOICES) return;
    this.voices.push(now);

    const file = EXPLOSION_A[(Math.random() * EXPLOSION_A.length) | 0];
    const power = Math.min(1, (range - 1) / 5);
    this._play(file, {
      // les grosses portées sonnent plus fort et plus grave
      volume: 0.55 + power * 0.45,
      rate: (1.12 - power * 0.22) * (0.94 + Math.random() * 0.12),
      pan: Math.max(-1, Math.min(1, pan)) * 0.6,
    });
  }

  restart() {
    this._play(RESTART, { volume: 0.9 });
  }

  // ------------------------------------------------------------ musique

  /** Tire un thème de jeu au hasard, à appeler au début d'une partie. */
  pickGameTheme() {
    this.gameTheme = GAME_THEMES[(Math.random() * GAME_THEMES.length) | 0];
    return this.gameTheme;
  }

  playMenuMusic() { this._switchTo(MENU_THEME); }

  playGameMusic() { this._switchTo(this.gameTheme || this.pickGameTheme()); }

  _switchTo(name) {
    if (this.current === name) return;
    this.current = name;
    this._apply();
  }

  _apply() {
    for (const [name, track] of this.tracks) {
      const on = this.enabled && this.unlocked && name === this.current;
      track.fadeTo(on ? MUSIC_VOLUME : 0);
    }
  }

  // ------------------------------------------------------------ contrôle

  setEnabled(on) {
    this.enabled = on;
    if (this.sfxGain) this.sfxGain.gain.value = on ? SFX_VOLUME : 0;
    this._apply();
  }

  toggle() {
    this.setEnabled(!this.enabled);
    return this.enabled;
  }

  /** Fait avancer les fondus. Appelé une fois par image. */
  update(dt) {
    for (const track of this.tracks.values()) track.update(dt);
  }
}
