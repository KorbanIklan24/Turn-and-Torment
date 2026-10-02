# Developer Technical Notes

This document serves as an internal technical guideline and architectural reference for the project.

## Audio Asset Pipeline (Godot 4)

To maintain optimal runtime performance, low memory footprint, and artifact-free playback, audio files must adhere to the following specifications:

### 1. Sound Effects (SFX)
- **Format:** Uncompressed WAV (`.wav`)
- **Rationale:** 
  - Bullet-hell encounters generate rapid and frequent audio triggers within milliseconds.
  - `.wav` playback requires zero CPU decoding overhead, eliminating runtime audio latency and stutter during dense bullet barrages.
  - Avoid `.ogg` or `.mp3` for continuous/rapid SFX.

### 2. Background Music (BGM)
- **Format:** Ogg Vorbis (`.ogg`)
- **Rationale:**
  - High compression ratio suitable for long audio tracks without inflating memory usage.
  - Godot provides native support for sample-accurate, gapless looping in `.ogg`.
  - Avoid `.mp3` for looping tracks due to standard encoder padding delays that introduce silence gaps at loop points.

### 3. Third-Party Asset Ingestion Checklist
Before importing external audio assets from itch.io:
- [ ] License verification: Ensure the asset is CC0, CC-BY, or clearly permits usage.
- [ ] Redistribution check: Confirm the license allows inclusion in public GitHub repositories (not restricted to compiled builds only).
- [ ] Attribution: Record creator name, source link, and license type directly into `CREDITS.md`.
