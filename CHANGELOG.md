# Changelog

All notable changes to this project are documented here. Version numbers track
the public releases; internal research milestones before v0.1.0 are summarized
below from the project's working history.

## Unreleased (0.2.0 in development)

- **Beginner-friendly launcher** (`launcher/`): a single GUI executable that
  wraps the runner — ROM selection via file dialog with automatic SHA-1
  verification and friendly error messages, one-click Play, in-app settings.
- **In-app mod management**: bundled mod packs ship prebuilt; Settings → Mods
  toggles them on/off, persisted across sessions.
- **In-app controller setup**: guided button-capture dialog (SDL2) writes
  device mappings to the SDL gamecontroller database automatically.
- **Settings persistence** in `%APPDATA%\JUSDecomp\settings.json`
  (portable mode supported), save-file import/delete, session logging.
- **Packaging**: `tools/scripts/package_release.py` assembles the
  self-contained `dist/JUSDecomp/` bundle (launcher + runner + DLLs + bios +
  prebuilt mods + player guide).
- `docs/USER_GUIDE.md` player guide; README "For players" section.

## 0.1.0 — 2026-08-24 (first public release)

First public release: repository cleaned for GitHub publishing, MIT license,
and a user-facing mod pipeline.

### Reverse engineering & recompilation

- Reconnaissance of the ARM9/ARM7 binaries: memory map, 14 ARM9 overlays,
  NitroFS layout, format magics, C++ identification (`decomp/docs/`).
- `dsd` project bootstrap: per-module symbols/relocs/delinks + reference gap
  assembly for main, ITCM, DTCM, and all overlays.
- Track A build loop (delink/lcf/objdiff + optional mwldarm link): 100%
  byte-exact gap-asm baseline; first verified function match
  (`func_ov000_0214de00`).
- Adopted **ndsrecomp** static recompilation ("Track C"): authoritative ARM9
  bank (6,017 functions), headless smoke boot passed, full intro plays with
  touch input, overlay/WRAM live promotion works, arcade-stick support with
  controller remapping tool.
- Save-chip reverse engineering: 64 KiB cartridge backup identified as EEPROM
  (not flash), runner write-model bugs fixed, in-game saving works
  (`SAVEBUG*.md`).

### Data & formats

- Deck record format decoded (16 slots × koma/flags + Shift-JIS name),
  including leader/link/row/col flag bits and link-direction enum.
- All **890 komas** harvested and named (`data/koma_db.*`, `KOMA_DATABASE.md`),
  enriched with the owner's Jump Database; kizuna boost relations mapped.
- Runtime deck injection working: authored decks load and battle.
- Brand-new koma id **890** created and packaged via NitroFS growth.

### Mod pipeline (new in 0.1.0)

- `recomp/mods/<id>/` pack format: `mod.toml` manifest + `src/` assets +
  optional `build.py` hook; payloads rebuilt from the user's own extraction —
  no game data ever committed.
- `tools/scripts/mods_manage.py`: `list`, `enable`, `disable`, `build`,
  `compose` (auto-generates `recomp/game-mod.generated.toml`).
- Example pack `koma-890-jodio` (reproduces the validated overlay mod
  byte-for-byte); generalized `recomp/play_mod.cmd` with fresh-save mode.
- Documentation: `decomp/docs/MODS.md`.

### Repository hygiene

- Comprehensive `.gitignore` + `.gitattributes`; public-repo audit and policy
  in `decomp/docs/REPO_AUDIT.md`.
- Local `ndsrecomp` modifications exported as a verified patch series
  (`patches/ndsrecomp/`).
- History rebuilt: one clean initial commit (previous working history kept in
  the local `backup/pre-v0.1` branch).
- MIT license for all original code/scripts/docs.

## Unreleased (pre-0.1 working history)

Milestones captured in git before the public history reset (branch
`backup/pre-v0.1`): reconnaissance docs + dsd init; build infrastructure;
CodeWarrior toolchain research; Track A loop operational; overlay→screen map;
Imp. registry discovery; first function match; scope change to playable POC;
JUSToolkit reuse and deck format RE; koma harvest; deck injection; save bug
sessions; new-koma POC; runtime overlay mod system.
