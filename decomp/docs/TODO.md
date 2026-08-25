# TODO — JUS Decomp

## ⚠️ SCOPE CHANGE (2026-08-20): "Playable POC" replaces "full byte-exact decomp"

After a reality check on cost/feasibility, the project goal is now:

> A native Windows 2-player local multiplayer build of JUS, controlled entirely via
> arcade sticks (no touch screen at all), starting with a single proof-of-concept
> character (**Luffy 4-koma + a small handful of support koma**). Deck-building
> **rules** must be faithful to the original; deck-building **UI** is fully custom
> (stick-navigable, no touch). Single-player content, minigames, WFC/online,
> Download Play, and all non-Luffy characters are OUT OF SCOPE for the POC.

This means:
- **Track A (byte-exact CodeWarrior matching) is DEPRECATED as the primary workflow.**
  It was useful to prove we can read the binary correctly (see "Done" sections below)
  but going forward we do **Track B only**: read ARM disassembly to understand
  behavior, then write clean modern C++ that replicates it. No more compiler sweeps.
- All UI/menu/touch-screen code in the original is now irrelevant — we do not port it.
  We only need to know *what data/rules* it reads, not *how* it drew itself.
- `mwldarm`/`mwccarm` remain useful for reference-checking specific tricky calculations
  (e.g. "does this fixed-point damage formula truncate or round") but are no longer a
  required part of the main workflow.

## ⚡ TRACK CHANGE (2026-08-21): "Track C" — static recompilation via ndsrecomp

Primary path is now **static recompilation** with
[ndsrecomp](https://github.com/mstan/ndsrecomp) (v0.0.1 pre-alpha, cloned to
`tools/ndsrecomp/`; title-project template `tools/supermario64dsrecomp/`). The runtime
lives in the same repo (`runner/`): dual-CPU scheduler, bus, CP15/TCM, 2D engines,
melonDS-derived 3D/Wi-Fi, SDL host. Demonstrated: firmware menu (oracle-identical),
SM64DS playable castle grounds, **MKDS same-machine local wireless 2P**, MPH early
gameplay. See `decomp/docs/NDSRECOMP.md` (verified facts + JUS recipe). Track B
(manual rewrite) is demoted to fallback / custom-UI work; the dsd docs/analysis
pipeline stays — it is literally the recomp input (decomp-assisted recompilation is
the designed workflow: function names/modes/boundaries drive bank generation).

Consequences:

- Original battle logic (ov011) and deck rules (ov001/ov005) run natively — no manual
  porting. RE shifts from "understand to rewrite" → "understand to patch" (input
  polling, save path, comm).
- Sprite/DSIG extraction and `chr/ChrBin.aar` format RE drop off the POC critical path
  (kept as optional tooling/mod work).
- "No touch screen" for the POC = runtime input mapping: XInput/DInput → DS buttons +
  right-stick virtual stylus. The fully custom stick-native deck UI becomes targeted
  function patches on top of the recomp, done later.
- New principal risk: **runtime maturity** for JUS's heavy dual-2D-engine/ALAR/overlay
  usage (tool capabilities — autoload sections, overlay support, symbol import — to be
  verified against its README during the spike). Gate: do not commit past "boots to
  title".
- 2P local: likely two recomp instances bridged at the comm layer — resurrects ov010
  (previously "skip entirely"). This is the one POC requirement where Track C may lose
  to a custom-engine approach; feasibility spike pending.

## Done

- [x] Reconnaissance: workspace, ARM9/ARM7/ITCM/DTCM, overlays, NitroFS inventory, format
  magics, SDK strings (see `PROJECT.md`, `MEMORY_MAP.md`, `OVERLAYS.md`, `FILE_FORMATS.md`).
- [x] `.gitignore` excludes ROM, extract binaries, dsd.exe, mwccarm, JUSToolkit clone.

## Done: dsd project bootstrapped

- [x] `dsd init` — per-module configs, symbols.txt seeds w/ NitroSDK names, relocs, delinks.
- [x] **Discovery**: game is written in **C++** (confirmed: `__sinit_*` ctors, vtable
  `blx` calls).
- [x] `dsd dis` — reference gap-assembly for all modules in `decomp/asm/`.

## Done: Track A build/verify loop (kept as a reference-checking tool, not primary workflow)

- [x] `dsd lcf` + `dsd delink` + `dsd objdiff` — reference ELF objects, linker script.
- [x] `tools/scripts/build.py` — automated delink/lcf/objdiff/link/check pipeline.
- [x] `mwldarm`/`mwccarm` acquired (`tools/mwccarm/`, 26 versions) and proven working:
  link succeeds, **100% gap-asm baseline passes `dsd check modules` byte-exact** for
  ARM9 main + all 14 overlays.
- [x] First (and likely last, for now) byte-exact function match:
  `func_ov000_0214de00`, narrowing compiler family to `2.0/*`/`dsi/*` — see
  `decomp/docs/FUNCTIONS.md`. Kept as a demonstrated capability; not the main path
  forward given the scope change.

## Done: architecture discovery (still fully relevant to the new scope)

- [x] Overlay→screen map via NitroFS path strings + relocation cross-refs
  (`tools/scripts/overlay_map.py`) — see `OVERLAYS.md`. Key findings:
  **ov011 = battle core engine** (highest-priority target for the POC),
  **ov006 = battle UI** (data-only relevant now — we skip porting its UI code, but its
  disassembly tells us *what it reads* from ov011/state), **ov005 = deck builder**
  (same: data/rules only), ov012 = shared UI/DB library, ov010 = comm/network
  (**out of scope, skip entirely**).
- [x] Module/subsystem registry table (`"Imp."` table) discovered in main —
  see `GAME_SYSTEMS.md`. Lower priority now since we don't need the original's scene
  manager (we're writing our own game loop).

## Done: asset/data pipeline — JUSToolkit reuse (2026-08-20)

- [x] Confirmed **JUSToolkit** (github.com/priverop/JUSToolkit) is an exact-game-match,
  actively maintained C#/.NET tool covering: ALAR (archive) container format (v2 and
  v3), DSCP (compression), DSIG (sprite/palette), DSTX/ALTM (tile arrangement), ALFT
  (fonts), the full **koma sprite/shape format** (`koma.bin` + `KShape` data), and
  **text-only** extraction for `ability.bin`-family, `chr_b_t.bin`, `deck/Deck.aar`
  names, etc. See `decomp/docs/FILE_FORMATS_JUSTOOLKIT.md`. **Major cost-saver** —
  we do not need to re-derive these formats from scratch.
- [x] Ported the ALAR v2/v3 container reader to Python (no .NET dependency needed in
  our pipeline): `tools/scripts/alar_extract.py`, verified against `Deck.aar`
  (370 files extracted correctly, exact byte-size match to JUSToolkit's own format
  constants).
- [x] Decoded `bin/koma.bin` ourselves in Python (12-byte `KomaElement` records).
- [x] **Reverse-engineered the deck record format** — see `decomp/docs/DECK_FORMAT.md`:
  each of the 370 preset decks in `Deck.aar` is 92 bytes. **Runtime-corrected
  (2026-08-22): 16 slots × `{koma_id: u16, flags: u16}` at 0x00–0x3F, Shift-JIS name
  at 0x40, `0xFFFF` = empty slot** (the earlier "0x18 header + 10 slots" reading was
  wrong). Note: the earlier "op = NTbl 3, indices 41-55" claim was also wrong —
  **One Piece = NameTableIdx 41**; see `DECK_INJECTION.md`.

## Next stage (Track C spike — status 2026-08-21: SMOKE BOOT PASSED)

Done today (see `decomp/docs/NDSRECOMP.md` "Spike results"): toolchain
provisioned, `nds_recompile.exe` built, JUS configs generated from dsd metadata
(`tools/scripts/prepare_jus.py`; 6,017-func authoritative ARM9 bank), banks
generated + runner built (mingw) + **headless smoke boot passed** (dual-CPU,
200M cycles, native ARM9 dispatch, no dispatch misses). Launcher:
`recomp/run_jus.sh interactive|smoke`.

- [x] **Visual spike gate PASSED (2026-08-21)** — interactive run: full intro
  played (VX video decode), touch → tutorial transition, 4,449 frames, save
  file created, gamepad auto-mapped as Player 1. Minor fps drops = Tier-3
  floor on overlays/ARM7-WRAM (expected pre-promotion).
- [x] **Perf confirmed clean**: `recomp/run_jus.sh live` overlay/WRAM
  promotion runs battles with no drops (user-confirmed).
- [x] **Arcade stick works**: QanBa recognized + custom-mapped via
  `recomp/run_remap.sh` (3 real tool bugs found/fixed — see NDSRECOMP.md);
  runner loads the mapping, buttons/D-pad confirmed correct in-game.
- [ ] **OPEN BUG, partially fixed (2026-08-21)**: two flash write-model bugs
  fixed (`0x02` byte-program zeroed data; `0xD8`/`0xDB` erase wrote 0x00
  instead of 0xFF) — the in-game save now succeeds (previously "Save failed").
  The original imported-save symptom (intro plays despite valid save) is still
  OPEN: the read path is proven byte-perfect, so next hypotheses are a
  boot-time write-verify (retest now that writes work), firmware user settings
  (`--firmware-path` with the real firmware), or RTC. Full session notes +
  evidence in `decomp/docs/SAVEBUG.md` — resume there next session.
- [x] **Overlay/WRAM promotion WORKS** — `recomp/run_jus.sh live`: 12 native
  DLL candidates auto-compiled + hot-swapped in-session (ARM7 WRAM sound
  driver + ARM9 overlay-region pages), cache persists in `recomp/live-cache/`
  and improves cumulatively. Keep playing in `live` mode to promote more.
- [ ] Input mapping: evaluate runner's built-in `--mph-virtual-stylus-*` /
  `--mph-pad-bind-*` (gamepad virtual stylus, MPH heritage) for arcade
  sticks; add SDL GameController mapping if needed.
- [ ] 2P feasibility: two instances via `--instance-index` +
  `--local-wireless on --local-wireless-port` (MKDS-precedent transport);
  JUS-specific bring-up in ov007/ov010 comm paths.
- [ ] Declare JUS cartridge save type/size in `recomp/game.toml`
  `[cartridge]` from a trusted DB (currently runner default 8 KiB EEPROM).
- [ ] Longer-term hygiene: fold `prepare_jus.py` + bank generation + runner
  build into one CMake project (supermario64dsrecomp model) once stable.

## Online play (2026-08-25) — working; one open issue

- [x] **WiFi Battle online (Wiimmfi/Kaeru) — DONE, validated.** Room created +
  joined with distinct friend codes (same machine) and a cross-network match
  (PC ↔ laptop on a 5G hotspot). The peer-unicast WFC relay fix resolved
  error 80430; a `wiilink` provider (DNS 167.235.229.36) was added for A/B.
  See `decomp/docs/NDSRECOMP.md` Session 3.
- [ ] **OPEN: friend code refreshes on relaunch (2026-08-25, owner-reported).**
  After closing and reopening JUSDecomp the friend code is regenerated;
  going online shows a UID-mismatch warning and prompts an update (which
  lets you play again, but friends must be re-added). The friend-code UID
  derives from the NDS console + the save's Gamecart identity (bank header
  `0x10`); on relaunch the runner must present the same stored identity so
  the code persists. Investigate why the identity changes across launches —
  firmware-state persistence (`--firmware-state-path`), generated-identity
  regeneration, or a save re-claim on boot.
- [ ] Also open from the online bring-up: online fps drop (60 → ~35, both
  machines); same-network `--wfc-peer-host` re-run; local `wfc-server`
  oracle for server-side logs.

## Track B carryovers (still needed under Track C)

- [x] **Deck injection (Track C, 2026-08-22) — DONE, owner-validated.** Runtime deck
  table confirmed (two 50-slot × 92-byte tables: `0x020B0DBC` player / `0x020B2E8C`
  rival, counts `0x020B0D6C`/`0x020B0D6D`); `.sav` mapping corrected to records at
  `0xB0C + slot*0x5C` (counts at `0xAB5`/`0xAB4`). `write_mem` debug-server command +
  `deck_tools.py`/`deck_build.py` → copied deck append shows in the deck list, and the
  authored Luffy POC deck (Sena 1K + **Luffy 4-koma + Zoro 2-koma**, named ＰＯＣ) loads
  with correct komas and **starts a battle**. Close-out in `DECK_INJECTION_STATUS.md`.
  Also cracks part of the save format (relevant to the open imported-save-recognition
  bug in `SAVEBUG.md`).
- [x] **Luffy 4-koma identified: koma.bin index `823`** (live oracle, 2026-08-22).
  One Piece = NameTableIdx 41; Zoro 2-koma = 830, Sena 1-koma (Eyeshield 21) = 0.
- [x] **Deck slot `flags` decoded (2026-08-22)**:
  `flags = (leader << 12) | (link << 10) | (row << 4) | col`, board 5×4, no
  rotation (see `DECK_FORMAT.md`). Only the 1-koma link-direction bits remain open.
  Also confirmed at runtime: duplicate koma ids are silently deduped; battle
  requires ≥1 1-koma and ≥1 support koma.
- [ ] Locate the deck-building **legality rule** (point cost limits, board size limits)
  — likely in ov001 or ov005. Under Track C: locate and understand enough to
  call/verify; no reimplementation required.
- [x] **Koma ID harvest — DONE (2026-08-23).** All 890 komas identified:
  `data/koma_db.json` / `.csv` (names, series, size/type, grid shapes,
  encyclopedia + ability texts) via `tools/scripts/koma_harvest.py`. Key
  unlocks: name tables use **relative u32 pointers + plain Shift-JIS**
  (JUSToolkit `JusText.ReadIndirectString` — old absolute-offset dumps were
  garbled for that reason, no custom encoding); `komatxt.bin` IS the per-koma
  name table (890 entries, indexed by koma id); 43-entry series table lives in
  JUSToolkit `Koma.cs`; `kshape.bin` decoded (tiles = KShapeGroupIdx+1,
  0x14-byte mask = 5×4 board occupancy). Validated against runtime anchors +
  295 preset decks. **Enriched with the owner's "Jump Database" project**
  (`data/koma_external.csv`): English names, series, nature (力/知/笑),
  shape-variant codes, battle stats for the 868 legit komas (22 cheat-only
  komas excluded by design). See `KOMA_DATABASE.md` (auto-generated).
- [x] **Link-direction decode — DONE (2026-08-23).** Flags bits 8-11 = direction
  enum {1: down, 2: left, 3: up, 4: right} toward the linked koma (464/464 corpus
  adjacency hits + live in-game arrow check on 4 injected decks). Links are
  optional (live `ＮＯＬＩＮＫ` test passes); 211 linkable / 15 standalone / 101
  unknown 1-koma ids classified. See `KOMA_LINKS.md`, `data/koma_linkable.json`,
  `tools/scripts/link_solve.py`; `deck_build.py` now auto-links by geometry.
- [x] **L/R assist flags — DONE (2026-08-23).** `0x2000` = L shortcut,
  `0x4000` = R shortcut (owner-confirmed in deck viewer). Placeable on support
  (2-3T) and battle (4-8T) komas; ≤1 of each per deck, never both on one slot.
  `deck_build.py --assist L|R:<spec>` implemented; see `KOMA_LINKS.md` +
  `tools/scripts/assist_solve.py`.
- [x] **Ally boost (kizuna) — DONE (2026-08-23).** No deck-record flag: the
  game computes the boost from adjacency + per-battle-char relations
  (`chr_b_t.bin` unk triplets = related characters' 1-koma ids). Live-validated
  sparkles (owner). 205/206 battle komas mapped in `data/kizuna.json`
  (`tools/scripts/kizuna_build.py`); `deck_build.py` reports boosts;
  see `KIZUNA.md` + `plans/boost-ui-implementation.md` (web handoff).
- [x] **New koma 890 appended — DONE (2026-08-23, owner-validated).** A
  genuine NEW koma id (890) now exists — own record, own deck entry, custom
  art, name ＮＥＷ, battles fine. Route: in-place NitroFS growth (FAT end
  patch into slack; `tools/scripts/nitrofs_map.py` / `koma_append.py` /
  `nitrofs_grow.py`). Discoveries: the game derives the koma-record count
  from the file size (runtime bound 891); **display name and art are both
  ImageID-keyed**; the earlier "hardcoded 13,362-B komatxt size" was a
  **false negative** — the correct ＮＥＷ codepoints have 7 hits in runtime
  RAM, so the grown file loads fully and **no ARM9 patch is needed**.
  See `decomp/docs/NEW_KOMA.md` §9.
- [x] **Unique koma 890 — packaged via runtime file overlays (2026-08-23).**
  Record 890's ImageID is now **0x037A (890)** → art = spare `koma/dt_20.dtx`
  (no archive growth) and name = real `komatxt[890]` entry. Release model:
  **Riivolution-style** — `[[mods.overlays]]` in the runner shadow gamecard
  reads with host files (io.cpp `card_copy_rom` interception); FAT-entry
  overlays carry file growth; `mods_build.py` resolves NitroFS paths to ROM
  offsets (content search + FAT + slack) and ALAR3 members by name. The ROM
  stays **stock** (`game-mod.toml` sha1 gate = stock dump; `play_mod.cmd`
  boots `rom/jus.nds`) — users bring their own ROM. Pre-flighted via
  `recomp/apply_overlays_check.py`. See `NEW_KOMA.md` §10.
- [x] **Owner verification of the overlay route — PASSED (2026-08-23).**
  Stock `rom/jus.nds` + overlays: deck viewer shows koma 890 = ＮＥＷ + its
  own art; battle runs and empty slots look normal. Slot collision found
  and resolved: `dt_20..dt_27` are the battle's empty-slot templates (size
  1..8), not spares — koma 890's art now lives in `dt_01.dtx` (cheat-only
  hidden koma 871's image slot, donated; `komatxt[871]` rewritten to ＮＥＷ
  in place). Everything via `[[mods.overlays]]`; the ROM is never touched.
- [x] **New-koma POC — DONE (2026-08-23, owner-validated).** Repurposed the
 hidden placeholder koma id 870 (Ａコマ, NTbl 42) into a "new" 1-tile helper
 via runtime RAM injection: custom name (ＺＯＯ shown live in the deck
 viewer), donor effect fields (Sena id 0), deck 30 (870 + Zoro + Luffy)
 authored, injected and **battle-started with all 3 komas**. Key facts:
 koma.bin `image_id == id` for all 890 records (art is id-selected — the
 ImageID field is NOT a swap lever); runtime koma table = `ctx[0x30] +
 kid*0xC` (ctx at 0x0214BD80; verbatim koma.bin copy); **scene transitions
 reload koma.bin/komatxt from NitroFS** (RAM patches are per-screen, but
 deck-view labels re-render live from the loaded table). Tooling:
 `tools/scripts/koma_tools.py` (offline/locate/patch/find). Full report:
 `decomp/docs/NEW_KOMA.md`.
- [x] **Custom sprite pixels — DONE (2026-08-23, owner-validated).** Offline
  in-place ROM route: koma 870's `koma/dt_00.dtx` (DTX4 + embedded DSIG,
  uncompressed, ROM offset `0x2BBB53C`) replaced size-preservingly with a
  custom design; `recomp/jus-mod.nds` + `recomp/game-mod.toml` + `recomp/
  play_mod.cmd`; tooling `tools/scripts/dtx4_mod.py`
  (dump/paint/paint-png/patch-rom; user art = any PNG, auto-quantized to
  ≤15 colors + transparency). See `decomp/docs/NEW_KOMA.md` §7.
- [x] **Mod pipeline for end users — DONE (2026-08-24).** `recomp/mods/<id>/`
  pack format (mod.toml manifest + src/ + optional build.py hook + generated
  files/), `tools/scripts/mods_manage.py` (list/enable/disable/build/compose),
  auto-composed `recomp/game-mod.generated.toml`, generalized `play_mod.cmd`,
  and the example pack `recomp/mods/koma-890-jodio/` (rebuilds byte-identical
  to the validated overlay set). Docs: `decomp/docs/MODS.md`. Remaining
  follow-up: zip distribution of packs.
- [ ] New-koma follow-ups (see `NEW_KOMA.md`): **brand-new CUSTOM series
  (ntbl 43) for koma 890 "Jodio" — IN PROGRESS, paused 2026-08-23**;
  full RE notes + next-session plan in `NEW_KOMA.md` §11 (piece.bin =
  41×0x60 records with relative string pointers + Id u16; tabs built in
  ov005; prefix table = JUSToolkit Koma.cs NameTable; overlays are
  uncompressed so byte patches work; ASCII koma names render blank — use
  full-width ＪＯＤＩＯ). Also: config-driven deck auto-inject; battle-time
  effect reuse; multi-tile art; new effect behavior (chr ALAR RE).
- [ ] Remaining flag work: `0x8000` (bit 15, never observed), `kshape.bin`
  (8 groups, per-koma shapes), koma.bin KShapeGroup/Element semantics. Also:
  the owner-reported editor-level "must link" rule (ov001/ov005) and the
  `unk[0]`-indexed help-effect table (chr ALAR).
- [ ] Optional follow-up on duplicate-koma dedup: the filter is located (battle
  list walk in `func_02076e38`, main ARM9 — see `DECK_INJECTION_STATUS.md`);
  a data-only list splice had no visible effect, so the fight engine likely
  snapshots at build. Code-level removal belongs to the Track A decomp route.

## Demoted to optional under Track C (was POC-critical under Track B)

- Luffy `chr/ChrBin.aar/chr/{ai,move,col,effect,shot}/*` format RE — the game reads its
  own battle data natively; revisit only for tooling/mods.
- Sprite extraction pipeline (`chr/ChrArc.aar`, ALAR type 3, DSTX Type 2) — the runtime
  renders the original assets; revisit only for mod tooling.
- "Trace one Luffy move end-to-end" — was the Track B workflow gate; under Track C only
  needed when patching specific battle behavior.
- SDL2 engine shell — superseded by the ndsrecomp runtime shell for the POC; may return
  for the custom deck UI or the long-term moddable reconstruction.
- "Integrate" item (custom deck-build screen → battle → win/loss) — becomes "runtime
  shell + input mapping + targeted UI patches" (see spike list above).

## Deferred / explicitly out of scope for the POC

- Byte-exact Track A matching of any function (kept only as an occasional
  reference-checking tool for tricky calculations).
- All non-Luffy-family characters, all non-battle/non-deck-build screens (title, quiz,
  J-Galaxy, Jump Arena, comics, database, Download Play, tutorials,
  demo/ending, credits).
- Touch-screen UI of any kind (deck building and battle HUD are both stick-only, custom).
- ARM7 analysis (audio driver etc.) — revisit only if audio porting requires it.
- Full `Imp.` table decode / dispatcher confirmation — not needed since we write our
  own game loop; revisit only if useful as a reference for game-flow logic.

## Standing rules

- Renames require recorded evidence; keep `FUN_020xxxxx` until then (`FUNCTIONS.md`).
- `plans/` holds internal agent handoffs and is gitignored; persistent knowledge
  lives in `decomp/docs/` (see also `docs/REPO_AUDIT.md` for the public-repo policy).
- New findings go into `decomp/docs/` immediately, labeled confirmed / strongly inferred /
  tentative / unknown.
- Reversible scripts over manual Ghidra operations where possible.
- Prefer reusing JUSToolkit's documented formats over re-deriving from scratch; only do
  original RE work for what JUSToolkit doesn't cover (battle logic, deck rules).