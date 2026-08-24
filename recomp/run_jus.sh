#!/usr/bin/env bash
# run_jus.sh — launch the JUS recomp runner (Track C).
#
# Prereqs (one-time, see decomp/docs/NDSRECOMP.md):
#   - MSYS2 mingw-w64 toolchain + SDL2 (pacman) installed
#   - tools/ndsrecomp cloned; runner built in tools/ndsrecomp/runner/build-mingw
#   - recomp/generated/* banks + tools/ndsrecomp/generated/* bios banks present
#     (regenerate with tools/scripts/prepare_jus.py + nds_recompile if needed)
#
# Usage:
#   recomp/run_jus.sh interactive        windowed run (mouse = touch, keyboard)
#   recomp/run_jus.sh smoke [cycles]     headless bounded run (default 200M)
#
# 2P (experimental, MKDS-precedent same-machine local wireless):
#   instance A: recomp/run_jus.sh interactive   (--instance-index 0 default)
#   instance B: add --instance-index 1 --local-wireless on --local-wireless-port 11404
#   (wire both instances with matching port; see ndsrecomp README "local wireless")
#
# Wiimmfi online play (experimental bring-up): use the `online` mode below.
#   machine A: recomp/run_jus.sh online --instance-index 0 --player-name "PlayerA"
#   machine B: recomp/run_jus.sh online --instance-index 1 --player-name "PlayerB"
set -e
SCRIPT_DIR="${0%/*}"
cd "${SCRIPT_DIR}/.."
export PATH="/usr/bin:/c/msys64/ucrt64/bin:$PATH"
RUNNER="tools/ndsrecomp/runner/build-mingw/nds_runner.exe"
BIOS="tools/ndsrecomp/bios"

MODE="${1:-interactive}"
case "$MODE" in
  interactive)
    exec "$RUNNER" "$BIOS" --interactive --rom rom/jus.nds \
      --config recomp/game.toml --startup-mode automatic \
      --freebios --generated-firmware --boot direct \
      --save-path recomp/jus.sav "${@:2}"
    ;;
  stick)
    # live mode + Prime Controls: buttons->DS buttons, left stick->D-pad,
    # RIGHT stick->virtual stylus (square-law aim), RT/LT + bindable pad
    # pseudo-buttons; touch-down = Shoot (default RT). Patched gate admits
    # JUS in the runner build (see decomp/docs/NDSRECOMP.md).
    #
    # Extra assist shortcuts (generic pad-tap): JUS's in-game L/R assist
    # binding only covers 2 support koma. Two spare arcade-stick buttons
    # can each synthesize a touchscreen tap at a player-calibrated
    # coordinate for a 3rd/4th support panel. The coordinates below are
    # PLACEHOLDERS -- calibrate them to YOUR deck's on-screen support
    # icons (see decomp/docs/NDSRECOMP.md "pad-tap" section). Override via
    # game.toml [[controls.taps]] or pass --pad-tap "Pad X:y" directly.
    exec "$RUNNER" "$BIOS" --interactive --rom rom/jus.nds \
      --config recomp/game.toml --startup-mode automatic \
      --freebios --generated-firmware --boot direct \
      --save-path recomp/jus.sav \
      --live-overlay-enable --live-overlay-auto \
      --live-overlay-command "py tools\ndsrecomp\tools\compile_live_shards.py --ndsrecomp-root tools\ndsrecomp --runner-build tools\ndsrecomp\runner\build-mingw --recompiler tools\ndsrecomp\recompiler\build\nds_recompile.exe --gcc gcc" \
      --live-overlay-cache recomp/live-cache \
      --screen-layout separate \
      --mph-prime-controls on --relative-mouse-touch on \
      --mph-virtual-stylus-sensitivity 150 --mph-pad-aim-sensitivity 120 \
      --pad-tap "Pad LB:40:150" --pad-tap "Pad RB:210:150" \
      "${@:2}"
    ;;
  live)
    # Interactive + live overlay auto-promotion: hot Tier-3 pages (overlays,
    # ARM7 WRAM) are recompiled to DLLs in the background and hot-swapped in.
    # Cache persists across runs (recomp/live-cache) — fps improves cumulatively.
    exec "$RUNNER" "$BIOS" --interactive --rom rom/jus.nds \
      --config recomp/game.toml --startup-mode automatic \
      --freebios --generated-firmware --boot direct \
      --save-path recomp/jus.sav \
      --live-overlay-enable --live-overlay-auto \
      --live-overlay-command "py tools\ndsrecomp\tools\compile_live_shards.py --ndsrecomp-root tools\ndsrecomp --runner-build tools\ndsrecomp\runner\build-mingw --recompiler tools\ndsrecomp\recompiler\build\nds_recompile.exe --gcc gcc" \
      --live-overlay-cache recomp/live-cache "${@:2}"
    ;;
  online)
    # Wiimmfi online play (see decomp/docs/NDSRECOMP.md "Wiimmfi bring-up").
    # --network on attaches the libslirp NAT backend; --wfc on +
    # --wfc-provider wiimmfi redirect the guest's DNS to the Kaeru/Wiimmfi
    # service (178.62.43.212, no-ROM-patch stock-DS route).
    # --firmware-state-path persists the in-game WFC profile + connection
    # settings between sessions.
    #
    # World-wide play: no extra flags needed.
    #   recomp/run_jus.sh online --player-name "YourName"
    #
    # Same-router friend battle (via Wiimmfi): tunnel the NATNEG peer frames
    # between the two runners with --wfc-peer-host <other-PC-LAN-IP> on BOTH
    # machines. The first peer frame pops the standard Windows "Allow access"
    # firewall alert for inbound UDP 27610-27625 — click it (no manual port
    # rules). The lobby/matchmaking still goes through Wiimmfi; only the peer
    # match frames are relayed, exactly like a real DS NATNEG direct hop.
    #   A: recomp/run_jus.sh online --instance-index 0 --wfc-peer-host <B-IP> --player-name "A"
    #   B: recomp/run_jus.sh online --instance-index 1 --wfc-peer-host <A-IP> --player-name "B"
    #
    # FRESH SAVE (REQUIRED for a distinct friend code): JUS ties its WFC
    # identity/friend code to the game SAVE, not the firmware MAC. Two
    # machines booting the same save present the same friend code and cannot
    # see/match each other. Each player must use their OWN save (append
    # --save-path recomp/jus-fresh.sav --firmware-state-path
    # recomp/jus-fresh.fwstate) and complete WiFi Battle -> profile
    # registration so the save is claimed by their machine.
    exec "$RUNNER" "$BIOS" --interactive --rom rom/jus.nds \
      --config recomp/game.toml --startup-mode automatic \
      --freebios --generated-firmware --boot direct \
      --save-path recomp/jus.sav \
      --firmware-state-path recomp/jus.fwstate \
      --network on --wfc on --wfc-provider wiimmfi \
      "${@:2}"
    ;;
  smoke)
    exec "$RUNNER" "$BIOS" "${2:-200000000}" --rom rom/jus.nds \
      --freebios --generated-firmware --boot direct --no-save "${@:3}"
    ;;
  *)
    echo "usage: $0 interactive|stick|live|online|smoke [cycles] [extra runner flags]" >&2
    exit 2
    ;;
esac
