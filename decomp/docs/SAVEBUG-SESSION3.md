# SAVEBUG session 3 — 2026-08-22 continued (agent: Zoo, debug mode)

Follow-up to `SAVEBUG-SESSION2.md`. This session pivoted, per the owner's
request, away from deep-RE of the import path and onto the **user-visible
failure on normal play**: in-game saves that are never re-recognized. Both
symptoms turned out to share ONE root cause, which is now fixed and verified.

Status labels: confirmed / strongly inferred / tentative / unknown.

---

## TL;DR

**Root cause (confirmed):** the runner's flash backup-chip model
([`flash_spi_write`](../../tools/ndsrecomp/runner/src/cart_backup.cpp)) consumed
**3 address bytes for every command regardless of chip size**. JUS's ARM7
backup driver uses **2-byte addressing** for the 64 KiB flash
([`recomp/game.toml`](../../recomp/game.toml) `save_type = "flash"`,
`save_size = 65536`, confirmed from the owner's cartridge). Every program
transfer therefore folded its first data byte into the address:
`02 00 00 4A 53 53 47 58 75 00 00` (magic "JSSGXu\0\0" at 0x0000) landed as
"SSGXu\0\0" at 0x004A, one byte lost, everything shifted. **Saved images had
no valid header, so the game rejected its own saves** → blank fallback (the
intro-replay / header-less-save symptoms from sessions 1–2). Reads were
similarly mis-addressed, which also explains why imported saves were treated
as blank (see below).

**Fix:** [`cart_backup.cpp`](../../tools/ndsrecomp/runner/src/cart_backup.cpp)
now uses an adaptive address size (`sram.size() > 65536 ? 3 : 2` — same rule
the EEPROM path already had) for program (0x02/0x0A), read (0x03/0x0B) and
sector erase (0xD8/0xDB); the 0x0B dummy-byte position follows the address
size. Runner rebuilt; `cart_backup_test` passes.

## Verification (owner-confirmed on the real UI)

1. **Own-save round trip works.** Fresh save → play → in-game save →
   relaunch: the game now loads the save (progress present).
   - Written image: `JSSGXu` at **0x0000 and 0x8000**, bank0 == bank1
     byte-for-byte, 53,700 non-FF bytes, and **only 84 bytes different from
     the hardware fresh save** (`jus-afterintro-save.sav`) — all expected
     per-save content (counter, MAC, name).
2. **Full 100% hardware save imports and loads** the complete profile
   (`jus-100-save.sav` via `play_import100.cmd`).
3. With 2-byte reads, the imported save's data now reaches ARM9 RAM
   (win@0x4000/0x4400/0x0B04 all found; previously impossible).

Note: the headless acceptance probe's `deck_default_init` criterion still
reads true at frame ~300 — the deck tables are default-initialized
transiently at boot before the loaded save overwrites them. The user-visible
load result is the ground truth, not that probe flag.

## Evidence trail (abridged)

- `recomp/play-auxspi.log` (manual play, 8,930 frames): 1,866 program
  transactions, 17,030 programmed bytes, all from ARM7 driver
  `pc=0x03803974`; magic bytes visible on the wire but the trace's chip-side
  `addr` showed the 3-byte fold (`00 00 4A` → 0x004A).
- `recomp/play-resume-auxspi.log` vs `recomp/verify-fixed.log`: byte-identical
  read patterns (950 RDSR, 60,808 read bytes) — the identify scan is
  data-independent; the difference between accepted/rejected outcomes is
  entirely in the returned bytes, which the addressing bug corrupted.
- White screen for the first ~35 vblanks is **normal boot** (identify scan
  phase), then bright title (~frames 40–240), then intro. Earlier "stuck on
  white" reports were the window being closed during this phase.
- Import acceptance at frame 300 previously showed `accepted:false` purely
  because the 3-byte read fold returned garbage; that is gone now.

## Runner / tooling changes this session

| Change | Where |
|---|---|
| Adaptive flash address size (the fix) | `tools/ndsrecomp/runner/src/cart_backup.cpp` |
| Debug-server `resume` command + `run_to_pc` auto-resume of break-pc halts | `debug_server.cpp`, `scheduler.cpp/h` (`scheduler_resume_break_halts`) |
| `recomp/probe_readback.py` | multi-breakpoint rotation over the ARM9 read pipeline + FIFO send tracing (usable now that breakpoints resume) |
| `recomp/probe_fb_timeline.py` | framebuffer-mean timeline over boot vblanks |
| `recomp/probe_play_live.py` | live query of a play-mode runner |
| `recomp/analyze_ownsave.py` | AUXSPI trace → transactions → reconstructed image vs disk vs hardware shape |
| `recomp/play_capture.cmd` / `play_resume.cmd` / `play_import100.cmd` | one-click manual-play capture / resume-load / 100% import launches |

## Follow-up bug: deck edit → save → "restart console" error (fixed)

After the addressing fix, editing a deck on the 100% save and saving showed
the game's "power off and restart" error. Traced reproduction
(`recomp/play_decksave.cmd`, `recomp/decksave-auxspi.log`) and replay analysis
(`recomp/analyze_decksave.py`):

- The save wrote 8 program transactions (388 bytes), **zero erase commands**,
  then 479 read-back verify transfers.
- 46 of the intended bytes needed **0→1 transitions** (e.g. the new deck name
  "ndsrecomp" over the old name "L.C.E.C.C.M.p") that the flash model's
  AND-only byte-program silently dropped. The game's verify then failed.

**Root cause:** the 64 KiB backup chip is an **EEPROM** (GBATEK classifies
flash at 256 KiB+); EEPROM byte writes reprogram the cell fully (0→1
allowed). [`recomp/game.toml`](../../recomp/game.toml) configured
`save_type = "flash"`, routing writes through the AND-program model.

**Fix:** `save_type = "eeprom"` in [`recomp/game.toml`](../../recomp/game.toml)
(config-only; the EEPROM path already does full byte store + 2-byte
addressing). Owner-verified: deck creation ("DEBUG") saves with no error and
**persists on reload** via `play_resume.cmd`.

## Still open (non-blocking)

- The session-2 "bank load delivers nothing" hypothesis was a red herring
  caused by the addressing bug; with correct reads the load works.
- `probe_readback.py` is now usable against serve runners (needs the rebuilt
  binary) if any further read-path question arises.
- `recomp/game.toml` header says "generated by tools/scripts/prepare_jus.py —
  do not hand-edit": the generator should be updated to emit
  `save_type = "eeprom"` so a regen does not reintroduce the bug.
