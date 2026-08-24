@echo off
rem play_capture.cmd — manual-play capture for the own-save experiment.
rem Always run from the workspace root, no matter where it is invoked from.
cd /D "%~dp0.."
rem NO save injection: starts with a fresh blank chip at recomp/jus-play.sav.
rem NDS_TRACE_AUXSPI=1 logs every AUXSPI byte (cmd/addr/data/PC) to
rem recomp/play-auxspi.log; the debug server listens on port 19888 for
rem live RAM/save queries while you play.
set PATH=C:\msys64\ucrt64\bin;%PATH%
set NDS_TRACE_AUXSPI=1
if exist recomp\jus-play.sav del /Q recomp\jus-play.sav
if exist recomp\play-auxspi.log del /Q recomp\play-auxspi.log
tools\ndsrecomp\runner\build-mingw\nds_runner.exe tools\ndsrecomp\bios --interactive --port 19888 --rom rom\jus.nds --config recomp\game.toml --startup-mode automatic --freebios --generated-firmware --boot direct --save-path recomp\jus-play.sav 2> recomp\play-auxspi.log
