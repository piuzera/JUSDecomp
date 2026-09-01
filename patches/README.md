# ndsrecomp patch series

The `tools/ndsrecomp/` directory is **not** part of this repository (see
`.gitignore`). Clone it from upstream and apply these patches to reproduce the
working JUS runner:

```bash
git clone https://github.com/mstan/ndsrecomp tools/ndsrecomp
cd tools/ndsrecomp
git checkout e9b530a0e08fe7c270ed97737b1c1495de9d1587
git apply ../../patches/ndsrecomp/0001-jus-runner-modifications.patch
```

- **Upstream**: https://github.com/mstan/ndsrecomp
- **Base commit**: `e9b530a0e08fe7c270ed97737b1c1495de9d1587` (2026-08, pre-0.0.2)
- **Files**: `0001-jus-runner-modifications.patch`

## What the patch does

- **Native Linux host support** — builds the SDL/OpenGL runner with GCC,
  loads live overlay banks as `.so` libraries, and implements local wireless
  and WFC peer-relay sockets with POSIX APIs. Windows remains supported.
- **EEPROM cartridge save model fixes** — JUS uses a 64 KiB EEPROM save chip;
  upstream's flash model AND-programmed bytes (1→0 only), silently corrupting
  re-saves and breaking the game's read-back verify (the "restart console"
  error). Fixed byte-program and erase semantics.
- **Runtime ROM-overlay mod support** — `[[mods.overlays]]` config section:
  gamecard reads are shadowed with host files at given ROM offsets, enabling
  the Riivolution-style mod system (see `decomp/docs/MODS.md`,
  `decomp/docs/NEW_KOMA.md` §10).
- **Pad→touchscreen tap shortcuts** (`[[controls.taps]]`) — spare arcade-stick
  buttons synthesize stylus taps for 3rd/4th support-panel summons.
- **Debug-server extensions** (`write_mem` etc.) used by `tools/scripts/deck_*`
  and the save-debug tooling.
- **`wiilink` WFC provider** — WiiLink24's public DS-capable service (DNS
  `167.235.229.36`) added to the provider table for A/B testing against the
  Kaeru/Wiimmfi route (their dev docs confirm DS games need only a DNS
  change, no ROM patch).
- **WFC peer-relay unicast delivery** (`--wfc-peer-unicast on|off`, default
  on) — relayed NATNEG peer frames are rewritten to the receiving guest's own
  MAC (unicast-to-self) instead of broadcast, testing the JUS 80430
  match-completion hypothesis (MKDS tolerated broadcast; JUS appears not to).
- Test adjustments for the save-model fixes + the new provider entry.

## Regenerating the patch

After editing `tools/ndsrecomp/` on top of the pinned base commit:

```bash
git -C tools/ndsrecomp diff > patches/ndsrecomp/0001-jus-runner-modifications.patch
```

Then re-verify it applies to a clean checkout (see above). Update this file if
the base commit moves.
