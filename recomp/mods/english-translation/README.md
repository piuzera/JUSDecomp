# English Translation (mod pack)

A faithful, standalone mod-form release of the Jump Ultimate Stars English
fan translation, built for the JUSDecomp Riivolution-style mod pipeline
(see `decomp/docs/MODS.md`). The stock Japanese ROM (`rom/jus.nds`) is never
modified; the 28 changed game files are shadowed over gamecard reads at
runtime.

## What it does

A byte-for-byte classified diff (`tools/scripts/eng_diff.py`, report in
`plans/eng-rom-diff-report.md`, manifest `recomp/eng_diff.json`) between the
stock ROM and the patched English ROM showed:

- **arm9, arm7, all 14 overlays (ov000–ov013) and the banner are
  byte-identical** — the translation ships no code patches, so none are
  needed (and none could be applied via gamecard overlays anyway).
- The header differences are pure rebuild-relocation artifacts (offsets,
  secure CRC, ROM size) with no behavioral content.
- The translation is carried entirely by **28 NitroFS files**:
  - text/string tables: `bin/komatxt.bin`, `bin/chr_b_t.bin`,
    `bin/chr_s_t.bin`, `bin/piece.bin`, `bin/rulemess.bin`,
    `bin/ability_t.bin`, `bin/infoname.bin`, `bin/location.bin`,
    `bin/commwin.bin`, `bin/clearlst.bin`, `bin/demo.bin`, `bin/stage.bin`,
    `bin/title.bin`, `bin/bgm.bin`, `battle/tutorial0–5.bin`,
    `deckmake/tutorial.bin`, `Common/win_c00.dig`
  - font width tables: `font/js8font.aft`, `font/jskfont.aft`
  - graphics archives: `bin/InfoDeck.aar`, `koma/koma.aar`,
    `jgalaxy/jgalaxy.aar`, `deckmake/deckmake.aar`

Same-size files are overlain in place. Files that shrank keep their start
offset with a shorter FAT end. Files that grew beyond the in-place slack
(notably `bin/InfoDeck.aar`, +78,820 B) are **relocated into the ROM's
trailing free space** (~1.1 MB of padding on the stock 64 MiB dump) with
their FAT entries repointed — the same documented growth mechanism,
generalized in `tools/scripts/mods_build.py`.

## Requirements

- the stock ROM at `rom/jus.nds` (sha1-gated) + `extract/` (ds-decomp)
- your patched English ROM copied to `rom/jus-en.nds` (used only as the
  local extraction source; never committed, never redistributed)

## Build / enable / play

```cmd
copy "E:\Jump Database\Jump! Ultimate Stars (J) [English].nds" rom\jus-en.nds
py tools\scripts\eng_diff.py
py tools\scripts\mods_manage.py enable english-translation
py tools\scripts\mods_manage.py build english-translation
py tools\scripts\mods_manage.py compose
recomp\play_mod.cmd
```

Verification: `py tools\scripts\eng_verify.py` applies every composed overlay
to the stock image in memory and asserts the effective ROM serves the English
bytes for **all 379 NitroFS files**, touches nothing outside payload extents
/ FAT entries / trailing free space, and leaves arm9/arm7/overlays/banner
stock.

## Interaction with other packs

This is currently the only bundled pack. General rule for mixing: if another
pack overlays the same NitroFS files (e.g. something rebuilding
`bin/komatxt.bin` from *stock* data), the alphabetically-later pack's overlay
wins for the shared ranges — compose order decides. Packs that touch disjoint
files compose cleanly.
