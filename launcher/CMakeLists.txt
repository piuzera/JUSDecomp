cmake_minimum_required(VERSION 3.20)
project(jusdecomp_launcher CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

if(WIN32)
    add_definitions(-D_WIN32_WINNT=0x0A00 -DUNICODE -D_UNICODE -DNOMINMAX)

    find_package(SDL2 REQUIRED)

    add_executable(JUSDecomp WIN32
        src/launcher.cpp
        resource.rc
    )

    target_include_directories(JUSDecomp PRIVATE src ${SDL2_INCLUDE_DIRS})

    # libstdc++ is linked explicitly (together with libwinpthread) inside the
    # -Bstatic region: the static libstdc++ itself imports pthread primitives,
    # so winpthread must be linked immediately after it.
    target_link_libraries(JUSDecomp PRIVATE
        SDL2::SDL2
        -Wl,-Bstatic -lstdc++ -lwinpthread -Wl,-Bdynamic
        ole32 comctl32 shell32 user32
    )

    target_link_options(JUSDecomp PRIVATE
        -static-libgcc
        -municode
    )
else()
    find_package(PkgConfig REQUIRED)
    pkg_check_modules(GTK3 REQUIRED IMPORTED_TARGET gtk+-3.0)
    pkg_check_modules(SDL2 REQUIRED IMPORTED_TARGET sdl2)

    add_executable(JUSDecomp src/launcher_linux.cpp)
    target_include_directories(JUSDecomp PRIVATE src)
    target_link_libraries(JUSDecomp PRIVATE PkgConfig::GTK3 PkgConfig::SDL2)
    target_compile_definitions(JUSDecomp PRIVATE
        JUS_PROJECT_ROOT="${CMAKE_CURRENT_SOURCE_DIR}/..")
endif()
