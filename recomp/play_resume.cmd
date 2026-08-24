@echo off
rem play_resume.cmd — boot with the EXISTING own-save image (recomp/jus-play.sav)
rem produced by play_capture.cmd. Does NOT delete the save. Use this to check
rem whether the game now recognizes/loads the in-game save. Traces AUXSPI to
rem recomp/play-resume-auxspi.log; debug server on port 19888.
cd /D "%~dp0.."
set PATH=C:\msys64\ucrt64\bin;%PATH%
set NDS_TRACE_AUXSPI=1
if exist recomp\play-resume-auxspi.log del /Q recomp\play-resume-auxspi.log
tools\ndsrecomp\runner\build-mingw\nds_runner.exe tools\ndsrecomp\bios --interactive --port 19888 --rom rom\jus.nds --config recomp\game.toml --startup-mode automatic --freebios --generated-firmware --boot direct --save-path recomp\jus-play.sav 2> recomp\play-resume-auxspi.log
