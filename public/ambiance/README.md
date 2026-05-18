# Ambiance tracks

Drop audio files (`.mp3`, `.ogg`, `.wav`) here, then list them in `manifest.json`:

```json
{
  "tracks": [
    { "name": "Tavern", "file": "tavern.mp3" },
    { "name": "Forest at night", "file": "forest-night.ogg" }
  ]
}
```

These are looped, slider-controlled tracks (volume = 0 pauses, volume > 0 plays looped).
