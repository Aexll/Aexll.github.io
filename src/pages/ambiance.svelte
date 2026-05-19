<script>
  import { onMount, onDestroy } from 'svelte';
  import Topmenu from '../lib/Topmenu.svelte';

  /** @typedef {{ name: string, src: string, type: 'ambiance'|'music', tag?: string, isUpload?: boolean }} Track */
  /** @typedef {{ id: string, name: string, volumes: Record<string, number> }} World */

  /** @type {Track[]} */
  let allTracks = [];
  /** @type {Track[]} */
  let soundboard = [];

  // Per-track slider value in [0,1].
  /** @type {Record<string, number>} */
  let volumes = {};
  // Audio elements populated via bind:this on each track card's <audio>.
  /** @type {Record<string, HTMLAudioElement>} */
  const audioEls = {};

  // Global mixer controls
  let masterVolume = 1;
  let crossfadeSeconds = 3;

  // Shared worlds — a world snapshots whichever tracks (ambiance + music)
  // have non-zero volume at save time, and loading one blends every mixer
  // track toward that snapshot in lockstep.
  /** @type {World[]} */
  let worlds = [];
  let newWorldName = '';
  const WORLDS_KEY = 'worlds-v1';

  /** @type {Set<string>} */
  let expandedGroups = new Set();

  // Drag-over state, per mixer section + the soundboard.
  let dragOver = { ambiance: false, music: false };
  let dragOverSoundboard = false;

  /** @type {number | null} */
  let blendAnimId = null;

  // Two mixer sections rendered from this config. The accent classes are
  // written out as full literal strings so Tailwind picks them up.
  const SECTIONS = [
    { type: 'ambiance', title: 'Ambiance', accent: 'accent-blue-500', dropClass: 'outline-blue-400 bg-blue-500/10' },
    { type: 'music',    title: 'Music',    accent: 'accent-purple-500', dropClass: 'outline-purple-400 bg-purple-500/10' }
  ];

  onMount(async () => {
    const [tracks, sb] = await Promise.all([
      loadManifest('/ambiance/manifest.json', '/ambiance/'),
      loadManifest('/soundboard/manifest.json', '/soundboard/')
    ]);
    allTracks = tracks;
    soundboard = sb;
    for (const t of allTracks) {
      if (volumes[t.src] === undefined) volumes[t.src] = 0;
    }
    // Default-expand every group so sliders are visible on first paint.
    const tags = new Set();
    for (const t of allTracks) if (t.tag) tags.add(t.tag);
    expandedGroups = tags;

    // Load worlds, with one-shot migration from the old per-tab keys.
    try {
      const raw = localStorage.getItem(WORLDS_KEY);
      if (raw) {
        worlds = JSON.parse(raw);
      } else {
        const ambRaw = localStorage.getItem('ambiance-worlds-v1');
        const musRaw = localStorage.getItem('music-worlds-v1');
        const amb = ambRaw ? JSON.parse(ambRaw) : [];
        const mus = musRaw ? JSON.parse(musRaw) : [];
        worlds = [...amb, ...mus];
        if (worlds.length > 0) persistWorlds();
        localStorage.removeItem('ambiance-worlds-v1');
        localStorage.removeItem('music-worlds-v1');
      }
    } catch { /* corrupt storage — ignore */ }
  });

  onDestroy(() => {
    for (const t of [...allTracks, ...soundboard]) {
      if (t.isUpload) URL.revokeObjectURL(t.src);
    }
    for (const el of Object.values(audioEls)) {
      if (el) { el.pause(); el.src = ''; }
    }
  });

  async function loadManifest(url, baseDir) {
    try {
      const res = await fetch(url);
      if (!res.ok) return [];
      const data = await res.json();
      return (data.tracks ?? []).map(t => ({
        name: t.name,
        src: baseDir + t.file,
        type: t.type === 'music' ? 'music' : 'ambiance',
        tag: t.tag || undefined
      }));
    } catch {
      return [];
    }
  }

  // Reactive: keep every loaded <audio> in sync with its slider × master.
  // Use raw slider (not master-scaled) to decide play/pause so master=0
  // silences without stopping playback.
  $: for (const t of allTracks) {
    const el = audioEls[t.src];
    if (!el) continue;
    const v = volumes[t.src] ?? 0;
    el.volume = Math.max(0, Math.min(1, v * masterVolume));
    if (v > 0 && el.paused) {
      el.play().catch(() => { /* autoplay-blocked until first user gesture */ });
    } else if (v === 0 && !el.paused) {
      el.pause();
    }
  }

  /**
   * Partition tracks of one section into tagged groups + untagged list.
   * @param {Track[]} tracks
   */
  function groupTracks(tracks) {
    /** @type {Record<string, Track[]>} */
    const tagged = {};
    /** @type {Track[]} */
    const untagged = [];
    for (const t of tracks) {
      if (t.tag) (tagged[t.tag] ??= []).push(t);
      else untagged.push(t);
    }
    return { tagged, untagged };
  }

  function activeCountIn(tracks) {
    let c = 0;
    for (const t of tracks) if ((volumes[t.src] ?? 0) > 0) c++;
    return c;
  }

  function toggleGroup(tag) {
    const next = new Set(expandedGroups);
    if (next.has(tag)) next.delete(tag);
    else next.add(tag);
    expandedGroups = next;
  }

  function cancelBlend() {
    if (blendAnimId !== null) {
      cancelAnimationFrame(blendAnimId);
      blendAnimId = null;
    }
  }

  /**
   * Animate volumes for a set of tracks toward target values.
   * Missing keys in `target` fade to 0. Tracks outside `scope` are untouched.
   * @param {Track[]} scope
   * @param {Record<string, number>} target
   * @param {number} durationMs
   */
  function blendTo(scope, target, durationMs) {
    cancelBlend();
    /** @type {Record<string, number>} */
    const start = {};
    for (const t of scope) start[t.src] = volumes[t.src] ?? 0;
    const startTime = performance.now();
    const dur = Math.max(1, durationMs);
    const step = (now) => {
      const p = Math.min(1, (now - startTime) / dur);
      const next = { ...volumes };
      for (const t of scope) {
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

  function stopAllMixer() {
    blendTo(allTracks, {}, crossfadeSeconds * 1000);
  }

  function makeId() {
    if (typeof crypto !== 'undefined' && crypto.randomUUID) return crypto.randomUUID();
    return Math.random().toString(36).slice(2) + Date.now().toString(36);
  }

  function persistWorlds() {
    const cleaned = worlds.map(w => ({
      id: w.id,
      name: w.name,
      volumes: Object.fromEntries(
        Object.entries(w.volumes).filter(([src]) => !src.startsWith('blob:'))
      )
    }));
    try { localStorage.setItem(WORLDS_KEY, JSON.stringify(cleaned)); }
    catch { /* quota / disabled — ignore */ }
  }

  function snapshotMixer() {
    /** @type {Record<string, number>} */
    const snap = {};
    for (const t of allTracks) {
      const v = volumes[t.src] ?? 0;
      if (v > 0) snap[t.src] = v;
    }
    return snap;
  }

  function saveWorld() {
    const name = newWorldName.trim();
    if (!name) return;
    worlds = [...worlds, { id: makeId(), name, volumes: snapshotMixer() }];
    newWorldName = '';
    persistWorlds();
  }

  function overwriteWorld(world) {
    worlds = worlds.map(w => w.id === world.id ? { ...w, volumes: snapshotMixer() } : w);
    persistWorlds();
  }

  function deleteWorld(world) {
    worlds = worlds.filter(w => w.id !== world.id);
    persistWorlds();
  }

  function loadWorld(world) {
    blendTo(allTracks, world.volumes, crossfadeSeconds * 1000);
  }

  function playSoundboard(track) {
    const a = new Audio(track.src);
    a.play().catch(() => {});
  }

  function addUploads(fileList, target) {
    /** @type {Track[]} */
    const added = [];
    for (const file of fileList) {
      if (!file.type.startsWith('audio/')) continue;
      const src = URL.createObjectURL(file);
      if (target === 'soundboard') {
        added.push({ name: file.name, src, type: 'ambiance', isUpload: true });
      } else {
        added.push({ name: file.name, src, type: target, isUpload: true });
      }
    }
    if (target === 'soundboard') {
      soundboard = [...soundboard, ...added];
    } else {
      allTracks = [...allTracks, ...added];
      for (const t of added) volumes[t.src] = 0;
    }
  }

  function onMixerDrop(e, type) {
    e.preventDefault();
    dragOver[type] = false;
    if (e.dataTransfer?.files) addUploads(e.dataTransfer.files, type);
  }

  function onSoundboardDrop(e) {
    e.preventDefault();
    dragOverSoundboard = false;
    if (e.dataTransfer?.files) addUploads(e.dataTransfer.files, 'soundboard');
  }

  function removeTrack(track) {
    const el = audioEls[track.src];
    if (el) { el.pause(); el.src = ''; }
    delete audioEls[track.src];
    delete volumes[track.src];
    if (track.isUpload) URL.revokeObjectURL(track.src);
    allTracks = allTracks.filter(t => t.src !== track.src);
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
      <p class="text-center text-slate-400 mb-8">A simple D&amp;D mixer — looped ambiance and music layers, shared scene presets, and a one-shot soundboard.</p>

      <!-- Global controls -->
      <div class="bg-black/40 rounded-xl outline outline-1 outline-white/20 p-4 mb-10 flex flex-wrap items-center gap-6">
        <div class="flex items-center gap-3 min-w-[14rem] flex-1">
          <label for="master-volume" class="text-sm text-slate-300 whitespace-nowrap">Master volume</label>
          <input id="master-volume" type="range" min="0" max="1" step="0.01" bind:value={masterVolume} class="flex-1 accent-blue-500" />
          <span class="text-xs text-slate-400 tabular-nums w-10 text-right">{Math.round(masterVolume * 100)}%</span>
        </div>
        <div class="flex items-center gap-3 min-w-[14rem] flex-1">
          <label for="crossfade" class="text-sm text-slate-300 whitespace-nowrap">Crossfade</label>
          <input id="crossfade" type="range" min="0.1" max="15" step="0.1" bind:value={crossfadeSeconds} class="flex-1 accent-purple-500" />
          <span class="text-xs text-slate-400 tabular-nums w-12 text-right">{crossfadeSeconds.toFixed(1)}s</span>
        </div>
        <button
          type="button"
          on:click={stopAllMixer}
          class="text-sm bg-slate-700 hover:bg-red-600 px-3 py-2 rounded-md transition-colors whitespace-nowrap"
        >
          Fade all out
        </button>
      </div>

      <!-- Mixer sections: Ambiance, Music -->
      {#each SECTIONS as section (section.type)}
        {@const sectionTracks = allTracks.filter(t => t.type === section.type)}
        {@const grouped = groupTracks(sectionTracks)}
        <section class="mb-12">
          <h2 class="text-2xl font-bold mb-4">{section.title}</h2>

          <div
            role="region"
            class="rounded-xl outline outline-1 p-4 transition-colors {dragOver[section.type] ? section.dropClass : 'outline-white/20 bg-black/40'}"
            on:dragover|preventDefault={() => dragOver[section.type] = true}
            on:dragleave={() => dragOver[section.type] = false}
            on:drop={(e) => onMixerDrop(e, section.type)}
          >
            {#if sectionTracks.length === 0}
              <p class="text-slate-400 text-center py-8">No {section.title.toLowerCase()} tracks yet. Drop audio files here, or add them via the button below.</p>
            {:else}
              <div class="space-y-3">
                <!-- Tagged groups: one collapsible card per tag -->
                {#each Object.entries(grouped.tagged) as [tag, ts] (tag)}
                  {@const isExpanded = expandedGroups.has(tag)}
                  {@const active = activeCountIn(ts)}
                  <div class="rounded-lg outline outline-1 outline-white/10 bg-black/30 overflow-hidden">
                    <button
                      type="button"
                      on:click={() => toggleGroup(tag)}
                      class="w-full flex items-center justify-between px-4 py-3 hover:bg-slate-800/50 transition-colors text-left"
                      aria-expanded={isExpanded}
                    >
                      <div class="flex items-center gap-3 min-w-0">
                        <span class="inline-block transition-transform text-slate-400 select-none {isExpanded ? 'rotate-90' : ''}">▶</span>
                        <span class="font-semibold truncate">{tag}</span>
                        <span class="text-xs text-slate-400 whitespace-nowrap">{active} / {ts.length} active</span>
                      </div>
                    </button>
                    {#if isExpanded}
                      <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-3 p-3 pt-0">
                        {#each ts as track (track.src)}
                          <div class="bg-slate-800/70 rounded-lg p-3 outline outline-1 outline-white/10">
                            <div class="flex items-center justify-between mb-2 gap-2">
                              <span class="font-semibold truncate text-sm" title={track.name}>{track.name}</span>
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
                                class="flex-1 {section.accent}"
                                aria-label="Volume for {track.name}"
                              />
                              <button
                                type="button"
                                on:click={() => removeTrack(track)}
                                class="text-slate-500 hover:text-red-400 text-sm px-2"
                                aria-label="Remove {track.name}"
                              >×</button>
                            </div>
                            <audio bind:this={audioEls[track.src]} src={track.src} loop preload="auto"></audio>
                          </div>
                        {/each}
                      </div>
                    {/if}
                  </div>
                {/each}

                <!-- Ungrouped tracks (no tag) -->
                {#if grouped.untagged.length > 0}
                  <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-3">
                    {#each grouped.untagged as track (track.src)}
                      <div class="bg-slate-800/70 rounded-lg p-3 outline outline-1 outline-white/10">
                        <div class="flex items-center justify-between mb-2 gap-2">
                          <span class="font-semibold truncate text-sm" title={track.name}>{track.name}</span>
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
                            class="flex-1 {section.accent}"
                            aria-label="Volume for {track.name}"
                          />
                          <button
                            type="button"
                            on:click={() => removeTrack(track)}
                            class="text-slate-500 hover:text-red-400 text-sm px-2"
                            aria-label="Remove {track.name}"
                          >×</button>
                        </div>
                        <audio bind:this={audioEls[track.src]} src={track.src} loop preload="auto"></audio>
                      </div>
                    {/each}
                  </div>
                {/if}
              </div>
            {/if}

            <div class="mt-4 flex justify-center">
              <label class="cursor-pointer text-sm bg-slate-700 hover:bg-slate-600 px-3 py-2 rounded-md">
                Add {section.title.toLowerCase()} files
                <input
                  type="file"
                  accept="audio/*"
                  multiple
                  class="hidden"
                  on:change={(e) => { addUploads(e.currentTarget.files, section.type); e.currentTarget.value = ''; }}
                />
              </label>
            </div>
          </div>
        </section>
      {/each}

      <!-- Worlds (shared across ambiance + music) -->
      <section class="mb-12">
        <div class="flex items-baseline justify-between mb-4 gap-4 flex-wrap">
          <h2 class="text-2xl font-bold">Worlds</h2>
          <p class="text-xs text-slate-400">Saved scene presets across ambiance and music. Click one to crossfade into it over {crossfadeSeconds.toFixed(1)}s.</p>
        </div>

        <div class="rounded-xl outline outline-1 outline-white/20 bg-black/40 p-4">
          <form on:submit|preventDefault={saveWorld} class="flex items-center gap-2 mb-4">
            <input
              type="text"
              bind:value={newWorldName}
              placeholder="Name this scene (e.g. Tavern, Combat, Night march)"
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
            <p class="text-slate-400 text-center py-6 text-sm">No worlds yet. Set up an ambiance and music mix above, then save it here.</p>
          {:else}
            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-3">
              {#each worlds as world (world.id)}
                {@const trackCount = Object.keys(world.volumes).length}
                <div class="bg-slate-800/70 rounded-lg outline outline-1 outline-white/10 hover:outline-purple-400/60 transition-colors">
                  <button
                    type="button"
                    on:click={() => loadWorld(world)}
                    class="w-full text-left px-3 pt-3 pb-1"
                  >
                    <div class="font-semibold truncate" title={world.name}>{world.name}</div>
                    <div class="text-xs text-slate-400">{trackCount} {trackCount === 1 ? 'track' : 'tracks'}</div>
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
