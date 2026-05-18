# Soundboard tracks

Drop audio files (`.mp3`, `.ogg`, `.wav`) here, then list them in `manifest.json`:

```json
{
  "tracks": [
    { "name": "Sword clang", "file": "sword.mp3" },
    { "name": "Dice roll", "file": "dice.ogg" }
  ]
}
```

Each click spawns a fresh, overlapping one-shot playback.
