@echo off
rem play_decksave.cmd — traced reproduction of the deck-edit save failure.
rem Restores the pristine 100%% save, launches interactive play with AUXSPI
rem tracing to recomp/decksave-auxspi.log, debug server on port 19888.
cd /D "%~dp0.."
set PATH=C:\msys64\ucrt64\bin;%PATH%
set NDS_TRACE_AUXSPI=1
copy /Y recomp\jus-100-save.sav recomp\jus-play.sav >NUL
if exist recomp\decksave-auxspi.log del /Q recomp\decksave-auxspi.log
C:\msys64\usr\bin\bash.exe recomp/run_jus.sh interactive --port 19888 --save-path recomp/jus-play.sav 2> recomp\decksave-auxspi.log
