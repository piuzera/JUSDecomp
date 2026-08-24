#!/usr/bin/env bash
# run_remap.sh — build (if needed) and run the arcade-stick/controller
# remapping tool. Writes/updates recomp/gamecontrollerdb.txt, which
# nds_runner.exe loads automatically on startup.
#
# Usage: recomp/run_remap.sh
set -e
SCRIPT_DIR="${0%/*}"
cd "${SCRIPT_DIR}/.."
export PATH="/usr/bin:/c/msys64/ucrt64/bin:$PATH"

EXE="recomp/tools/remap_controller.exe"
if [ ! -x "$EXE" ]; then
    echo "Building remap_controller.exe..."
    mkdir -p recomp/tools
    g++ -std=c++17 -O2 -Wall -mconsole -o "$EXE" \
        tools/scripts/remap_controller.cpp \
        -I"$(sdl2-config --prefix)/include/SDL2" -lSDL2 -lgdi32
fi
exec "$EXE"
