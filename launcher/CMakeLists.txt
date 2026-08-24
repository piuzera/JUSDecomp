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

target_link_libraries(JUSDecomp PRIVATE
    SDL2::SDL2
    ole32 comctl32 shell32 user32
)

# Standalone bundle: static-link the mingw C/C++ runtimes (SDL2.dll ships
# alongside), use wWinMain entry point (WIN32 subsystem).
target_link_options(JUSDecomp PRIVATE
    -static-libgcc -static-libstdc++
    -municode
)
