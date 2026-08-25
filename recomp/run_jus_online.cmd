@echo off
rem run_jus_online.cmd — boot JUS in Wiimmfi online mode.
rem
rem Usage (from the repo root, or double-click from recomp\):
rem   run_jus_online.cmd [extra runner flags]
rem
rem   World-wide play (the common case):
rem     run_jus_online.cmd --instance-index 0 --player-name YourName
rem
rem   Two machines on the SAME router (same-network friend battle via Wiimmfi):
rem     machine A: run_jus_online.cmd --instance-index 0 --player-name A ^
rem                                   --wfc-peer-host <B-LAN-IP>
rem     machine B: run_jus_online.cmd --instance-index 1 --player-name B ^
rem                                   --wfc-peer-host <A-LAN-IP>
rem     --wfc-peer-host tunnels the Wiimmfi NATNEG peer frames between the two
rem     runner processes host-to-host; the lobby/matchmaking still goes through
rem     Wiimmfi. Each machine must allow INBOUND UDP ports 27610-27625.
rem
rem   FRIEND CODES (validated 2026-08-25): the friend-code UID is derived from
rem   the NDS console (live MAC, distinct per machine/instance) PLUS the
rem   Gamecart save identity. Two consoles with distinct generated identities
rem   therefore get distinct friend codes EVEN with the same never-online save
rem   (the shipped recomp\jus.sav). Still, complete WiFi Battle -> profile
rem   registration on each machine so the save is claimed by that console
rem   (registration rewrites the save's console identity -- verified).
rem   If a save has already been claimed by another console, use a fresh one:
rem     run_jus_online.cmd --instance-index 0 --player-name YourName ^
rem                         --save-path recomp\jus-fresh.sav ^
rem                         --firmware-state-path recomp\jus-fresh.fwstate
rem
rem No MSYS2 required: the runtime DLLs (libgcc_s_seh-1.dll, libstdc++-6.dll,
rem libwinpthread-1.dll, SDL2.dll) ship next to nds_runner.exe.
rem
rem LIVE OVERLAY PROMOTION (2026-08-25, online fps fix): the WFC/DWC network
rem stack (ARM9 ov008/ov010 + the ARM7 wifi driver) is RAM-resident code that
rem runs on the Tier-3 interpreter until promoted. Offline "live" mode always
rem promoted it (60 fps battles); the online launchers did not, which is why
rem online play halved the framerate (60 -> ~35, measured: ARM9 phase time x2.7
rem and dispatch cache-hit halved in the lobby, 25x ARM7 bursts in battle).
rem The flags below turn on the same auto-promotion, with a 15s activation
rem delay (the 90s interactive default is too late for the online flow), so
rem the hot WFC pages recompile to native DLLs mid-session and the cache
rem (recomp\live-cache) warms cumulatively across sessions. First online
rem session after this change still pays interpreted cost until the banks
rem compile+swap; later sessions start warm.
rem
rem Requirements:
rem   - The folder must be at C:\JUS Decomp (the runner's recomp\generated bank
rem     path is baked in at build time).
rem   - rom\jus.nds must be present (your legal, unmodified dump).
rem   - PC B's FIRST launch auto-generates a distinct console MAC
rem     (tools\ndsrecomp\bios\generated-identity.bin is excluded from the PC-B
rem     zip) and a fresh WFC profile (recomp\jus.fwstate re-seeds).
rem   - Firewall: allow the runner outbound (UDP 53 + TCP to the Wiimmfi/Kaeru
rem     service). For same-router play, the first peer frame pops the standard
rem     Windows "Allow access" security alert for inbound UDP 27610-27625 —
rem     just click it (no manual port rules needed).
cd /D "%~dp0.."
if not exist rom\jus.nds (
  echo ERROR: rom\jus.nds not found. Place your legal Jump Ultimate Stars dump here.
  exit /b 1
)
rem Live-overlay shard compilation spawns `--gcc gcc` for every promotion
rem batch and the runner inherits THIS shell's PATH. run_jus.sh works only
rem because MSYS bash already has gcc; a plain .cmd does not. Prepend the
rem known MSYS2 ucrt64 gcc bin dir if present (no-op elsewhere).
if exist "C:\msys64\ucrt64\bin\gcc.exe" set "PATH=C:\msys64\ucrt64\bin;%PATH%"
tools\ndsrecomp\runner\build-mingw\nds_runner.exe tools\ndsrecomp\bios --interactive --rom rom\jus.nds --config recomp\game.toml --startup-mode automatic --freebios --generated-firmware --boot direct --save-path recomp\jus.sav --firmware-state-path recomp\jus.fwstate --network on --wfc on --wfc-provider wiimmfi --live-overlay-enable --live-overlay-auto --live-overlay-activation-delay-ms 15000 --live-overlay-auto-delay-ms 15000 --live-overlay-auto-cooldown-ms 20000 --live-overlay-command "py tools\ndsrecomp\tools\compile_live_shards.py --ndsrecomp-root tools\ndsrecomp --runner-build tools\ndsrecomp\runner\build-mingw --recompiler tools\ndsrecomp\recompiler\build\nds_recompile.exe --gcc gcc" --live-overlay-cache recomp\live-cache %*
