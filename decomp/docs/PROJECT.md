# JUS Decomp — Project Overview

Purpose: reverse-engineer **Jump Ultimate Stars** (Nintendo DS, game code `AJUJ`, ROM version 0)
into maintainable source code and, eventually, a **native, moddable desktop executable** that
runs without a Nintendo DS emulator.

The original ROM (`rom/jus.nds`, exactly 64 MiB / 0x4000000 bytes) is the behavioral reference.
It is treated as **read-only** and never committed to Git (see `.gitignore`).

## Long-term goals

1. Analyze and document the original DS program (reconnaissance first).
2. Reconstruct original functions, data structures, systems, and file formats.
3. Produce matching or behaviorally equivalent source code (ARM build = correctness reference).
4. Identify NitroSDK / DS-hardware dependencies and isolate them behind abstractions.
5. Implement native replacements (graphics, audio, input, filesystem, timing).
6. Build a native executable; keep game logic platform-agnostic for future modding.

## Directory layout

| Path | Contents |
|---|---|
| `rom/jus.nds` | Original ROM (read-only reference; git-ignored) |
| `tools/dsd/dsd.exe` | ds-decomp CLI **v0.12.0** (git-ignored binary) |
| `extract/` | Baseline `dsd` extraction of the ROM (git-ignored) |
| `decomp/` | Main working source tree (this documentation lives in `decomp/docs/`) |
| `decomp/docs/` | Persistent reverse-engineering documentation |
| `tools/scripts/` | Reproducible analysis scripts |
| `recomp/` | Track-C static-recompilation workspace (configs, launchers, probes) |
| `recomp/mods/` | User mod packs + `mods_manage.py` manager (see `MODS.md`) |
| `data/` | RE-derived koma/kizuna databases |
| `patches/` | Local ndsrecomp runner modifications (apply on upstream clone) |
| `plans/` | Internal agent handoffs (git-ignored) |

## Toolchain

- **ds-decomp (`dsd`) 0.12.0** — commands observed: `init`, `dis` (disassembly, per module:
  `--main`, `--overlay`, `--itcm`, `--dtcm`), `delink` (relocatable ELF per module), `lcf`
  (linker scripts), `objdiff` (config generation), `sig` (library signatures), `import`,
  `check`, `apply`, `dump`, `format`, `diff`, `rom`, `json`, `fix`.
- Planned: Ghidra + NTRGhidra, objdiff, melonDS (behavioral reference), GDB, Python tooling,
  Git, native C/C++ toolchain (stack decision deferred until requirements are understood).
- **ndsrecomp** (github.com/mstan/ndsrecomp, N64Recomp lineage) + its companion runtime —
  adopted 2026-08-21 as the primary path to the native executable ("Track C": static
  recompilation of ARM9 main + overlays; see `TODO.md`).

## Methodology notes

- Track A (original-code reconstruction) targets ARM code that matches the original binary.
- Track B (native runtime) targets equivalent behavior; matching is not required there.
- Unknown functions keep names `FUN_020xxxxx` until evidence supports a rename; renames are
  recorded with justification in `decomp/docs/FUNCTIONS.md` (to be created when needed).
- Findings are labeled **confirmed** / **strongly inferred** / **tentative** / **unknown**.

## See also

- `MEMORY_MAP.md` — ARM9/ARM7/ITCM/DTCM and overlay load addresses.
- `OVERLAYS.md` — full ARM9 overlay table.
- `FILE_FORMATS.md` — NitroFS layout and proprietary format magics.
- `TODO.md` — work queue.