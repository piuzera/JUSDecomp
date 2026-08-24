# ARM9 Overlays — Jump Ultimate Stars (AJUJ)

Source: `extract/arm9_overlays/overlays.yaml` (`dsd 0.12.0`). All values **confirmed**
against the extraction metadata; region grouping is **strongly inferred** from base addresses.

- 14 ARM9 overlays, ids 0–13; all **uncompressed** and **unsigned** (`table_signed: false`).
- No ARM7 overlays.
- Overlays 9 and 13 are 32-byte stubs (single 4-byte ctor entry; likely placeholders so that
  overlay IDs remain contiguous — **tentative**).

## Full table

| ID | Base | Code size | BSS size | Ctor range | File |
|---:|---|---|---|---|---|
| 0 | `0x0214CD20` | 0x14F00 (85,760) | 0 | `0x02160B24–0x02160B34` | `ov000.bin` |
| 1 | `0x0214CD20` | 0x21120 (135,456) | 0x140 | `0x0216B944–0x0216B980` | `ov001.bin` |
| 2 | `0x0214CD20` | 0x0FE80 (65,152) | 0x80 | `0x0215BB84–0x0215BB9C` | `ov002.bin` |
| 3 | `0x0214CD20` | 0x11F00 (73,472) | 0x20 | `0x0215DA48–0x0215DA68` | `ov003.bin` |
| 4 | `0x0214CD20` | 0x150C0 (86,208) | 0x20 | `0x02160878–0x02160888` | `ov004.bin` |
| 5 | `0x0214CD20` | 0x25560 (152,928) | 0x2E0 | `0x0216F2F4–0x0216F328` | `ov005.bin` |
| 6 | `0x0214CD20` | 0x25C40 (154,688) | 0x100 | `0x02171A7C–0x02171A90` | `ov006.bin` |
| 7 | `0x0214CD20` | 0x1DFC0 (122,816) | 0x1A20 | `0x021691EC–0x02169228` | `ov007.bin` |
| 8 | `0x0214CD20` | 0x1F4A0 (128,160) | 0x2700 | `0x0216AF0C–0x0216AF10` | `ov008.bin` |
| 9 | `0x0214CD20` | 0x20 (32) | 0 | `0x0214CD20–0x0214CD24` | `ov009.bin` |
| 10 | `0x02172A60` | 0x348E0 (215,264) | 0x4A60 | `0x021A3714–0x021A3718` | `ov010.bin` |
| 11 | `0x02172A60` | 0x0F000 (61,440) | 0x2A760 | `0x02181698–0x021816A4` | `ov011.bin` |
| 12 | `0x021AC1C0` | 0x28F60 (167,776) | 0x2AE0 | `0x021D0598–0x021D05A8` | `ov012.bin` |
| 13 | `0x021AC1C0` | 0x20 (32) | 0 | `0x021AC1C0–0x021AC1C4` | `ov013.bin` |

All overlay files are also stored in NitroFS as file IDs 0–13 (the first files in the ROM
image), confirmed by `file_id` fields.

## Load regions

| Region | Base address | Overlays | Occupies (code+BSS worst case) |
|---|---|---|---|
| A | `0x0214CD20` | 0–9 | max end `0x02172960` (+BSS → `0x02172A60`) |
| B | `0x02172A60` | 10–11 | max end `0x021A7340` (ov011 +BSS → `0x021AC1C0`) |
| C | `0x021AC1C0` | 12–13 | ov012 end `0x021D5120` (+BSS → `0x021D7C00`) |

Region bases chain exactly: region B base = region A worst-case end (code+BSS), region C base =
ov011 end (code+BSS). This is strong evidence the regions were laid out by the linker to pack
mutually-exclusive overlay groups contiguously after ARM9 main BSS end (`0x0214CD20`).

## Screen/system mapping (analyzed 2026-08-20; method: NitroFS path-string refs + relocs)

Method: scan each binary for embedded NitroFS paths (confirmed present in ROM) and count
relocation cross-references. Evidence labels: **confirmed** (path strings directly name
the screens), **strongly inferred** (cross-refs + assets), **tentative**.

| ID | Contents (top-level NitroFS dirs referenced) | Identification |
|---:|---|---|
| arm9 (main) | `bin/*` tables | Kernel: file/asset loading, data tables (koma, ability, chr…), NitroSDK init |
| ov000 | title, topmenu, opening, copyright, demo, ending, option, jgalaxy, info | **Title/menu/flow screens** (confirmed) |
| ov001 | deckselect, deck, database, koma, ruleselect, stageselect, result, JArena, Commu | **Deck/koma management + galleries** (confirmed) |
| ov002 | deckcheck, demo, jgalaxy | **Deck checker / J-Galaxy quest UI** (confirmed) |
| ov003 | JArena, vscall, Common/chr | **Jump Arena / communication screens** (confirmed) |
| ov004 | jquiz, result, ruleselect, JArena | **Quiz/result/rules screens** (confirmed) |
| ov005 | deckmake, koma, jpower, battle/ChrWin, database/comic, input | **Deck builder + koma power** (confirmed) |
| ov006 | battle/* (33 refs: deck displays, markers, KO, rank, symbols…) | **Battle UI layer** (confirmed) |
| ov007 | ChildRom (JSS2Child.srl!), Commu, deckselect | **Multiplayer/Download-Play lobby** (confirmed) |
| ov008 | dwc/utility.bin only | **Nintendo WFC online** (confirmed) |
| ov009 | — (32-byte stub) | placeholder (confirmed empty) |
| ov010 | no path strings; called by main (156), ov007 (332!), ov008 (68), ov001/004/005/006/012 (~2-10 each); contains DWC strings | **Shared service library, communication/network-oriented** — strongly inferred (dominant consumers are the multiplayer lobby ov007 and WFC ov008); swapped out of region B during battle |
| ov011 | no path strings; called ONLY by ov006 (25 refs) + ambiguous (10,11) groups; calls main 346×; BSS 174 KB | **Battle core engine** — strongly inferred (battle state + logic; loaded into region B only during battle, replacing ov010) |
| ov012 | stageselect, stage, item, info, bin/commwin | **Shared common library: window/UI framework (commwin), info windows, stage & item DB access + stage-select screen** (confirmed assets; library role strongly inferred — referenced by EVERY module: main 62, ov000 254, ov001 859, ov002 198, ov003 358, ov004 211, ov005 573, ov007 542, ov008 27…) |
| ov013 | — (32-byte stub) | placeholder (confirmed empty) |

## Runtime co-residency model (strongly inferred from regions + cross-refs)

At any moment memory holds: **main** + exactly ONE of ov000–ov009 (region A) + exactly ONE
of ov010/ov011 (region B) + ov012/ov013 (region C, ov012 near-always resident).

- Region A holds the *current screen*; region C (ov012) is the shared UI/DB library.
- Region B holds ov010 (shared comm/network services) in menu contexts, swapped to
  ov011 (battle core) when entering battle (battle UI = ov006 in region A).
- Ambiguous reloc groups like `overlays(10,11)` (main 8, ov007 26, ov008 8) are calls
  into region B whose target module dsd could not disambiguate statically.

Key cross-reference facts (from `decomp/arm9/*/relocs.txt` via `tools/scripts/overlay_map.py`, confirmed):
- main → ov010: 156; ov007 → ov010: 332; ov008 → ov010: 68 (comm-heavy consumers).
- main → ov011: 0 (ov011 only reachable via ov006 → battle subsystem pair).
- Internal call-graph sizes: main 25,588; ov010 7,149; ov008 5,719; ov012 4,905;
  ov011 875 (compact, state-machine-like core).

Priority implication: **battle reconstruction = ov006 (UI) + ov011 (core)**;
**ov012 = highest-leverage shared library** (used by every screen — reconstruct early to
unblock all screens); scene flow = ov000 + main.

## Working hypotheses (to verify during analysis)

- ov010/ov011 are mutually exclusive (shared region B): ov010 serves menu/comm contexts,
  ov011 replaces it during battle. **Tentative** — verify via overlay-load call sites
  (`FS_LoadOverlay`-like) in main's scene manager.
- ov012 is near-always resident (every module references it heavily). **Tentative** —
  verify same way.
- The scene manager lives in **main** (it must orchestrate region-A swaps + region-B swaps
  on screen/battle transitions). Highest-value early target alongside ov010 identification.

## Reproducibility

`tools/scripts/overlay_map.py` regenerates the path-reference and cross-reference tables.
