# Linux build

The JUS runtime and its GTK launcher build natively on Linux. The launcher has
feature parity with the Windows version: ROM verification, mod toggles,
controller and keyboard mapping, save import/reset, display layout, and Wiimmfi
settings.

## Requirements

On Arch Linux or Omarchy:

```bash
sudo pacman -S --needed cmake ninja gcc sdl2 gtk3 python git
```

You also need your own unmodified Jump Ultimate Stars ROM. The build accepts
only SHA-1 `ba58e20ee60eb81c33dcd4934a21271baa9f954a`. ROMs, extracted files,
generated code, and saves are gitignored and must never be committed.

## Verify the open-source host port

This does not require a ROM and does not produce a playable game. It builds
the recompiler, generates FreeBIOS code from the BSD-licensed submodule, builds
the Linux runner, and runs both test suites:

```bash
tools/scripts/build_linux.sh --host-only
```

## Build JUS

1. Put your legal dump at `rom/jus.nds`.
2. Extract it into `extract/` with ds-decomp, preserving the existing layout
   (`extract/arm9/arm9.bin`, `itcm.bin`, `dtcm.bin`, and
   `extract/arm7/arm7.bin`). ds-decomp itself currently needs to be supplied
   separately; see the main README setup instructions.
3. Run:

```bash
tools/scripts/build_linux.sh
```

The script pins and patches ndsrecomp, verifies the ROM hash, generates the
title banks, builds and tests the native runner, and builds the GTK launcher.

## Run

```bash
launcher/build-linux/JUSDecomp
```

The shell interface remains available for development and diagnostics:

```bash
recomp/run_jus.sh interactive
```

Other useful modes are `smoke`, `live`, `stick`, and `online`. Live mode
compiles promoted overlay banks as Linux `.so` libraries. Local wireless and
the WFC peer relay use native Linux sockets.

The underlying runner is `tools/ndsrecomp/runner/build-linux/nds_runner`. It is
not self-contained; launch through the GTK launcher or `recomp/run_jus.sh` so
it receives the correct ROM, configuration, save, and working-directory paths.

## Native-code pre-seed (framerate)

RAM-resident overlay code runs on the Tier-3 interpreter until the live-overlay
system promotes it to natively compiled banks (see `decomp/docs/ONLINE_FPS.md`).
The Linux build pre-seeds `recomp/live-cache` (and the 2P caches) with every
overlay page compiled to a native `.so` ahead of time, so sessions boot fully
native — no in-play convergence wait, no background compiler stealing CPU.

If a fresh install ever runs at roughly half framerate (~30 fps instead of 60),
the cache is missing or stale. Re-seed it (cheap; already-compiled pages are
deduped):

```bash
python3 tools/scripts/live_preseed.py
```

The one residual set of pages that cannot be pre-seeded from ROM data is the
ARM7 WRAM Wi-Fi driver, which the guest assembles at runtime. It converges
in-session within the first minutes of online play; only `recomp/live-cache`
source builds can compile it (the Windows bundle ships no compiler).

## Current Linux limitations

- There is no self-contained Linux packaged release yet; the GTK launcher uses
  the source-built runner and project assets.
- The source build requires the user's legal ROM and extracted inputs.
- Packet-capture integration remains Windows-only and is disabled by default;
  normal online and local socket transports are available on Linux.
