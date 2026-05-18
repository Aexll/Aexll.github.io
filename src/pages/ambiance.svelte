<script>
  import { onMount, onDestroy } from 'svelte';
  import Topmenu from '../lib/Topmenu.svelte';

  /** @typedef {{ name: string, src: string, isUpload?: boolean }} Track */

  /** @type {Track[]} */
  let ambiance = [];
  /** @type {Track[]} */
  let soundboard = [];

  // volume per ambiance track, keyed by src
  /** @type {Record<string, number>} */
  let volumes = {};
  // audio elements per ambiance src, set via bind:this through the keyed each
  /** @type {Record<string, HTMLAudioElement>} */
  const ambianceEls = {};

  let dragOverAmbiance = false;
  let dragOverSoundboard = false;

  // Global mixer controls
  let masterVolume = 1;
  let crossfadeSeconds = 3;

  // Worlds (presets): { id, name, volumes: { [trackSrc]: 0..1 } }
  /** @typedef {{ id: string, name: string, volumes: Record<string, number> }} World */
  /** @type {World[]} */
  let worlds = [];
  let newWorldName = '';
  const WORLDS_STORAGE_KEY = 'ambiance-worlds-v1';

  // Active blend animation handle, null when no blend is running.
  /** @type {number | null} */
  let blendAnimId = null;

  onMount(async () => {
    const [amb, sb] = await Promise.all([
      loadManifest('/ambiance/manifest.json', '/ambiance/'),
      loadManifest('/soundboard/manifest.json', '/soundboard/')
    ]);
    ambiance = amb;
    soundboard = sb;
    for (const t of ambiance) {
      if (volumes[t.src] === undefined) volumes[t.src] = 0;
    }
    try {
      const raw = localStorage.getItem(WORLDS_STORAGE_KEY);
      if (raw) worlds = JSON.parse(raw);
    } catch { /* corrupt storage — ignore */ }
  });

  onDestroy(() => {
    for (const t of [...ambiance, ...soundboard]) {
      if (t.isUpload) URL.revokeObjectURL(t.src);
    }
    for (const el of Object.values(ambianceEls)) {
      if (el) {
        el.pause();
        el.src = '';
      }
    }
  });

  async function loadManifest(url, baseDir) {
    try {
      const res = await fetch(url);
      if (!res.ok) return [];
      const data = await res.json();
      return (data.tracks ?? []).map(t => ({
        name: t.name,
        src: baseDir + t.file
      }));
    } catch {
      return [];
    }
  }

  // Reactive: when volume or master changes, sync to the audio element and play/pause.
  // Use slider value to decide play/pause (so master=0 doesn't pause everything),
  // and master * slider for the actual output volume.
  $: for (const t of ambiance) {
    const el = ambianceEls[t.src];
    if (!el) continue;
    const v = volumes[t.src] ?? 0;
    el.volume = Math.max(0, Math.min(1, v * masterVolume));
    if (v > 0 && el.paused) {
      el.play().catch(() => { /* autoplay-blocked until first user gesture */ });
    } else if (v === 0 && !el.paused) {
      el.pause();
    }
  }

  function cancelBlend() {
    if (blendAnimId !== null) {
      cancelAnimationFrame(blendAnimId);
      blendAnimId = null;
    }
  }

  /**
   * Smoothly tween every ambiance track's volume toward `target`.
   * Missing keys in `target` fade to 0. Duration in milliseconds.
   * @param {Record<string, number>} target
   * @param {number} durationMs
   */
  function blendTo(target, durationMs) {
    cancelBlend();
    /** @type {Record<string, number>} */
    const start = {};
    for (const t of ambiance) start[t.src] = volumes[t.src] ?? 0;
    const startTime = performance.now();
    const dur = Math.max(1, durationMs);
    const step = (now) => {
      const p = Math.min(1, (now - startTime) / dur);
      const next = { ...volumes };
      for (const t of ambiance) {
        const from = start[t.src] ?? 0;
        const to = target[t.src] ?? 0;
        next[t.src] = from + (to - from) * p;
      }
      volumes = next;
      if (p < 1) blendAnimId = requestAnimationFrame(step);
      else blendAnimId = null;
    };
    blendAnimId = requestAnimationFrame(step);
  }

  function stopAllAmbiance() {
    blendTo({}, crossfadeSeconds * 1000);
  }

  function makeId() {
    if (typeof crypto !== 'undefined' && crypto.randomUUID) return crypto.randomUUID();
    return Math.random().toString(36).slice(2) + Date.now().toString(36);
  }

  function persistWorlds() {
    // Drop blob: URLs — they don't survive a reload, no point storing them.
    const cleaned = worlds.map(w => ({
      id: w.id,
      name: w.name,
      volumes: Object.fromEntries(
        Object.entries(w.volumes).filter(([src]) => !src.startsWith('blob:'))
      )
    }));
    try { localStorage.setItem(WORLDS_STORAGE_KEY, JSON.stringify(cleaned)); }
    catch { /* quota / disabled — ignore */ }
  }

  function snapshotVolumes() {
    /** @type {Record<string, number>} */
    const snap = {};
    for (const t of ambiance) {
      const v = volumes[t.src] ?? 0;
      if (v > 0) snap[t.src] = v;
    }
    return snap;
  }

  function saveWorld() {
    const name = newWorldName.trim();
    if (!name) return;
    worlds = [...worlds, { id: makeId(), name, volumes: snapshotVolumes() }];
    newWorldName = '';
    persistWorlds();
  }

  function overwriteWorld(world) {
    worlds = worlds.map(w => w.id === world.id ? { ...w, volumes: snapshotVolumes() } : w);
    persistWorlds();
  }

  function deleteWorld(world) {
    worlds = worlds.filter(w => w.id !== world.id);
    persistWorlds();
  }

  function loadWorld(world) {
    blendTo(world.volumes, crossfadeSeconds * 1000);
  }

  function playSoundboard(track) {
    // New Audio per click for free overlapping playback.
    const a = new Audio(track.src);
    a.play().catch(() => {});
  }

  function addUploads(fileList, target) {
    /** @type {Track[]} */
    const added = [];
    for (const file of fileList) {
      if (!file.type.startsWith('audio/')) continue;
      const src = URL.createObjectURL(file);
      added.push({ name: file.name, src, isUpload: true });
    }
    if (target === 'ambiance') {
      ambiance = [...ambiance, ...added];
      for (const t of added) volumes[t.src] = 0;
    } else {
      soundboard = [...soundboard, ...added];
    }
  }

  function onAmbianceDrop(e) {
    e.preventDefault();
    dragOverAmbiance = false;
    if (e.dataTransfer?.files) addUploads(e.dataTransfer.files, 'ambiance');
  }

  function onSoundboardDrop(e) {
    e.preventDefault();
    dragOverSoundboard = false;
    if (e.dataTransfer?.files) addUploads(e.dataTransfer.files, 'soundboard');
  }

  function removeAmbiance(track) {
    const el = ambianceEls[track.src];
    if (el) { el.pause(); el.src = ''; }
    delete ambianceEls[track.src];
    delete volumes[track.src];
    if (track.isUpload) URL.revokeObjectURL(track.src);
    ambiance = ambiance.filter(t => t.src !== track.src);
  }

  function removeSoundboard(track) {
    if (track.isUpload) URL.revokeObjectURL(track.src);
    soundboard = soundboard.filter(t => t.src !== track.src);
  }
</script>

<Topmenu />

<div class="min-h-screen bg-slate-900 text-slate-100">
  <div class="bg-grid bg-center bg-fixed w-full min-h-screen">
    <div class="max-w-6xl mx-auto px-6 py-12">

      <h1 class="font-verdana font-extrabold text-4xl sm:text-5xl lg:text-6xl tracking-tight text-center mb-2 title">
        Ambiance Generator
      </h1>
      <p class="text-center text-slate-400 mb-8">A simple D&amp;D music mixer — looped ambiance layers plus a one-shot soundboard.</p>

      <!-- Global controls -->
      <div class="bg-black/40 rounded-xl outline outline-1 outline-white/20 p-4 mb-10 flex flex-wrap items-center gap-6">
        <div class="flex items-center gap-3 min-w-[14rem] flex-1">
          <label for="master-volume" class="text-sm text-slate-300 whitespace-nowrap">Master volume</label>
          <input
            id="master-volume"
            type="range"
            min="0"
            max="1"
            step="0.01"
            bind:value={masterVolume}
            class="flex-1 accent-blue-500"
          />
          <span class="text-xs text-slate-400 tabular-nums w-10 text-right">{Math.round(masterVolume * 100)}%</span>
        </div>
        <div class="flex items-center gap-3 min-w-[14rem] flex-1">
          <label for="crossfade" class="text-sm text-slate-300 whitespace-nowrap">Crossfade</label>
          <input
            id="crossfade"
            type="range"
            min="0.1"
            max="15"
            step="0.1"
            bind:value={crossfadeSeconds}
            class="flex-1 accent-purple-500"
          />
          <span class="text-xs text-slate-400 tabular-nums w-12 text-right">{crossfadeSeconds.toFixed(1)}s</span>
        </div>
        <button
          type="button"
          on:click={stopAllAmbiance}
          class="text-sm bg-slate-700 hover:bg-red-600 px-3 py-2 rounded-md transition-colors whitespace-nowrap"
        >
          Fade all out
        </button>
      </div>

      <!-- Ambiance mixer -->
      <section class="mb-12">
        <h2 class="text-2xl font-bold mb-4">Ambiance</h2>

        <div
          role="region"
          class="rounded-xl outline outline-1 p-4 transition-colors {dragOverAmbiance ? 'outline-blue-400 bg-blue-500/10' : 'outline-white/20 bg-black/40'}"
          on:dragover|preventDefault={() => dragOverAmbiance = true}
          on:dragleave={() => dragOverAmbiance = false}
          on:drop={onAmbianceDrop}
        >
          {#if ambiance.length === 0}
            <p class="text-slate-400 text-center py-8">No ambiance tracks yet. Drop audio files here, or add them via the button below.</p>
          {:else}
            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-3">
              {#each ambiance as track (track.src)}
                <div class="bg-slate-800/70 rounded-lg p-3 outline outline-1 outline-white/10">
                  <div class="flex items-center justify-between mb-2 gap-2">
                    <span class="font-semibold truncate" title={track.name}>{track.name}</span>
                    <span class="text-xs text-slate-400 tabular-nums w-10 text-right">
                      {Math.round((volumes[track.src] ?? 0) * 100)}%
                    </span>
                  </div>
                  <div class="flex items-center gap-2">
                    <input
                      type="range"
                      min="0"
                      max="1"
                      step="0.01"
                      bind:value={volumes[track.src]}
                      on:input={cancelBlend}
                      class="flex-1 accent-blue-500"
                      aria-label="Volume for {track.name}"
                    />
                    <button
                      type="button"
                      on:click={() => removeAmbiance(track)}
                      class="text-slate-500 hover:text-red-400 text-sm px-2"
                      aria-label="Remove {track.name}"
                    >×</button>
                  </div>
                  <audio
                    bind:this={ambianceEls[track.src]}
                    src={track.src}
                    loop
                    preload="auto"
                  ></audio>
                </div>
              {/each}
            </div>
          {/if}

          <div class="mt-4 flex justify-center">
            <label class="cursor-pointer text-sm bg-slate-700 hover:bg-slate-600 px-3 py-2 rounded-md">
              Add ambiance files
              <input
                type="file"
                accept="audio/*"
                multiple
                class="hidden"
                on:change={(e) => { addUploads(e.currentTarget.files, 'ambiance'); e.currentTarget.value = ''; }}
              />
            </label>
          </div>
        </div>
      </section>

      <!-- Worlds (presets) -->
      <section class="mb-12">
        <div class="flex items-baseline justify-between mb-4 gap-4 flex-wrap">
          <h2 class="text-2xl font-bold">Worlds</h2>
          <p class="text-xs text-slate-400">Saved ambiance presets. Click a world to crossfade into it over {crossfadeSeconds.toFixed(1)}s.</p>
        </div>

        <div class="rounded-xl outline outline-1 outline-white/20 bg-black/40 p-4">
          <form on:submit|preventDefault={saveWorld} class="flex items-center gap-2 mb-4">
            <input
              type="text"
              bind:value={newWorldName}
              placeholder="Name this mix (e.g. Tavern, Combat, Night march)"
              class="flex-1 bg-slate-800 outline outline-1 outline-white/10 focus:outline-purple-500 rounded-md px-3 py-2 text-sm placeholder:text-slate-500"
            />
            <button
              type="submit"
              disabled={!newWorldName.trim()}
              class="text-sm bg-purple-600 hover:bg-purple-500 disabled:bg-slate-700 disabled:text-slate-500 disabled:cursor-not-allowed px-3 py-2 rounded-md transition-colors"
            >
              Save current as world
            </button>
          </form>

          {#if worlds.length === 0}
            <p class="text-slate-400 text-center py-6 text-sm">No worlds yet. Set up an ambiance mix above and save it here.</p>
          {:else}
            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-3">
              {#each worlds as world (world.id)}
                {@const activeCount = Object.keys(world.volumes).length}
                <div class="group bg-slate-800/70 rounded-lg outline outline-1 outline-white/10 hover:outline-purple-400/60 transition-colors">
                  <button
                    type="button"
                    on:click={() => loadWorld(world)}
                    class="w-full text-left px-3 pt-3 pb-1"
                  >
                    <div class="font-semibold truncate" title={world.name}>{world.name}</div>
                    <div class="text-xs text-slate-400">{activeCount} {activeCount === 1 ? 'track' : 'tracks'}</div>
                  </button>
                  <div class="flex justify-end gap-2 px-3 pb-2 text-xs">
                    <button
                      type="button"
                      on:click={() => overwriteWorld(world)}
                      class="text-slate-400 hover:text-purple-400"
                      title="Overwrite with the current mix"
                    >
                      Save current
                    </button>
                    <button
                      type="button"
                      on:click={() => deleteWorld(world)}
                      class="text-slate-400 hover:text-red-400"
                      title="Delete world"
                      aria-label="Delete {world.name}"
                    >
                      Delete
                    </button>
                  </div>
                </div>
              {/each}
            </div>
          {/if}
        </div>
      </section>

      <!-- Soundboard -->
      <section>
        <h2 class="text-2xl font-bold mb-4">Soundboard</h2>

        <div
          role="region"
          class="rounded-xl outline outline-1 p-4 transition-colors {dragOverSoundboard ? 'outline-orange-400 bg-orange-500/10' : 'outline-white/20 bg-black/40'}"
          on:dragover|preventDefault={() => dragOverSoundboard = true}
          on:dragleave={() => dragOverSoundboard = false}
          on:drop={onSoundboardDrop}
        >
          {#if soundboard.length === 0}
            <p class="text-slate-400 text-center py-8">No soundboard tracks yet. Drop audio files here, or add them via the button below.</p>
          {:else}
            <div class="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 gap-3">
              {#each soundboard as track (track.src)}
                <div class="relative">
                  <button
                    type="button"
                    on:click={() => playSoundboard(track)}
                    class="w-full h-20 rounded-lg bg-slate-800 hover:bg-slate-700 active:bg-slate-600 outline outline-1 outline-white/10 hover:outline-orange-400/60 transition-colors px-3 text-sm font-medium"
                  >
                    {track.name}
                  </button>
                  <button
                    type="button"
                    on:click={() => removeSoundboard(track)}
                    class="absolute top-1 right-1 text-slate-500 hover:text-red-400 text-xs px-1"
                    aria-label="Remove {track.name}"
                  >×</button>
                </div>
              {/each}
            </div>
          {/if}

          <div class="mt-4 flex justify-center">
            <label class="cursor-pointer text-sm bg-slate-700 hover:bg-slate-600 px-3 py-2 rounded-md">
              Add soundboard files
              <input
                type="file"
                accept="audio/*"
                multiple
                class="hidden"
                on:change={(e) => { addUploads(e.currentTarget.files, 'soundboard'); e.currentTarget.value = ''; }}
              />
            </label>
          </div>
        </div>
      </section>

    </div>
  </div>
</div>

<style>
  .title {
    filter: drop-shadow(0 0 0.3em #ffffff7e);
  }
</style>
