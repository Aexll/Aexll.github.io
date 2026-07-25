// main.js — boucle de jeu, protocole réseau et interface.
//
// Modèle réseau : l'hôte fait autorité. Il simule à pas fixe (60 Hz) et diffuse
// un instantané 20 fois par seconde. Le client envoie ses entrées et prédit
// localement son propre déplacement, avec correction douce à chaque instantané.

import { Renderer } from './gfx.js';
import { Game, COLS, ROWS, TICK } from './game.js';
import { Input } from './input.js';
import { Fx, drawGame, PAL } from './view.js';
import { Peer } from './net.js';
import { AudioSystem } from './audio.js';

const SNAPSHOT_HZ = 20;
const INPUT_HZ = 30;
const ROUND_PAUSE = 2.8;

const $ = (sel) => document.querySelector(sel);
const $$ = (sel) => [...document.querySelectorAll(sel)];

// ---------------------------------------------------------------- état global

const app = {
  mode: 'menu',            // menu | local | host | guest
  game: null,
  fx: new Fx(),
  peer: null,
  localId: 0,
  accum: 0,
  time: 0,
  shake: 0,
  ready: false,            // client : instantané initial reçu
  snapTimer: 0,
  inputTimer: 0,
  pingTimer: 0,
  rtt: 0,
  bombSeq: 0,              // client : compteur de poses (résiste aux pertes)
  pendingBomb: [false, false],
  remote: { ax: 0, ay: 0, seq: 0 },
  remoteAck: 0,
  sentGridVersion: -1,
};

let renderer;
const input = new Input();
const audio = new AudioSystem();

// L'audio ne peut démarrer qu'après une interaction : on déverrouille au premier
// geste, quel qu'il soit.
for (const ev of ['pointerdown', 'keydown', 'click']) {
  window.addEventListener(ev, () => {
    audio.unlock();
    if (app.mode === 'menu') audio.playMenuMusic();
  }, { once: true });
}

// ---------------------------------------------------------------- interface

function showScreen(name) {
  $('#ui').classList.toggle('hidden', name === null);
  $$('[data-screen]').forEach((el) => {
    el.classList.toggle('hidden', el.dataset.screen !== name);
  });
  if (name !== null) audio.playMenuMusic();
}

function setStatus(id, text, cls = '') {
  const el = $(id);
  if (!el) return;
  el.textContent = text;
  el.className = 'status' + (cls ? ' ' + cls : '');
}

function flashHint(id) {
  const el = $(id);
  if (!el) return;
  el.textContent = 'Copié !';
  el.classList.add('show');
  setTimeout(() => el.classList.remove('show'), 1400);
}

function banner(text, color) {
  const el = $('#banner');
  if (!text) { el.classList.add('hidden'); return; }
  el.textContent = text;
  el.style.color = color || '#dfe7ff';
  el.classList.remove('hidden');
  // relance l'animation d'apparition
  el.style.animation = 'none';
  void el.offsetWidth;
  el.style.animation = '';
}

function fatal(msg) {
  $('#fatal-msg').textContent = msg;
  showScreen('fatal');
}

async function copyToClipboard(text) {
  try {
    await navigator.clipboard.writeText(text);
    return true;
  } catch {
    return false;
  }
}

$$('[data-copy]').forEach((btn) => {
  btn.addEventListener('click', async () => {
    const ta = document.getElementById(btn.dataset.copy);
    if (!ta.value) return;
    if (!(await copyToClipboard(ta.value))) {
      ta.focus(); ta.select();
      try { document.execCommand('copy'); } catch {}
    }
    flashHint('#' + btn.dataset.copy + '-hint');
  });
});

$$('[data-act]').forEach((btn) => {
  btn.addEventListener('click', () => handleAction(btn.dataset.act, btn));
});

// Échap : quitter la partie en cours et revenir au menu.
window.addEventListener('keydown', (e) => {
  if (e.code === 'KeyM') { toggleMute(); return; }
  if (e.code !== 'Escape' || app.mode === 'menu') return;
  teardown();
  showScreen('menu');
});

function toggleMute() {
  const on = audio.toggle();
  const btn = $('#mute');
  btn.classList.toggle('off', !on);
  btn.textContent = on ? '♪' : '✕';
}

$('#mute').addEventListener('click', toggleMute);

async function handleAction(act, btn) {
  switch (act) {
    case 'menu':
      teardown();
      showScreen('menu');
      break;

    case 'local':
      startLocal();
      break;

    case 'host':
      showScreen('host');
      await beginHost();
      break;

    case 'join':
      showScreen('join');
      break;

    case 'paste': {
      const ta = document.getElementById(btn.dataset.target);
      try {
        ta.value = await navigator.clipboard.readText();
      } catch {
        ta.focus();
      }
      break;
    }

    case 'host-connect':
      await hostConnect();
      break;

    case 'join-generate':
      await joinGenerate();
      break;
  }
}

// ---------------------------------------------------------------- connexion

function newPeer() {
  teardown();
  const peer = new Peer();
  app.peer = peer;
  peer.onMessage = onMessage;
  peer.onClose = () => {
    if (app.mode === 'menu') return;
    teardown();
    showScreen('menu');
    banner('CONNEXION PERDUE', '#ff7b8f');
    setTimeout(() => banner(null), 2500);
  };
  return peer;
}

function teardown() {
  if (app.peer) { app.peer.close(); app.peer = null; }
  app.mode = 'menu';
  app.game = null;
  app.ready = false;
  app.fx.clear();
  $('#hud').classList.add('hidden');
  banner(null);
}

async function beginHost() {
  const peer = newPeer();
  const ta = $('#host-offer');
  ta.value = '';
  setStatus('#host-status', 'Génération du code…');
  try {
    ta.value = await peer.host();
    setStatus('#host-status',
      'Code prêt. Envoie-le à ton ami, puis colle sa réponse ci-dessous.');
  } catch (e) {
    setStatus('#host-status', 'Échec : ' + e.message, 'err');
    return;
  }
  peer.onOpen = () => {
    setStatus('#host-status', 'Connecté !', 'ok');
    startOnline(0);
  };
}

async function hostConnect() {
  const peer = app.peer;
  const code = $('#host-answer').value.trim();
  if (!peer) { setStatus('#host-status', 'Recommence l\'hébergement.', 'err'); return; }
  if (!code) { setStatus('#host-status', 'Colle d\'abord la réponse de ton ami.', 'err'); return; }
  try {
    setStatus('#host-status', 'Établissement du lien…');
    await peer.acceptAnswer(code);
  } catch (e) {
    setStatus('#host-status', 'Échec : ' + e.message, 'err');
  }
}

async function joinGenerate() {
  const code = $('#join-offer').value.trim();
  if (!code) { setStatus('#join-status', 'Colle d\'abord le code reçu.', 'err'); return; }
  const peer = newPeer();
  peer.onOpen = () => {
    setStatus('#join-status', 'Connecté ! En attente de la partie…', 'ok');
  };
  try {
    setStatus('#join-status', 'Préparation de la réponse…');
    $('#join-answer').value = await peer.join(code);
    setStatus('#join-status', 'Renvoie cette réponse à l\'hôte, puis attends.');
  } catch (e) {
    setStatus('#join-status', 'Échec : ' + e.message, 'err');
  }
}

// ---------------------------------------------------------------- démarrage

function startLocal() {
  teardown();
  app.mode = 'local';
  app.game = new Game(randomSeed());
  app.localId = -1;
  app.ready = true;
  app.accum = 0;
  app.pendingBomb = [false, false];
  showScreen(null);
  $('#hud').classList.remove('hidden');
  $('#hud-status').textContent = 'LOCAL — 2 JOUEURS';
  startGameMusic();
}

/** Un thème tiré au hasard par partie — pas par round, ce serait haché. */
function startGameMusic() {
  audio.pickGameTheme();
  audio.playGameMusic();
}

function startOnline(id) {
  app.mode = id === 0 ? 'host' : 'guest';
  app.localId = id;
  app.bombSeq = 0;
  app.remote = { ax: 0, ay: 0, seq: 0 };
  app.remoteAck = 0;
  app.sentGridVersion = -1;
  app.accum = 0;
  app.pendingBomb = [false, false];

  if (id === 0) {
    app.game = new Game(randomSeed());
    app.ready = true;
    app.peer.sendCtl({
      t: 'h', id: 1, seed: app.game.seed,
      grid: app.game.encodeGrid(), sc: app.game.scores,
    });
    showScreen(null);
    $('#hud').classList.remove('hidden');
    startGameMusic();
  }
  // le client attend le message 'h' avant d'afficher quoi que ce soit
}

function randomSeed() {
  return (Math.random() * 0xffffffff) >>> 0;
}

// ---------------------------------------------------------------- protocole

function onMessage(m) {
  const peer = app.peer;

  switch (m.t) {
    case 'h': {                       // bienvenue (hôte -> client)
      app.mode = 'guest';
      app.localId = m.id;
      app.game = new Game(m.seed);
      app.game.scores = m.sc || [0, 0];
      app.game.decodeGrid(m.grid);
      app.fx.clear();
      app.ready = true;
      app.accum = 0;
      app.bombSeq = 0;
      app.pendingBomb = [false, false];
      showScreen(null);
      $('#hud').classList.remove('hidden');
      startGameMusic();
      break;
    }

    case 'r':                         // nouveau round
      if (!app.game) break;
      app.game.reset(m.seed);
      app.game.scores = m.sc || app.game.scores;
      app.fx.clear();
      banner(null);
      audio.restart();
      break;

    case 'g':                         // mise à jour de la grille
      if (app.game) app.game.decodeGrid(m.d);
      break;

    case 'e':                         // évènements pour les effets
      if (app.game) {
        app.fx.spawnFromEvents(m.e);
        feedback(m.e);
      }
      break;

    case 's': {                       // instantané (hôte -> client)
      if (!app.game || app.mode !== 'guest') break;
      const auth = app.game.applySnapshot(m, app.localId);
      const p = app.game.players[app.localId];
      if (auth && p) {
        const d = Math.hypot(p.x - auth.x, p.y - auth.y);
        if (d > 0.8) { p.x = auth.x; p.y = auth.y; }     // resynchronisation dure
        else { p.x += (auth.x - p.x) * 0.22; p.y += (auth.y - p.y) * 0.22; }
      }
      break;
    }

    case 'i':                         // entrées (client -> hôte)
      if (app.mode !== 'host') break;
      app.remote.ax = m.ax;
      app.remote.ay = m.ay;
      if (m.s > app.remote.seq) app.remote.seq = m.s;
      break;

    case 'p':
      peer?.sendCtl({ t: 'q', n: m.n });
      break;

    case 'q':
      app.rtt = performance.now() - m.n;
      break;
  }
}

// ---------------------------------------------------------------- boucle

let last = performance.now();

function advance() {
  const now = performance.now();
  let dt = (now - last) / 1000;
  last = now;
  if (dt <= 0) return;
  if (dt > 0.25) dt = 0.25;          // gros décrochage : on ne rattrape pas tout
  app.time += dt;

  if (app.game && app.ready) {
    if (app.mode === 'local' || app.mode === 'host') simulateAuthoritative(dt);
    else if (app.mode === 'guest') simulateGuest(dt);
    app.fx.update(dt);
    updateHud();
  }

  app.shake *= Math.pow(0.02, dt);
  audio.update(dt);
}

function frame() {
  requestAnimationFrame(frame);
  advance();
  render();
}

// Le navigateur suspend requestAnimationFrame dès que l'onglet passe en arrière-plan.
// Si c'était l'hôte, la partie gèlerait pour les deux joueurs : un worker prend
// alors le relais pour continuer à faire tourner la simulation (sans rendu).
function startBackgroundTicker() {
  try {
    const src = 'let id=null;onmessage=e=>{clearInterval(id);id=null;' +
      'if(e.data)id=setInterval(()=>postMessage(0),16);};';
    const url = URL.createObjectURL(new Blob([src], { type: 'text/javascript' }));
    const worker = new Worker(url);
    worker.onmessage = () => { if (document.hidden) advance(); };
    document.addEventListener('visibilitychange', () => {
      last = performance.now();      // pas de bond temporel au retour
      worker.postMessage(document.hidden ? 1 : 0);
    });
    if (document.hidden) worker.postMessage(1);
  } catch {
    // Pas de worker disponible : la partie se met simplement en pause.
  }
}

function simulateAuthoritative(dt) {
  const g = app.game;
  const local = app.mode === 'local';

  // Une lecture par image. Le front "bombe" est mis en attente et n'est effacé
  // qu'une fois réellement consommé par un tick : une image plus courte qu'un
  // tick n'en exécute aucun, et l'appui serait sinon perdu.
  const in0 = local ? input.read(0) : input.readAny();
  const in1 = local ? input.read(1) : null;
  if (in0.bomb) app.pendingBomb[0] = true;
  if (local && in1.bomb) app.pendingBomb[1] = true;

  app.accum += dt;
  let ticks = 0;
  while (app.accum >= TICK && ticks < 8) {
    app.accum -= TICK;
    ticks++;

    let p1;
    if (local) {
      p1 = { ax: in1.ax, ay: in1.ay, bomb: app.pendingBomb[1] };
      app.pendingBomb[1] = false;
    } else {
      const fire = app.remote.seq > app.remoteAck;
      if (fire) app.remoteAck++;
      p1 = { ax: app.remote.ax, ay: app.remote.ay, bomb: fire };
    }
    g.step(TICK, [{ ax: in0.ax, ay: in0.ay, bomb: app.pendingBomb[0] }, p1]);
    app.pendingBomb[0] = false;
  }

  consumeEvents();

  if (g.over && g.overTimer > ROUND_PAUSE) startNextRound();
  if (!local) netHostSend(dt);
  updateBanner();
}

function consumeEvents() {
  const g = app.game;
  if (!g.events.length) return;
  const events = g.events.splice(0, g.events.length);
  app.fx.spawnFromEvents(events);
  feedback(events);
  if (app.mode === 'host') app.peer?.sendCtl({ t: 'e', e: events });
}

/** Secousse et son, identiques des deux côtés du réseau. */
function feedback(events) {
  for (const [kind, x, , arg] of events) {
    if (kind === 'boom') {
      app.shake = Math.min(1, app.shake + 0.35);
      audio.explosion(arg, (x - COLS / 2) / (COLS / 2));
    } else if (kind === 'die') {
      app.shake = 1;
    }
  }
}

function startNextRound() {
  const g = app.game;
  const seed = randomSeed();
  g.reset(seed);
  app.fx.clear();
  banner(null);
  audio.restart();
  if (app.mode === 'host') app.peer?.sendCtl({ t: 'r', seed, sc: g.scores });
}

function netHostSend(dt) {
  const peer = app.peer;
  if (!peer || !peer.connected) return;
  const g = app.game;

  if (g.gridVersion !== app.sentGridVersion) {
    app.sentGridVersion = g.gridVersion;
    peer.sendCtl({ t: 'g', d: g.encodeGrid() });
  }

  app.snapTimer += dt;
  if (app.snapTimer >= 1 / SNAPSHOT_HZ) {
    app.snapTimer = 0;
    peer.sendState(g.snapshot());
  }

  app.pingTimer += dt;
  if (app.pingTimer >= 1) {
    app.pingTimer = 0;
    peer.sendCtl({ t: 'p', n: performance.now() });
  }
}

function simulateGuest(dt) {
  const g = app.game;
  const inp = input.readAny();
  if (inp.bomb) {
    app.bombSeq++;
    sendInput(inp, true);             // envoi immédiat : la pose ne doit pas attendre
  }

  // prédiction locale du joueur contrôlé, à pas fixe
  app.accum += dt;
  let ticks = 0;
  while (app.accum >= TICK && ticks < 8) {
    app.accum -= TICK;
    ticks++;
    const p = g.players[app.localId];
    if (p && p.alive && !g.over) g.movePlayer(p, inp, TICK);
  }

  g.interpolate(dt);

  app.inputTimer += dt;
  if (app.inputTimer >= 1 / INPUT_HZ) {
    app.inputTimer = 0;
    sendInput(inp, false);
  }

  app.pingTimer += dt;
  if (app.pingTimer >= 1) {
    app.pingTimer = 0;
    app.peer?.sendCtl({ t: 'p', n: performance.now() });
  }

  updateBanner();
}

function sendInput(inp, reliable) {
  const msg = { t: 'i', ax: inp.ax, ay: inp.ay, s: app.bombSeq };
  if (reliable) app.peer?.sendCtl(msg);
  else app.peer?.sendState(msg);
}

// ---------------------------------------------------------------- affichage

function updateBanner() {
  const g = app.game;
  if (!g.over) { banner(null); return; }
  if (g.winner === 2) banner('ÉGALITÉ', '#dfe7ff');
  else {
    const mine = app.localId >= 0 && g.winner === app.localId;
    const label = app.mode === 'local'
      ? `JOUEUR ${g.winner + 1} GAGNE`
      : (mine ? 'GAGNÉ !' : 'PERDU');
    banner(label, g.winner === 0 ? '#35f0ff' : '#ff4fd8');
  }
}

function updateHud() {
  const g = app.game;
  for (let i = 0; i < 2; i++) {
    const el = $('#hud-p' + i);
    const p = g.players[i];
    el.querySelector('[data-stat="bombs"]').textContent = p.maxBombs;
    el.querySelector('[data-stat="range"]').textContent = p.range;
    el.querySelector('[data-stat="speed"]').textContent =
      Math.round((p.speed - 4.0) / 0.55) + 1;
    el.querySelector('[data-stat="score"]').textContent = g.scores[i];
    el.style.opacity = p.alive ? '1' : '0.35';
  }

  if (app.mode !== 'local') {
    const role = app.mode === 'host' ? 'HÔTE' : 'INVITÉ';
    const you = `TU ES JOUEUR ${app.localId + 1}`;
    $('#hud-status').textContent = `${role} · ${you} · ${Math.round(app.rtt)} MS`;
  }
}

function render() {
  const canvas = renderer.canvas;
  const aspect = Math.max(0.2, canvas.clientWidth / Math.max(1, canvas.clientHeight));
  const margin = 0.7;
  const halfH = Math.max(ROWS / 2 + margin, (COLS / 2 + margin) / aspect);

  const s = app.shake * app.shake * 0.32;
  const cam = {
    x: COLS / 2 + (Math.random() - 0.5) * s,
    y: ROWS / 2 + (Math.random() - 0.5) * s,
    halfHeight: halfH,
  };

  renderer.begin(cam);
  if (app.game && app.ready) {
    drawGame(renderer, app.game, app.fx, app.time);
  } else {
    drawIdle(renderer, app.time);
  }
  renderer.end(app.time);
}

/** Fond animé du menu : quelques disques qui respirent, rien de plus. */
function drawIdle(g, t) {
  for (let i = 0; i < 26; i++) {
    const a = t * 0.16 + i * 1.7;
    const rad = 3.2 + (i % 5) * 1.35;
    const x = COLS / 2 + Math.cos(a) * rad * 1.25;
    const y = ROWS / 2 + Math.sin(a * 0.8 + i) * rad * 0.7;
    const col = PAL.players[i % 2];
    const pulse = 0.5 + 0.5 * Math.sin(t * 1.4 + i);
    g.disc(x, y, 0.05 + 0.05 * pulse, col, { alpha: 0.8, glow: 0.9 * pulse, falloff: 9 });
  }
  const r = 2.4 + Math.sin(t * 0.9) * 0.25;
  g.ring(COLS / 2, ROWS / 2, r, 0.03, PAL.players[0],
    { alpha: 0.35, glow: 0.5, falloff: 10 });
  g.ring(COLS / 2, ROWS / 2, r * 1.35, 0.02, PAL.players[1],
    { alpha: 0.25, glow: 0.35, falloff: 12 });
}

// ---------------------------------------------------------------- démarrage

try {
  renderer = new Renderer($('#gl'));
  showScreen('menu');
  requestAnimationFrame(frame);
  startBackgroundTicker();
  window.PB = { app, input, audio, get renderer() { return renderer; } };  // debug console
} catch (e) {
  fatal(e.message);
}
