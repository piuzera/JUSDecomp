// remap_controller.cpp — interactive SDL2 controller mapping generator.
//
// Purpose: arcade sticks / fight boards (e.g. QanBa) are frequently
// mismapped by SDL2's built-in gamecontrollerdb (wrong button order, no
// entry at all, or a generic "guess" that doesn't match the physical
// layout). This tool walks every DS-relevant button/axis, waits for you to
// press/move the *physical* control, and emits a correct SDL2 GameController
// mapping string keyed to your device's exact GUID.
//
// Output: written to recomp/gamecontrollerdb.txt (created if missing),
// which nds_runner.exe loads automatically at startup via
// SDL_GameControllerAddMappingsFromFile() (see frontend.cpp). Safe to
// re-run any time; re-mapping the same GUID overwrites its old line.
//
// Build (from repo root, MSYS2 UCRT64 shell -- uses the same pacman SDL2
// package the runner links, NOT the MSVC-ABI tools/sdl2/ devel zip, which
// is link-incompatible with mingw's SDL2main). Deliberately does NOT use
// `sdl2-config --cflags --libs`: that adds -Dmain=SDL_main/-lSDL2main and
// -mwindows, which are for GUI apps and would hide this tool's console
// (SDL_MAIN_HANDLED + SDL_SetMainReady() below replace that shim):
//   g++ -std=c++17 -O2 -mconsole -o recomp/tools/remap_controller.exe \
//       tools/scripts/remap_controller.cpp \
//       -I$(sdl2-config --prefix)/include/SDL2 -lSDL2
//
// Run:
//   recomp/run_remap.sh
//
// Controls while running: press the requested physical button (or push the
// D-pad/stick in the requested single direction), then RELEASE it fully —
// the prompt only advances once the control returns to neutral, so stale
// input can never bleed into the next prompt. Press ESC (keyboard) to skip
// the current entry (leaves it unbound), or Q to quit early and save
// whatever was mapped so far.

// Prevent SDL.h from renaming main() to SDL_main() (which requires linking
// SDL2main + WinMain and hides the console window). This is a plain
// console tool with its own main().
#define SDL_MAIN_HANDLED
#include <SDL.h>

// SDL's keyboard event routing is tied to a window's Win32 message loop.
// This tool deliberately has NO SDL window (a window would just render
// blank/black and cover the console — see the top-of-file build notes), so
// SDL_KEYDOWN can never fire here. ESC/Q are read directly via the Win32
// API instead, which works with no window at all.
#define WIN32_LEAN_AND_MEAN
#include <windows.h>

#include <algorithm>
#include <cstdio>
#include <cstring>
#include <fstream>
#include <iostream>
#include <optional>
#include <set>
#include <sstream>
#include <string>
#include <vector>

namespace {

enum class Kind { Button, Hat, AxisOrButton };

struct Target {
    const char* sdl_name;   // SDL mapping key, e.g. "a", "dpup"
    const char* prompt;     // human-readable prompt
    bool required;
    Kind kind;
};

// Order matches what the JUS runner actually consumes:
// - a/b/x/y/leftshoulder/rightshoulder/leftstick/rightstick/start/back
//   -> SDL_JOYBUTTONDOWN only (controller_bit() in frontend.cpp)
// - dpup/dpdown/dpleft/dpright -> a SINGLE cardinal SDL_JOYHATMOTION value
//   (1=up, 2=right, 4=down, 8=left) OR a plain button, for boards that wire
//   the stick as 4 discrete buttons instead of a hat
// - leftx/lefty -> optional analog axis (skippable on pure arcade sticks)
const std::vector<Target> kTargets = {
    {"dpup",          "D-pad / stick UP",           true,  Kind::Hat},
    {"dpdown",        "D-pad / stick DOWN",         true,  Kind::Hat},
    {"dpleft",        "D-pad / stick LEFT",         true,  Kind::Hat},
    {"dpright",       "D-pad / stick RIGHT",        true,  Kind::Hat},
    {"a",             "Button A  (DS A)",            true,  Kind::Button},
    {"b",             "Button B  (DS B)",            true,  Kind::Button},
    {"x",             "Button X  (DS X)",            true,  Kind::Button},
    {"y",             "Button Y  (DS Y)",            true,  Kind::Button},
    {"leftshoulder",  "Button L  (DS L)",            true,  Kind::Button},
    {"rightshoulder", "Button R  (DS R)",            true,  Kind::Button},
    {"start",         "Button START",                true,  Kind::Button},
    {"back",          "Button SELECT",               true,  Kind::Button},
    {"leftstick",     "Left stick click (L3, optional)",  false, Kind::Button},
    {"rightstick",    "Right stick click (R3, optional)", false, Kind::Button},
    {"lefttrigger",   "Left trigger (optional, Prime Controls scan)",  false, Kind::AxisOrButton},
    {"righttrigger",  "Right trigger (optional, Prime Controls shoot)", false, Kind::AxisOrButton},
    {"leftx",         "Analog LEFT/RIGHT (optional, skip on pure arcade sticks)", false, Kind::AxisOrButton},
    {"lefty",         "Analog UP/DOWN (optional, skip on pure arcade sticks)",    false, Kind::AxisOrButton},
};

struct Binding {
    std::string sdl_name;
    std::string token;  // e.g. "b3", "a2~", "h0.1"
};

std::string trim(const std::string& s) {
    size_t a = s.find_first_not_of(" \t\r\n");
    size_t b = s.find_last_not_of(" \t\r\n");
    if (a == std::string::npos) return "";
    return s.substr(a, b - a + 1);
}

// Resolves recomp/gamecontrollerdb.txt relative to THIS EXECUTABLE's own
// location (repo_root/recomp/tools/remap_controller.exe -> ../ from there),
// not the process's current working directory. This matters because
// double-clicking the exe in Explorer sets CWD to the exe's own folder, not
// the repo root -- a relative "recomp/gamecontrollerdb.txt" path would then
// silently resolve to a non-existent recomp/tools/recomp/ subdirectory.
std::string db_path_next_to_exe() {
    char exe_path[MAX_PATH] = {};
    if (GetModuleFileNameA(nullptr, exe_path, MAX_PATH) == 0)
        return "recomp/gamecontrollerdb.txt";  // best-effort fallback
    std::string dir(exe_path);
    const size_t slash = dir.find_last_of("\\/");
    if (slash != std::string::npos) dir.resize(slash);
    return dir + "\\gamecontrollerdb.txt";
}

bool is_cardinal_hat(Uint8 value) {
    return value == SDL_HAT_UP || value == SDL_HAT_RIGHT ||
           value == SDL_HAT_DOWN || value == SDL_HAT_LEFT;
}

// True once every button is up, every hat is centered, and every axis is
// near its rest position. Used both before starting a capture (drain any
// stale physical state) and after capturing (require full release so the
// next prompt starts clean).
bool is_neutral(SDL_Joystick* joy, const std::vector<Sint16>& axis_rest) {
    for (int i = 0; i < SDL_JoystickNumButtons(joy); ++i)
        if (SDL_JoystickGetButton(joy, i)) return false;
    for (int i = 0; i < SDL_JoystickNumHats(joy); ++i)
        if (SDL_JoystickGetHat(joy, i) != SDL_HAT_CENTERED) return false;
    for (int i = 0; i < static_cast<int>(axis_rest.size()); ++i) {
        const int delta = static_cast<int>(SDL_JoystickGetAxis(joy, i)) -
                           static_cast<int>(axis_rest[i]);
        if (std::abs(delta) > 8000) return false;
    }
    return true;
}

// True on the transition from "not pressed" to "pressed" for a real key,
// polled directly via Win32 since there is no SDL window/message loop to
// deliver SDL_KEYDOWN events (see the WIN32_LEAN_AND_MEAN comment above).
bool key_just_pressed(int vk, bool* held_state) {
    const bool down = (GetAsyncKeyState(vk) & 0x8000) != 0;
    const bool edge = down && !*held_state;
    *held_state = down;
    return edge;
}

// Pumps the event queue (discarding events) and updates joystick state
// until every control is neutral, or until Q (quit) is pressed.
// Returns false if the caller should quit (check *quit).
bool wait_for_neutral(SDL_Joystick* joy, const std::vector<Sint16>& axis_rest,
                       bool* quit) {
    SDL_Event event;
    bool q_held = (GetAsyncKeyState('Q') & 0x8000) != 0;  // ignore already-held
    for (;;) {
        while (SDL_PollEvent(&event)) {
            if (event.type == SDL_QUIT) { *quit = true; return false; }
        }
        if (key_just_pressed('Q', &q_held)) { *quit = true; return false; }
        if (is_neutral(joy, axis_rest)) return true;
        SDL_Delay(8);
    }
}

// Waits for the user to actuate exactly one control of the requested kind,
// debounces it (must read the same value on two consecutive polls 16ms
// apart) so transient travel through a diagonal hat position or contact
// bounce is never captured, then waits for full release before returning.
// Returns a mapping token string, or std::nullopt on ESC-skip, with *quit
// set if the user asked to quit entirely.
std::optional<std::string> wait_for_input(SDL_Joystick* joy, Kind kind,
                                          bool* quit) {
    const int num_axes = SDL_JoystickNumAxes(joy);
    std::vector<Sint16> axis_rest(num_axes, 0);
    for (int i = 0; i < num_axes; ++i)
        axis_rest[i] = SDL_JoystickGetAxis(joy, i);

    // Drain any stale queued events and refuse to start capturing until the
    // whole device reads neutral -- this is what prevents a held/lingering
    // stick position from bleeding into the very next prompt.
    if (!wait_for_neutral(joy, axis_rest, quit)) return std::nullopt;

    auto sample = [&]() -> std::optional<std::string> {
        if (kind == Kind::Button) {
            for (int i = 0; i < SDL_JoystickNumButtons(joy); ++i)
                if (SDL_JoystickGetButton(joy, i))
                    return std::string("b") + std::to_string(i);
            return std::nullopt;
        }
        if (kind == Kind::Hat) {
            for (int i = 0; i < SDL_JoystickNumHats(joy); ++i) {
                const Uint8 v = SDL_JoystickGetHat(joy, i);
                if (v != SDL_HAT_CENTERED && is_cardinal_hat(v))
                    return std::string("h") + std::to_string(i) + "." +
                           std::to_string(static_cast<int>(v));
            }
            // Fall back to plain buttons too: some boards wire the stick as
            // 4 discrete digital buttons rather than a hat switch.
            for (int i = 0; i < SDL_JoystickNumButtons(joy); ++i)
                if (SDL_JoystickGetButton(joy, i))
                    return std::string("b") + std::to_string(i);
            return std::nullopt;
        }
        // AxisOrButton (triggers / analog sticks).
        for (int i = 0; i < num_axes; ++i) {
            const int delta = static_cast<int>(SDL_JoystickGetAxis(joy, i)) -
                              static_cast<int>(axis_rest[i]);
            if (std::abs(delta) > 16000)
                return std::string("a") + std::to_string(i) +
                       (delta < 0 ? "~" : "");
        }
        for (int i = 0; i < SDL_JoystickNumButtons(joy); ++i)
            if (SDL_JoystickGetButton(joy, i))
                return std::string("b") + std::to_string(i);
        return std::nullopt;
    };

    SDL_Event event;
    std::optional<std::string> last_seen;
    // Ignore ESC/Q if already held down from a previous prompt (only react
    // to a fresh press-edge), same reasoning as the joystick debounce.
    bool esc_held = (GetAsyncKeyState(VK_ESCAPE) & 0x8000) != 0;
    bool q_held = (GetAsyncKeyState('Q') & 0x8000) != 0;
    for (;;) {
        while (SDL_PollEvent(&event)) {
            if (event.type == SDL_QUIT) { *quit = true; return std::nullopt; }
        }
        if (key_just_pressed(VK_ESCAPE, &esc_held)) return std::nullopt;
        if (key_just_pressed('Q', &q_held)) {
            *quit = true;
            return std::nullopt;
        }
        SDL_JoystickUpdate();
        auto now = sample();
        if (now && now == last_seen) {
            // Debounced: same reading twice in a row -> accept it, but
            // require full physical release before returning to the
            // caller, so the next prompt never sees this control still
            // held down.
            wait_for_neutral(joy, axis_rest, quit);
            return now;
        }
        last_seen = now;
        SDL_Delay(16);
    }
}

std::string joystick_guid_string(SDL_Joystick* joy) {
    char buf[64] = {};
    SDL_JoystickGUID guid = SDL_JoystickGetGUID(joy);
    SDL_JoystickGetGUIDString(guid, buf, sizeof(buf));
    return buf;
}

// Loads any existing lines from the db file, keyed by GUID, so we can
// replace just this device's entry rather than duplicating it.
std::vector<std::string> load_other_lines(const std::string& path,
                                           const std::string& guid) {
    std::vector<std::string> out;
    std::ifstream in(path);
    std::string line;
    while (std::getline(in, line)) {
        const std::string t = trim(line);
        if (t.empty() || t[0] == '#') { out.push_back(line); continue; }
        if (t.rfind(guid, 0) == 0) continue;  // drop old entry for this GUID
        out.push_back(line);
    }
    return out;
}

}  // namespace

int main(int argc, char** argv) {
    (void)argc; (void)argv;
    SDL_SetMainReady();  // required after SDL_MAIN_HANDLED (see top of file)
    // No SDL window: on Windows, SDL2's joystick backend (XInput/RawInput)
    // polls devices directly and does not need a window or message pump.
    // A window here would just render blank/black and cover this console.
    if (SDL_Init(SDL_INIT_JOYSTICK | SDL_INIT_EVENTS) != 0) {
        std::fprintf(stderr, "SDL_Init failed: %s\n", SDL_GetError());
        return 1;
    }

    const int n = SDL_NumJoysticks();
    if (n <= 0) {
        std::fprintf(stderr, "No joysticks detected. Plug in your arcade "
                              "stick and try again.\n");
        SDL_Quit();
        return 1;
    }

    std::printf("Detected joysticks:\n");
    for (int i = 0; i < n; ++i) {
        std::printf("  [%d] %s\n", i, SDL_JoystickNameForIndex(i));
    }
    int chosen = 0;
    if (n > 1) {
        std::printf("Select index [0-%d]: ", n - 1);
        std::fflush(stdout);
        std::string line;
        std::getline(std::cin, line);
        line = trim(line);
        if (!line.empty()) {
            try { chosen = std::stoi(line); } catch (...) { chosen = 0; }
            chosen = std::clamp(chosen, 0, n - 1);
        }
    }

    SDL_Joystick* joy = SDL_JoystickOpen(chosen);
    if (!joy) {
        std::fprintf(stderr, "SDL_JoystickOpen failed: %s\n", SDL_GetError());
        SDL_Quit();
        return 1;
    }
    const std::string name = SDL_JoystickName(joy) ? SDL_JoystickName(joy)
                                                    : "Unknown Controller";
    const std::string guid = joystick_guid_string(joy);
    std::printf("\nMapping: %s (GUID %s)\n", name.c_str(), guid.c_str());
    std::printf("Axes=%d Buttons=%d Hats=%d\n\n",
                SDL_JoystickNumAxes(joy), SDL_JoystickNumButtons(joy),
                SDL_JoystickNumHats(joy));
    std::printf("Make sure nothing is held down, then press Enter to "
                "begin...");
    std::fflush(stdout);
    { std::string dummy; std::getline(std::cin, dummy); }

    std::vector<Binding> bindings;
    std::set<std::string> used_tokens;
    bool quit = false;
    for (const auto& target : kTargets) {
        if (quit) break;
        for (;;) {
            std::printf("Press/move: %-45s %s\n", target.prompt,
                        target.required ? "" : "(ESC to skip)");
            std::fflush(stdout);
            auto token = wait_for_input(joy, target.kind, &quit);
            if (!token) {
                std::printf("  -> skipped\n");
                break;
            }
            if (used_tokens.count(*token)) {
                std::printf("  -> %s is already assigned to another "
                            "button — press a DIFFERENT control (or ESC "
                            "to skip this one).\n", token->c_str());
                if (!target.required) continue;  // retry same target
                continue;
            }
            std::printf("  -> %s\n", token->c_str());
            bindings.push_back({target.sdl_name, *token});
            used_tokens.insert(*token);
            break;
        }
    }

    SDL_JoystickClose(joy);

    if (bindings.empty()) {
        std::printf("\nNothing mapped, exiting without writing.\n");
        SDL_Quit();
        return 0;
    }

    std::ostringstream mapping;
    mapping << guid << "," << name << ",";
    for (const auto& b : bindings) mapping << b.sdl_name << ":" << b.token << ",";
    mapping << "platform:Windows,";

    const std::string db_path = db_path_next_to_exe();
    auto lines = load_other_lines(db_path, guid);
    lines.push_back(mapping.str());

    std::ofstream out(db_path, std::ios::trunc);
    for (const auto& l : lines) out << l << "\n";
    const bool write_ok = out.good();
    out.close();

    if (!write_ok) {
        std::fprintf(stderr, "\nFAILED to write %s -- check the folder is "
                              "writable.\n", db_path.c_str());
        std::printf("Press Enter to exit...");
        std::fflush(stdout);
        { std::string dummy; std::getline(std::cin, dummy); }
        SDL_Quit();
        return 1;
    }

    std::printf("\nWrote mapping to %s:\n%s\n\n", db_path.c_str(),
                mapping.str().c_str());
    std::printf("Run recomp/run_jus.sh (any mode) again to use it.\n");
    std::printf("Press Enter to exit...");
    std::fflush(stdout);
    { std::string dummy; std::getline(std::cin, dummy); }

    SDL_Quit();
    return 0;
}
