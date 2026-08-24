# ndsrecomp — verified assessment & JUS bring-up recipe (Track C)

Written 2026-08-21 after cloning `mstan/ndsrecomp` (v0.0.1 pre-alpha) and the
`mstan/supermario64dsrecomp` title project into `tools/` (both git-ignored).
Everything below is **confirmed** by reading the repos unless labeled otherwise.

## What ndsrecomp is (confirmed)

- Static recompiler for the DS: lifts guest ARM code (ARM7TDMI + ARM946E-S,
  ARM + Thumb) to C ahead of time; the generated banks run natively. It is
  explicitly **not** a general-purpose emulator (`README.md`).
- The runtime lives **in the same repo** (`runner/`): dual-CPU event scheduler,
  full bus, CP15/TCM, IPC, IRQ/timers/DMA, SPI/RTC, 2D engines A+B, SPU,
  melonDS-derived 3D + Wi-Fi models, SDL host (mouse→touch, keyboard, audio).
  There is no separate "companion runtime" repo.
- **Three-tier dispatch** (`PLAN.md`, `docs/dispatch_architecture.md`):
  Tier 1 = recompiled native banks → Tier 2 = dirty-RAM JIT shard (deferred) →
  Tier 3 = dirty-RAM ARM interpreter (correctness floor that runs the guest's
  own copied bytes). No runtime exec path may depend on the interpreter
  **except** that bounded floor (`CLAUDE.md`).
- **Runtime-copied code** (overlays loaded into RAM, ITCM fast paths, the ARM7
  sound driver in WRAM) is handled by **content-validated RAM banks**: live RAM
  regions captured at runtime, recompiled, and dispatched only while a content
  hash of the live bytes still matches (psxrecomp-derived candidate model —
  `docs/overlay-strategy.md`, `--validate-live-bytes`).
- Demonstrated status (README/`PLAN.md`): firmware menu byte-identical vs a
  melonDS oracle; SM64DS boot→title→castle gameplay, ARM9 93.5% static out of
  the box, ~100% native after RAM-bank promotion; MKDS **Wiimmfi online** and
  **same-machine local wireless 2P** via a localhost transport; MPH early
  gameplay. It is a pre-alpha with no compatibility promise — narrow,
  hash-gated bring-ups, not broad compatibility.
- Inputs: retail BIOS/firmware dumps are **optional** — bundled FreeBIOS
  (BSD-2) code banks + generated firmware are the fallback
  (`supermario64dsrecomp/README.md` Quick Start). The user-supplied ROM is
  hash-gated into everything (`NDS_TITLE_ROM_SHA1`, `[game].sha1`).
- Windows is the primary dev/release platform (PowerShell instructions,
  Windows ZIP release path). Build = CMake 3.20+ / C++20 / Ninja; SDL2
  optional (headless without).

## Why it fits this project

- It is a working implementation of the end goal in `INSTRUCTIONS.md`: a
  native executable running the original logic without a DS emulator, with
  original logic kept separate from the host layer.
- **Decomp-assisted recompilation is the designed workflow**: the SM64DS title
  project recompiles "all decomp-defined ARM9 main-module functions" using a
  pinned decomp repo's function names/modes/sizes/boundaries
  (`supermario64dsrecomp/README.md`). For JUS, **our `dsd` output is that
  metadata**: `decomp/arm9/*/symbols.txt` (names incl. NitroSDK), `decomp/asm/`
  gap assembly (boundaries + ARM/Thumb modes), `OVERLAYS.md` (overlay load
  regions — the RAM-bank capture windows).
- JUS's GPU profile is *simpler* than SM64DS's: primarily dual-2D engines
  (no 3D engine dependency expected — **tentative**, verify via DISPCNT/GX
  register usage in disassembly). The 2D engines are already oracle-proven
  from the firmware work.
- 2P local: MKDS demonstrates same-machine local wireless (two instances over
  a localhost transport) — the faithful route for JUS versus mode, without
  porting any logic. Per-title bring-up effort still required (JUS ov010 +
  DWC local-play paths; **strongly inferred** portable from the MKDS case).

## JUS title-project shape (modeled on supermario64dsrecomp)

```
<root>/recomp/                 # JUS title project (new, ours)
├── CMakeLists.txt             # prepare → recompile → host-compile → link
├── game.toml                  # [game].sha1 = JUS ROM SHA-1; [cartridge] save type; [display]
├── tools/prepare_jus.py       # verify ROM, emit ARM9/ARM7 configs from dsd metadata
├── config/                    # generated (ignored) or checked-in RAM-bank configs
└── src/                       # host-side additions (gamepad input etc.)
```

1. `prepare_jus.py`: verify `rom/jus.nds` SHA-1; extract ARM9 (+ decompress if
   the image is compressed — dsd already handles this) + ARM7 + overlay table;
   emit `jus_arm9.toml` (entry points from symbols.txt/gap asm: addr, mode,
   name) and the ARM7 boot-closure config; run `nds_recompile --config … --bin
   … --out generated --bank jus_arm9` per bank.
2. Runner: `cmake -G Ninja -S tools/ndsrecomp/runner -B … -DNDS_BOOTSTRAP_FIRMWARE=ON
   -DNDS_TITLE_BANK_DIR=<generated/recomp> -DNDS_TITLE_ROM_SHA1=<jus sha1>`;
   run `nds_runner.exe … --interactive --rom rom/jus.nds --config game.toml`.
3. Iterate: watch `dispatch_misses.log` until empty (CLAUDE.md build loop);
   capture RAM banks for JUS overlay regions A/B/C (0x0214CD20 / 0x02172A60 /
   0x021AC1C0, per `OVERLAYS.md`), ITCM/DTCM, and the ARM7 WRAM sound driver
   via `tools/capture_arm9_ram_bank.py`-style captures; promote overlays from
   interpreter floor to native banks.
4. `[cartridge]` table: JUS save type from a trusted cartridge DB
   (unknown yet — TODO).
5. Host input: gamepad (XInput/DInput via SDL2 GameController) → DS buttons +
   right-stick virtual stylus, added in the title project's `src/` (not the
   framework runner).

## Risks (honest)

- Pre-alpha v0.0.1; the "regeneration workflow is not yet turnkey from a
  clean clone" (README). Expect friction: submodules, capture tooling, and
  gaps in hardware paths JUS exercises that SM64DS/MKDS did not.
- Per-title effort is real: emptying dispatch misses, RAM captures for every
  overlay window (JUS has 14 overlays in 3 regions), save-type verification.
- Wi-Fi/local-wireless for JUS specifically is unproven (MKDS precedent only).
- The framework's discipline forbids HLE shortcuts; we must bring JUS up the
  same way (oracle = melonDS, which we already planned as behavioral
  reference in `PROJECT.md`).

## License / hygiene posture (confirmed)

MIT framework; title scaffold MIT. No ROM/BIOS/firmware/generated banks in
git — matches our existing `.gitignore` rules. FreeBIOS fallback means we do
not need to acquire BIOS dumps for the spike.

## Spike results (2026-08-21) — SMOKE BOOT PASSED

Everything below is **confirmed** by executing it on this machine today:

1. **Toolchain provisioned** (winget): VS Build Tools 2022 (MSVC 14.44),
   CMake 4.4.2, Ninja; MSYS2 mingw-w64 (GCC 16.2 + SDL2 2.32.10 via pacman).
   The runner requires the **mingw/GCC** toolchain (vendored melonDS net stack
   uses `poll.h`/GCC builtins; the framework's own CMake notes reference
   mingw). MSVC builds the recompiler fine but not the runner.
2. **`nds_recompile.exe` built** on MSVC (one-line fix: `__builtin_popcount` →
   `std::popcount` + `<bit>` in `recompiler/armv4t/interpreter.cpp`).
3. **JUS bank configs generated** by `tools/scripts/prepare_jus.py` from dsd
   metadata — the SM64DS project pins a whole decomp repo for this; we already
   own the equivalent from `dsd`:
   - `jus_arm9_main`: 6,017 functions (4,770 ARM / 1,247 Thumb), **authoritative
     entry set, finder undefined=0**, sha1-gated to `extract/arm9/arm9.bin`.
   - `jus_arm9_itcm`: 273 functions @ 0x01FF8000. `jus_arm9_dtcm`: data-only
     (4 discovered). `jus_arm7_main`: 1 seed → 16-function boot closure.
   - `recomp/game.toml`: `[game].sha1 = ba58e20ee60eb81c33dcd4934a21271baa9f954a`.
4. **Banks generated** (`--shards` so bodies match the runner's `*_NN.c` glob):
   4 JUS banks in `recomp/generated/` (git-ignored, ROM-derived). FreeBIOS banks
   generated from the vendored BSD-2 submodule into `tools/ndsrecomp/generated/`,
   including `arm9_bios`/`arm7_bios`-named FreeBIOS substitutions to satisfy the
   runner's unconditional bank sources (replace with real dumps if ever needed;
   retail dumps remain optional at runtime — FreeBIOS path is the default here).
5. **Runner built** (`build-mingw`, Release, compute renderer ON, SDL2):
   local CMake patches — MSVC-conditional generated-TU warning flags,
   `NOMINMAX` on WIN32, portable `__builtin_unreachable`/`__assume` in the two
   vendored melonDS GPU files. Runner links all 4 JUS banks behind the ROM
   SHA-1 gate.
6. **Smoke boot PASSED** (headless, `--freebios --generated-firmware --boot
   direct`, 200M ARM9 cycle budget): title banks registered for the exact ROM
   hash; both CPUs ran the full budget; ARM9 executed its own NitroSDK init
   **natively** through `jus_arm9_main` (600K native dispatches; GPU/DISPCNT
   programming and the wifi probe visible in the trace); ARM7 served IRQs from
   its banks with the WRAM sound driver on the Tier-3 interpreter floor (by
   design, pre-capture). No dispatch-misses file produced. Coverage capture:
   146 code pages.
7. Runner conveniences discovered in `--help` (directly serve our POC):
   `--mph-virtual-stylus-*`/`--mph-pad-bind-*` (gamepad-driven virtual stylus,
   built for Metroid Prime Hunters), `--local-wireless on --local-wireless-port`
   + `--instance-index` (same-machine 2P transport), `--rtc-host`, per-run
   `--config`.

8. **Visual gate PASSED (2026-08-21, user-confirmed)**: interactive run —
   the full game **intro played normally** (Actimagine VX video decode working),
   **touch input registered** (tap → entered the tutorial), 4,449 frames
   presented before close. Minor fps drops match the known pre-promotion
   profile (overlays regions A/B/C + ARM7 WRAM sound driver still on the
   Tier-3 interpreter floor). Also confirmed live: save file created
   (`recomp/jus.sav`, EEPROM 8 KiB default — real JUS save type still TODO),
   **runner already maps a gamepad as Player 1** (`[sdl] controls: gamepad=
   Player 1 | ...`), and the TCP debug server is available on 127.0.0.1:19842.

9. **Live overlay promotion WORKS on JUS (2026-08-21, user session)**:
   `recomp/run_jus.sh live` (interactive + `--live-overlay-enable
   --live-overlay-auto`, driver `tools/ndsrecomp/tools/compile_live_shards.py`
   + mingw gcc against `libnds_runner.dll.a`) auto-compiled and hot-swapped
   **12 native DLL candidates in-session**: ARM7 WRAM sound-driver pages
   (0x037FB000–0x03807000) and ARM9 overlay-region pages (0x02028000–
   0x02055000), across 3 snapshot-driven compile rounds. 12,283 frames
   (~3.4 min), coverage 195→299 pages; cache persists in `recomp/live-cache/`
   (git-ignored) and improves cumulatively per session.

10. **Real save type confirmed + imported (2026-08-21)**: owner's hardware
    cartridge dump (`Jump! Ultimate Stars (J) [English].sav`) is **65,536
    bytes = 64 KiB flash**, not the runner's 8 KiB EEPROM default. Declared
    in `recomp/game.toml` `[cartridge]` (`save_type = "flash"`, `save_size =
    65536`) and in `prepare_jus.py`'s generator so regeneration keeps it.
    Installed at `recomp/jus.sav`; runner confirmed `[save] loaded 65536
    bytes ... cartridge backup: flash, 65536 bytes`. A 100%-complete save
    means the deck-builder/koma roster/training mode are reachable
    immediately — no intro replay needed for POC testing.
11. **Arcade stick recognized (2026-08-21)**: `--mph-prime-controls` gate
    patched in `runner/src/main.cpp` (`mph_mouse_aim_policy`) to also admit
    JUS's ROM SHA-1 — previously hard-locked to Metroid Prime Hunters only.
    Runner log confirms detection: `[sdl] Player 1 controller: QanBa Arcade
    JoyStick 1008`. New launcher mode `recomp/run_jus.sh stick`
    (`--screen-layout separate` required by `--relative-mouse-touch`,
    `--mph-prime-controls on`, sensitivity flags). Left stick → D-pad,
    buttons → DS buttons work via the existing generic gamepad path; the
    Prime Controls layer additionally offers right-stick-driven virtual
    stylus + bindable touch, evaluated for full no-touch play.

12. **Controller remapping tool (2026-08-21)**: the runner never loaded a
    custom SDL2 GameController mapping DB, so arcade sticks/fight boards
    (raw HID button order, e.g. the owner's QanBa) got whatever guess SDL2's
    built-in DB happened to make — wrong for this device. Fixed two ways:
    - `runner/src/frontend.cpp`: loads `recomp/gamecontrollerdb.txt` (or
      `NDS_GAMECONTROLLERDB` override) via
      `SDL_GameControllerAddMappingsFromFile()` right after `SDL_Init`.
      Purely additive — does not affect already-correctly-mapped devices.
    - New tool `tools/scripts/remap_controller.cpp` (built as
      `recomp/tools/remap_controller.exe` via `recomp/run_remap.sh`):
      walks every DS-relevant button/axis, waits for the physical
      press/move, and writes a correct mapping string keyed to the
      device's exact GUID into `recomp/gamecontrollerdb.txt`. Uses SDL2's
      documented mapping-string format directly (`guid,name,a:bN,...`), no
      dependency on SDL2's shipped `controllermap` sample.
    - Build note: use the MSYS2/pacman SDL2 package (`sdl2-config`) for this
      tool, not the MSVC-ABI `tools/sdl2/` devel zip — its `SDL2main.lib` is
      link-incompatible with mingw.

13. **Remap tool debugging (2026-08-21, three real bugs found+fixed)**:
    - **Black window**: tool created an unnecessary SDL window (blank/black,
      covering the real console). Fix: no window at all — Windows'
      joystick backend (XInput/RawInput) polls devices directly without one.
    - **No console at all**: `sdl2-config --cflags --libs` bakes in
      `-Dmain=SDL_main -lSDL2main -mwindows` (GUI-app shim), which hides
      the console entirely. Fix: build with `SDL_MAIN_HANDLED` +
      `SDL_SetMainReady()` and plain `-lSDL2`, no `-mwindows`.
    - **ESC/Q didn't work**: SDL keyboard events route through a window's
      Win32 message loop, which doesn't exist here. Fix: poll
      `GetAsyncKeyState` directly for ESC/Q instead of `SDL_KEYDOWN`.
    - **Scrambled/colliding mappings** (root cause of the very first
      attempt's garbage output): the original capture loop reacted to the
      first raw event of ANY kind for every prompt, with no debounce and no
      required release — a held D-pad direction bled into later button
      prompts, and transient diagonal hat values got captured instead of
      cardinal ones. Fix: `wait_for_input` now filters by expected kind
      (button vs. cardinal-hat vs. axis), debounces (same reading twice
      16ms apart), requires full physical release before returning, and
      the caller rejects/retries on duplicate token assignment.
    - **Silent write failure** (root cause of the second, byte-identical
      "clean" attempt): the tool wrote to a path relative to the process's
      CWD, but double-clicking in Explorer sets CWD to the exe's own folder
      (`recomp/tools/`), not the repo root — so it wrote to a nonexistent
      `recomp/tools/recomp/` subdirectory and never checked `ofstream`
      success. Fix: resolve the db path via `GetModuleFileNameA` (always
      next to the exe, regardless of launch method) and check write status.
    - Runner (`frontend.cpp`) updated to check `recomp/gamecontrollerdb.txt`
      first (correct when launched via `run_jus.sh`, which `cd`s to repo
      root), falling back to `recomp/tools/gamecontrollerdb.txt`.
    - **Verified working end-to-end**: clean mapping produced (8 distinct
      buttons `b0`-`b9`, 4 distinct cardinal hat directions, zero
      collisions); runner confirmed `[sdl] loaded 1 custom controller
      mapping(s) from recomp/tools/gamecontrollerdb.txt`.

Launcher: `recomp/run_jus.sh interactive|smoke|live|stick` (MSYS2 bash) +
`recomp/run_remap.sh` for controller mapping. Track C is **committed**: JUS
runs natively on Windows with video, touch, scene flow, runtime overlay
promotion, and a correctly remapped arcade stick. Save import is the one
**open bug** below.

## Extra assist shortcuts via generic pad-tap (2026-08-21)

JUS's in-game battle option binds **L and R** to two support/assist koma
summons. Two shortcuts is too few for a deck with more support koma, and an
arcade stick has spare buttons. Rather than patch game code (which would
require reverse-engineering the battle input path in `ov011`/`ov006` — see
the RE note below), the runner now exposes a **generic, title-agnostic
pad-button → touchscreen-tap** layer: any stick button can synthesize a
stylus tap at a player-chosen coordinate, so a 3rd/4th support panel icon
can be summoned directly.

- **Config**: `[[controls.taps]]` in `recomp/game.toml`, or repeated
  `--pad-tap "button:x:y[:tap_frames:release_frames]"` CLI flags (CLI
  entries append after config entries). `button` accepts the same names as
  `controls.prime.pad_bindings` (`Pad A/B/X/Y`, `Pad LB/RB`, `Pad LT/RT`,
  `Pad L3/R3`, `Pad Up/Down/Left/Right`, `Pad Start/Back`). `x`/`y` are DS
  touchscreen pixels (0..255 / 0..191). `tap_frames`/`release_frames`
  default to 2 each (enough for the ARM7 touchscreen poll to observe a
  discrete tap).
- **Why coordinates are config, not constants**: deck composition varies per
  player, so the support icons sit at different on-screen positions. The
  coordinates are deliberately NOT baked into the binary — each player
  calibrates against their own deck. `recomp/run_jus.sh stick` ships two
  placeholder `--pad-tap` entries (`Pad LB`/`Pad RB`) to be edited.
- **Implementation**: `NdsPadTapAction` + `nds_parse_pad_tap_action()` in
  [`frontend.h`](../tools/ndsrecomp/runner/src/frontend.h) /
  [`frontend_config.cpp`](../tools/ndsrecomp/runner/src/frontend_config.cpp);
  runtime edge-detection + `MphTouchSequence` playback in
  [`frontend.cpp`](../tools/ndsrecomp/runner/src/frontend.cpp)
  (`make_pad_tap_runtime`, the per-frame poll in the gamepad section, and
  the `pad_tap_sequence` tick). Unlike MPH Prime Controls, this has **no ROM
  allowlist and no relative-mouse gate** — it is active whenever a
  controller is connected.

### RE note: the KEYINPUT remapper (for a future in-game 4-slot patch)

The generic tap layer is the quick win; the *authentic* fix (extend JUS's
own L/R assist binding to 4 slots) needs the battle input path. A first
landmark is already located in ARM9 main:

- **`func_0203a610`** (`decomp/asm/_dsd_gap@main_5.s`, size 0x190) reads the
  hardware `KEYINPUT` register (`0x04000130`) and `EXTKEYIN` (`0x027fffa8`),
  XORs against a **14-bit mask `0x2fff`** (bits 0–11 + bit 13; **bit 12 is
  excluded**), then maps each set bit into a per-player input-slot array
  (`[r0 + 0x18 + slot*4]`, slot index from `[r0 + 0x78]`). This is the
  generic "raw hardware buttons → internal input state" remapper, referenced
  from a data table at `0x020948f8` (reloc `kind:load`). **Confirmed** at the
  byte level; the *meaning* of each internal slot bit (which one is "L
  assist" vs "R assist") is **tentative** and still needs tracing into
  `ov011`/`ov006`.
- **Implication for a 4-slot patch**: `KEYINPUT` bits 12–13 are unused on
  retail hardware and always read "unpressed", so they are a free,
  overlay-swap-proof input channel. A future patch would (a) widen the
  runner's published key mask from `0x0FFF` to include bits 12/13
  ([`frontend.cpp`](../tools/ndsrecomp/runner/src/frontend.cpp) `publish_keys`
  and [`io.cpp`](../tools/ndsrecomp/runner/src/io.cpp) `nds_set_key_mask`),
  and (b) extend the assist check in `ov011`/`ov006` to 4 slots. This is
  **not yet implemented** — the pad-tap layer above is the shipped
  workaround.

## OPEN BUG: imported save is not recognized as non-blank (2026-08-21)

**Symptom**: with the owner's 100%-complete `.sav` installed at `recomp/jus.sav`
and `[cartridge] save_type = "flash"` / `save_size = 65536` set in
`recomp/game.toml`, JUS still plays the full unskippable first-boot
intro/tutorial sequence — the same behavior as a genuinely blank save.

**Confirmed facts (verified, not assumptions)**:
- The `.sav` file the runner actually reads is **byte-for-byte identical**
  to the owner's original hardware dump (`fc /b` binary diff: "no
  differences encountered").
- Runner correctly identifies size/type at load:
  `[save] cartridge backup: flash, 65536 bytes` /
  `[save] loaded 65536 bytes from recomp/jus.sav`.
- Owner confirms real-hardware behavior: a brief Nintendo/logo splash plays
  on every boot regardless of save state, but the **long story-intro/
  tutorial specifically only plays on a truly blank save** — so JUS is
  reaching a code path that should only trigger for blank/new saves.
- **Ruled out**: the cartridge-backup flash's JEDEC ID (SPI command `0x9F`)
  was hardcoded to return `0xFF` ("no chip present") for every save type,
  unlike the firmware SPI flash a few lines away in the same file
  (`io.cpp` case `0x9F`), which correctly returns a real 3-byte ID
  (`0x20 0x40 0x12`, ST-family). This looked like a plausible root cause —
  a save driver probing chip identity before trusting existing data would
  plausibly fail this check and fall back to first-boot. **Patched as an
  experiment in `runner/src/cart_backup.cpp` (`flash_spi_write`, case
  `0x9F` now returns a real-looking 3-byte ID) and rebuilt — user-tested,
  confirmed NO CHANGE in behavior.** This patch is speculative/unverified
  against real hardware or melonDS's own cart-backup JEDEC modelling and
  should probably be reverted or re-derived from a real source before
  trusting it; it did not fix the symptom either way.

**Not yet investigated (next lines to pursue)**:
1. Whether JUS's "is this save valid" check reads something other than raw
   SRAM content/JEDEC ID — e.g. a checksum/magic value at a specific save
   offset that our imported file satisfies on real hardware (via the real
   AUXSPI controller + real timing) but that our emulation computes/exposes
   differently (status register bits, busy/write-in-progress bit behavior,
   AUXSPICNT timing, or a different SPI command entirely used only by JUS's
   save driver, not covered by the generic eeprom/flash SPI model above).
2. Whether the boot path is even reaching real cartridge SPI reads before
   deciding "blank" — could be a completely unrelated flag (e.g. an RTC
   read, a NitroFS file existence check, or first-boot logic gated on
   something in the firmware user-settings block rather than the cart
   backup at all).
3. Disassembly RE of JUS's actual save-validity check (likely early in
   `main`/ov000 title flow) is the reliable way to find the real condition,
   rather than guessing at the SPI/backup-chip layer.
4. Direct comparison against melonDS running the same ROM+save (the project's
   own designated oracle) would immediately show whether melonDS treats this
   save as valid — isolating whether the bug is in ndsrecomp's cart-backup
   model at all, or (less likely, since the raw bytes are proven identical)
   somewhere else in the boot/save-recognition path.

**Status (update 2026-08-21)**: two root causes of save WRITE corruption were
found and fixed (flash 0x02 byte-program AND semantics, erase → 0xFF — see
`decomp/docs/SAVEBUG.md`); the in-game save now succeeds. The imported-save
intro symptom itself is still under investigation; the melonDS oracle matrix
ruled out ROM/save pairing, and the AUXSPI trace proved the read path
byte-perfect. Next session: retest import recognition with the fixed write
model, then `--firmware-path` / `--rtc-host` / boot-time-write hypotheses.

## Wiimmfi bring-up for JUS (2026-08-24)

Goal: play JUS's **WiFi Battle (WiFiバトル)** online between two PCs on the
same LAN, each recomp connecting to the public Kaeru/Wiimmfi service over
the Internet (no LAN transport patch needed — the runner's Slirp NAT backend
is always linked). This is the "Wiimmfi infrastructure" route, distinct from
the same-machine `--local-wireless` localhost transport.

### What was implemented / verified

- **New launcher mode** [`recomp/run_jus.sh`](../recomp/run_jus.sh) `online`:
  adds `--network on --wfc on --wfc-provider wiimmfi` and
  `--firmware-state-path recomp/jus.fwstate` to the interactive invocation.
  Chosen over a `[network] enabled = true` table in `recomp/game.toml`
  because game.toml is generated by `prepare_jus.py` (do not hand-edit) and
  a table would silently turn host networking on for every offline run,
  contradicting the runner's deliberate "network defaults to off" posture.
- **Verified (headless smoke, `run_jus.sh smoke 20000000 --network on --wfc
  on --wfc-provider wiimmfi`)**, exit 0:
  - `[wifi_net] Winsock initialized (WSAStartup 2.2) before boot()`
  - `[network] WFC DNS provider: wiimmfi (178.62.43.212)`
  - `[identity] persisted MAC 00:09:BF:AC:B5:54 from
    tools/ndsrecomp/bios/generated-identity.bin` (this machine's identity)
  - `[wifi_net] network backend attached (wfc_enabled=1,
    nameserver_override=yes, slirp_subnet=10.64.0.0/24)`
  - `[wifi_net] host network worker thread started` … `stopped` (clean exit)
- **No runner rebuild required**: `build-mingw/nds_runner.exe` is newer than
  every `runner/src` file and `--help` lists `--network`, `--wfc`,
  `--wfc-provider`, `--instance-index`, `--identity-mac`, `--player-name`,
  `--firmware-state-path`, `--net-capture-out`. The existing
  `patches/ndsrecomp/0001-jus-runner-modifications.patch` remains applied.

### Provider choice

`kaeru` and `wiimmfi` are aliases for `178.62.43.212` — the DNS-only,
no-ROM-patch stock-DS route that fronts the Wiimmfi ecosystem
(`runner/src/net/wfc_provider.cpp`). `wiimmfi-direct` is the raw Wiimmfi DNS
endpoint for patched clients only; `local`/`local-oracle` are for a local
test DWC server. The `online` mode uses `wiimmfi`.

### Two-PC same-LAN bring-up procedure

1. **Single-instance connection test (the bring-up gate).** On machine A:
   `recomp/run_jus.sh online --player-name "PlayerA"`. In-game: Wi-Fi
   settings → create connection (auto IP) → connection test → must pass.
   This is the first real exercise of JUS's DWC/DHCP/DNS/TCP paths through
   the recompiled banks — **unproven before this**. Watch the runner console
   for `[network]`, `[wifi_net]`, and the guest's WFC activity.
   - On failure, rerun with `--net-capture-out recomp/wfc-test.cap` (writes
     a sanitized JSON + a `wfc-test.pcap` for Wireshark) and compare the
     guest's DHCP/DNS/TCP flow against the melonDS oracle
     (`tools/ndsrecomp/oracle/`). Fix the game path or runner before
     attempting 2P.
2. **Distinct friend codes.** Friend codes derive from the console MAC.
   - Each fresh install persists a random MAC in
     `tools/ndsrecomp/bios/generated-identity.bin`; two separate installs
     already differ. **If machine B's project folder was COPIED from machine
     A, delete that file on B** (it regenerates on next launch) or pass a
     unique `--identity-mac AA:BB:CC:DD:EE:FF`. NOTE: the runner refuses
     `--identity-mac` together with `--firmware-state-path`, so prefer
     deleting the identity file on B.
   - Confirm distinct MACs in each boot log (`[identity] persisted MAC …`).
3. **Register both friend codes** in JUS's WiFi Battle profile (nickname +
   connection test must be done first).
4. **Friend battle.** Launch both machines with the `online` mode:
   - A: `recomp/run_jus.sh online --instance-index 0 --player-name "PlayerA"`
   - B: `recomp/run_jus.sh online --instance-index 1 --player-name "PlayerB"`
   - Distinct `--instance-index` keeps the Slirp guest LAN endpoints apart
     (`10.64.0.0/24` vs `10.64.1.0/24`) so both don't present identical
     guest endpoints to DWC/Wiimmfi NAT negotiation.
   - Host a friend battle on one, join from the other; verify the match
     starts and stays in sync.
5. **Windows Firewall**: allow the runner outbound (UDP 53 DNS to the
   provider, TCP to Kaeru/Wiimmfi service ports). No inbound rules are
   needed for the Slirp route.

### Diagnostics / evidence

- `--net-capture-out` + `tools/ndsrecomp/tools/net_capture_tool.py`
  (sanitize / inspect), plus the `.pcap` sibling in Wireshark.
- The runner's TCP debug server (`127.0.0.1:19842`, protocol in
  `tools/ndsrecomp/TCP.md`) exposes `framebuffer`, `touch`, `keys`,
  `read_mem`, and net-ring queries for scenario automation/evidence —
  `tools/ndsrecomp/tools/collect_two_instance_evidence.py` is the MKDS
  two-client evidence collector to adapt for JUS (two debug ports) once the
  friend battle works.
- Status: runner-side wiring verified; **the in-game connection test and
  friend battle are pending interactive execution** (needs the owner's
  hands + a second machine).
