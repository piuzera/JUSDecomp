# SAVEBUG session 2 — 2026-08-22 (agent: Zoo, debug mode)

Continuation of `SAVEBUG.md` (read that first). Goal: symptom A — imported
hardware save treated as blank (intro replays, no bank data ever loads) and
the related "own saves are header-less and never re-recognized" problem.

Status labels: confirmed / strongly inferred / tentative / unknown.
Every experiment below ran headless via the runner debug server
(`--serve --port 19xxx`) driven by the new tooling in `recomp/`.

---

## TL;DR of where we are

The runner's **read path is byte-perfect** (re-proven this session, all
59,860 probe bytes identical to the file) and the **write fix from session 1
is in place**. The game performs a **fixed, data-independent 236-read
"geometry probe"** over AUXSPI at boot, goes AUXSPI-silent forever after,
and **fresh-initializes** the save mirror — under *every* environmental
variation we could produce (chip size, padding, firmware, interpreter vs
native driver). The rejection therefore happens **downstream of the SPI
bytes, in the NitroSDK card-backup identification logic**, which mixes
**AUXSPI** with the **gamecard-bus backup identify command 0xB8** — and we
have strong evidence the decision point is the ARM9-side scan that the
probe feeds. The session ended mid-RE of that logic (see "Next steps").

---

## New facts (confirmed this session)

1. **Save file structure (from 3 hardware saves).**
   - Two **32 KiB mirrored banks** at 0x0000 and 0x8000. In both hardware
     files bank0 == bank1 **byte-for-byte** (0 differing bytes).
   - Bank header (0x48 bytes): `0x00 "JSSGXu\0\0"`, `0x08 u32 0x40`,
     `0x0C u32` content-dependent counter (`0x0F2B` fresh ≈ 3883,
     `0x0F45` 100% ≈ 3909; ×8 ≈ bytes-used), `0x10 8-byte MAC`
     (per-save value; same console+content → same value), `0x2C "JUJA"`,
     `0x44 4-byte value` (per-save). Same 8 bytes as `0x10` also appear
     at save offset 0x0B04 (deck table 1 start).
   - Banks are used up to `0x755F`; 0x7560..0x7FFF stays erased (0xFF).
   - **A hardware "fresh" save (`jus-afterintro-save.sav`, provided by the
     owner this session) HAS the full JSSGXu header at both bank slots.**
     ⇒ the runner's post-fix own saves (`jus.sav`: no header anywhere,
     2,290 non-FF bytes) are **not** the correct shape of even a fresh
     save — something downstream of the raw flash write is still wrong.
   - `jus-100-save.sav` is byte-identical to `jus-trace.sav`
     (sha1 `3dd960c2…`).
   - ARM9 `.data` at **0x0209244C** = default blank-save template
     ("JSSGXu" + default SJIS name entries `83 66 83 62 83 4C` …). This
     template is what blank-init writes and what we see in `jus.sav`.

2. **Boot behavior (live, instrumented).**
   - The game issues exactly **236 AUXSPI read transactions of 255 bytes,
     one at every 64 KiB boundary 0x000000…0xF50000**, deterministically
     skipping blocks 0x76–0x7F, with two 95-byte reads at 0x750000 and
     0xF50000 (guest-chosen lengths, not aborts), plus 2×RDSR per read.
     This pattern is **byte-for-byte identical across** 64K/128K/256K/512K
     chips and generated/real firmware ⇒ **the probe is data-independent**.
   - **Zero write commands at boot** (post-write-fix). SAVEBUG hyp. 1
     (boot-time write-verify) is dead.
   - After the probe, **AUXSPI goes permanently silent** — even at frame
     6,600 (110 s of guest time, well past the 4,449-frame intro; fb means
     show active video). No bank data is ever read.
   - ARM9 RAM: the imported header (all 0x48 bytes incl. MAC) **is staged
     at 0x020AEDC1** (64K/real-fw runs; not staged at ≥128K runs); every
     probe result is cached at **0x021DE700+** in 0x100-stride entries
     with payload at +0x61 (entry header 0x60 bytes); deck tables at
     **0x020B0DFC+ (0x5C stride) are DEFAULT-TEMPLATE initialized**.
   - **func_02072a60 (ARM9, Thumb, the validator next to the JSSGXu
     constant) IS reached during boot** (≈397k scheduler rounds after
     reset) with `r0 = 0x020B02B8` — the save-mirror BSS base —
     **containing all zeros**: the validator validates an EMPTY buffer
     because the bank load never delivered data. Caller LR = 0x020727AD
     (inside func_02072750).

3. **Elimination matrix (all rejected; probe pattern identical in each).**
   | Variation | Result |
   |---|---|
   | chip 64 KiB (wrap mirror) | rejected |
   | chip 128 KiB (import + 0xFF pad) | rejected |
   | chip 256 KiB | rejected |
   | chip 512 KiB | rejected |
   | real owner firmware (`E:\Jump Database\firmware.bin`, sha1 87dae250…) | rejected |
   | generated firmware | rejected |
   | ARM7 driver page natively recompiled (live-overlay, bank `03803000` promoted, reset, re-boot) | rejected |
   | read-back verification of ALL probe bytes vs file | **byte-identical** |
   | RDSR | correct (cmd byte 0xFF, status 0x00 idle, `last` flags fine) |

4. **The ARM7 backup driver (WRAM blob) — RE map (confirmed by disasm).**
   Source: `extract/arm7/arm7.bin` offset **0xB1B0** ↔ WRAM 0x03803000
   (page 0x03803000..0x03804000+; entry 0x03803974 = file 0xBB24).
   Dump: `recomp/arm7-wram-dump.bin`; disassembly:
   `recomp/driver_disasm.txt` (0x03803000..0x03804000).
   - `0x03803964 spi_send_byte(ctx)` — pc 0x03803974 in traces (cmd/addr
     bytes). Writes byte to 0x040001A2, spins on AUXSPICNT bit7.
   - `0x038039B0 spi_recv_byte(ctx)` — pc 0x038039B8 (data phase + RDSR
     dummy). Clocks 0x00 out, latches result into ctx->[8] buffer.
   - `0x038038FC spi_transfer_and_compare(ctx)` — recv byte, `cmp` vs
     expected buffer byte; mismatch → failure flag at ctx+0xC and abort
     (ctx[0]==1 → set ctx[0]=1). Used for verify-type reads.
   - `0x038039F4 spi_xfer(ctx, sendptr, recvptr, count, bytefn)` — sets
     AUXSPICNT=0xA040 (enable|hold|backup), per-byte via fn pointer, on
     last byte writes 0xA000 (drops hold = `last` in traces).
   - `0x03803AC8 wait_ready()` — sends the byte at `0x03807E04` (=0x05
     RDSR), reads status, returns (status & 1)==0.
   - `0x03803B34 delay-ish(a,b)` — chunks of ≤5 wait_ready calls.
   - `0x03803A84 gate_keep()` — delay; then `state = *[0x03809C80]->state`;
     **state==4 → state=6, return 0**; else return 1.
     **Every SPI op calls this first and is SKIPPED when it returns 0**
     (i.e. when state==4 = "cardbus/NAND media active").
   - `0x03803D18 cardbus_backup_identify()` — issues **card command
     0xB8** (writes 0xC0 then B8.. params to 0x040001A4..0x040001AF,
     ROMCTRL size field 0xA7 = 4 bytes, waits busy, reads 0x04100010)
     and returns the 32-bit response.
   - `0x03803E20` PXI command dispatcher (jump table for opcodes 0..0xC):
     op3 → 0x03803760 (RDSR-vs-ctx->0x48 check), op4 → 0x03803D18 (B8
     identify, result stored at ctx+8), op6 → 0x038036F0, op7 →
     0x03803568, op8 → 0x0380362C, op9 → 0x038034C0 (SPI
     read/write/verify against ctx+0xC/+0x10/+0x14 = offset/len/buffer),
     op10/11 → 0x0380342C (write loop), op12 → 0x038033D4 (write+verify).
   - `0x0380380C spi_read_cmd(addr, addrsize)` — assembles `0x03` + 1/2/3
     address bytes (addrsize from ctx+0x24).
   - `0x038038B8 spi_wren()` — sends byte at `0x03807E00` (=0x06 WREN).
   - Driver data/globals: 0x03807E00=0x06 (WREN), 0x03807E04=0x05 (RDSR),
     ctx pointer holder **0x03809C80** → ctx in shared main RAM
     (**0x020AEC40** at runtime), [0x03809CC8] = 0x8000009F (a 0x9F/JEDEC
     constant exists in driver data although no 0x9F is ever sent),
     [0x0380A2C0] = 0x03803D7C (nop callback), mode var 0x0380A2A4.

5. **CARD shared ctx (main RAM 0x020AEC40, read live; same after 64K and
   512K runs):**
   ```
   [0x00] state      = 0        (≠4 ⇒ SPI ops are NOT skipped)
   [0x04] 0x1001
   [0x08] B8 id?     = 0
   [0x0C] cursor     = 0xF500   ← probe scan ended at block 0xF5 (EXHAUSTED)
   [0x10] 0x020AEDC0 ← staging buffer (= header copy site 0x020AEDC1-1)
   [0x14] 0x60       ← probe-cache entry header size (cache at 0x021DE700)
   [0x18] 0x10000    ← 64K (default? detected?)
   [0x1C] 0x80  [0x20] 0x80  [0x24] 2  [0x28] 0xA
   ```
   ⇒ the probe scan **ran off the end of its candidate list (0xF5)** in
   every configuration instead of stopping at a detected size.

6. **Card-bus traffic (NEW: the game also drives save via the gamecard
   bus, not only AUXSPI).** Live `cartridge` trace during boot:
   - `b703afa000000000` ×124 (normal ROM reads),
   - **`b800000000000000` ×1 transaction** (4 events: romctrl/command/
     data_ready/complete), transfer_len=4,
     **response word = 16322 = 0x3FC2 — the runner's ROM chip ID**.
   - Runner implementation: [`io.cpp:323`](../tools/ndsrecomp/runner/src/io.cpp)
     `if (g_card_command[0] == 0xB8u) card_fill_chip_id();` — B8 is modeled
     as a chip-ID read and answers with `g_card_chip_id` (0xC2|(MB-1)<<8).
   - The driver stores this B8 word as the **backup media id** (op4 →
     ctx+8). Whether JUS hardware returns 0x00000000 (no cardbus backup
     media) here is THE open question — melonDS's NDSCart B8 modeling is
     the reference to check (not vendored in this repo).

---

## Ruled out (cumulative with session 1)

- ROM/save pairing (melonDS T1/T2), read-path bytes, JEDEC 0x9F (never
  sent by JUS), boot write-verify (no writes at boot), firmware identity,
  chip sizes 64K–512K + padding, ARM7 Tier-3 interpreter (native driver
  behaves identically), RDSR/status model, AUXSPI busy timing formula
  (unchanged from session 1, reads byte-perfect).

## Leading open hypotheses (priority order)

1. **The ARM9-side scan verdict needs a stop condition our model never
   produces.** The scan (cursor in ctx+0x0C) stops only on… something we
   haven't varied: possibly a **read that returns an ERROR** from the
   driver API, a specific status behavior (WIP busy during a read?), or a
   comparison against the ctx cache that must see a *specific* pattern.
   The identical exhaustion at every chip size suggests the stop test
   consults something other than returned data (timing? an API error
   path? the B8 id?).
2. **B8 response semantics**: runner returns ROM chip-id 0x3FC2; if
   hardware/melonDS returns 0 (no cardbus backup) the identification
   takes a different branch (state/media selection) that then feeds the
   scan parameters. Needs a decisive A/B test (patch runner B8 → 0,
   re-boot, watch ctx cursor/acceptance).
3. The scan's 0x76–0x7F skip + two-phase 118/118 shape + 95-byte tail
   reads look like a **table-driven candidate-size walk**; decoding the
   ARM9 loop (recompiled banks around the caller of the read API, or
   static ARM9 near 0x0206xxxx) would give the exact stop condition.

## Next steps (concrete)

1. **A/B the B8 response**: patch `io.cpp` card command 0xB8 to answer
   `0x00000000` when a non-cardbus save type is configured (keep chip-id
   behavior for the boot logo check if the direct-boot mirror needs it —
   check `direct_boot.cpp:162` expectations first), rebuild, re-run the
   standard boot probe (`probe_runner.py`), compare ctx cursor/`accepted`.
2. Disassemble the ARM9 scan loop: find callers of the PXI backup-read
   op (op 6/9) in the ARM9 static banks (symbols around the CARD user
   code; the validator caller func_02072750 is a starting point) to read
   the stop condition and what value the verdict takes.
3. Check melonDS `NDSCart.cpp` (fetch upstream source) for its 0xB8 and
   backup-ID modeling; align the runner.
4. If (1) fixes acceptance: implement properly (config-driven B8 id,
   save-type-aware), add unit test pinning B8=0 for SPI saves, add
   round-trip test: boot with import → assert `win4000_in_ram` →
   flush → new instance boots and RAM mirror shows same bytes → in-game
   save writes a header-carrying image (compare vs
   `jus-afterintro-save.sav` shape: JSSGXu at 0x0000 AND 0x8000).

## Tooling added this session (all in `recomp/`)

| File | Purpose |
|---|---|
| `savebug_driver.py` | debug-server client + driver CLI (shot/save/scanram/key/touch/frames/runrounds/mem/flush/exit) |
| `probe_runner.py` | one-boot acceptance probe (win@0x4000 in RAM, deck default check) |
| `probe_long.py` | long-horizon probe with AUXSPI-growth + fb means |
| `probe_native_boot.py` | live-overlay promote-then-reboot probe |
| `probe_validator.py` | reset + run_to_pc on ARM9 validator, dump regs/args |
| `probe_driver_dump.py` | dump ARM7 WRAM 0x03800000-64K + locate driver in arm7.bin |
| `probe_state.py` | read driver ctx (state/cursor/B8 id) |
| `probe_b8.py` | dump non-B7 card-bus events with response words |
| `probe_pcs.py`, `probe19878.py` | misc sampling helpers |
| `arm_disasm.py` | minimal ARM disassembler (driver RE) |
| `savebug_ladder.py` | chip-size ladder harness (superseded by manual runs; in-process client had a port bug — fixed since) |
| `savebug_readback_check.py` | verify ALL probe read bytes vs file (byte-perfect proof) |
| `savebug_95.py` | extract the 95-byte reads' context |
| `savebug_compare.py` / `save_layout_report.py` / `save_islands.py` | save-file structure forensics |

Key artifacts: `recomp/savebug-session1.log` (gen-fw 64K),
`recomp/savebug-fwtest.log` (real-fw 64K, 6,600 frames),
`recomp/ladder-*-manual*.log` (size ladder), `recomp/arm7-wram-dump.bin`,
`recomp/driver_disasm.txt`, `recomp/b8-events.json`,
`recomp/probe-*.json` (acceptance results), screenshots
`recomp/savebug-shot-*.png`.

## Session 3 (2026-08-22, continued) — B8 A/B + ARM9 pipeline RE

### B8 A/B result (hypothesis 2 REFUTED)

Patched `io.cpp` normal-mode `0xB8` to answer an env-gated value
(`NDS_CARD_B8_ID`, hex u32; unset = chip-id). Rebuilt, re-ran the standard
boot probe.

| | control (B8 = chip-id 0x3FC2) | B8 = 0 |
|---|---|---|
| screens | intro video | **pure white (mean 255)** |
| AUXSPI traffic | 236 reads + RDSR | **zero** |
| probe cache (0x021DE700) | 10 JSSGXu entries | **empty** |
| ctx (0x020AEC40) | cursor 0xF5, state 0 | **NULL (torn down)** |
| deck tables | default-template | **zeroed** |
| `accepted` | false | false |

⇒ the boot-time `0xB8` is the **card-presence chip-ID re-read** (compared
against the 0x027FF800 mirror = 0x3FC2). Answering 0 sends the game down its
cartridge-removed path *before any save access*. The B8 backup-id hypothesis
is dead; B8 must echo the chip ID. (melonDS T1/T2 oracle also answers B8 with
the chip-id and still accepts the import — consistent.)

### ARM9 save pipeline RE (capstone; new tooling)

Added `recomp/arm9_disasm.py` (capstone Thumb/ARM + literal-pool finder +
resync-past-pools) and `recomp/arm9_callers.py` (call-site finder). Key
findings, all confirmed by disasm of `extract/arm9/arm9.bin` (base 0x02000000):

- **`func_02062040` = CARDi_SetBackupType(type)** — type low byte = family
  (1=small flash, 2=large flash, 3=FRAM), `1 << (type>>8)` = size. Sets
  ctx+0x20 (page size), +0x24 (addr mode), +0x28 (subsector). Unrecognized
  type → zeroes config + **ctx state = 3**.
- **`func_02062260` = CARD_IdentifyBackupAsync(type)** — registers callback
  **0x02000b7c**, calls SetBackupType, resets **ctx cursor (+0xC) = 0**, sets
  staging (ctx+0x10 = 0x020AEDC0), queues **op 2** then **op 6** (the 236-read
  scan). Returns `*ctx == 0` (state 0 = "identify succeeded").
- **`func_02061d9c` = CARD_GetBackupType** (reads ctx+0x18); **`func_02061d90`
  = CARD_SetBackupType**; both are refcounted wrappers (ctx+0xC refcount,
  ctx+0x18 type).
- **`func_02070d64` = game save-init** — memset mirror (0x020B02B8) to zero
  for **0x7558** bytes (⇒ validator sees empty buffer), init 50 deck tables
  (0x020B0DBC, 0x5C stride) from default template 0x02092454, then
  `GetBackupType` → `IdentifyBackupAsync(0x1001)` → `SetBackupType`.
- **`func_02062444` = CARD_ReadBackup** — dispatches on read mode (r6: 0/2/3)
  via jump table, queues ops through `func_02062b60`; `func_02062af8` is the
  low-level read (page 0x200, addr-mode from ctx+0x24).
- **`func_020728d8` = game save-load-and-validate** — reads **both banks**
  (loop r4 0..1, bank offset `r4<<0xF` = 0x0000/0x8000) via CARD_ReadBackup
  into a stack buffer, then validates each bank header:
  `[buf] == 0x4753534A` ("JSSG" LE) **and** `[buf+4] == 0x7558` (used-length).
  Verdict: 0=ok, 2=invalid (magic/length mismatch), 3=stamp mismatch, 4=error.
  On invalid it falls back to blank (the intro-replay symptom).

### Root-cause chain (now fully traced)

The rejection is **not** in the SPI bytes, the B8 id, or the identify scan
(which "succeeds", state 0). It is that **the bank data never reaches the
validator**: `func_020728d8` reads both banks via CARD_ReadBackup and checks
the `JSSG`+`0x7558` header, but the read delivers nothing (mirror stays
zeroed), so the verdict is "invalid" → blank fallback → intro replays.

**Open question (next step):** why does CARD_ReadBackup deliver nothing? The
identify scan (op 6) reads 236×255 bytes fine, but the *actual* bank read
(op 9 / read path) either never fires or returns empty. Instrument
`func_02062444`/`func_02062af8` (breakpoint on the read op, dump the returned
buffer) to confirm whether the read is issued and what it returns.

### Tooling added this session

| File | Purpose |
|---|---|
| `recomp/arm9_disasm.py` | capstone Thumb/ARM disassembler + literal-pool finder + resync |
| `recomp/arm9_callers.py` | call-site finder for a target address |
| `recomp/probe_b8zero_state.py` | live-state dump (fb, ctx, mirror, deck, probe cache) |
| `recomp/arm9-card-cluster-disasm.txt` | full disasm of the CARD API cluster 0x02061de4..0x02062cc4 |

Key artifacts: `recomp/probe-b8zero.json` (B8=0), `recomp/probe-control.json`
(control), `recomp/savebug-b8zero.log`, `recomp/savebug-control.log`,
`recomp/probe-b8zero-state.json`.

---

## Reproduction cheatsheet

```powershell
# boot with import save, instrumented, headless
$env:NDS_TRACE_AUXSPI=1
tools\ndsrecomp\runner\build-mingw\nds_runner.exe tools\ndsrecomp\bios --serve --port 19885 `
  --rom rom\jus.nds --config recomp\game.toml --startup-mode automatic `
  --freebios --generated-firmware --boot direct `
  --save-path recomp\savebug-run.sav 2> recomp\run.log
# (copy recomp\jus-trace.sav over recomp\savebug-run.sav first)
py recomp\probe_runner.py --port 19885 --frames 900 --out recomp\probe.json
py recomp\probe_state.py 19885
py recomp\analyze_auxspi.py recomp\run.log recomp\jus-trace.sav
```
