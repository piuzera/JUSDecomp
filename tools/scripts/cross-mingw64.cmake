# cross-mingw64.cmake — build the Windows (x86_64-w64-mingw32) release
# bundle from a Linux host. Used by tools/scripts/package_release.py
# --cross-linux.
#
# Host prerequisites (Arch/Omarchy):
#   sudo pacman -S --needed mingw-w64-gcc mingw-w64-binutils mingw-w64-crt \
#       mingw-w64-headers mingw-w64-winpthreads
# plus the official SDL2 mingw devel package (package_release.py --sdl2),
# e.g. https://github.com/libsdl-org/SDL/releases (SDL2-devel-*-mingw.zip).
#
# Pass -DSDL2_DIR=<sdl2>/x86_64-w64-mingw32/lib/cmake/SDL2 to the cmake
# configure so find_package(SDL2 CONFIG) resolves the cross SDL2.
set(CMAKE_SYSTEM_NAME Windows)
set(CMAKE_SYSTEM_PROCESSOR x86_64)

set(CMAKE_C_COMPILER x86_64-w64-mingw32-gcc)
set(CMAKE_CXX_COMPILER x86_64-w64-mingw32-g++)
set(CMAKE_RC_COMPILER x86_64-w64-mingw32-windres)

set(CMAKE_FIND_ROOT_PATH /usr/x86_64-w64-mingw32)
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
