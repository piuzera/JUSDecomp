// launcher.cpp — JUSDecomp beginner-friendly launcher.
//
// Single self-contained Windows executable that wraps the ndsrecomp runner:
//   - ROM selection via file dialog + SHA-1 verification
//   - in-app mod toggling (bundled prebuilt packs)
//   - controller binding capture (SDL2) -> gamecontrollerdb.txt
//   - persistent settings in %APPDATA%\JUSDecomp\settings.json
//   - friendly error messages and a session log
//
// Build: MSYS2 UCRT64, g++ -std=c++17 (see launcher/CMakeLists.txt).
#ifndef UNICODE
#define UNICODE
#endif
#ifndef _UNICODE
#define _UNICODE
#endif
#ifndef NOMINMAX
#define NOMINMAX
#endif
#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <windowsx.h>
#include <commctrl.h>
#include <shlobj.h>
#include <shellapi.h>
#include <SDL.h>

#include <algorithm>
#include <cstdarg>
#include <cstdio>
#include <string>
#include <vector>

#include "json.h"
#include "sha1.h"

// ---------------------------------------------------------------------------
// Constants
// ---------------------------------------------------------------------------
static const char*  APP_NAME       = "JUSDecomp";
static const char*  APP_VERSION    = "0.3.0";
static const char*  STOCK_SHA1     = "ba58e20ee60eb81c33dcd4934a21271baa9f954a";
static const long long STOCK_SIZE  = 0x4000000LL; // 64 MiB

// Control IDs
enum {
    IDC_ROM_LABEL = 100, IDC_ROM_STATUS, IDC_PLAY, IDC_CHANGE_ROM,
    IDC_SETTINGS, IDC_GUIDE, IDC_OPEN_LOG,
    // settings dialog
    IDC_MODLIST = 200, IDC_LAYOUT_COMBO,
    IDC_SAVE_LABEL, IDC_IMPORT_SAVE, IDC_DELETE_SAVE,
    IDC_CTRL_LIST, IDC_CTRL_CONFIGURE, IDC_CTRL_RESET,
    IDC_KB_CONFIGURE,
    IDC_PLAYERNAME, IDC_ONLINE_CHK,
    IDC_OK, IDC_CANCEL,
    // capture dialog
    IDC_CAP_DEVICE = 300, IDC_CAP_START, IDC_CAP_SKIP, IDC_CAP_STATE,
    IDC_CAP_DONE,
    // keyboard capture dialog
    IDC_KB_STATE = 320, IDC_KB_SKIP, IDC_KB_RESET, IDC_KB_DONE,
    // rom progress
    IDC_PROG_TEXT = 400, IDC_PROG_BAR
};

// ---------------------------------------------------------------------------
// Small utilities
// ---------------------------------------------------------------------------
static std::wstring u2w(const std::string& s) {
    if (s.empty()) return L"";
    int n = MultiByteToWideChar(CP_UTF8, 0, s.c_str(), (int)s.size(), nullptr, 0);
    std::wstring out(n, L'\0');
    MultiByteToWideChar(CP_UTF8, 0, s.c_str(), (int)s.size(), &out[0], n);
    return out;
}

static std::string w2u(const std::wstring& s) {
    if (s.empty()) return "";
    int n = WideCharToMultiByte(CP_UTF8, 0, s.c_str(), (int)s.size(), nullptr, 0,
                                nullptr, nullptr);
    std::string out(n, '\0');
    WideCharToMultiByte(CP_UTF8, 0, s.c_str(), (int)s.size(), &out[0], n, nullptr,
                        nullptr);
    return out;
}

static std::wstring exe_dir() {
    wchar_t buf[MAX_PATH];
    GetModuleFileNameW(nullptr, buf, MAX_PATH);
    std::wstring p(buf);
    size_t slash = p.find_last_of(L"\\/");
    return slash == std::wstring::npos ? L"." : p.substr(0, slash);
}

static std::wstring app_dir() { return exe_dir(); } // bundle root == exe dir

static bool portable_mode() {
    std::wstring marker = app_dir() + L"\\portable.txt";
    DWORD a = GetFileAttributesW(marker.c_str());
    return a != INVALID_FILE_ATTRIBUTES && !(a & FILE_ATTRIBUTE_DIRECTORY);
}

static std::wstring user_dir() {
    if (portable_mode()) return app_dir() + L"\\data-user";
    wchar_t buf[MAX_PATH];
    if (SUCCEEDED(SHGetFolderPathW(nullptr, CSIDL_APPDATA, nullptr,
                                   SHGFP_TYPE_CURRENT, buf)))
        return std::wstring(buf) + L"\\JUSDecomp";
    return app_dir() + L"\\data-user";
}

static void ensure_dir(const std::wstring& d) {
    if (!d.empty()) CreateDirectoryW(d.c_str(), nullptr);
}

static void log_line(const char* fmt, ...) {
    static bool first = true;
    std::wstring log_path = user_dir() + L"\\launcher.log";
    ensure_dir(user_dir());
    FILE* f = _wfopen(log_path.c_str(), first ? L"w" : L"a");
    if (f) {
        va_list ap;
        va_start(ap, fmt);
        vfprintf(f, fmt, ap);
        va_end(ap);
        fputc('\n', f);
        fclose(f);
    }
    first = false;
}

static void show_info(HWND parent, const wchar_t* text,
                      const wchar_t* title = L"JUSDecomp") {
    MessageBoxW(parent, text, title, MB_OK | MB_ICONINFORMATION);
}

static void show_error(HWND parent, const wchar_t* text,
                       const wchar_t* title = L"JUSDecomp") {
    MessageBoxW(parent, text, title, MB_OK | MB_ICONERROR);
}

static std::wstring path_of(const std::string& rel_utf8) {
    std::wstring w = u2w(rel_utf8);
    for (auto& c : w) if (c == L'/') c = L'\\';
    return app_dir() + L"\\" + w;
}

static std::string read_text_file(const std::wstring& path) {
    FILE* f = _wfopen(path.c_str(), L"rb");
    if (!f) return "";
    std::string out;
    char buf[4096];
    size_t n;
    while ((n = std::fread(buf, 1, sizeof(buf), f)) > 0)
        out.append(buf, n);
    fclose(f);
    return out;
}

static void write_text_file(const std::wstring& path, const std::string& text) {
    FILE* f = _wfopen(path.c_str(), L"wb");
    if (f) {
        std::fwrite(text.data(), 1, text.size(), f);
        fclose(f);
    }
}

// ---------------------------------------------------------------------------
// Settings + bundled mod registry
// ---------------------------------------------------------------------------
struct Settings {
    int version = 1;
    std::string rom_path;
    std::vector<std::string> mods_enabled;
    std::string display_layout = "stacked";
    std::string save_path;   // empty -> default under user dir
    std::string player_name;  // online player name (--player-name)
    bool online_mode = true;  // launch with the Wiimmfi online flags (default on)
    std::vector<std::string> controller_mappings; // SDL2 mapping strings
    // Keyboard bindings as "button:key" pairs ("a:J"); button is a DS button
    // (a b select start right left up down r l x y), key is an SDL scancode
    // name. Emitted to the run config as [[input.keyboard]] tables.
    std::vector<std::string> keyboard_mappings;
};

struct Overlay { std::string offset; std::string file; };
struct ModInfo {
    std::string id, name, version, author, description;
    std::vector<Overlay> overlays;
};

static Settings g_settings;
static std::vector<ModInfo> g_mods;
static std::wstring g_settings_path() { return user_dir() + L"\\settings.json"; }
static std::wstring g_run_config_path() { return user_dir() + L"\\run.toml"; }

static std::wstring default_save_path() {
    return user_dir() + L"\\jus-play.sav";
}

static void load_settings() {
    std::string text = read_text_file(g_settings_path());
    if (text.empty()) return;
    try {
        jz::Value root = jz::Value::parse(text);
        g_settings.rom_path = root.get_str("rom_path");
        g_settings.display_layout = root.get_str("display_layout", "stacked");
        g_settings.save_path = root.get_str("save_path");
        g_settings.player_name = root.get_str("player_name");
        g_settings.online_mode = root.get_bool("online_mode", true);
        for (const jz::Value& v : root.get_arr("mods_enabled"))
            if (v.t == jz::Value::Str) g_settings.mods_enabled.push_back(v.s);
        for (const jz::Value& v : root.get_arr("controller_mappings"))
            if (v.t == jz::Value::Str)
                g_settings.controller_mappings.push_back(v.s);
        for (const jz::Value& v : root.get_arr("keyboard_mappings"))
            if (v.t == jz::Value::Str)
                g_settings.keyboard_mappings.push_back(v.s);
    } catch (const std::exception& e) {
        log_line("settings.json unreadable (%s) — starting with defaults", e.what());
    }
}

static void save_settings() {
    jz::Value root = jz::Value::obj();
    root.o["version"] = jz::Value((long long)1);
    root.o["rom_path"] = jz::Value(g_settings.rom_path);
    root.o["display_layout"] = jz::Value(g_settings.display_layout);
    root.o["save_path"] = jz::Value(g_settings.save_path);
    root.o["player_name"] = jz::Value(g_settings.player_name);
    root.o["online_mode"] = jz::Value(g_settings.online_mode);
    jz::Value mods = jz::Value::arr();
    for (const auto& m : g_settings.mods_enabled) mods.a.push_back(jz::Value(m));
    root.o["mods_enabled"] = mods;
    jz::Value maps = jz::Value::arr();
    for (const auto& m : g_settings.controller_mappings)
        maps.a.push_back(jz::Value(m));
    root.o["controller_mappings"] = maps;
    jz::Value kb = jz::Value::arr();
    for (const auto& m : g_settings.keyboard_mappings)
        kb.a.push_back(jz::Value(m));
    root.o["keyboard_mappings"] = kb;
    ensure_dir(user_dir());
    write_text_file(g_settings_path(), root.dump(2));
    log_line("settings saved");
}

static void load_modindex() {
    g_mods.clear();
    std::string text = read_text_file(path_of("mods/modindex.json"));
    if (text.empty()) { log_line("no modindex.json — mod list empty"); return; }
    try {
        jz::Value root = jz::Value::parse(text);
        for (const jz::Value& m : root.get_arr("mods")) {
            ModInfo info;
            info.id = m.get_str("id");
            info.name = m.get_str("name", info.id);
            info.version = m.get_str("version");
            info.author = m.get_str("author");
            info.description = m.get_str("description");
            for (const jz::Value& ov : m.get_arr("overlays")) {
                Overlay o;
                o.offset = ov.get_str("offset");
                o.file = ov.get_str("file");
                if (!o.offset.empty() && !o.file.empty())
                    info.overlays.push_back(o);
            }
            if (!info.id.empty()) g_mods.push_back(info);
        }
    } catch (const std::exception& e) {
        log_line("modindex.json unreadable: %s", e.what());
    }
    // default: every bundled mod enabled unless settings already has entries
    if (g_settings.mods_enabled.empty())
        for (const auto& m : g_mods) g_settings.mods_enabled.push_back(m.id);
}

static bool mod_enabled(const std::string& id) {
    return std::find(g_settings.mods_enabled.begin(),
                     g_settings.mods_enabled.end(),
                     id) != g_settings.mods_enabled.end();
}

static void set_mod_enabled(const std::string& id, bool on) {
    auto it = std::find(g_settings.mods_enabled.begin(),
                        g_settings.mods_enabled.end(), id);
    if (on && it == g_settings.mods_enabled.end())
        g_settings.mods_enabled.push_back(id);
    if (!on && it != g_settings.mods_enabled.end())
        g_settings.mods_enabled.erase(it);
}

// ---------------------------------------------------------------------------
// ROM verification
// ---------------------------------------------------------------------------
enum class RomStatus {
    Ok, NotFound, NotNDS, WrongSize, WrongHash, ReadError, NotSelected
};

static RomStatus g_rom_status = RomStatus::NotSelected;
static std::string g_rom_sha1;

static const wchar_t* rom_error_text(RomStatus st) {
    switch (st) {
        case RomStatus::NotFound:
            return L"That file could not be read. Please choose a ROM file on a "
                   L"disk you can access.";
        case RomStatus::NotNDS:
            return L"This file is not a Nintendo DS ROM. Please choose the "
                   L"original Jump Ultimate Stars cartridge dump.";
        case RomStatus::WrongSize:
            return L"This looks like a trimmed or modified ROM. Please use an "
                   L"unmodified original cartridge dump (64 MB).";
        case RomStatus::WrongHash:
            return L"This is not an unmodified Jump Ultimate Stars dump. It may "
                   L"be a different game, a patched copy, or a bad dump. Please "
                   L"use an original dump of Jump Ultimate Stars.";
        case RomStatus::ReadError:
            return L"The ROM could not be fully read. The file may be damaged "
                   L"or on a failing disk.";
        default:
            return L"";
    }
}

struct HashProgress {
    HWND bar = nullptr;
    HWND label = nullptr;
    wchar_t text[128] = {};
};

static HashProgress* g_progress_ctx = nullptr;

static void hash_progress_global(long long done, long long total) {
    if (g_progress_ctx) {
        HashProgress* st = g_progress_ctx;
        swprintf(st->text, 128, L"Verifying ROM... %lld / %lld MB",
                 done / (1024 * 1024), total / (1024 * 1024));
        SetWindowTextW(st->label, st->text);
        SendMessageW(st->bar, PBM_SETPOS, (WPARAM)(done * 100 / total), 0);
        MSG msg;
        while (PeekMessageW(&msg, nullptr, 0, 0, PM_REMOVE)) {
            TranslateMessage(&msg);
            DispatchMessageW(&msg);
        }
    }
}

static RomStatus validate_rom_file(const std::wstring& path) {
    FILE* f = _wfopen(path.c_str(), L"rb");
    if (!f) return RomStatus::NotFound;
    _fseeki64(f, 0, SEEK_END);
    long long size = _ftelli64(f);
    _fseeki64(f, 0, SEEK_SET);
    if (size != STOCK_SIZE) { fclose(f); return RomStatus::WrongSize; }
    unsigned char head[16] = {};
    size_t got = std::fread(head, 1, sizeof(head), f);
    fclose(f);
    if (got != sizeof(head)) return RomStatus::ReadError;

    jz::Sha1 sha1;
    bool ok = sha1.hash_file(path, hash_progress_global);
    if (!ok) return RomStatus::ReadError;
    g_rom_sha1 = sha1.hexdigest();
    log_line("ROM %s -> sha1 %s", w2u(path).c_str(), g_rom_sha1.c_str());
    if (g_rom_sha1 != STOCK_SHA1) return RomStatus::WrongHash;
    return RomStatus::Ok;
}

// ---------------------------------------------------------------------------
// Runtime config composition (base + enabled mods)
// ---------------------------------------------------------------------------
static std::string compose_run_config() {
    std::string out;
    out += "# Generated by JUSDecomp launcher. Do not hand-edit.\n";
    out += "[game]\n";
    out += "sha1 = \"" + std::string(STOCK_SHA1) + "\"\n\n";
    out += "[display]\n";
    out += "screen_layout = \"" + g_settings.display_layout + "\"\n";
    out += "adaptive_widescreen = \"none\"\n\n";
    out += "[system]\nstartup_mode = \"automatic\"\n\n";
    out += "[cartridge]\nsave_type = \"eeprom\"\nsave_size = 65536\n";
    for (const auto& mod : g_mods) {
        if (!mod_enabled(mod.id)) continue;
        out += "\n# ---- mod: " + mod.name + " (" + mod.id + ") v" +
               mod.version + " ----\n";
        for (const auto& ov : mod.overlays) {
            out += "[[mods.overlays]]\n";
            out += "offset = " + ov.offset + "\n";
            out += "file = \"" + ov.file + "\"\n";
        }
    }
    // user keyboard bindings ("button:key"); unlisted buttons keep the
    // runner's built-in DS-emulator-convention defaults
    for (const auto& m : g_settings.keyboard_mappings) {
        size_t colon = m.find(':');
        if (colon == std::string::npos || colon == 0 ||
            colon + 1 >= m.size())
            continue;
        out += "\n[[input.keyboard]]\n";
        out += "button = \"" + m.substr(0, colon) + "\"\n";
        out += "key = \"" + m.substr(colon + 1) + "\"\n";
    }
    return out;
}

// ---------------------------------------------------------------------------
// Controller database merge (bundled base + user mappings)
// ---------------------------------------------------------------------------
static void write_merged_controller_db() {
    std::string base = read_text_file(path_of("data/gamecontrollerdb.txt"));
    std::string merged = base;
    if (!merged.empty() && merged.back() != '\n') merged += "\n";
    for (const auto& m : g_settings.controller_mappings) {
        // only add if not already present (idempotent)
        if (merged.find(m) == std::string::npos) {
            merged += m;
            if (merged.back() != '\n') merged += "\n";
        }
    }
    // user-writable location; passed to the runner via NDS_GAMECONTROLLERDB
    ensure_dir(user_dir());
    write_text_file(user_dir() + L"\\gamecontrollerdb.txt", merged);
    log_line("wrote merged gamecontrollerdb (%zu user mappings)",
             g_settings.controller_mappings.size());
}

// ---------------------------------------------------------------------------
// Runner launch
// ---------------------------------------------------------------------------
static void open_log(HWND parent) {
    std::wstring lp = user_dir() + L"\\launcher.log";
    ShellExecuteW(parent, L"open", L"notepad.exe", (L"\"" + lp + L"\"").c_str(),
                  nullptr, SW_SHOWNORMAL);
}

static void launch_game(HWND parent) {
    if (g_settings.rom_path.empty() || g_rom_status != RomStatus::Ok) {
        show_error(parent, L"Please select a valid Jump Ultimate Stars ROM first.");
        return;
    }
    std::wstring runner = app_dir() + L"\\app\\nds_runner.exe";
    if (GetFileAttributesW(runner.c_str()) == INVALID_FILE_ATTRIBUTES) {
        show_error(parent, L"The game engine could not be found.\n\n"
                           L"The application seems to be installed incompletely. "
                           L"Please reinstall JUSDecomp.");
        return;
    }
    std::wstring bios = app_dir() + L"\\app\\bios";
    ensure_dir(user_dir());
    write_text_file(g_run_config_path(), compose_run_config());
    write_merged_controller_db();

    std::wstring save_path = g_settings.save_path.empty()
                                 ? default_save_path()
                                 : u2w(g_settings.save_path);

    std::wstring cmdline =
        L"\"" + runner + L"\" \"" + bios + L"\" --interactive --port 19888 "
        L"--rom \"" + u2w(g_settings.rom_path) + L"\" "
        L"--config \"" + g_run_config_path() + L"\" "
        L"--startup-mode automatic --freebios --generated-firmware --boot direct "
        L"--save-path \"" + save_path + L"\"";
    if (g_settings.online_mode) {
        cmdline += L" --network on --wfc on --wfc-provider wiimmfi";
        if (!g_settings.player_name.empty())
            cmdline += L" --player-name \"" + u2w(g_settings.player_name) + L"\"";
        // Persist the WFC profile (friend code / connection settings) under the
        // user dir so the friend code survives relaunches. The runner seeds it
        // on first launch and rewrites it as the profile is registered.
        std::wstring fwstate = user_dir() + L"\\jus.fwstate";
        cmdline += L" --firmware-state-path \"" + fwstate + L"\"";
        // Online-FPS fix (0.2.1): the WFC/DWC stack (ARM9 ov008/ov010 + ARM7
        // wifi driver) is RAM-resident and runs on the Tier-3 interpreter until
        // live-overlay promotion. Without these flags online play halves the
        // framerate (60 -> ~35). The shipped bundle's live cache is pre-seeded
        // with every overlay page compiled to native (see package_release.py),
        // so the runner boots fully native and only needs to load the DLLs from
        // disk -- no in-session compiler is required. 15s activation delay (the
        // 90s interactive default is too late for the online flow).
        std::wstring live_cache = app_dir() + L"\\app\\live-cache";
        cmdline += L" --live-overlay-enable --live-overlay-auto"
                   L" --live-overlay-activation-delay-ms 15000"
                   L" --live-overlay-auto-delay-ms 15000"
                   L" --live-overlay-auto-cooldown-ms 20000"
                   L" --live-overlay-cache \"" + live_cache + L"\"";
        log_line("online mode enabled (player '%s', fwstate '%s', live-cache '%s')",
                 g_settings.player_name.c_str(), w2u(fwstate).c_str(),
                 w2u(live_cache).c_str());
    }

    log_line("launch: %s", w2u(cmdline).c_str());

    SetEnvironmentVariableW(L"NDS_GAMECONTROLLERDB",
                            (user_dir() + L"\\gamecontrollerdb.txt").c_str());

    SECURITY_ATTRIBUTES sa = {sizeof(sa), nullptr, TRUE};
    std::wstring logpath = user_dir() + L"\\game.log";
    HANDLE logf = CreateFileW(logpath.c_str(), GENERIC_WRITE, FILE_SHARE_READ,
                              &sa, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, nullptr);
    if (logf == INVALID_HANDLE_VALUE) logf = nullptr;
    HANDLE nul_in = CreateFileW(L"NUL", GENERIC_READ, FILE_SHARE_READ, &sa,
                                OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, nullptr);

    STARTUPINFOW si = {};
    si.cb = sizeof(si);
    si.dwFlags = STARTF_USESTDHANDLES;
    si.hStdInput = nul_in;
    si.hStdOutput = logf;
    si.hStdError = logf;
    PROCESS_INFORMATION pi = {};
    wchar_t cmd[4096];
    wcscpy_s(cmd, cmdline.c_str());
    BOOL created = CreateProcessW(nullptr, cmd, nullptr, nullptr, TRUE,
                                  CREATE_NO_WINDOW, nullptr,
                                  app_dir().c_str(), &si, &pi);
    if (!created) {
        if (logf) CloseHandle(logf);
        if (nul_in) CloseHandle(nul_in);
        show_error(parent, L"The game could not be started. Please reinstall "
                           L"JUSDecomp and try again.");
        log_line("CreateProcess failed: %lu", GetLastError());
        return;
    }
    CloseHandle(pi.hThread);
    WaitForSingleObject(pi.hProcess, INFINITE);
    DWORD code = 1;
    GetExitCodeProcess(pi.hProcess, &code);
    CloseHandle(pi.hProcess);
    if (logf) CloseHandle(logf);
    if (nul_in) CloseHandle(nul_in);

    if (code != 0) {
        log_line("game exited with code %lu", code);
        show_error(parent, L"The game stopped unexpectedly.\n\n"
                          L"Your progress is saved automatically. If this keeps "
                          L"happening, use the \"Open log\" button on the main "
                          L"window and include the log when asking for help.");
    } else {
        log_line("game exited cleanly");
    }
}

// ---------------------------------------------------------------------------
// Main window
// ---------------------------------------------------------------------------
#define WM_APP_ROMSET (WM_APP + 1)

static HFONT g_font = nullptr;
static HWND g_main = nullptr;
static HWND g_play = nullptr;
static HWND g_rom_label = nullptr;
static HWND g_status = nullptr;

static void refresh_status() {
    if (!g_status) return;
    const wchar_t* txt;
    switch (g_rom_status) {
        case RomStatus::Ok:
            txt = L"ROM verified — ready to play.";
            break;
        case RomStatus::NotSelected:
            txt = L"No ROM selected yet. Click \"Change ROM\" to choose your "
                  L"legally dumped copy of Jump Ultimate Stars.";
            break;
        default:
            txt = L"ROM problem detected — click \"Change ROM\" to pick a "
                  L"valid dump.";
    }
    SetWindowTextW(g_status, txt);
    if (g_play) EnableWindow(g_play, g_rom_status == RomStatus::Ok);
}

static void pick_rom(HWND parent) {
    HRESULT hr = CoInitializeEx(nullptr, COINIT_APARTMENTTHREADED);
    IFileOpenDialog* dlg = nullptr;
    if (SUCCEEDED(CoCreateInstance(CLSID_FileOpenDialog, nullptr,
                                   CLSCTX_INPROC_SERVER,
                                   IID_PPV_ARGS(&dlg)))) {
        COMDLG_FILTERSPEC specs[] = {
            {L"Nintendo DS ROM (*.nds)", L"*.nds"},
            {L"All files (*.*)", L"*.*"},
        };
        dlg->SetFileTypes(2, specs);
        dlg->SetTitle(L"Choose your Jump Ultimate Stars ROM");
        if (SUCCEEDED(dlg->Show(parent))) {
            IShellItem* item = nullptr;
            if (SUCCEEDED(dlg->GetResult(&item))) {
                PWSTR p = nullptr;
                if (SUCCEEDED(item->GetDisplayName(SIGDN_FILESYSPATH, &p))) {
                    std::wstring path = p;
                    CoTaskMemFree(p);

                    // progress dialog while hashing
                    HWND pd = CreateWindowExW(0, L"STATIC", L"Verifying ROM...",
                                              WS_OVERLAPPED | WS_CAPTION |
                                                  WS_SYSMENU | WS_VISIBLE,
                                              CW_USEDEFAULT, CW_USEDEFAULT,
                                              360, 110, parent, nullptr,
                                              GetModuleHandleW(nullptr), nullptr);
                    HWND bar = CreateWindowExW(0, PROGRESS_CLASSW, L"",
                                               WS_CHILD | WS_VISIBLE, 20, 35,
                                               320, 20, pd, (HMENU)IDC_PROG_BAR,
                                               GetModuleHandleW(nullptr), nullptr);
                    HWND lbl = CreateWindowExW(0, L"STATIC", L"Reading file...",
                                               WS_CHILD | WS_VISIBLE, 20, 10,
                                               320, 20, pd,
                                               (HMENU)IDC_PROG_TEXT,
                                               GetModuleHandleW(nullptr), nullptr);
                    SendMessageW(lbl, WM_SETFONT, (WPARAM)g_font, TRUE);
                    SendMessageW(bar, PBM_SETRANGE32, 0, 100);
                    SendMessageW(bar, PBM_SETPOS, 0, 0);
                    SendMessageW(pd, WM_SETFONT, (WPARAM)g_font, TRUE);
                    UpdateWindow(pd);

                    HashProgress ctx = {bar, lbl};
                    g_progress_ctx = &ctx;
                    RomStatus st = validate_rom_file(path);
                    g_progress_ctx = nullptr;
                    DestroyWindow(pd);

                    if (st == RomStatus::Ok) {
                        g_settings.rom_path = w2u(path);
                        save_settings();
                        g_rom_status = RomStatus::Ok;
                        SetWindowTextW(g_rom_label,
                                       (L"ROM: " + path).c_str());
                        refresh_status();
                        show_info(parent, L"ROM verified! Click Play to start the game.");
                    } else {
                        g_rom_status = st;
                        refresh_status();
                        show_error(parent, rom_error_text(st), L"ROM problem");
                    }
                }
                item->Release();
            }
        }
        dlg->Release();
    }
    if (SUCCEEDED(hr)) CoUninitialize();
}

// settings dialog ----------------------------------------------------------
static void settings_apply(HWND dlg) {
    // mods
    HWND list = GetDlgItem(dlg, IDC_MODLIST);
    g_settings.mods_enabled.clear();
    int n = ListView_GetItemCount(list);
    for (int i = 0; i < n; i++) {
        if (ListView_GetCheckState(list, i)) {
            LVITEMW item = {};
            item.mask = LVIF_PARAM;
            item.iItem = i;
            ListView_GetItem(list, &item);
            g_settings.mods_enabled.push_back(
                std::string((const char*)item.lParam));
        }
    }
    // display
    int layout = (int)SendMessageW(GetDlgItem(dlg, IDC_LAYOUT_COMBO),
                                   CB_GETCURSEL, 0, 0);
    g_settings.display_layout = layout == 0 ? "stacked" : "separate";
    // online
    wchar_t namebuf[128] = {};
    GetWindowTextW(GetDlgItem(dlg, IDC_PLAYERNAME), namebuf, 128);
    g_settings.player_name = w2u(namebuf);
    g_settings.online_mode =
        SendMessageW(GetDlgItem(dlg, IDC_ONLINE_CHK), BM_GETCHECK, 0, 0) ==
        BST_CHECKED;
    save_settings();
    write_merged_controller_db();
}

static void import_save(HWND parent) {
    HRESULT hr = CoInitializeEx(nullptr, COINIT_APARTMENTTHREADED);
    IFileOpenDialog* dlg = nullptr;
    if (SUCCEEDED(CoCreateInstance(CLSID_FileOpenDialog, nullptr,
                                   CLSCTX_INPROC_SERVER,
                                   IID_PPV_ARGS(&dlg)))) {
        COMDLG_FILTERSPEC specs[] = {{L"Save file (*.sav)", L"*.sav"},
                                     {L"All files (*.*)", L"*.*"}};
        dlg->SetFileTypes(2, specs);
        dlg->SetTitle(L"Choose a save file to import");
        if (SUCCEEDED(dlg->Show(parent))) {
            IShellItem* item = nullptr;
            if (SUCCEEDED(dlg->GetResult(&item))) {
                PWSTR p = nullptr;
                if (SUCCEEDED(item->GetDisplayName(SIGDN_FILESYSPATH, &p))) {
                    std::wstring src = p;
                    CoTaskMemFree(p);

                    // The original file is NEVER referenced or modified: we
                    // validate it, then copy it in as the app's working save.
                    WIN32_FILE_ATTRIBUTE_DATA fa;
                    if (!GetFileAttributesExW(src.c_str(), GetFileExInfoStandard,
                                              &fa) ||
                        fa.nFileSizeHigh != 0 || fa.nFileSizeLow != 65536) {
                        show_error(parent, L"That file is not a Jump Ultimate "
                                           L"Stars save (expected a 64 KiB .sav "
                                           L"file).");
                    } else if (MessageBoxW(parent,
                                L"Replace the app's current save with this "
                                L"file?\n\nA copy is made inside the app; the "
                                L"original file is never modified or deleted.",
                                L"Import save",
                                MB_YESNO | MB_ICONQUESTION) == IDYES) {
                        ensure_dir(user_dir());
                        if (CopyFileW(src.c_str(), default_save_path().c_str(),
                                      FALSE)) {
                            g_settings.save_path.clear();
                            save_settings();
                            show_info(parent,
                                      L"Save imported — a copy is now the app's "
                                      L"working save.\n\nNote: importing saves "
                                      L"is experimental — the game may still "
                                      L"show the first-boot sequence even with "
                                      L"a valid save (a known issue we are "
                                      L"investigating).");
                        } else {
                            show_error(parent, L"The save could not be copied.");
                        }
                    }
                }
                item->Release();
            }
        }
        dlg->Release();
    }
    if (SUCCEEDED(hr)) CoUninitialize();
}

static void delete_save(HWND parent) {
    // SAFETY: only files inside the app's own directories may ever be
    // deleted. Anything else (e.g. an imported original on another disk)
    // is merely detached — never deleted.
    std::wstring active = g_settings.save_path.empty() ? default_save_path()
                                                       : u2w(g_settings.save_path);
    bool ours = active.rfind(user_dir(), 0) == 0 || active.rfind(app_dir(), 0) == 0;
    std::wstring msg = L"Delete the app's save file?\n\n"
                       L"This resets all in-game progress and cannot be undone.";
    if (!ours)
        msg += L"\n\nThe save file currently in use is outside this app's "
               L"folders — it will only be detached, NOT deleted from disk.";
    if (MessageBoxW(parent, msg.c_str(), L"Delete save",
                    MB_YESNO | MB_ICONWARNING) == IDYES) {
        if (ours && GetFileAttributesW(active.c_str()) != INVALID_FILE_ATTRIBUTES)
            DeleteFileW(active.c_str());
        // also clear the default working save so the next run is truly fresh
        std::wstring work = default_save_path();
        if (work != active &&
            GetFileAttributesW(work.c_str()) != INVALID_FILE_ATTRIBUTES)
            DeleteFileW(work.c_str());
        g_settings.save_path.clear();
        save_settings();
        show_info(parent, L"Save file deleted. The game will start fresh next time.");
    }
}

// controller capture -------------------------------------------------------
enum class CapStep {
    A, B, X, Y, Back, Start, LeftShoulder, RightShoulder,
    DPadUp, DPadDown, DPadLeft, DPadRight,
    LeftStick, RightStick, LeftTrigger, RightTrigger,
    Done
};

static const wchar_t* step_label(CapStep s) {
    switch (s) {
        case CapStep::A: return L"Press A"; break;
        case CapStep::B: return L"Press B"; break;
        case CapStep::X: return L"Press X"; break;
        case CapStep::Y: return L"Press Y"; break;
        case CapStep::Back: return L"Press Back / Select"; break;
        case CapStep::Start: return L"Press Start"; break;
        case CapStep::LeftShoulder: return L"Press Left Shoulder (LB)"; break;
        case CapStep::RightShoulder: return L"Press Right Shoulder (RB)"; break;
        case CapStep::DPadUp: return L"Press D-pad Up"; break;
        case CapStep::DPadDown: return L"Press D-pad Down"; break;
        case CapStep::DPadLeft: return L"Press D-pad Left"; break;
        case CapStep::DPadRight: return L"Press D-pad Right"; break;
        case CapStep::LeftStick: return L"Move the Left Stick any direction"; break;
        case CapStep::RightStick: return L"Move the Right Stick any direction"; break;
        case CapStep::LeftTrigger: return L"Pull the Left Trigger (LT)"; break;
        case CapStep::RightTrigger: return L"Pull the Right Trigger (RT)"; break;
        case CapStep::Done: return L"Done!"; break;
    }
    return L"";
}

struct CaptureState {
    SDL_Joystick* joy = nullptr;
    std::string guid;
    std::string name;
    CapStep step = CapStep::A;
    std::string a, b, x, y, back, start, lb, rb;
    std::string dpu, dpd, dpl, dpr;
    std::string lsx, lsy, rsx, rsy, lt, rt;
    bool waiting_release = false;
    std::string map_str;
};

static std::string sdl_token_button(int btn) {
    return "b" + std::to_string(btn);
}
static std::string sdl_token_axis(int axis, bool positive) {
    return std::string("a") + std::to_string(axis) + (positive ? "" : "-");
}
static std::string sdl_token_hat(int hat, int dir) {
    return "h" + std::to_string(hat) + "." + std::to_string(dir);
}

static CaptureState g_cap;

static void cap_advance(HWND dlg) {
    // require physical release between captures
    g_cap.step = (CapStep)((int)g_cap.step + 1);
    g_cap.waiting_release = true;
    if (g_cap.step == CapStep::Done) {
        // build mapping string
        // Emit only the buttons that were actually captured (skipped steps
        // stay unassigned and are omitted from the mapping string).
        std::string m = g_cap.guid + "," + g_cap.name + ",";
        const std::pair<const char*, const std::string*> fields[] = {
            {"a", &g_cap.a}, {"b", &g_cap.b}, {"x", &g_cap.x}, {"y", &g_cap.y},
            {"back", &g_cap.back}, {"start", &g_cap.start},
            {"leftshoulder", &g_cap.lb}, {"rightshoulder", &g_cap.rb},
            {"lefttrigger", &g_cap.lt}, {"righttrigger", &g_cap.rt},
            {"dpup", &g_cap.dpu}, {"dpdown", &g_cap.dpd},
            {"dpleft", &g_cap.dpl}, {"dpright", &g_cap.dpr},
            {"leftx", &g_cap.lsx}, {"lefty", &g_cap.lsy},
            {"rightx", &g_cap.rsx}, {"righty", &g_cap.rsy},
        };
        for (const auto& f : fields)
            if (!f.second->empty()) {
                m += f.first;
                m += ":";
                m += *f.second;
                m += ",";
            }
        m += "platform:Windows,";
        g_cap.map_str = m;
        g_settings.controller_mappings.push_back(m);
        save_settings();
        std::wstring done = L"Mapping saved! Close this window.";
        if (g_cap.a.empty() || g_cap.b.empty())
            done += L"\n\nNote: some buttons were left unassigned — you can "
                    L"reconfigure any time.";
        SetWindowTextW(GetDlgItem(dlg, IDC_CAP_STATE), done.c_str());
        return;
    }
    SetWindowTextW(GetDlgItem(dlg, IDC_CAP_STATE), step_label(g_cap.step));
}

static void cap_assign_button(const std::string& tok) {
    switch (g_cap.step) {
        case CapStep::A: g_cap.a = tok; break;
        case CapStep::B: g_cap.b = tok; break;
        case CapStep::X: g_cap.x = tok; break;
        case CapStep::Y: g_cap.y = tok; break;
        case CapStep::Back: g_cap.back = tok; break;
        case CapStep::Start: g_cap.start = tok; break;
        case CapStep::LeftShoulder: g_cap.lb = tok; break;
        case CapStep::RightShoulder: g_cap.rb = tok; break;
        default: break;
    }
}

static void cap_assign_hat(int hat, int dir) {
    std::string tok = sdl_token_hat(hat, dir);
    switch (g_cap.step) {
        case CapStep::DPadUp: g_cap.dpu = tok; break;
        case CapStep::DPadDown: g_cap.dpd = tok; break;
        case CapStep::DPadLeft: g_cap.dpl = tok; break;
        case CapStep::DPadRight: g_cap.dpr = tok; break;
        default: break;
    }
}

// Assigns an axis event to the current step. Returns true when the step has
// everything it needs (sticks need BOTH axes; triggers need one axis).
static bool cap_assign_axis(int axis, bool pos) {
    std::string tok = sdl_token_axis(axis, pos);
    switch (g_cap.step) {
        case CapStep::LeftStick:
            if (axis == 0) { g_cap.lsx = tok; return !g_cap.lsy.empty(); }
            if (axis == 1) { g_cap.lsy = tok; return !g_cap.lsx.empty(); }
            return false;
        case CapStep::RightStick:
            if (axis == 2) { g_cap.rsx = tok; return !g_cap.rsy.empty(); }
            if (axis == 3) { g_cap.rsy = tok; return !g_cap.rsx.empty(); }
            return false;
        case CapStep::LeftTrigger:
            if (axis == 4 || axis == 5) { g_cap.lt = tok; return true; }
            return false;
        case CapStep::RightTrigger:
            if (axis == 5 || axis == 4) { g_cap.rt = tok; return true; }
            return false;
        default:
            return false;
    }
}

static void cap_poll(HWND dlg) {
    if (g_cap.step == CapStep::Done || !g_cap.joy) return;
    SDL_JoystickUpdate();
    int nbuttons = SDL_JoystickNumButtons(g_cap.joy);
    int naxes = SDL_JoystickNumAxes(g_cap.joy);
    int nhats = SDL_JoystickNumHats(g_cap.joy);
    bool dpad_step = (g_cap.step >= CapStep::DPadUp && g_cap.step <= CapStep::DPadRight);
    bool stick_step = (g_cap.step == CapStep::LeftStick || g_cap.step == CapStep::RightStick);
    bool trig_step = (g_cap.step == CapStep::LeftTrigger || g_cap.step == CapStep::RightTrigger);

    if (!g_cap.waiting_release) {
        if (dpad_step && nhats > 0) {
            Uint8 h = SDL_JoystickGetHat(g_cap.joy, 0);
            if (h != SDL_HAT_CENTERED) {
                int dir = h == SDL_HAT_UP ? 1 : h == SDL_HAT_RIGHT ? 2 :
                          h == SDL_HAT_DOWN ? 4 : h == SDL_HAT_LEFT ? 8 : 1;
                cap_assign_hat(0, dir);
                cap_advance(dlg);
                return;
            }
            // fallback: dpad on axes (SDL hat mapping: up=1 right=2 down=4 left=8)
            for (int a = 0; a < naxes; a++) {
                Sint16 v = SDL_JoystickGetAxis(g_cap.joy, a);
                if (v > 16384) { cap_assign_hat(0, a == 0 ? 2 : 4); cap_advance(dlg); return; }
                if (v < -16384) { cap_assign_hat(0, a == 0 ? 8 : 1); cap_advance(dlg); return; }
            }
        } else if (stick_step || trig_step) {
            for (int a = 0; a < naxes; a++) {
                Sint16 v = SDL_JoystickGetAxis(g_cap.joy, a);
                if (v > 16384) {
                    if (cap_assign_axis(a, true)) { cap_advance(dlg); return; }
                } else if (v < -16384) {
                    if (cap_assign_axis(a, false)) { cap_advance(dlg); return; }
                }
            }
            if (trig_step) {
                // some pads expose triggers as buttons
                for (int b = 0; b < nbuttons; b++) {
                    if (SDL_JoystickGetButton(g_cap.joy, b)) {
                        std::string tok = sdl_token_button(b);
                        if (g_cap.step == CapStep::LeftTrigger) g_cap.lt = tok;
                        else g_cap.rt = tok;
                        cap_advance(dlg);
                        return;
                    }
                }
            }
        } else {
            for (int b = 0; b < nbuttons; b++) {
                if (SDL_JoystickGetButton(g_cap.joy, b)) {
                    cap_assign_button(sdl_token_button(b));
                    cap_advance(dlg);
                    return;
                }
            }
            // buttons may be on the hat (fight sticks)
            if (nhats > 0) {
                Uint8 h = SDL_JoystickGetHat(g_cap.joy, 0);
                if (h != SDL_HAT_CENTERED) {
                    int dir = h == SDL_HAT_UP ? 1 : h == SDL_HAT_RIGHT ? 2 :
                              h == SDL_HAT_DOWN ? 4 : h == SDL_HAT_LEFT ? 8 : 1;
                    cap_assign_button(sdl_token_hat(0, dir));
                    cap_advance(dlg);
                    return;
                }
            }
        }
    } else {
        // waiting for release: all inputs must return to neutral
        bool released = true;
        for (int b = 0; b < nbuttons && released; b++)
            if (SDL_JoystickGetButton(g_cap.joy, b)) released = false;
        for (int a = 0; a < naxes && released; a++)
            if (SDL_JoystickGetAxis(g_cap.joy, a) > 8192 ||
                SDL_JoystickGetAxis(g_cap.joy, a) < -8192) released = false;
        for (int h = 0; h < nhats && released; h++)
            if (SDL_JoystickGetHat(g_cap.joy, h) != SDL_HAT_CENTERED)
                released = false;
        if (released) {
            g_cap.waiting_release = false;
            if (g_cap.step != CapStep::Done)
                SetWindowTextW(GetDlgItem(dlg, IDC_CAP_STATE),
                               step_label(g_cap.step));
        }
    }
}

static HWND g_cap_dlg = nullptr;

static LRESULT CALLBACK capture_proc(HWND hwnd, UINT msg, WPARAM wp, LPARAM lp) {
    switch (msg) {
        case WM_CREATE: {
            g_cap_dlg = hwnd;
            HWND dev = CreateWindowExW(0, L"COMBOBOX", L"",
                                       WS_CHILD | WS_VISIBLE | CBS_DROPDOWNLIST,
                                       20, 15, 300, 200, hwnd,
                                       (HMENU)IDC_CAP_DEVICE,
                                       GetModuleHandleW(nullptr), nullptr);
            int n = SDL_NumJoysticks();
            for (int i = 0; i < n; i++) {
                std::string name = SDL_JoystickNameForIndex(i)
                                       ? SDL_JoystickNameForIndex(i) : "device";
                SendMessageW(dev, CB_ADDSTRING, 0, (LPARAM)u2w(name).c_str());
            }
            if (n > 0) SendMessageW(dev, CB_SETCURSEL, 0, 0);
            SendMessageW(dev, WM_SETFONT, (WPARAM)g_font, TRUE);

            CreateWindowExW(0, L"BUTTON", L"Start capture",
                            WS_CHILD | WS_VISIBLE | BS_PUSHBUTTON, 340, 14, 110,
                            24, hwnd, (HMENU)IDC_CAP_START,
                            GetModuleHandleW(nullptr), nullptr);
            CreateWindowExW(0, L"BUTTON", L"Skip",
                            WS_CHILD | WS_VISIBLE | BS_PUSHBUTTON, 340, 44, 110,
                            24, hwnd, (HMENU)IDC_CAP_SKIP,
                            GetModuleHandleW(nullptr), nullptr);
            HWND st = CreateWindowExW(0, L"STATIC",
                                      L"Select your device and press Start. "
                                      L"Skip leaves the current button unassigned.",
                                      WS_CHILD | WS_VISIBLE, 20, 60, 430, 40,
                                      hwnd, (HMENU)IDC_CAP_STATE,
                                      GetModuleHandleW(nullptr), nullptr);
            SendMessageW(st, WM_SETFONT, (WPARAM)g_font, TRUE);
            CreateWindowExW(0, L"BUTTON", L"Close",
                            WS_CHILD | WS_VISIBLE | BS_PUSHBUTTON, 360, 110, 90,
                            24, hwnd, (HMENU)IDC_CAP_DONE,
                            GetModuleHandleW(nullptr), nullptr);
            SetTimer(hwnd, 1, 16, nullptr);
            break;
        }
        case WM_TIMER:
            if (wp == 1) cap_poll(hwnd);
            break;
        case WM_COMMAND:
            switch (LOWORD(wp)) {
                case IDC_CAP_START: {
                    int idx = (int)SendMessageW(GetDlgItem(hwnd, IDC_CAP_DEVICE),
                                                CB_GETCURSEL, 0, 0);
                    if (idx < 0 || idx >= SDL_NumJoysticks()) {
                        show_error(hwnd, L"No controller detected.\n\nPlug in a "
                                         L"controller, wait a moment, then reopen "
                                         L"this window.");
                        break;
                    }
                    if (g_cap.joy) SDL_JoystickClose(g_cap.joy);
                    g_cap = CaptureState{};
                    g_cap.joy = SDL_JoystickOpen(idx);
                    if (!g_cap.joy) {
                        show_error(hwnd, L"The controller could not be opened.");
                        break;
                    }
                    char guid[64];
                    SDL_JoystickGetGUIDString(SDL_JoystickGetGUID(g_cap.joy),
                                              guid, sizeof(guid));
                    g_cap.guid = guid;
                    g_cap.name = SDL_JoystickName(g_cap.joy)
                                     ? SDL_JoystickName(g_cap.joy) : "controller";
                    // sanitize commas in the name (mapping-string format)
                    for (auto& c : g_cap.name) if (c == ',') c = ' ';
                    g_cap.step = CapStep::A;
                    SetWindowTextW(GetDlgItem(hwnd, IDC_CAP_STATE),
                                   step_label(g_cap.step));
                    EnableWindow(GetDlgItem(hwnd, IDC_CAP_START), FALSE);
                    break;
                }
                case IDC_CAP_SKIP:
                    if (g_cap.joy && g_cap.step != CapStep::Done)
                        cap_advance(hwnd);
                    break;
                case IDC_CAP_DONE:
                    DestroyWindow(hwnd);
                    break;
            }
            break;
        case WM_DESTROY:
            KillTimer(hwnd, 1);
            if (g_cap.joy) { SDL_JoystickClose(g_cap.joy); g_cap.joy = nullptr; }
            g_cap_dlg = nullptr;
            break;
    }
    return DefWindowProcW(hwnd, msg, wp, lp);
}

static void open_capture_dialog(HWND parent) {
    if (g_cap_dlg) { SetForegroundWindow(g_cap_dlg); return; }
    CreateWindowExW(0, L"JUSCaptureWnd", L"Controller setup",
                    WS_OVERLAPPED | WS_CAPTION | WS_SYSMENU | WS_VISIBLE,
                    CW_USEDEFAULT, CW_USEDEFAULT, 480, 180, parent, nullptr,
                    GetModuleHandleW(nullptr), nullptr);
}

// keyboard capture dialog ---------------------------------------------------
// Walks the 12 DS buttons, capturing one host key each (Esc skips a button,
// leaving the built-in default). Results are stored as "button:key" pairs in
// settings.json and emitted to the run config as [[input.keyboard]] tables;
// the runner applies them at startup (frontend.cpp key_bit remap).
static const struct { const char* id; const wchar_t* label; } kKbButtons[] = {
    {"a", L"A"}, {"b", L"B"}, {"select", L"Select"}, {"start", L"Start"},
    {"right", L"Right"}, {"left", L"Left"}, {"up", L"Up"}, {"down", L"Down"},
    {"r", L"R (right shoulder)"}, {"l", L"L (left shoulder)"},
    {"x", L"X"}, {"y", L"Y"},
};

struct KbState {
    int step = 0;
    bool active = false;
    std::string keys[12];
};
static KbState g_kb;
static HWND g_kb_dlg = nullptr;

// Win32 virtual-key -> SDL scancode name (what the runner parses).
static std::string vk_to_sdl_key_name(WPARAM vk) {
    if (vk >= 'A' && vk <= 'Z') return std::string(1, (char)vk);
    if (vk >= '0' && vk <= '9') return std::string(1, (char)vk);
    if (vk >= VK_NUMPAD0 && vk <= VK_NUMPAD9)
        return "Keypad " + std::to_string((int)(vk - VK_NUMPAD0));
    if (vk >= VK_F1 && vk <= VK_F12)
        return "F" + std::to_string((int)(vk - VK_F1 + 1));
    switch (vk) {
        case VK_UP: return "Up";
        case VK_DOWN: return "Down";
        case VK_LEFT: return "Left";
        case VK_RIGHT: return "Right";
        case VK_RETURN: return "Return";
        case VK_BACK: return "Backspace";
        case VK_SPACE: return "Space";
        case VK_TAB: return "Tab";
        case VK_LSHIFT: return "Left Shift";
        case VK_RSHIFT: return "Right Shift";
        case VK_LCONTROL: return "Left Ctrl";
        case VK_RCONTROL: return "Right Ctrl";
        case VK_LMENU: return "Left Alt";
        case VK_RMENU: return "Right Alt";
        case VK_INSERT: return "Insert";
        case VK_DELETE: return "Delete";
        case VK_HOME: return "Home";
        case VK_END: return "End";
        case VK_PRIOR: return "PageUp";
        case VK_NEXT: return "PageDown";
        case VK_OEM_COMMA: return ",";
        case VK_OEM_PERIOD: return ".";
        case VK_OEM_MINUS: return "-";
        case VK_OEM_PLUS: return "=";
        case VK_OEM_1: return ";";
        case VK_OEM_2: return "/";
        case VK_OEM_3: return "`";
        case VK_OEM_4: return "[";
        case VK_OEM_5: return "\\";
        case VK_OEM_6: return "]";
        case VK_OEM_7: return "'";
        default: return "";
    }
}

static std::wstring kb_prompt(int step) {
    if (step >= 12)
        return L"Keyboard mapping saved! Close this window.";
    return std::wstring(L"Press the key for [") + kKbButtons[step].label +
           L"]\n(Esc = skip and keep the default for this button)";
}

static void kb_finish(HWND dlg) {
    g_kb.active = false;
    g_settings.keyboard_mappings.clear();
    for (int i = 0; i < 12; i++) {
        if (!g_kb.keys[i].empty())
            g_settings.keyboard_mappings.push_back(
                std::string(kKbButtons[i].id) + ":" + g_kb.keys[i]);
    }
    save_settings();
    SetWindowTextW(GetDlgItem(dlg, IDC_KB_STATE),
                   L"Keyboard mapping saved! Close this window.");
}

static void kb_advance(HWND dlg) {
    g_kb.step++;
    if (g_kb.step >= 12) {
        kb_finish(dlg);
        return;
    }
    SetWindowTextW(GetDlgItem(dlg, IDC_KB_STATE), kb_prompt(g_kb.step).c_str());
}

static LRESULT CALLBACK kb_proc(HWND hwnd, UINT msg, WPARAM wp, LPARAM lp) {
    switch (msg) {
        case WM_CREATE: {
            g_kb_dlg = hwnd;
            HWND st = CreateWindowExW(
                0, L"STATIC",
                L"Map the keyboard: 12 buttons, one key each.",
                WS_CHILD | WS_VISIBLE, 20, 15, 430, 40, hwnd,
                (HMENU)IDC_KB_STATE, GetModuleHandleW(nullptr), nullptr);
            SendMessageW(st, WM_SETFONT, (WPARAM)g_font, TRUE);
            CreateWindowExW(0, L"BUTTON", L"Skip (Esc)",
                            WS_CHILD | WS_VISIBLE | BS_PUSHBUTTON, 340, 60,
                            110, 24, hwnd, (HMENU)IDC_KB_SKIP,
                            GetModuleHandleW(nullptr), nullptr);
            CreateWindowExW(0, L"BUTTON", L"Reset to defaults",
                            WS_CHILD | WS_VISIBLE | BS_PUSHBUTTON, 20, 110,
                            140, 24, hwnd, (HMENU)IDC_KB_RESET,
                            GetModuleHandleW(nullptr), nullptr);
            CreateWindowExW(0, L"BUTTON", L"Close",
                            WS_CHILD | WS_VISIBLE | BS_PUSHBUTTON, 360, 110,
                            90, 24, hwnd, (HMENU)IDC_KB_DONE,
                            GetModuleHandleW(nullptr), nullptr);
            EnumChildWindows(hwnd, [](HWND c, LPARAM) {
                SendMessageW(c, WM_SETFONT, (WPARAM)g_font, TRUE);
                return TRUE;
            }, 0);
            g_kb = KbState{};
            g_kb.active = true;
            SetFocus(hwnd);
            SetWindowTextW(GetDlgItem(hwnd, IDC_KB_STATE),
                           kb_prompt(0).c_str());
            break;
        }
        case WM_ACTIVATE:
            if (g_kb.active && wp != WA_INACTIVE) SetFocus(hwnd);
            break;
        case WM_KEYDOWN:
            if (!g_kb.active) break;
            if (wp == VK_ESCAPE) {
                kb_advance(hwnd);  // skip: keep the built-in default
                break;
            }
            {
                std::string name = vk_to_sdl_key_name(wp);
                if (name.empty()) {
                    SetWindowTextW(GetDlgItem(hwnd, IDC_KB_STATE),
                                   L"That key can't be mapped — try another. "
                                   L"(Esc = skip)");
                    break;
                }
                g_kb.keys[g_kb.step] = name;
                kb_advance(hwnd);
            }
            break;
        case WM_COMMAND:
            switch (LOWORD(wp)) {
                case IDC_KB_SKIP:
                    if (g_kb.active) kb_advance(hwnd);
                    break;
                case IDC_KB_RESET:
                    g_settings.keyboard_mappings.clear();
                    save_settings();
                    g_kb.active = false;
                    SetWindowTextW(GetDlgItem(hwnd, IDC_KB_STATE),
                                   L"Keyboard defaults restored "
                                   L"(Z/X = A/B, A/S = Y/X, Q/W = L/R, "
                                   L"arrows, Backspace/Return = "
                                   L"Select/Start).");
                    break;
                case IDC_KB_DONE:
                    if (g_kb.active) kb_finish(hwnd);
                    DestroyWindow(hwnd);
                    break;
            }
            break;
        case WM_CLOSE:
            if (g_kb.active) kb_finish(hwnd);
            DestroyWindow(hwnd);
            break;
        case WM_DESTROY:
            g_kb_dlg = nullptr;
            break;
    }
    return DefWindowProcW(hwnd, msg, wp, lp);
}

static void open_keyboard_dialog(HWND parent) {
    if (g_kb_dlg) { SetForegroundWindow(g_kb_dlg); return; }
    CreateWindowExW(0, L"JUSKbWnd", L"Keyboard setup",
                    WS_OVERLAPPED | WS_CAPTION | WS_SYSMENU | WS_VISIBLE,
                    CW_USEDEFAULT, CW_USEDEFAULT, 480, 180, parent, nullptr,
                    GetModuleHandleW(nullptr), nullptr);
}

// settings window ----------------------------------------------------------
static LRESULT CALLBACK settings_proc(HWND hwnd, UINT msg, WPARAM wp, LPARAM lp) {
    switch (msg) {
        case WM_CREATE: {
            // mods
            CreateWindowExW(0, L"STATIC", L"Mods (take effect next launch)",
                            WS_CHILD | WS_VISIBLE, 20, 10, 240, 18, hwnd,
                            nullptr, GetModuleHandleW(nullptr), nullptr);
            HWND list = CreateWindowExW(WS_EX_CLIENTEDGE, WC_LISTVIEWW, L"",
                                        WS_CHILD | WS_VISIBLE | LVS_REPORT |
                                            LVS_SINGLESEL | LVS_NOCOLUMNHEADER,
                                        20, 30, 330, 150, hwnd,
                                        (HMENU)IDC_MODLIST,
                                        GetModuleHandleW(nullptr), nullptr);
            ListView_SetExtendedListViewStyle(
                list, LVS_EX_CHECKBOXES | LVS_EX_FULLROWSELECT);
            LVCOLUMNW col = {};
            col.mask = LVCF_TEXT | LVCF_WIDTH;
            col.pszText = const_cast<wchar_t*>(L"mod");
            col.cx = 300;
            ListView_InsertColumn(list, 0, &col);
            int row = 0;
            for (const auto& mod : g_mods) {
                std::wstring label = u2w(mod.name + "  (v" + mod.version + ")");
                LVITEMW item = {};
                item.mask = LVIF_TEXT | LVIF_PARAM;
                item.iItem = row;
                item.pszText = const_cast<wchar_t*>(label.c_str());
                item.lParam = (LPARAM)_strdup(mod.id.c_str());
                int inserted = ListView_InsertItem(list, &item);
                ListView_SetCheckState(list, inserted,
                                       mod_enabled(mod.id) ? TRUE : FALSE);
                row++;
            }
            if (g_mods.empty()) {
                LVITEMW item = {};
                item.mask = LVIF_TEXT;
                item.iItem = 0;
                item.pszText = const_cast<wchar_t*>(L"(no bundled mods)");
                ListView_InsertItem(list, &item);
            }

            // display
            CreateWindowExW(0, L"STATIC", L"Screen layout", WS_CHILD | WS_VISIBLE,
                            380, 10, 150, 18, hwnd, nullptr,
                            GetModuleHandleW(nullptr), nullptr);
            HWND layout = CreateWindowExW(0, L"COMBOBOX", L"",
                                          WS_CHILD | WS_VISIBLE |
                                              CBS_DROPDOWNLIST,
                                          380, 30, 140, 120, hwnd,
                                          (HMENU)IDC_LAYOUT_COMBO,
                                          GetModuleHandleW(nullptr), nullptr);
            SendMessageW(layout, CB_ADDSTRING, 0, (LPARAM)L"Stacked screens");
            SendMessageW(layout, CB_ADDSTRING, 0, (LPARAM)L"Separate screens");
            SendMessageW(layout, CB_SETCURSEL,
                         g_settings.display_layout == "separate" ? 1 : 0, 0);

            // controllers
            CreateWindowExW(0, L"STATIC", L"Controller", WS_CHILD | WS_VISIBLE,
                            380, 65, 150, 18, hwnd, nullptr,
                            GetModuleHandleW(nullptr), nullptr);
            CreateWindowExW(0, L"BUTTON", L"Configure controller...",
                            WS_CHILD | WS_VISIBLE | BS_PUSHBUTTON, 380, 85,
                            150, 24, hwnd, (HMENU)IDC_CTRL_CONFIGURE,
                            GetModuleHandleW(nullptr), nullptr);

            // keyboard
            CreateWindowExW(0, L"STATIC", L"Keyboard", WS_CHILD | WS_VISIBLE,
                            380, 120, 150, 18, hwnd, nullptr,
                            GetModuleHandleW(nullptr), nullptr);
            CreateWindowExW(0, L"BUTTON", L"Map keyboard...",
                            WS_CHILD | WS_VISIBLE | BS_PUSHBUTTON, 380, 140,
                            150, 24, hwnd, (HMENU)IDC_KB_CONFIGURE,
                            GetModuleHandleW(nullptr), nullptr);

            // online (Wiimmfi)
            CreateWindowExW(0, L"STATIC", L"Player name (online)",
                            WS_CHILD | WS_VISIBLE, 380, 172, 150, 18, hwnd,
                            nullptr, GetModuleHandleW(nullptr), nullptr);
            HWND pname = CreateWindowExW(WS_EX_CLIENTEDGE, L"EDIT", L"",
                                         WS_CHILD | WS_VISIBLE | ES_AUTOHSCROLL,
                                         380, 192, 150, 22, hwnd,
                                         (HMENU)IDC_PLAYERNAME,
                                         GetModuleHandleW(nullptr), nullptr);
            if (!g_settings.player_name.empty())
                SetWindowTextW(pname, u2w(g_settings.player_name).c_str());
            HWND online = CreateWindowExW(0, L"BUTTON",
                                          L"Online mode (Wiimmfi)",
                                          WS_CHILD | WS_VISIBLE | BS_AUTOCHECKBOX,
                                          380, 219, 150, 20, hwnd,
                                          (HMENU)IDC_ONLINE_CHK,
                                          GetModuleHandleW(nullptr), nullptr);
            SendMessageW(online, BM_SETCHECK,
                         g_settings.online_mode ? BST_CHECKED : BST_UNCHECKED,
                         0);

            // save data
            CreateWindowExW(0, L"STATIC", L"Save data", WS_CHILD | WS_VISIBLE,
                            20, 200, 150, 18, hwnd, nullptr,
                            GetModuleHandleW(nullptr), nullptr);
            CreateWindowExW(0, L"BUTTON", L"Import save file...",
                            WS_CHILD | WS_VISIBLE | BS_PUSHBUTTON, 20, 220,
                            150, 24, hwnd, (HMENU)IDC_IMPORT_SAVE,
                            GetModuleHandleW(nullptr), nullptr);
            CreateWindowExW(0, L"BUTTON", L"Delete save (fresh start)",
                            WS_CHILD | WS_VISIBLE | BS_PUSHBUTTON, 180, 220,
                            170, 24, hwnd, (HMENU)IDC_DELETE_SAVE,
                            GetModuleHandleW(nullptr), nullptr);

            // bottom buttons
            CreateWindowExW(0, L"BUTTON", L"OK", WS_CHILD | WS_VISIBLE |
                                BS_PUSHBUTTON | BS_DEFPUSHBUTTON,
                            380, 260, 90, 26, hwnd, (HMENU)IDC_OK,
                            GetModuleHandleW(nullptr), nullptr);
            CreateWindowExW(0, L"BUTTON", L"Cancel", WS_CHILD | WS_VISIBLE |
                                BS_PUSHBUTTON,
                            480, 260, 90, 26, hwnd, (HMENU)IDC_CANCEL,
                            GetModuleHandleW(nullptr), nullptr);

            // font
            EnumChildWindows(hwnd, [](HWND c, LPARAM) {
                SendMessageW(c, WM_SETFONT, (WPARAM)g_font, TRUE);
                return TRUE;
            }, 0);
            break;
        }
        case WM_COMMAND:
            switch (LOWORD(wp)) {
                case IDC_OK:
                    settings_apply(hwnd);
                    DestroyWindow(hwnd);
                    break;
                case IDC_CANCEL:
                    DestroyWindow(hwnd);
                    break;
                case IDC_CTRL_CONFIGURE:
                    open_capture_dialog(hwnd);
                    break;
                case IDC_KB_CONFIGURE:
                    open_keyboard_dialog(hwnd);
                    break;
                case IDC_IMPORT_SAVE:
                    import_save(hwnd);
                    break;
                case IDC_DELETE_SAVE:
                    delete_save(hwnd);
                    break;
            }
            break;
        case WM_CLOSE:
            DestroyWindow(hwnd);
            break;
    }
    return DefWindowProcW(hwnd, msg, wp, lp);
}

static void open_settings(HWND parent) {
    CreateWindowExW(0, L"JUSSettingsWnd", L"Settings — JUSDecomp",
                    WS_OVERLAPPED | WS_CAPTION | WS_SYSMENU | WS_VISIBLE,
                    CW_USEDEFAULT, CW_USEDEFAULT, 600, 330, parent, nullptr,
                    GetModuleHandleW(nullptr), nullptr);
}

// main window --------------------------------------------------------------
static LRESULT CALLBACK main_proc(HWND hwnd, UINT msg, WPARAM wp, LPARAM lp) {
    switch (msg) {
        case WM_CREATE: {
            g_main = hwnd;
            g_rom_label = CreateWindowExW(
                0, L"STATIC", L"ROM: (none selected)", WS_CHILD | WS_VISIBLE,
                20, 20, 700, 24, hwnd, (HMENU)IDC_ROM_LABEL,
                GetModuleHandleW(nullptr), nullptr);
            g_play = CreateWindowExW(
                0, L"BUTTON", L"Play Jump Ultimate Stars", WS_CHILD | WS_VISIBLE |
                    BS_PUSHBUTTON | BS_DEFPUSHBUTTON,
                240, 200, 240, 44, hwnd, (HMENU)IDC_PLAY,
                GetModuleHandleW(nullptr), nullptr);
            CreateWindowExW(0, L"BUTTON", L"Change ROM...", WS_CHILD | WS_VISIBLE |
                                BS_PUSHBUTTON,
                            300, 260, 120, 28, hwnd, (HMENU)IDC_CHANGE_ROM,
                            GetModuleHandleW(nullptr), nullptr);
            CreateWindowExW(0, L"BUTTON", L"Settings", WS_CHILD | WS_VISIBLE |
                                BS_PUSHBUTTON,
                            300, 300, 120, 28, hwnd, (HMENU)IDC_SETTINGS,
                            GetModuleHandleW(nullptr), nullptr);
            CreateWindowExW(0, L"BUTTON", L"Help", WS_CHILD | WS_VISIBLE |
                                BS_PUSHBUTTON,
                            300, 340, 120, 28, hwnd, (HMENU)IDC_GUIDE,
                            GetModuleHandleW(nullptr), nullptr);
            CreateWindowExW(0, L"BUTTON", L"Open log", WS_CHILD | WS_VISIBLE |
                                BS_PUSHBUTTON,
                            620, 400, 90, 24, hwnd, (HMENU)IDC_OPEN_LOG,
                            GetModuleHandleW(nullptr), nullptr);
            g_status = CreateWindowExW(
                0, L"STATIC", L"", WS_CHILD | WS_VISIBLE, 20, 420, 700, 24,
                hwnd, (HMENU)IDC_ROM_STATUS, GetModuleHandleW(nullptr), nullptr);
            EnumChildWindows(hwnd, [](HWND c, LPARAM) {
                SendMessageW(c, WM_SETFONT, (WPARAM)g_font, TRUE);
                return TRUE;
            }, 0);

            // restore state
            if (!g_settings.rom_path.empty()) {
                std::wstring p = u2w(g_settings.rom_path);
                SetWindowTextW(g_rom_label, (L"ROM: " + p).c_str());
                HashProgress ctx{};
                g_rom_status = validate_rom_file(p);
                if (g_rom_status == RomStatus::Ok)
                    log_line("stored ROM re-verified: %s",
                             w2u(p).c_str());
            }
            refresh_status();

            wchar_t title[128];
            swprintf(title, 128, L"JUSDecomp %hs", APP_VERSION);
            SetWindowTextW(hwnd, title);
            break;
        }
        case WM_COMMAND:
            switch (LOWORD(wp)) {
                case IDC_PLAY:
                    launch_game(hwnd);
                    break;
                case IDC_CHANGE_ROM:
                    pick_rom(hwnd);
                    break;
                case IDC_SETTINGS:
                    open_settings(hwnd);
                    break;
                case IDC_GUIDE: {
                    std::wstring guide = app_dir() + L"\\docs\\USER_GUIDE.txt";
                    if (GetFileAttributesW(guide.c_str()) ==
                        INVALID_FILE_ATTRIBUTES)
                        show_info(hwnd, L"The user guide could not be found.");
                    else
                        ShellExecuteW(hwnd, L"open", L"notepad.exe",
                                      (L"\"" + guide + L"\"").c_str(), nullptr,
                                      SW_SHOWNORMAL);
                    break;
                }
                case IDC_OPEN_LOG:
                    open_log(hwnd);
                    break;
            }
            break;
        case WM_DESTROY:
            PostQuitMessage(0);
            break;
    }
    return DefWindowProcW(hwnd, msg, wp, lp);
}

// ---------------------------------------------------------------------------
// Entry point
// ---------------------------------------------------------------------------
static void register_classes(HINSTANCE inst) {
    WNDCLASSW wc = {};
    wc.lpfnWndProc = main_proc;
    wc.hInstance = inst;
    wc.hCursor = LoadCursorW(nullptr, IDC_ARROW);
    wc.hbrBackground = (HBRUSH)(COLOR_BTNFACE + 1);
    wc.lpszClassName = L"JUSMainWnd";
    RegisterClassW(&wc);

    wc.lpfnWndProc = settings_proc;
    wc.lpszClassName = L"JUSSettingsWnd";
    RegisterClassW(&wc);

    wc.lpfnWndProc = capture_proc;
    wc.lpszClassName = L"JUSCaptureWnd";
    RegisterClassW(&wc);

    wc.lpfnWndProc = kb_proc;
    wc.lpszClassName = L"JUSKbWnd";
    RegisterClassW(&wc);
}

int WINAPI wWinMain(HINSTANCE inst, HINSTANCE, PWSTR, int) {
    // DPI awareness (best effort on Win10+)
    {
        HMODULE user32 = GetModuleHandleW(L"user32.dll");
        auto fn = (BOOL(WINAPI*)(DPI_AWARENESS_CONTEXT))GetProcAddress(
            user32, "SetProcessDpiAwarenessContext");
        if (fn) fn(DPI_AWARENESS_CONTEXT_PER_MONITOR_AWARE_V2);
    }

    INITCOMMONCONTROLSEX icc = {sizeof(icc), ICC_STANDARD_CLASSES |
                                                 ICC_LISTVIEW_CLASSES |
                                                 ICC_PROGRESS_CLASS};
    InitCommonControlsEx(&icc);

    g_font = CreateFontW(-13, 0, 0, 0, FW_NORMAL, FALSE, FALSE, FALSE,
                         DEFAULT_CHARSET, OUT_DEFAULT_PRECIS,
                         CLIP_DEFAULT_PRECIS, CLEARTYPE_QUALITY,
                         DEFAULT_PITCH, L"Segoe UI");

    ensure_dir(user_dir());
    log_line("===== JUSDecomp %s started =====", APP_VERSION);
    load_settings();
    load_modindex();

    if (SDL_Init(SDL_INIT_JOYSTICK) != 0)
        log_line("SDL joystick init failed: %s", SDL_GetError());

    register_classes(inst);

    HWND main = CreateWindowExW(
        0, L"JUSMainWnd", L"JUSDecomp",
        WS_OVERLAPPED | WS_CAPTION | WS_SYSMENU | WS_MINIMIZEBOX | WS_VISIBLE,
        CW_USEDEFAULT, CW_USEDEFAULT, 740, 500, nullptr, nullptr, inst,
        nullptr);
    if (!main) {
        show_error(nullptr, L"Could not create the main window.");
        return 1;
    }
    SendMessageW(main, WM_SETFONT, (WPARAM)g_font, TRUE);

    MSG msg;
    while (GetMessageW(&msg, nullptr, 0, 0) > 0) {
        TranslateMessage(&msg);
        DispatchMessageW(&msg);
    }

    save_settings();
    SDL_Quit();
    log_line("===== JUSDecomp exiting =====");
    return 0;
}
