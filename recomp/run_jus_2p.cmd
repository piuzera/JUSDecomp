@echo off
rem run_jus_2p.cmd - launch TWO JUS instances side by side (same machine) for
rem the WiFi Battle same-network / same-machine repro (error 80430 bring-up).
rem
rem This wires the exact scenario that stalled at 80430 in Session 2, but on a
rem SINGLE machine: two interactive runner windows, distinct instance indices
rem (0 and 1 => distinct slirp 10.64.x.y LANs + distinct console MACs), distinct
rem fresh saves and firmware-state files (JUS friend codes come from the SAVE,
rem so a shared save = identical friend code = cannot match), the loopback WFC
rem peer relay (LocalWfcPeerBridge, base UDP 27610+instance), and full
rem --net-capture-out on BOTH instances for the pcap + ring evidence.
rem
rem Usage (from the repo root, or double-click from recomp\):
rem   run_jus_2p.cmd
rem
rem Provider A/B (set before launching):
rem   set PROVIDER=wiimmfi        (default; Kaeru, the previously-tested route)
rem   set PROVIDER=wiilink        (WiiLink24's public service, DNS 167.235.229.36)
rem   set PROVIDER=local-oracle   (local dwc-docker rig; needs Docker + wfc_dns.py)
rem
rem Peer-frame delivery A/B (JUS 80430 fix under test):
rem   set PEER_UNICAST=on    (default; deliver relayed peer frames unicast-to-self)
rem   set PEER_UNICAST=off    (broadcast, the pre-fix behavior MKDS tolerated)
rem
rem Player names / file paths (all optional):
rem   set PLAYER_A=YourNameA   set PLAYER_B=YourNameB
rem   set SAVE_A=...           set SAVE_B=...
rem   set FW_A=...             set FW_B=...
rem   set CAP_A=...            set CAP_B=...
rem
rem FRESH SAVE (REQUIRED): JUS ties its WFC identity/friend code to the game
rem SAVE. Two instances booting the same save present the same friend code and
rem cannot see/match each other. Delete jus-2p-a.sav / jus-2p-b.sav to start
rem fresh, then on EACH window complete the connection test + WiFi Battle ->
rem profile registration so that window's save is claimed by its instance.
rem
rem Evidence: recomp\cap-2p-a.pcap / recomp\cap-2p-b.pcap (+ .txt JSON ring via
rem --net-ring-dump if wanted), plus the [wfc_peer] forwarded/received lines in
rem each console. Peer frames should flow both ways on the loopback relay.
rem
rem Requirements: same as run_jus_online.cmd (runner built in build-mingw,
rem recomp\generated banks, rom\jus.nds, the runtime DLLs next to nds_runner.exe).
setlocal
cd /D "%~dp0.."

if "%PROVIDER%"=="" set PROVIDER=wiimmfi
if "%PEER_UNICAST%"=="" set PEER_UNICAST=on
if "%PLAYER_A%"=="" set PLAYER_A=PlayerA
if "%PLAYER_B%"=="" set PLAYER_B=PlayerB
if "%SAVE_A%"=="" set SAVE_A=recomp\jus-2p-a.sav
if "%SAVE_B%"=="" set SAVE_B=recomp\jus-2p-b.sav
if "%FW_A%"=="" set FW_A=recomp\jus-2p-a.fwstate
if "%FW_B%"=="" set FW_B=recomp\jus-2p-b.fwstate
if "%CAP_A%"=="" set CAP_A=recomp\cap-2p-a.pcap
if "%CAP_B%"=="" set CAP_B=recomp\cap-2p-b.pcap

if not exist rom\jus.nds (
  echo ERROR: rom\jus.nds not found. Place your legal Jump Ultimate Stars dump here.
  exit /b 1
)
if not exist "tools\ndsrecomp\runner\build-mingw\nds_runner.exe" (
  echo ERROR: runner not found; build-mingw must contain nds_runner.exe.
  exit /b 1
)

echo [2P] provider=%PROVIDER%  peer-unicast=%PEER_UNICAST%
echo [2P] A: instance 0  save=%SAVE_A%  fwstate=%FW_A%  cap=%CAP_A%  port=19842
echo [2P] B: instance 1  save=%SAVE_B%  fwstate=%FW_B%  cap=%CAP_B%  port=19843
echo [2P] FRESH SAVES REQUIRED (distinct friend codes). If A/B share a save,
echo       they present the same friend code and will not match.

start "JUS 2P - A (host)" tools\ndsrecomp\runner\build-mingw\nds_runner.exe tools\ndsrecomp\bios --interactive --rom rom\jus.nds --config recomp\game.toml --startup-mode automatic --freebios --generated-firmware --boot direct --port 19842 --instance-index 0 --player-name "%PLAYER_A%" --save-path %SAVE_A% --firmware-state-path %FW_A% --network on --wfc on --wfc-provider %PROVIDER% --wfc-peer-unicast %PEER_UNICAST% --net-capture-out %CAP_A% %*

start "JUS 2P - B (join)" tools\ndsrecomp\runner\build-mingw\nds_runner.exe tools\ndsrecomp\bios --interactive --rom rom\jus.nds --config recomp\game.toml --startup-mode automatic --freebios --generated-firmware --boot direct --port 19843 --instance-index 1 --player-name "%PLAYER_B%" --save-path %SAVE_B% --firmware-state-path %FW_B% --network on --wfc on --wfc-provider %PROVIDER% --wfc-peer-unicast %PEER_UNICAST% --net-capture-out %CAP_B% %*

echo [2P] Both instances launched. Drive WiFi Battle on each window:
echo       connection test, register profile, then Friend Battle (host on A).
echo       Captures: %CAP_A% and %CAP_B%  |  relay loopback active.
