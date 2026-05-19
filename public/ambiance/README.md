# Mixer tracks

Drop audio files (`.mp3`, `.ogg`, `.wav`) here, then list them in `manifest.json`:

```json
{
  "tracks": [
    { "name": "Forest birds", "file": "forest_bird.mp3", "type": "ambiance", "tag": "Forest" },
    { "name": "Tense music", "file": "tense.mp3", "type": "music", "tag": "Combat" }
  ]
}
```

Fields:

- `name` — display name shown in the UI.
- `file` — filename relative to this folder.
- `type` — `ambiance` or `music`. Determines which tab the track appears in. Defaults to `ambiance`.
- `tag` — optional. Tracks sharing a tag are grouped together in a collapsible card with that tag as the header. Omit for ungrouped tracks.

All tracks are looped, slider-controlled (volume = 0 pauses, volume > 0 plays looped).
