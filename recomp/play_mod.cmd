@echo off
rem play_mod.cmd — boot the STOCK ROM (rom/jus.nds) with runtime overlay mods.
rem
rem The ROM is never modified: the runner shadows NitroFS reads with host
rem files listed under [[mods.overlays]] (Riivolution-style). The overlay list
rem is generated from your enabled mod packs:
rem
rem     py tools\scripts\mods_manage.py compose
rem
rem which writes recomp/game-mod.generated.toml. This script prefers the
rem generated config and falls back to the no-mod base recomp/game-mod.toml.
rem See decomp/docs/MODS.md.
rem
rem Usage:   recomp\play_mod.cmd [fresh]
rem   fresh — delete the local save so the game starts a blank profile.
rem The save lives at recomp/jus-play.sav (gitignored); set JUS_SAVE to
rem override the path.
cd /D "%~dp0.."
set PATH=C:\msys64\ucrt64\bin;%PATH%

if /I "%~1"=="fresh" (
  if exist recomp\jus-play.sav del /Q recomp\jus-play.sav
  echo Fresh save: deleted recomp\jus-play.sav
)

set CFG=recomp\game-mod.toml
if exist recomp\game-mod.generated.toml set CFG=recomp\game-mod.generated.toml

set SAVE=recomp\jus-play.sav
if defined JUS_SAVE set SAVE=%JUS_SAVE%

if exist recomp\play-mod-auxspi.log del /Q recomp\play-mod-auxspi.log

tools\ndsrecomp\runner\build-mingw\nds_runner.exe tools\ndsrecomp\bios --interactive --port 19888 --rom rom\jus.nds --config %CFG% --startup-mode automatic --freebios --generated-firmware --boot direct --save-path %SAVE% 2> recomp\play-mod-auxspi.log
