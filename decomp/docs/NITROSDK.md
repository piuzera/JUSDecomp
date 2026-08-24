# NitroSDK & Build Toolchain — JUS Decomp

## Static libraries linked into JUS (confirmed via ARM9 build strings)

| Component | Build string | Notes |
|---|---|---|
| NitroSDK core | `[SDK+NINTENDO:BACKUP]`, SDK version field `0x03017534` | Card backup (save data) etc. |
| Nintendo Wi-Fi Connection | `[SDK+NINTENDO:DWC1.2.30004.060825.1845_DWC_1_2_PLUS4]` | Online matchmaking; DWC strings also in ov008/ov010 |
| WiFi library | `[SDK+NINTENDO:WiFi1.2.30000.0609050341]` | |
| Actimagine VX | `[SDK+Actimagine:VX]` | `opening.vx` video codec (`VXDS` magic) |
| Ubiquitous CPS | `[SDK+UBIQUITOUS:CPS]` | Compression used by DWCF files |
| Ubiquitous SSL | `[SDK+UBIQUITOUS:SSL]` | WFC security layer |
| Abiosso libVCT | `[SDK+Abiosso:libVCT 1.0.1_ec]` | Voice chat |

## SDK functions pre-named by dsd signatures (90 confirmed so far)

ARM9 main: `WaitByLoop`, `Sqrt`, `SoftReset`, `GetCRC16`, `IntrWait`, `CpuFastSet`,
`CpuSet`, `Div`, `Halt`, `Entry`, `main`, `Mod`, `AutoloadCallback`,
`LZ77UnCompReadByCallbackWrite16bit`, `LZ77UnCompReadNormalWrite8bit`,
`RLUnCompReadByCallbackWrite16bit`, `RLUnCompReadNormalWrite8bit`,
`HuffUnCompReadByCallback`, `BitUnPack`, `IsDebugger`, `VBlankIntrWait`,
`__FindExceptionTable`.

Plus `__sinit_*` static initializers (C++ global ctors) across nearly all modules —
the game is written in **C++** (confirmed: vtable virtual calls `blx r2` present).

Roughly 14,872 functions remain unnamed (`func_*`) — the reconstruction workload.

## dsd build workflow (ds-decomp 0.12.0)

Reference: https://github.com/AetiasHax/ds-decomp

```
dsd rom extract  -> extract/            (done, baseline)
dsd init         -> decomp/arm9/        (done: configs, symbols, relocs, delinks)
dsd delink       -> build/delinks/*.o   (done: reference ELF objects from original ROM)
dsd lcf          -> build/arm9.lcf + build/objects.txt  (done)
dsd objdiff      -> decomp/objdiff/objdiff.json         (done)
mwldarm ...      -> build/final_link.o + build/build/*.bin  (WORKING)
dsd check modules -> verify vs base ROM hashes           (ALL PASS)
dsd check symbols / apply                 (available)
```

All steps are automated by `python tools/scripts/build.py`.

**Working mwldarm invocation** (critical details):
- The LCF is passed as a **positional argument** — `-lcf` is wrong (parses as `-l cf`,
  "link library cf" → `libcf` not-found error).
- `-m Entry` selects the entry symbol (`Entry` @ 0x02000800); without it mwldarm
  demands `__startup`.
- `-nostdlib` avoids the MSL runtime dependency.
- Full flags: `-w off -sym on -nodead -proc v5te -interworking -map closure,unused
  -symtab sort -nostdlib -m Entry -o <out> <lcf> @<objects>`

**Verified 2026-08-20**: 100% gap-asm baseline links cleanly and `dsd check modules`
passes for ARM9 main, ITCM, DTCM, and all 14 overlays (byte-exact vs base ROM).
Track A matching loop is fully operational.

## Toolchain acquisition (researched 2026-08-20; sources: sm64ds-decomp PR #765, notes/setup-mwccarm.md)

Two components are needed for full Track A (matching) builds:

### `mwldarm` — the linker (REQUIRED for linking)

- Comes from **`mwccarm.zip`**, hosted in the **resources channel** of the
  **DS Decompilation Discord**: https://discord.com/invite/gwN6M3HQrA
  (same server as the dsd toolkit's `#dsd` channel).
- The zip contains `1.2/` and `2.0/` trees with service-pack subdirs, each holding
  `mwccarm.exe`, **`mwldarm.exe`**, `mwasmarm.exe`.
- DS decomp projects (sm64ds-decomp, pokediamond, pokeheartgold) pin the linker at
  **`1.2/sp2p3`**.
- Setup: extract the zip to `tools/mwccarm/` (git-ignored). `build.py` then auto-detects
  `tools/mwccarm/1.2/sp2p3/mwldarm.exe` (preferences: `1.2/sp2p3` > `1.2/sp2` > `1.2/base`,
  then any `mwldarm.exe` under `tools/mwccarm/`), or set `MWLDARM_PATH` explicitly.
- `mwldarm.exe` is a native Windows binary (no Wine needed on Windows).
- A `license.dat` is **not** required for these builds.

### `mwccarm` — the compiler (needed once we write matching C/C++)

- Same `mwccarm.zip` covers the common versions (`1.2` and `2.0` service packs).
- Community research (sm64ds-decomp) shows games may have been built with **older**
  builds not in the zip: their pinned compiler is a recovered **2004 build 0056**
  from the public Metrowerks FTP mirror on archive.org
  (`https://archive.org/download/ftp_metrowerks_updates.7z/`, 5.5 GB; their
  `tools/recover_cw2004.py` range-fetches just the needed ~2 GB block, hash-verifies,
  and extracts `CW_ARM_2.1.1_Update.exe`'s payload without executing anything).
- b56 ships **no linker** — it's a compiler-only addition to the version sweep.
- For JUS the exact compiler build is **unknown**; we should start with the zip's
  `1.2`/`2.0` versions and version-sweep once matching begins. Note the SDK strings
  suggest a 2005-2006 build era (DWC 060825, WiFi 060905).
- A NITRO-SDK archive (headers/objects) may become useful later but is not needed to
  start matching game functions.

### Why this matters for JUS

- dsd's LCF targets `mwldarm` (ELF objects + `-lcf` script + `@objects.txt`).
- With `mwldarm` present, `python tools/scripts/build.py` performs the full loop:
  delink → lcf → link → `dsd check modules` (hash verification vs the base ROM).
- Until then, Track A progress can continue via objdiff/decomp.me using the reference
  delink objects (`build/delinks/*.o`) and per-function disassembly in `decomp/asm/`.
