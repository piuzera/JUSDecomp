@echo off
rem play_import100.cmd — boot with the 100%% hardware save (recomp/jus-100-save.sav)
rem placed as the cartridge save, same resume-style launch. Visual check: does
rem the game load the complete profile or fall back to a fresh start?
rem Traces AUXSPI to recomp/play-import100-auxspi.log; debug server on 19888.
cd /D "%~dp0.."
set PATH=C:\msys64\ucrt64\bin;%PATH%
set NDS_TRACE_AUXSPI=1
copy /Y recomp\jus-100-save.sav recomp\jus-play.sav >NUL
if exist recomp\play-import100-auxspi.log del /Q recomp\play-import100-auxspi.log
tools\ndsrecomp\runner\build-mingw\nds_runner.exe tools\ndsrecomp\bios --interactive --port 19888 --rom rom\jus.nds --config recomp\game.toml --startup-mode automatic --freebios --generated-firmware --boot direct --save-path recomp\jus-play.sav 2> recomp\play-import100-auxspi.log
