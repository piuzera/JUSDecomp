# SAVEBUG — save-import / save-write bug session notes (2026-08-21)

> **Session 2 (2026-08-22) continued this investigation with live headless
> instrumentation. Read [`SAVEBUG-SESSION2.md`](SAVEBUG-SESSION2.md) next** —
> it eliminates most hypotheses below (firmware, chip sizes, boot
> write-verify, interpreter) and traces the decision into the NitroSDK
> card-backup identification, incl. the gamecard-bus `0xB8` identify command
> and the ARM7 WRAM driver RE map.

Status labels per standing rules: confirmed / strongly inferred / tentative / unknown.

## Symptoms

- **A (original, OPEN)**: imported 64 KiB flash save (byte-identical to hardware
  dump) triggers the first-boot intro/tutorial in the ndsrecomp runner as if the
  save were blank.
- **B (fixed)**: saving in-game during the tutorial produced
  "CAUTION — Save failed. Please turn off the power and reinsert the card."

## Confirmed facts

### Files (hashes verified this session)

| File | Size | SHA-1 | Notes |
|---|---|---|---|
| `rom/jus.nds` | — | `ba58e20ee60eb81c33dcd4934a21271baa9f954a` | clean **Japanese** ROM, game code `AJUJ` |
| `E:\Jump Database\Jump! Ultimate Stars (J) [English].nds` | — | `11b13210490c983ba79544a706b7e8a3379f8504` | English patch, game code `AJUJ` too |
| import save (Telegram copy = `E:\...\jump-savegame-import.sav`) | 65536 | `3dd960c2809b2cdad8c6ff63b88b0e4f92117f2c` | 100% hardware save |
| `E:\Jump Database\Jump! Ultimate Stars (J) [English].sav` | 65536 | `893dbf1ec64f6f5f52f2cf9529abab476f677acf` | same header; differs from import only after 0x8EA |
| `recomp/jus-failed-save.sav` | 65536 | `89b6298a0356a4db334850f8758efd19ca029da0` | result of pre-fix failed save |
| `recomp/jus.sav` | 65536 | `850413e99ec4759e71a965c662dd8b8091621a29` | result of post-fix successful save |
| `recomp/jus-trace.sav` | 65536 | `3dd960…` | pristine import copy kept for retests |

### Save header format (confirmed from the import)

```
0000: 4A 53 53 47 58 75 00 00   "JSSGXu" magic
0008: 40 00 00 00               u32? sector count 0x40 (64) at 0x08
000C: 45 0F 00 00
0010: B4 32 66 71 FA C6 CF 97   8-byte HMAC-like value
0028: 4A 55 4A 41               "JUJA" = reversed game code AJUJ
0040: E4 A6 17 38 ...           8-byte HMAC-like value
```
The clean ARM9 contains a 64-byte `hmac_sha1_key.bin`
(`extract/arm9/hmac_sha1_key.bin`, `2106c0de…`) — consistent with an
HMAC-SHA1 (truncated) validation. The magic string `JSSGXu` lives in the clean
ARM9 at **0x02072A50**, flanked by `func_02072a60` (Thumb) and `func_02072ab4`
(ARM, 0x660) in `decomp/arm9/symbols.txt` — the static RE entry point for the
validator.

### melonDS oracle matrix (owner-run, decisive)

- **T1** English ROM + import save → intro skippable (control, matches hardware).
- **T2** clean ROM + import save → intro skippable ⇒ **ROM/save pairing is NOT
  the problem**; the clean ROM accepts the English save.
- **T3** clean ROM + a save the clean ROM wrote itself (fresh) → intro NOT
  skippable ⇒ a save that has not completed first-boot/tutorial legitimately
  replays the intro; the intro-suppression flag is written later.

### Runner trace facts (NDS_TRACE_AUXSPI=1 instrumentation)

- Backup driver runs on **ARM7 WRAM @ 0x03803974** (Tier-3 floor in headless).
- Pre-decision traffic is read-only: **0x03 reads only** (236 transactions) +
  **0x05 RDSR** (475). Zero WREN/erase/program at boot in headless runs.
- Read pattern: 255-byte reads at 0x00000, 0x10000, …, 0x270000 (39 × 64 KiB
  boundaries) — chip-geometry probe or paged scan (address byte order of the
  driver still to be confirmed from its code).
- RDSR responses: first byte 0xFF, then status 0x00 (chip ready).
- **Load path is byte-exact and the read path is byte-perfect** (verified via
  in-runner sram head dumps + stream reconstruction; two runs diff-identical).
  Symptom A is therefore NOT caused by wrong read data on the SPI bus.
- JEDEC-ID probe: the game **never sends 0x9F** — the experimental `0x9F`
  patch in `cart_backup.cpp` is dead code for JUS and should be reverted
  (tentative).

## Root cause fixed (symptom B) — CONFIRMED

Two hardware-faithfulness bugs in
`tools/ndsrecomp/runner/src/cart_backup.cpp` `flash_spi_write`:

1. **0x02 byte-program wrote 0x00** instead of ANDing (`new = old & data` —
   flash programming can only clear bits). JUS programs header/flag bytes via
   0x02 → every programmed byte became 0x00 → read-back verify failed →
   "Save failed" in-game.
2. **0xD8/0xDB erase wrote 0x00** instead of raising bits to **0xFF**.

Fix applied (owner-confirmed, verified):
- `0x02` → `destination & val`; erase → `0xFF`.
- Unit test `tools/ndsrecomp/runner/tests/cart_backup_test.cpp` updated to the
  corrected semantics (AND-check 0x5A & 0x0F = 0x0A; erase → 0xFF) — **passing**.
- Runner rebuilt (`build-mingw`).
- **Verification (owner): in-game save now succeeds — no "Save failed" message.**

Forensic corroboration: pre-fix failed save (`jus-failed-save.sav`) contains
43,484 zero bytes and no `JSSGXu` magic — exactly the predicted corruption.

## OPEN: symptom A (imported save still triggers intro) — not yet resolved

Read path is proven byte-perfect, so the divergence must be downstream.
Hypotheses, in priority order:

1. **Boot-time write-verify (strongly inferred)**: the game's validity check
   may require a write round-trip (e.g., write a probe byte / "last played"
   stamp, read it back). Our headless traces show no writes, but those runs
   may terminate before the game reaches that stage, or the interactive path
   differs. The write model was broken until today, so ANY earlier boot-time
   write would have failed verification → blank fallback. **Retest A now that
   the write model is fixed** — simplest first step.
2. **Firmware user settings (tentative)**: the runner always boots with
   `--generated-firmware` (fresh defaults), while melonDS used the owner's
   real 256 KiB `firmware.bin` (SHA-1 `87dae250…`, at `E:\Jump Database`).
   If JUS gates first-boot on firmware personal data / a system flag,
   generated firmware would replay the intro regardless of save. Test:
   `--firmware-path "E:/Jump Database/firmware.bin"` (mutually exclusive with
   `--generated-firmware`; works with `--boot direct`).
3. **RTC (tentative)**: save validation may compare timestamps against the
   RTC; runner RTC defaults are unverified for JUS. Test: `--rtc-host`.
4. **ARM7 driver / IPC handoff (unknown)**: the ARM7 WRAM driver runs on the
   Tier-3 interpreter; a subtle interpreter bug could corrupt the
   ARM7→ARM9 handoff even though SPI bytes are correct. Validate only if 1–3
   fail; driver page 0x03803000 is not yet in `recomp/live-cache/`.
5. **ARM9 validator RE (fallback)**: disassemble `func_02072a60` /
   `func_02072ab4` around 0x02072A50 to read the exact validity condition
   (what bytes, which offsets, which comparison).

## OPEN: post-fix save content — needs one more trace capture

The post-fix `recomp/jus.sav` contains only 2,290 non-FF bytes (islands at
0x0000/0x4000/0x5000/0x8000/0x9000/0xA000/0xB000/0xF000) and **no `JSSGXu`
header** — yet the owner saw the save succeed. Unknown whether that is the
correct shape of a fresh game save (the game may only commit the full system
header later, e.g. after tutorial completion) or a remaining write-model gap.
The playthrough AUXSPI trace was NOT captured (`recomp/playthrough-trace.log`
missing — launch-shell CWD swallowed the redirect). **Next session: re-run the
save with `NDS_TRACE_AUXSPI=1` and locate the log**, then compare the game's
programmed bytes against the flushed file.

## Tooling added this session

- `NDS_TRACE_AUXSPI=1` env-gated byte-level AUXSPI trace in
  `tools/ndsrecomp/runner/src/io.cpp` (`auxspi_trace_write/read`,
  `auxspi_dump_sram_head`) — keep (cheap, off by default).
- `recomp/analyze_auxspi.py` — parses the trace: command histogram, write
  transactions, read ranges, first-read stream, sram dumps, expected-file diff.
- Usage: `py recomp/analyze_auxspi.py <trace-log> [expected-save-file]`.

## Files touched

- `tools/ndsrecomp/runner/src/cart_backup.cpp` — flash write/erase semantics fix.
- `tools/ndsrecomp/runner/tests/cart_backup_test.cpp` — assertions updated.
- `tools/ndsrecomp/runner/src/io.cpp` — AUXSPI trace instrumentation.
- `recomp/analyze_auxspi.py` — new trace analyzer.
- This file.
