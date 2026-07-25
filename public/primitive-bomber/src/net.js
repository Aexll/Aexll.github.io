// net.js — transport WebRTC pair-à-pair avec signalisation manuelle.
//
// Aucun serveur de jeu, aucun broker : l'hôte génère un code (son offre SDP,
// compressée en base64url), le client le colle et renvoie un code de réponse.
// Seuls des serveurs STUN publics sont contactés, uniquement pour découvrir
// l'adresse publique — le trafic de jeu reste direct entre les deux navigateurs.

const ICE_SERVERS = [
  { urls: ['stun:stun.l.google.com:19302', 'stun:stun1.l.google.com:19302'] },
];

const PREFIX = 'PB1-';
const GATHER_TIMEOUT = 4000;

// ---------------------------------------------------------------- codage

const b64url = {
  encode(bytes) {
    let s = '';
    for (let i = 0; i < bytes.length; i++) s += String.fromCharCode(bytes[i]);
    return btoa(s).replace(/\+/g, '-').replace(/\//g, '_').replace(/=+$/, '');
  },
  decode(str) {
    const s = atob(str.replace(/-/g, '+').replace(/_/g, '/'));
    const out = new Uint8Array(s.length);
    for (let i = 0; i < s.length; i++) out[i] = s.charCodeAt(i);
    return out;
  },
};

async function deflate(text) {
  const bytes = new TextEncoder().encode(text);
  if (typeof CompressionStream === 'undefined') return { z: false, bytes };
  const cs = new CompressionStream('deflate-raw');
  const stream = new Blob([bytes]).stream().pipeThrough(cs);
  const buf = await new Response(stream).arrayBuffer();
  return { z: true, bytes: new Uint8Array(buf) };
}

async function inflate(bytes) {
  const ds = new DecompressionStream('deflate-raw');
  const stream = new Blob([bytes]).stream().pipeThrough(ds);
  return await new Response(stream).text();
}

/** SDP -> code court partageable. */
async function pack(desc) {
  const payload = JSON.stringify({ t: desc.type === 'offer' ? 'o' : 'a', s: desc.sdp });
  const { z, bytes } = await deflate(payload);
  return PREFIX + (z ? 'z' : 'r') + b64url.encode(bytes);
}

/** Code -> RTCSessionDescriptionInit. */
async function unpack(code) {
  const clean = code.trim().replace(/\s+/g, '');
  if (!clean.startsWith(PREFIX)) throw new Error('Code invalide (il doit commencer par PB1-).');
  const mode = clean[PREFIX.length];
  const body = clean.slice(PREFIX.length + 1);
  let bytes;
  try {
    bytes = b64url.decode(body);
  } catch {
    throw new Error('Code corrompu — recopie-le en entier.');
  }
  let text;
  try {
    text = mode === 'z' ? await inflate(bytes) : new TextDecoder().decode(bytes);
  } catch {
    throw new Error('Code illisible — il a peut-être été tronqué.');
  }
  const obj = JSON.parse(text);
  return { type: obj.t === 'o' ? 'offer' : 'answer', sdp: obj.s };
}

// ---------------------------------------------------------------- pair

export class Peer {
  constructor() {
    this.pc = null;
    this.ctl = null;         // fiable + ordonné : évènements, grille, round
    this.state = null;       // non fiable : instantanés et entrées
    this.isHost = false;
    this.connected = false;

    this.onOpen = () => {};
    this.onClose = () => {};
    this.onMessage = () => {};
    this.onStatus = () => {};
  }

  _createPC() {
    const pc = new RTCPeerConnection({ iceServers: ICE_SERVERS });
    this.pc = pc;

    pc.onconnectionstatechange = () => {
      const s = pc.connectionState;
      this.onStatus(s);
      if (s === 'failed' || s === 'closed' || s === 'disconnected') {
        if (this.connected) { this.connected = false; this.onClose(s); }
      }
    };
    return pc;
  }

  _bindChannel(ch) {
    ch.binaryType = 'arraybuffer';
    if (ch.label === 'ctl') this.ctl = ch; else this.state = ch;

    ch.onmessage = (ev) => {
      try {
        this.onMessage(JSON.parse(ev.data));
      } catch { /* message malformé : ignoré */ }
    };
    ch.onopen = () => {
      if (this.ctl && this.ctl.readyState === 'open' &&
          this.state && this.state.readyState === 'open' && !this.connected) {
        this.connected = true;
        this.onOpen();
      }
    };
    ch.onclose = () => {
      if (this.connected) { this.connected = false; this.onClose('channel'); }
    };
  }

  async _gather() {
    const pc = this.pc;
    if (pc.iceGatheringState === 'complete') return;
    await new Promise((resolve) => {
      const done = () => {
        clearTimeout(timer);
        pc.removeEventListener('icegatheringstatechange', check);
        resolve();
      };
      const check = () => { if (pc.iceGatheringState === 'complete') done(); };
      // Beaucoup de réseaux ne renvoient jamais l'état "complete" :
      // on part avec les candidats déjà collectés au bout du délai.
      const timer = setTimeout(done, GATHER_TIMEOUT);
      pc.addEventListener('icegatheringstatechange', check);
    });
  }

  /** Hôte : crée les canaux et retourne le code d'invitation. */
  async host() {
    this.isHost = true;
    const pc = this._createPC();
    this._bindChannel(pc.createDataChannel('ctl', { ordered: true }));
    this._bindChannel(pc.createDataChannel('state', {
      ordered: false, maxRetransmits: 0,
    }));
    await pc.setLocalDescription(await pc.createOffer());
    await this._gather();
    return pack(pc.localDescription);
  }

  /** Hôte : valide la réponse du client. */
  async acceptAnswer(code) {
    const desc = await unpack(code);
    if (desc.type !== 'answer') throw new Error('Ce code est une invitation, pas une réponse.');
    await this.pc.setRemoteDescription(desc);
  }

  /** Client : consomme l'invitation et retourne le code de réponse. */
  async join(code) {
    const desc = await unpack(code);
    if (desc.type !== 'offer') throw new Error('Ce code est une réponse, pas une invitation.');
    this.isHost = false;
    const pc = this._createPC();
    pc.ondatachannel = (ev) => this._bindChannel(ev.channel);
    await pc.setRemoteDescription(desc);
    await pc.setLocalDescription(await pc.createAnswer());
    await this._gather();
    return pack(pc.localDescription);
  }

  /** Envoi fiable (ordonné). */
  sendCtl(obj) {
    if (this.ctl && this.ctl.readyState === 'open') this.ctl.send(JSON.stringify(obj));
  }

  /** Envoi non fiable — on saute le message si le tampon est saturé. */
  sendState(obj) {
    const ch = this.state;
    if (!ch || ch.readyState !== 'open') return;
    if (ch.bufferedAmount > 65536) return;
    ch.send(JSON.stringify(obj));
  }

  close() {
    try { this.ctl?.close(); } catch {}
    try { this.state?.close(); } catch {}
    try { this.pc?.close(); } catch {}
    this.connected = false;
  }
}
