# Koma 890 — Jodio

Example mod pack demonstrating the JUS Decomp mod pipeline
(`decomp/docs/MODS.md`).

## What it does

- Appends a **new unique koma id 890** to the game's koma table
  (890 → 891 records) and names it `ＪＯＤＩＯ` (full-width Latin, matching the
  game's own `ＤＩＯ` convention — the koma-name font has no ASCII glyphs).
- Koma 890's deck-viewer art is painted from [`src/custom01.png`](src/custom01.png)
  into the `koma/dt_01.dtx` slot donated from the cheat-only hidden koma 871.
- The stock ROM is never touched: the runner shadows the modded NitroFS files
  at gamecard-read time via `[[mods.overlays]]`.

## Install / build / enable

```cmd
py tools/scripts/mods_manage.py list                       :: see installed packs
py tools/scripts/mods_manage.py enable koma-890-jodio      :: on by default
py tools/scripts/mods_manage.py build koma-890-jodio       :: materialize files/ from your extract/
py tools/scripts/mods_manage.py compose                    :: generate recomp/game-mod.generated.toml
recomp\play_mod.cmd                                        :: play (stock ROM + mods)
```

The pack ships only original assets and recipes — `files/` payloads are rebuilt
from **your own** `extract/` and are gitignored.

## Customizing the art

Replace `src/custom01.png` with your own image (any size; it is scaled to the
46x44 koma window and auto-quantized to ≤15 colors + transparency), then
`build` again.

## Credits

Format research: `decomp/docs/NEW_KOMA.md` (records, name tables, image-ID
lookup), `tools/scripts/koma_append.py`, `tools/scripts/dtx4_mod.py`.
