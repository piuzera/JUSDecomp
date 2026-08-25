cmake_minimum_required(VERSION 3.20)
project(jusdecomp_launcher CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_definitions(-D_WIN32_WINNT=0x0A00 -DUNICODE -D_UNICODE -DNOMINMAX)

find_package(SDL2 REQUIRED)

add_executable(JUSDecomp WIN32
    src/launcher.cpp
    resource.rc
)

target_include_directories(JUSDecomp PRIVATE src ${SDL2_INCLUDE_DIRS})

# libstdc++ is linked explicitly (together with libwinpthread) inside the
# -Bstatic region: the static libstdc++ itself imports pthread primitives, so
# winpthread must be linked immediately after it — BEFORE -Bdynamic re-enables
# shared libs. Doing this removes BOTH the libstdc++-6.dll and
# libwinpthread-1.dll dynamic dependencies, leaving SDL2.dll as the only
# non-system runtime DLL (which the release packager places next to the exe —
# see tools/scripts/package_release.py). These MUST live in the library list
# (after the objects); in the link options, Ninja emits them before the object
# files and the driver's trailing -lwinpthread links the DLL import lib instead.
target_link_libraries(JUSDecomp PRIVATE
    SDL2::SDL2
    -Wl,-Bstatic -lstdc++ -lwinpthread -Wl,-Bdynamic
    ole32 comctl32 shell32 user32
)

# Standalone bundle: static-link the mingw C/C++ runtimes (SDL2.dll ships
# alongside), use wWinMain entry point (WIN32 subsystem).
target_link_options(JUSDecomp PRIVATE
    -static-libgcc
    -municode
)
