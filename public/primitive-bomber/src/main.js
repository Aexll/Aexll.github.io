// main.js — boucle de jeu, protocole réseau et interface.
//
// Modèle réseau : l'hôte fait autorité. Il simule à pas fixe (60 Hz) et diffuse
// un instantané 20 fois par seconde à chacun de ses invités. Chaque invité
// envoie ses entrées et prédit localement son propre déplacement, avec
// correction douce à chaque instantané.
//
// Topologie en étoile : les invités ne se parlent jamais entre eux, ils n'ont
// qu'un lien avec l'hôte. Une place d'invité = une connexion WebRTC, donc un
// échange de codes à part.

import { Renderer } from './gfx.js';
import {
  Game, COLS, ROWS, TICK, STATS, STAT_COUNT, MAX_PLAYERS,
  S_BOMBS, S_FIRE, S_SPEED, maxBombsOf, rangeOf, speedOf,
  MODIFIERS, MOD_COUNT, hasMod,
} from './game.js';
import { Input } from './input.js';
import { Fx, drawGame, PAL, PLAYER_HEX } from './view.js';
import { Peer } from './net.js';
import { AudioSystem } from './audio.js';

const SNAPSHOT_HZ = 20;
const INPUT_HZ = 30;
const ROUND_PAUSE = 2.8;

/** Places d'invités proposées par l'hôte : tout le monde sauf lui. */
const HOST_SLOTS = MAX_PLAYERS - 1;

const $ = (sel) => document.querySelector(sel);
const $$ = (sel) => [...document.querySelectorAll(sel)];

// ---------------------------------------------------------------- état global

const app = {
  mode: 'menu',            // menu | lobby | local | host | guest
  game: null,
  fx: new Fx(),
  peer: null,              // invité : lien unique vers l'hôte
  slots: [],               // hôte : places en cours de négociation
  guests: [],              // hôte : pairs entrés en jeu, chacun avec son `pid`
  localId: 0,
  accum: 0,
  time: 0,
  shake: 0,
  ready: false,            // invité : instantané initial reçu
  snapTimer: 0,
  inputTimer: 0,
  pingTimer: 0,
  rtt: 0,
  bombSeq: 0,              // invité : compteur de poses (résiste aux pertes)
  powerSeq: 0,             // idem pour la touche pouvoir
  pendingBomb: [],
  pendingPower: [],
  remote: [],              // hôte : dernière entrée reçue, par identifiant de joueur
  remoteAck: [],
  remoteAckPower: [],
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

// Délégation : les blocs de l'hôte sont créés à la volée, un écouteur posé une
// fois pour toutes évite d'avoir à les relier après chaque reconstruction.
document.addEventListener('click', async (ev) => {
  const copy = ev.target.closest('[data-copy]');
  if (copy) {
    const ta = document.getElementById(copy.dataset.copy);
    if (!ta || !ta.value) return;
    if (!(await copyToClipboard(ta.value))) {
      ta.focus(); ta.select();
      try { document.execCommand('copy'); } catch {}
    }
    flashHint('#' + copy.dataset.copy + '-hint');
    return;
  }
  const act = ev.target.closest('[data-act]');
  if (act) handleAction(act.dataset.act, act);
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

// Légende des orbes, construite depuis la table des stats pour ne pas dériver.
const RARITY_LABEL = ['Commun', 'Peu commun', 'Rare'];
const STAT_HELP = [
  'bombes simultanées',
  'portée de l\'explosion',
  'vitesse de déplacement',
  'plus d\'orbes dans les blocs',
  'blocs traversés par le souffle',
  'bombes poussées d\'un coup',
  'absorbe une explosion',
  '+3 sur une stat au hasard',
  '+1 à chaque stat commune',
];

/**
 * Libellés affichables des quatre jeux de touches. Les codes font foi dans
 * input.js ; ici on ne décrit que ce qui est lisible par un joueur.
 */
const KEY_HELP = [
  { move: ['W', 'A', 'S', 'D'], bomb: 'Espace', power: 'E' },
  { move: ['↑', '←', '↓', '→'], bomb: 'Entrée', power: 'Ctrl droit' },
  { move: ['I', 'J', 'K', 'L'], bomb: 'U', power: 'O' },
  { move: ['T', 'F', 'G', 'H'], bomb: 'R', power: 'Y' },
];

/** Le tetrino d'un modifieur en SVG, pour le HUD et la légende. */
function tetrinoSvg(m, px = 13) {
  const cells = MODIFIERS[m].shape;
  const w = Math.max(...cells.map((c) => c[0])) + 1;
  const h = Math.max(...cells.map((c) => c[1])) + 1;
  const side = px / Math.max(w, h);
  const ox = (px - w * side) / 2, oy = (px - h * side) / 2;
  const rects = cells.map(([x, y]) =>
    `<rect x="${(ox + x * side).toFixed(2)}" y="${(oy + y * side).toFixed(2)}" ` +
    `width="${(side * 0.86).toFixed(2)}" height="${(side * 0.86).toFixed(2)}" ` +
    `rx="${(side * 0.2).toFixed(2)}"/>`).join('');
  return `<svg viewBox="0 0 ${px} ${px}" width="${px}" height="${px}" ` +
    `fill="currentColor" aria-hidden="true">${rects}</svg>`;
}

$('#legend-keys').innerHTML = KEY_HELP.map((k, i) =>
  `<div class="legend-row" style="--pc:${PLAYER_HEX[i]}">` +
  `<em>Joueur ${i + 1}</em>` +
  k.move.map((c) => `<kbd>${c}</kbd>`).join('') +
  `<span class="sep">bombe</span><kbd>${k.bomb}</kbd>` +
  `<span class="sep">pouvoir</span><kbd>${k.power}</kbd></div>`).join('') +
  '<div class="legend-note">Le joueur 4 peut aussi jouer au pavé numérique ' +
  '(<kbd>8</kbd><kbd>4</kbd><kbd>5</kbd><kbd>6</kbd>, bombe <kbd>0</kbd>, ' +
  'pouvoir <kbd>+</kbd>).</div>';

$('#legend').innerHTML = [0, 1, 2].map((r) => {
  const rows = STATS
    .map((s, i) => [s, i])
    .filter(([s]) => s.rarity === r)
    .map(([s, i]) => `<span class="pip" title="${STAT_HELP[i]}">` +
      `<i style="background:${s.color}"></i>${s.label}</span>`)
    .join('');
  return `<div class="legend-row"><em>${RARITY_LABEL[r]}</em>${rows}</div>`;
}).join('');

$('#legend-mods').innerHTML = MODIFIERS.map((def, m) =>
  `<span class="mod ${def.active ? 'act' : ''}" style="--mc:${def.color}" ` +
  `title="${def.help}">${tetrinoSvg(m)}${def.label}` +
  `${def.active ? `<u>${def.cd}s</u>` : ''}</span>`).join('');

async function handleAction(act, btn) {
  switch (act) {
    case 'menu':
      teardown();
      showScreen('menu');
      break;

    case 'local':
      startLocal(parseInt(btn.dataset.n, 10) || 2);
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

    case 'slot-connect':
      await slotConnect(parseInt(btn.dataset.slot, 10));
      break;

    case 'host-launch':
      hostLaunch();
      break;

    case 'join-generate':
      await joinGenerate();
      break;
  }
}

// ---------------------------------------------------------------- connexion

function teardown() {
  if (app.peer) { app.peer.close(); app.peer = null; }
  for (const s of app.slots) { if (s) { try { s.peer.close(); } catch {} } }
  app.slots = [];
  app.guests = [];
  app.mode = 'menu';
  app.game = null;
  app.ready = false;
  app.fx.clear();
  $('#hud').classList.add('hidden');
  $('#hud-bottom').classList.add('hidden');
  banner(null);
}

// ---- hôte : une place par invité -------------------------------------------

function slotState(i, text, cls = '') {
  const el = $('#slot-state-' + i);
  if (!el) return;
  el.textContent = text;
  el.className = 'slot-state' + (cls ? ' ' + cls : '');
}

async function beginHost() {
  teardown();
  app.mode = 'lobby';

  $('#host-slots').innerHTML = Array.from({ length: HOST_SLOTS }, (_, i) =>
    `<div class="slot" id="slot-${i}" style="--pc:${PLAYER_HEX[i + 1]}">
      <div class="slot-head"><i></i>Joueur ${i + 2}
        <span class="slot-state" id="slot-state-${i}">génération…</span></div>
      <textarea id="slot-offer-${i}" readonly placeholder="génération…"></textarea>
      <div class="btn-row tight">
        <button class="btn small" data-copy="slot-offer-${i}">Copier son code</button>
        <span class="hint" id="slot-offer-${i}-hint"></span>
      </div>
      <textarea id="slot-answer-${i}" placeholder="colle ici sa réponse PB1-…"></textarea>
      <div class="btn-row tight">
        <button class="btn small primary" data-act="slot-connect" data-slot="${i}">Connecter</button>
        <button class="btn small ghost" data-act="paste" data-target="slot-answer-${i}">Coller</button>
      </div>
    </div>`).join('');

  setStatus('#host-status',
    'Envoie un code différent à chaque invité, puis colle leurs réponses.');
  updateLaunch();

  // Les trois négociations tournent en parallèle : la collecte ICE a le même
  // coût pour une place ou pour trois.
  for (let i = 0; i < HOST_SLOTS; i++) openSlot(i);
}

async function openSlot(i) {
  const peer = new Peer();
  const slot = { peer, connected: false };
  app.slots[i] = slot;

  peer.onMessage = (m) => onMessage(m, peer);
  peer.onOpen = () => {
    slot.connected = true;
    slotState(i, 'connecté', 'ok');
    $('#slot-' + i)?.classList.add('ready');
    updateLaunch();
  };
  peer.onClose = () => onPeerClose(peer, i);

  try {
    const code = await peer.host();
    const ta = $('#slot-offer-' + i);
    if (!ta || app.slots[i] !== slot) return;   // écran quitté entre-temps
    ta.value = code;
    if (!slot.connected) slotState(i, 'code prêt');
  } catch (e) {
    slotState(i, 'échec : ' + e.message, 'err');
  }
}

async function slotConnect(i) {
  const slot = app.slots[i];
  if (!slot) { setStatus('#host-status', 'Recommence l\'hébergement.', 'err'); return; }
  const code = $('#slot-answer-' + i).value.trim();
  if (!code) { slotState(i, 'colle d\'abord sa réponse', 'err'); return; }
  try {
    slotState(i, 'établissement du lien…');
    await slot.peer.acceptAnswer(code);
  } catch (e) {
    slotState(i, 'échec : ' + e.message, 'err');
  }
}

function updateLaunch() {
  const btn = $('#host-launch');
  if (!btn) return;
  const n = app.slots.filter((s) => s && s.connected).length;
  btn.disabled = n === 0;
  btn.textContent = n === 0
    ? 'En attente d\'un invité…'
    : `Lancer la partie (${n + 1} joueurs)`;
}

/** Les places connectées deviennent les joueurs 2, 3, 4 — dans l'ordre. */
function hostLaunch() {
  const ready = app.slots.filter((s) => s && s.connected);
  if (!ready.length) return;

  // Les places restées vides n'ont plus de raison d'être : on ferme pour ne pas
  // laisser une négociation ouverte derrière la partie.
  for (const s of app.slots) {
    if (s && !s.connected) { try { s.peer.close(); } catch {} }
  }
  app.slots = ready;

  app.guests = ready.map((s, k) => {
    s.peer.pid = k + 1;
    return s.peer;
  });

  const count = app.guests.length + 1;
  app.mode = 'host';
  app.localId = 0;
  app.game = new Game(randomSeed(), count);
  resetNetState(app.game.count);
  app.ready = true;

  for (const peer of app.guests) {
    peer.sendCtl({
      t: 'h', id: peer.pid, n: app.game.count, seed: app.game.seed,
      grid: app.game.encodeGrid(), sc: app.game.scores,
    });
  }

  buildHud(app.game.count, 0);
  showScreen(null);
  $('#hud').classList.remove('hidden');
  startGameMusic();
}

/** Perte d'un lien : côté hôte la place se vide, côté invité la partie s'arrête. */
function onPeerClose(peer, slotIndex) {
  if (app.mode === 'lobby') {
    const slot = app.slots[slotIndex];
    if (slot) {
      slot.connected = false;
      slotState(slotIndex, 'lien perdu', 'err');
      $('#slot-' + slotIndex)?.classList.remove('ready');
      updateLaunch();
    }
    return;
  }

  if (app.mode === 'host') {
    app.guests = app.guests.filter((g) => g !== peer);
    if (peer.pid != null && app.game) app.game.dropPlayer(peer.pid);
    // Plus personne en face : la partie n'a plus d'objet.
    if (!app.guests.length) {
      teardown();
      showScreen('menu');
      banner('PLUS D\'ADVERSAIRE', '#ff7b8f');
      setTimeout(() => banner(null), 2500);
    }
    return;
  }

  if (app.mode === 'guest') {
    teardown();
    showScreen('menu');
    banner('CONNEXION PERDUE', '#ff7b8f');
    setTimeout(() => banner(null), 2500);
  }
}

// ---- invité ----------------------------------------------------------------

async function joinGenerate() {
  const code = $('#join-offer').value.trim();
  if (!code) { setStatus('#join-status', 'Colle d\'abord le code reçu.', 'err'); return; }
  teardown();
  const peer = new Peer();
  app.peer = peer;
  peer.onMessage = (m) => onMessage(m, peer);
  peer.onClose = () => onPeerClose(peer, -1);
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

function resetNetState(count) {
  app.bombSeq = 0;
  app.powerSeq = 0;
  app.accum = 0;
  app.sentGridVersion = -1;
  app.pendingBomb = new Array(count).fill(false);
  app.pendingPower = new Array(count).fill(false);
  app.remote = [];
  app.remoteAck = new Array(count).fill(0);
  app.remoteAckPower = new Array(count).fill(0);
  for (let i = 0; i < count; i++) app.remote[i] = { ax: 0, ay: 0, seq: 0, pseq: 0 };
}

function startLocal(count) {
  teardown();
  app.mode = 'local';
  app.game = new Game(randomSeed(), count);
  app.localId = -1;
  app.ready = true;
  resetNetState(app.game.count);
  buildHud(app.game.count, -1);
  showScreen(null);
  $('#hud').classList.remove('hidden');
  $('#hud-status').textContent = `LOCAL — ${app.game.count} JOUEURS`;
  startGameMusic();
}

/** Un thème tiré au hasard par partie — pas par round, ce serait haché. */
function startGameMusic() {
  audio.pickGameTheme();
  audio.playGameMusic();
}

function randomSeed() {
  return (Math.random() * 0xffffffff) >>> 0;
}

/**
 * Place de chaque joueur dans le HUD : 0 haut-gauche, 1 haut-droit,
 * 2 bas-gauche, 3 bas-droit. L'ordre suit celui des coins de départ, si bien
 * que la carte d'un joueur se trouve toujours du côté où il apparaît.
 */
const HUD_CORNER = [0, 3, 1, 2];

/** Cartes du HUD : une par joueur, une par coin de l'écran. */
function buildHud(count, localId) {
  const cols = [$('#hud-c0'), $('#hud-c1'), $('#hud-c2'), $('#hud-c3')];
  for (const c of cols) c.innerHTML = '';
  // La barre du bas n'existe que s'il y a quelqu'un à y mettre.
  $('#hud-bottom').classList.toggle('hidden', count < 2);
  for (let i = 0; i < count; i++) {
    const el = document.createElement('div');
    el.className = 'hud-card' + (i === localId ? ' me' : '');
    el.id = 'hud-p' + i;
    el.style.setProperty('--pc', PLAYER_HEX[i]);
    el.innerHTML =
      `<div class="hud-name">JOUEUR ${i + 1}</div>` +
      '<div class="hud-stats"></div><div class="hud-mods"></div>' +
      '<div class="hud-score" data-stat="score">0</div>';
    cols[HUD_CORNER[i]].appendChild(el);
  }
}

// ---------------------------------------------------------------- protocole

function onMessage(m, peer) {
  switch (m.t) {
    case 'h': {                       // bienvenue (hôte -> invité)
      app.mode = 'guest';
      app.localId = m.id;
      app.game = new Game(m.seed, m.n || 2);
      app.game.scores = m.sc || app.game.scores;
      app.game.decodeGrid(m.grid);
      app.fx.clear();
      resetNetState(app.game.count);
      app.ready = true;
      buildHud(app.game.count, app.localId);
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

    case 's': {                       // instantané (hôte -> invité)
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

    case 'i': {                       // entrées (invité -> hôte)
      if (app.mode !== 'host' || peer.pid == null) break;
      const r = app.remote[peer.pid];
      if (!r) break;
      r.ax = m.ax;
      r.ay = m.ay;
      if (m.s > r.seq) r.seq = m.s;
      if (m.w > r.pseq) r.pseq = m.w;
      break;
    }

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
// Si c'était l'hôte, la partie gèlerait pour tout le monde : un worker prend
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
  const n = g.players.length;

  // Une lecture par image. Le front « bombe » est mis en attente et n'est
  // effacé qu'une fois réellement consommé par un tick : une image plus courte
  // qu'un tick n'en exécute aucun, et l'appui serait sinon perdu.
  const reads = [];
  if (local) {
    for (let i = 0; i < n; i++) reads[i] = input.read(i);
  } else {
    reads[0] = input.readAny();
  }
  for (let i = 0; i < n; i++) {
    if (!reads[i]) continue;
    if (reads[i].bomb) app.pendingBomb[i] = true;
    if (reads[i].power) app.pendingPower[i] = true;
  }

  app.accum += dt;
  let ticks = 0;
  while (app.accum >= TICK && ticks < 8) {
    app.accum -= TICK;
    ticks++;

    const inputs = [];
    for (let i = 0; i < n; i++) {
      if (reads[i]) {
        inputs[i] = {
          ax: reads[i].ax, ay: reads[i].ay,
          bomb: app.pendingBomb[i], power: app.pendingPower[i],
        };
        app.pendingBomb[i] = false;
        app.pendingPower[i] = false;
      } else {
        // Compteurs monotones : une pose perdue sur le canal non fiable est
        // rattrapée au message suivant, et jamais jouée deux fois.
        const r = app.remote[i] || { ax: 0, ay: 0, seq: 0, pseq: 0 };
        const fire = r.seq > app.remoteAck[i];
        if (fire) app.remoteAck[i]++;
        const zap = r.pseq > app.remoteAckPower[i];
        if (zap) app.remoteAckPower[i]++;
        inputs[i] = { ax: r.ax, ay: r.ay, bomb: fire, power: zap };
      }
    }
    g.step(TICK, inputs);
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
  if (app.mode === 'host') hostCtl({ t: 'e', e: events });
}

/** Secousse et son, identiques de part et d'autre du réseau. */
function feedback(events) {
  for (const [kind, x, , arg] of events) {
    if (kind === 'boom') {
      app.shake = Math.min(1, app.shake + 0.35);
      audio.explosion(arg, (x - COLS / 2) / (COLS / 2));
    } else if (kind === 'die') {
      app.shake = 1;
    } else if (kind === 'shield' || kind === 'boost') {
      app.shake = Math.min(1, app.shake + 0.25);
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
  if (app.mode === 'host') hostCtl({ t: 'r', seed, sc: g.scores });
}

/** Diffusion fiable à tous les invités. */
function hostCtl(obj) {
  for (const peer of app.guests) peer.sendCtl(obj);
}

function netHostSend(dt) {
  if (!app.guests.length) return;
  const g = app.game;

  if (g.gridVersion !== app.sentGridVersion) {
    app.sentGridVersion = g.gridVersion;
    hostCtl({ t: 'g', d: g.encodeGrid() });
  }

  app.snapTimer += dt;
  if (app.snapTimer >= 1 / SNAPSHOT_HZ) {
    app.snapTimer = 0;
    // Un seul instantané, envoyé tel quel à chacun : l'état est le même pour tous.
    const snap = g.snapshot();
    for (const peer of app.guests) peer.sendState(snap);
  }

  app.pingTimer += dt;
  if (app.pingTimer >= 1) {
    app.pingTimer = 0;
    hostCtl({ t: 'p', n: performance.now() });
  }
}

function simulateGuest(dt) {
  const g = app.game;
  const inp = input.readAny();
  if (inp.bomb || inp.power) {
    if (inp.bomb) app.bombSeq++;
    if (inp.power) app.powerSeq++;
    sendInput(inp, true);             // envoi immédiat : l'action ne doit pas attendre
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
  const msg = { t: 'i', ax: inp.ax, ay: inp.ay, s: app.bombSeq, w: app.powerSeq };
  if (reliable) app.peer?.sendCtl(msg);
  else app.peer?.sendState(msg);
}

// ---------------------------------------------------------------- affichage

function updateBanner() {
  const g = app.game;
  if (!g.over) { banner(null); return; }
  if (g.winner < 0) { banner('ÉGALITÉ', '#dfe7ff'); return; }
  const color = PLAYER_HEX[g.winner] || '#dfe7ff';
  const mine = app.localId >= 0 && g.winner === app.localId;
  banner(mine ? 'GAGNÉ !' : `JOUEUR ${g.winner + 1} GAGNE`, color);
}

/**
 * Les trois communes affichent leur valeur effective (bonus Général compris),
 * les six autres n'apparaissent qu'une fois acquises — sinon la barre est
 * illisible pour une information toujours nulle.
 */
function statPips(p) {
  const out = [
    [S_BOMBS, maxBombsOf(p)],
    [S_FIRE, rangeOf(p)],
    [S_SPEED, 1 + Math.round((speedOf(p) - 4.0) / 0.5)],
  ];
  for (let i = 0; i < STAT_COUNT; i++) {
    if (i > S_SPEED && p.stats[i] > 0) out.push([i, p.stats[i]]);
  }
  return out;
}

function updateHud() {
  const g = app.game;
  for (let i = 0; i < g.players.length; i++) {
    const el = $('#hud-p' + i);
    const p = g.players[i];
    if (!el || !p) continue;
    const pips = statPips(p);

    // le DOM n'est reconstruit que quand une valeur change
    const sig = pips.map(([s, v]) => s + ':' + v).join(',');
    if (el.dataset.sig !== sig) {
      el.dataset.sig = sig;
      el.querySelector('.hud-stats').innerHTML = pips.map(([s, v]) => {
        const st = STATS[s];
        return `<span class="pip" title="${st.label}">` +
          `<i style="background:${st.color}"></i>${st.short}<b>${v}</b></span>`;
      }).join('');
    }

    // Modifieurs : un jeton par tetrino possédé, grisé pendant sa recharge.
    const mods = [];
    for (let m = 0; m < MOD_COUNT; m++) if (hasMod(p, m)) mods.push(m);
    const msig = mods.map((m) => m + ':' + Math.ceil(Math.max(0, p.cd[m]))).join(',');
    if (el.dataset.msig !== msig) {
      el.dataset.msig = msig;
      el.querySelector('.hud-mods').innerHTML = mods.map((m) => {
        const def = MODIFIERS[m];
        const left = Math.max(0, p.cd[m]);
        const cls = 'mod' + (def.active ? ' act' : '') + (left > 0 ? ' cooling' : '');
        const badge = left > 0 ? `<u>${Math.ceil(left)}</u>` : '';
        return `<span class="${cls}" style="--mc:${def.color}">` +
          `${tetrinoSvg(m)}<b>${def.label}</b>${badge}` +
          `<span class="tip">${def.help}</span></span>`;
      }).join('');
    }

    el.querySelector('[data-stat="score"]').textContent = g.scores[i] ?? 0;
    el.classList.toggle('gone', !!p.gone);
    el.style.opacity = p.alive ? '1' : '0.35';
  }

  if (app.mode !== 'local') {
    const role = app.mode === 'host' ? 'HÔTE' : 'INVITÉ';
    const you = `TU ES JOUEUR ${app.localId + 1}`;
    $('#hud-status').textContent =
      `${role} · ${you} · ${g.players.length} JOUEURS · ${Math.round(app.rtt)} MS`;
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
    // Reste à parcourir du tick en cours : sans ça, la position n'avance que
    // les images où un tick est tombé, ce qui saccade au-dessus de 60 Hz.
    drawGame(renderer, app.game, app.fx, app.time,
      Math.min(1, app.accum / TICK), app.mode === 'local' ? -1 : app.localId);
  } else {
    drawIdle(renderer, app.time);
  }
  renderer.end(app.time);
}

/** Fond animé du menu : quelques disques qui respirent, rien de plus. */
function drawIdle(g, t) {
  const n = PAL.players.length;
  for (let i = 0; i < 28; i++) {
    const a = t * 0.16 + i * 1.7;
    const rad = 3.2 + (i % 5) * 1.35;
    const x = COLS / 2 + Math.cos(a) * rad * 1.25;
    const y = ROWS / 2 + Math.sin(a * 0.8 + i) * rad * 0.7;
    const col = PAL.players[i % n];
    const pulse = 0.5 + 0.5 * Math.sin(t * 1.4 + i);
    g.disc(x, y, 0.05 + 0.05 * pulse, col, { alpha: 0.8, glow: 0.9 * pulse, falloff: 9 });
  }
  // Un anneau par joueur, de plus en plus large et discret.
  const r = 2.4 + Math.sin(t * 0.9) * 0.25;
  for (let i = 0; i < n; i++) {
    g.ring(COLS / 2, ROWS / 2, r * (1 + i * 0.3), 0.03 - i * 0.005, PAL.players[i],
      { alpha: 0.35 - i * 0.06, glow: 0.5 - i * 0.08, falloff: 10 + i * 1.5 });
  }
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
