// Native Linux port of the JUSDecomp launcher.

#include <gtk/gtk.h>
#include <gdk/gdkkeysyms.h>
#include <SDL.h>

#include <algorithm>
#include <array>
#include <cerrno>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <filesystem>
#include <fstream>
#include <string>
#include <vector>

#include <fcntl.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>

#include "json.h"

namespace fs = std::filesystem;

static constexpr const char* APP_VERSION = "0.3.1";
static constexpr const char* STOCK_SHA1 =
    "ba58e20ee60eb81c33dcd4934a21271baa9f954a";
static constexpr std::uintmax_t STOCK_SIZE = 0x4000000ULL;
static const fs::path PROJECT_ROOT = fs::path(JUS_PROJECT_ROOT);

struct Settings {
    int version = 1;
    std::string rom_path;
    std::vector<std::string> mods_enabled;
    std::string display_layout = "stacked";
    std::string save_path;
    std::string player_name;
    bool online_mode = true;
    std::vector<std::string> controller_mappings;
    std::vector<std::string> keyboard_mappings;
};

struct Overlay { std::string offset; std::string file; };
struct ModInfo {
    std::string id, name, version, author, description;
    std::vector<Overlay> overlays;
};

static Settings settings;
static std::vector<ModInfo> mods;
static GtkWidget* main_window = nullptr;
static GtkWidget* rom_label = nullptr;
static GtkWidget* status_label = nullptr;
static GtkWidget* play_button = nullptr;
static bool rom_valid = false;

static fs::path executable_dir() {
    std::error_code ec;
    fs::path exe = fs::read_symlink("/proc/self/exe", ec);
    return ec ? fs::current_path() : exe.parent_path();
}

static fs::path app_root() {
    const fs::path dir = executable_dir();
    if (fs::exists(dir / "app/nds_runner") || fs::exists(dir / "mods/modindex.json"))
        return dir;
    return PROJECT_ROOT;
}

static bool portable_mode() {
    return fs::is_regular_file(executable_dir() / "portable.txt");
}

static fs::path user_dir() {
    if (portable_mode()) return executable_dir() / "data-user";
    const char* xdg = std::getenv("XDG_CONFIG_HOME");
    if (xdg && *xdg) return fs::path(xdg) / "JUSDecomp";
    const char* home = std::getenv("HOME");
    return (home && *home ? fs::path(home) / ".config" : fs::path(".")) /
           "JUSDecomp";
}

static fs::path settings_path() { return user_dir() / "settings.json"; }
static fs::path run_config_path() { return user_dir() / "run.toml"; }
static fs::path default_save_path() { return user_dir() / "jus-play.sav"; }
static fs::path launcher_log_path() { return user_dir() / "launcher.log"; }
static fs::path game_log_path() { return user_dir() / "game.log"; }
static fs::path runner_path() {
    fs::path bundled = app_root() / "app/nds_runner";
    return fs::exists(bundled) ? bundled
        : PROJECT_ROOT / "tools/ndsrecomp/runner/build-linux/nds_runner";
}
static fs::path bios_path() {
    fs::path bundled = app_root() / "app/bios";
    return fs::exists(bundled) ? bundled : PROJECT_ROOT / "tools/ndsrecomp/bios";
}
static fs::path live_cache_path() {
    fs::path bundled = app_root() / "app/live-cache";
    return fs::exists(app_root() / "app") ? bundled : PROJECT_ROOT / "recomp/live-cache";
}
static fs::path controller_db_source() {
    fs::path bundled = app_root() / "data/gamecontrollerdb.txt";
    return fs::exists(bundled) ? bundled : PROJECT_ROOT / "recomp/gamecontrollerdb.txt";
}

static void ensure_user_dir() {
    std::error_code ec;
    fs::create_directories(user_dir(), ec);
}

static void log_line(const std::string& line) {
    ensure_user_dir();
    std::ofstream out(launcher_log_path(), std::ios::app);
    out << line << '\n';
}

static std::string read_text(const fs::path& path) {
    std::ifstream in(path, std::ios::binary);
    if (!in) return {};
    return {std::istreambuf_iterator<char>(in),
            std::istreambuf_iterator<char>()};
}

static bool write_text(const fs::path& path, const std::string& text) {
    std::ofstream out(path, std::ios::binary | std::ios::trunc);
    out << text;
    return out.good();
}

static void show_message(GtkMessageType type, const char* title,
                         const std::string& text) {
    GtkWidget* dialog = gtk_message_dialog_new(
        GTK_WINDOW(main_window), GTK_DIALOG_MODAL, type, GTK_BUTTONS_OK,
        "%s", text.c_str());
    gtk_window_set_title(GTK_WINDOW(dialog), title);
    gtk_dialog_run(GTK_DIALOG(dialog));
    gtk_widget_destroy(dialog);
}

static bool ask_question(const char* title, const std::string& text) {
    GtkWidget* dialog = gtk_message_dialog_new(
        GTK_WINDOW(main_window), GTK_DIALOG_MODAL, GTK_MESSAGE_QUESTION,
        GTK_BUTTONS_YES_NO, "%s", text.c_str());
    gtk_window_set_title(GTK_WINDOW(dialog), title);
    bool yes = gtk_dialog_run(GTK_DIALOG(dialog)) == GTK_RESPONSE_YES;
    gtk_widget_destroy(dialog);
    return yes;
}

static std::string shell_escape_for_log(const std::string& value) {
    if (value.find_first_of(" \t\"'") == std::string::npos) return value;
    std::string out = "'";
    for (char c : value) out += c == '\'' ? "'\\''" : std::string(1, c);
    return out + "'";
}

static void load_settings() {
    const std::string text = read_text(settings_path());
    if (!text.empty()) {
        try {
            jz::Value root = jz::Value::parse(text);
            settings.rom_path = root.get_str("rom_path");
            settings.display_layout =
                root.get_str("display_layout", "stacked");
            settings.save_path = root.get_str("save_path");
            settings.player_name = root.get_str("player_name");
            settings.online_mode = root.get_bool("online_mode", true);
            for (const auto& v : root.get_arr("mods_enabled"))
                if (v.t == jz::Value::Str) settings.mods_enabled.push_back(v.s);
            for (const auto& v : root.get_arr("controller_mappings"))
                if (v.t == jz::Value::Str) settings.controller_mappings.push_back(v.s);
            for (const auto& v : root.get_arr("keyboard_mappings"))
                if (v.t == jz::Value::Str)
                    settings.keyboard_mappings.push_back(v.s);
        } catch (const std::exception& e) {
            log_line(std::string("settings parse failed: ") + e.what());
        }
    }
    if (settings.rom_path.empty()) {
        fs::path dev_rom = PROJECT_ROOT / "rom/jus.nds";
        if (fs::exists(dev_rom)) settings.rom_path = dev_rom.string();
    }
}

static void save_settings() {
    jz::Value root = jz::Value::obj();
    root.o["version"] = jz::Value((long long)1);
    root.o["rom_path"] = jz::Value(settings.rom_path);
    root.o["display_layout"] = jz::Value(settings.display_layout);
    root.o["save_path"] = jz::Value(settings.save_path);
    root.o["player_name"] = jz::Value(settings.player_name);
    root.o["online_mode"] = jz::Value(settings.online_mode);
    jz::Value enabled = jz::Value::arr();
    for (const auto& item : settings.mods_enabled) enabled.a.emplace_back(item);
    root.o["mods_enabled"] = enabled;
    jz::Value controllers = jz::Value::arr();
    for (const auto& item : settings.controller_mappings)
        controllers.a.emplace_back(item);
    root.o["controller_mappings"] = controllers;
    jz::Value mappings = jz::Value::arr();
    for (const auto& item : settings.keyboard_mappings)
        mappings.a.emplace_back(item);
    root.o["keyboard_mappings"] = mappings;
    ensure_user_dir();
    if (!write_text(settings_path(), root.dump(2)))
        log_line("could not write settings.json");
}

static bool mod_enabled(const std::string& id) {
    return std::find(settings.mods_enabled.begin(), settings.mods_enabled.end(), id)
           != settings.mods_enabled.end();
}

static void load_modindex() {
    mods.clear();
    const std::string text = read_text(app_root() / "mods/modindex.json");
    if (text.empty()) {
        log_line("no mods/modindex.json — mod list empty");
        return;
    }
    try {
        jz::Value root = jz::Value::parse(text);
        for (const auto& value : root.get_arr("mods")) {
            ModInfo mod;
            mod.id = value.get_str("id");
            mod.name = value.get_str("name", mod.id);
            mod.version = value.get_str("version");
            mod.author = value.get_str("author");
            mod.description = value.get_str("description");
            for (const auto& value_overlay : value.get_arr("overlays")) {
                Overlay overlay{value_overlay.get_str("offset"),
                                value_overlay.get_str("file")};
                if (!overlay.offset.empty() && !overlay.file.empty())
                    mod.overlays.push_back(std::move(overlay));
            }
            if (!mod.id.empty()) mods.push_back(std::move(mod));
        }
        if (settings.mods_enabled.empty())
            for (const auto& mod : mods) settings.mods_enabled.push_back(mod.id);
    } catch (const std::exception& e) {
        log_line(std::string("modindex parse failed: ") + e.what());
    }
}

static void write_merged_controller_db() {
    std::string merged = read_text(controller_db_source());
    if (!merged.empty() && merged.back() != '\n') merged += '\n';
    for (const auto& mapping : settings.controller_mappings) {
        if (merged.find(mapping) == std::string::npos) {
            merged += mapping;
            if (merged.back() != '\n') merged += '\n';
        }
    }
    ensure_user_dir();
    write_text(user_dir() / "gamecontrollerdb.txt", merged);
}

// Small portable SHA-1 implementation used only to verify the selected ROM.
class Sha1 {
public:
    Sha1() { reset(); }
    void update(const void* data, size_t len) {
        const auto* p = static_cast<const std::uint8_t*>(data);
        total_ += len;
        while (len) {
            size_t take = std::min(len, 64 - used_);
            std::memcpy(buffer_ + used_, p, take);
            used_ += take; p += take; len -= take;
            if (used_ == 64) { block(buffer_); used_ = 0; }
        }
    }
    std::string file(const fs::path& path) {
        std::ifstream in(path, std::ios::binary);
        std::uint8_t chunk[1 << 16];
        while (in) {
            in.read(reinterpret_cast<char*>(chunk), sizeof(chunk));
            if (in.gcount() > 0) update(chunk, static_cast<size_t>(in.gcount()));
        }
        if (!in.eof()) return {};
        finish();
        char out[41];
        for (int i = 0; i < 5; ++i)
            std::snprintf(out + i * 8, 9, "%08x", h_[i]);
        return std::string(out, 40);
    }
private:
    void reset() {
        h_[0]=0x67452301u; h_[1]=0xefcdab89u; h_[2]=0x98badcfeu;
        h_[3]=0x10325476u; h_[4]=0xc3d2e1f0u; total_=0; used_=0;
    }
    void block(const std::uint8_t* b) {
        std::uint32_t w[80];
        for (int i=0;i<16;++i) w[i]=(std::uint32_t(b[i*4])<<24)|
            (std::uint32_t(b[i*4+1])<<16)|(std::uint32_t(b[i*4+2])<<8)|b[i*4+3];
        for (int i=16;i<80;++i) { auto x=w[i-3]^w[i-8]^w[i-14]^w[i-16]; w[i]=(x<<1)|(x>>31); }
        auto a=h_[0],b0=h_[1],c=h_[2],d=h_[3],e=h_[4];
        for(int i=0;i<80;++i){std::uint32_t f,k;if(i<20){f=(b0&c)|(~b0&d);k=0x5a827999u;}else if(i<40){f=b0^c^d;k=0x6ed9eba1u;}else if(i<60){f=(b0&c)|(b0&d)|(c&d);k=0x8f1bbcdcu;}else{f=b0^c^d;k=0xca62c1d6u;}auto t=((a<<5)|(a>>27))+f+e+k+w[i];e=d;d=c;c=(b0<<30)|(b0>>2);b0=a;a=t;}
        h_[0]+=a;h_[1]+=b0;h_[2]+=c;h_[3]+=d;h_[4]+=e;
    }
    void finish(){std::uint64_t bits=total_*8;std::uint8_t pad[72]={0x80};size_t n=used_<56?56-used_:120-used_;for(size_t i=0;i<8;++i)pad[n+i]=std::uint8_t(bits>>(56-i*8));update(pad,n+8);}
    std::uint32_t h_[5]{}; std::uint64_t total_{};
    std::uint8_t buffer_[64]{}; size_t used_{};
};

static bool verify_rom(const fs::path& path, bool report_error) {
    std::error_code ec;
    if (!fs::is_regular_file(path, ec)) {
        if (report_error) show_message(GTK_MESSAGE_ERROR, "Invalid ROM",
            "The selected ROM could not be read.");
        return false;
    }
    if (fs::file_size(path, ec) != STOCK_SIZE) {
        if (report_error) show_message(GTK_MESSAGE_ERROR, "Invalid ROM",
            "Use an unmodified 64 MiB Jump Ultimate Stars cartridge dump.");
        return false;
    }
    const std::string digest = Sha1().file(path);
    if (digest != STOCK_SHA1) {
        if (report_error) show_message(GTK_MESSAGE_ERROR, "Invalid ROM",
            "The ROM hash does not match the supported unmodified dump.");
        return false;
    }
    return true;
}

static void refresh_rom_status() {
    rom_valid = !settings.rom_path.empty() && verify_rom(settings.rom_path, false);
    std::string label = "ROM: " + (settings.rom_path.empty() ?
        std::string("(none selected)") : settings.rom_path);
    gtk_label_set_text(GTK_LABEL(rom_label), label.c_str());
    gtk_label_set_text(GTK_LABEL(status_label), rom_valid ?
        "ROM verified — ready to play." : "Select a valid Jump Ultimate Stars ROM.");
    gtk_widget_set_sensitive(play_button, rom_valid);
}

static std::string compose_run_config() {
    std::string out =
        "# Generated by the JUSDecomp Linux launcher.\n"
        "[game]\nsha1 = \"" + std::string(STOCK_SHA1) + "\"\n\n"
        "[display]\nscreen_layout = \"" + settings.display_layout +
        "\"\nadaptive_widescreen = \"none\"\n\n"
        "[system]\nstartup_mode = \"automatic\"\n\n"
        "[cartridge]\nsave_type = \"eeprom\"\nsave_size = 65536\n";
    for (const auto& mod : mods) {
        if (!mod_enabled(mod.id)) continue;
        out += "\n# ---- mod: " + mod.name + " (" + mod.id + ") v" +
               mod.version + " ----\n";
        for (const auto& overlay : mod.overlays) {
            out += "[[mods.overlays]]\n";
            out += "offset = " + overlay.offset + "\n";
            out += "file = \"" + overlay.file + "\"\n";
        }
    }
    for (const auto& mapping : settings.keyboard_mappings) {
        size_t colon = mapping.find(':');
        if (colon == std::string::npos || colon == 0 || colon + 1 >= mapping.size()) continue;
        out += "\n[[input.keyboard]]\nbutton = \"" + mapping.substr(0, colon) +
               "\"\nkey = \"" + mapping.substr(colon + 1) + "\"\n";
    }
    return out;
}

static void choose_rom(GtkButton*, gpointer) {
    GtkWidget* chooser = gtk_file_chooser_dialog_new(
        "Choose Jump Ultimate Stars ROM", GTK_WINDOW(main_window),
        GTK_FILE_CHOOSER_ACTION_OPEN, "Cancel", GTK_RESPONSE_CANCEL,
        "Choose", GTK_RESPONSE_ACCEPT, nullptr);
    GtkFileFilter* filter = gtk_file_filter_new();
    gtk_file_filter_set_name(filter, "Nintendo DS ROMs (*.nds)");
    gtk_file_filter_add_pattern(filter, "*.nds");
    gtk_file_chooser_add_filter(GTK_FILE_CHOOSER(chooser), filter);
    if (gtk_dialog_run(GTK_DIALOG(chooser)) == GTK_RESPONSE_ACCEPT) {
        char* selected = gtk_file_chooser_get_filename(GTK_FILE_CHOOSER(chooser));
        if (selected && verify_rom(selected, true)) {
            settings.rom_path = selected;
            save_settings();
        }
        g_free(selected);
    }
    gtk_widget_destroy(chooser);
    refresh_rom_status();
}

static void import_save(GtkButton*, gpointer) {
    GtkWidget* chooser = gtk_file_chooser_dialog_new(
        "Choose a save file to import", GTK_WINDOW(main_window),
        GTK_FILE_CHOOSER_ACTION_OPEN,
        "Cancel", GTK_RESPONSE_CANCEL, "Choose", GTK_RESPONSE_ACCEPT, nullptr);
    GtkFileFilter* filter = gtk_file_filter_new();
    gtk_file_filter_set_name(filter, "Nintendo DS saves (*.sav)");
    gtk_file_filter_add_pattern(filter, "*.sav");
    gtk_file_chooser_add_filter(GTK_FILE_CHOOSER(chooser), filter);
    if (gtk_dialog_run(GTK_DIALOG(chooser)) == GTK_RESPONSE_ACCEPT) {
        char* selected = gtk_file_chooser_get_filename(GTK_FILE_CHOOSER(chooser));
        fs::path source = selected ? fs::path(selected) : fs::path();
        std::error_code ec;
        if (!fs::is_regular_file(source, ec) || fs::file_size(source, ec) != 65536) {
            show_message(GTK_MESSAGE_ERROR, "Invalid save",
                "That file is not a Jump Ultimate Stars save (expected a 64 KiB .sav file).");
        } else if (ask_question("Import save",
                   "Replace the app's current save with this file?\n\n"
                   "A copy is made inside the app; the original file is never modified or deleted.")) {
            ensure_user_dir();
            fs::copy_file(source, default_save_path(),
                          fs::copy_options::overwrite_existing, ec);
            if (ec) {
                show_message(GTK_MESSAGE_ERROR, "Import failed",
                             "The save could not be copied: " + ec.message());
            } else {
                settings.save_path.clear();
                save_settings();
                show_message(GTK_MESSAGE_INFO, "Save imported",
                    "A copy is now the app's working save. Importing saves is experimental; "
                    "the game may still show the first-boot sequence.");
            }
        }
        g_free(selected);
    }
    gtk_widget_destroy(chooser);
}

static bool path_is_inside(const fs::path& child, const fs::path& parent) {
    std::error_code ec1, ec2;
    fs::path c = fs::weakly_canonical(child, ec1);
    fs::path p = fs::weakly_canonical(parent, ec2);
    if (ec1 || ec2) return false;
    auto ci = c.begin();
    for (auto pi = p.begin(); pi != p.end(); ++pi, ++ci)
        if (ci == c.end() || *ci != *pi) return false;
    return true;
}

static void delete_save(GtkButton*, gpointer) {
    fs::path active = settings.save_path.empty() ? default_save_path()
                                                  : fs::path(settings.save_path);
    bool ours = path_is_inside(active, user_dir()) || path_is_inside(active, app_root());
    std::string message = "Delete the app's save file?\n\n"
                          "This resets all in-game progress and cannot be undone.";
    if (!ours)
        message += "\n\nThe selected save is outside the app's folders; it will only be detached.";
    if (!ask_question("Delete save", message)) return;
    std::error_code ec;
    if (ours) fs::remove(active, ec);
    if (active != default_save_path()) fs::remove(default_save_path(), ec);
    settings.save_path.clear();
    save_settings();
    show_message(GTK_MESSAGE_INFO, "Save deleted",
                 "The game will start fresh next time.");
}

static const struct { const char* id; const char* label; } keyboard_buttons[] = {
    {"a", "A"}, {"b", "B"}, {"select", "Select"}, {"start", "Start"},
    {"right", "Right"}, {"left", "Left"}, {"up", "Up"}, {"down", "Down"},
    {"r", "R (right shoulder)"}, {"l", "L (left shoulder)"},
    {"x", "X"}, {"y", "Y"},
};

struct KeyboardCapture {
    int step = 0;
    bool active = true;
    GtkWidget* label = nullptr;
    std::array<std::string, 12> keys;
};

static std::string keyval_to_sdl(guint keyval) {
    gunichar ch = gdk_keyval_to_unicode(keyval);
    if (ch >= 'a' && ch <= 'z') return std::string(1, char(ch - 'a' + 'A'));
    if ((ch >= 'A' && ch <= 'Z') || (ch >= '0' && ch <= '9'))
        return std::string(1, static_cast<char>(ch));
    switch (keyval) {
        case GDK_KEY_Up: return "Up"; case GDK_KEY_Down: return "Down";
        case GDK_KEY_Left: return "Left"; case GDK_KEY_Right: return "Right";
        case GDK_KEY_Return: case GDK_KEY_KP_Enter: return "Return";
        case GDK_KEY_BackSpace: return "Backspace"; case GDK_KEY_space: return "Space";
        case GDK_KEY_Tab: return "Tab"; case GDK_KEY_Shift_L: return "Left Shift";
        case GDK_KEY_Shift_R: return "Right Shift"; case GDK_KEY_Control_L: return "Left Ctrl";
        case GDK_KEY_Control_R: return "Right Ctrl"; case GDK_KEY_Alt_L: return "Left Alt";
        case GDK_KEY_Alt_R: return "Right Alt"; case GDK_KEY_Insert: return "Insert";
        case GDK_KEY_Delete: return "Delete"; case GDK_KEY_Home: return "Home";
        case GDK_KEY_End: return "End"; case GDK_KEY_Page_Up: return "PageUp";
        case GDK_KEY_Page_Down: return "PageDown";
        default: break;
    }
    if (keyval >= GDK_KEY_F1 && keyval <= GDK_KEY_F12)
        return "F" + std::to_string(keyval - GDK_KEY_F1 + 1);
    if (ch >= 32 && ch < 127) return std::string(1, static_cast<char>(ch));
    return {};
}

static void keyboard_prompt(KeyboardCapture* capture) {
    if (!capture->active) return;
    std::string prompt = "Press the key for [" +
        std::string(keyboard_buttons[capture->step].label) +
        "]\n(Esc = skip and keep the default for this button)";
    gtk_label_set_text(GTK_LABEL(capture->label), prompt.c_str());
}

static void keyboard_finish(KeyboardCapture* capture) {
    capture->active = false;
    settings.keyboard_mappings.clear();
    for (size_t i = 0; i < capture->keys.size(); ++i)
        if (!capture->keys[i].empty())
            settings.keyboard_mappings.push_back(
                std::string(keyboard_buttons[i].id) + ":" + capture->keys[i]);
    save_settings();
    gtk_label_set_text(GTK_LABEL(capture->label), "Keyboard mapping saved. Close this window.");
}

static void keyboard_advance(KeyboardCapture* capture) {
    if (++capture->step >= static_cast<int>(capture->keys.size()))
        keyboard_finish(capture);
    else
        keyboard_prompt(capture);
}

static gboolean keyboard_key_press(GtkWidget*, GdkEventKey* event, gpointer data) {
    auto* capture = static_cast<KeyboardCapture*>(data);
    if (!capture->active) return FALSE;
    if (event->keyval == GDK_KEY_Escape) {
        keyboard_advance(capture);
        return TRUE;
    }
    std::string key = keyval_to_sdl(event->keyval);
    if (key.empty()) {
        gtk_label_set_text(GTK_LABEL(capture->label),
                           "That key can't be mapped — try another. (Esc = skip)");
    } else {
        capture->keys[capture->step] = key;
        keyboard_advance(capture);
    }
    return TRUE;
}

static void open_keyboard_dialog(GtkButton*, gpointer) {
    GtkWidget* dialog = gtk_dialog_new_with_buttons(
        "Keyboard setup", GTK_WINDOW(main_window), GTK_DIALOG_MODAL,
        "Reset to defaults", 1, "Skip (Esc)", 2, "Close", GTK_RESPONSE_CLOSE, nullptr);
    gtk_window_set_default_size(GTK_WINDOW(dialog), 520, 180);
    GtkWidget* label = gtk_label_new("");
    gtk_container_set_border_width(GTK_CONTAINER(label), 24);
    gtk_box_pack_start(GTK_BOX(gtk_dialog_get_content_area(GTK_DIALOG(dialog))),
                       label, TRUE, TRUE, 0);
    KeyboardCapture capture;
    capture.label = label;
    keyboard_prompt(&capture);
    g_signal_connect(dialog, "key-press-event", G_CALLBACK(keyboard_key_press), &capture);
    gtk_widget_show_all(dialog);
    while (true) {
        gint response = gtk_dialog_run(GTK_DIALOG(dialog));
        if (response == 1) {
            settings.keyboard_mappings.clear();
            save_settings();
            capture.active = false;
            gtk_label_set_text(GTK_LABEL(label),
                "Keyboard defaults restored (Z/X = A/B, A/S = Y/X, Q/W = L/R, arrows, "
                "Backspace/Return = Select/Start).");
        } else if (response == 2 && capture.active) {
            keyboard_advance(&capture);
        } else {
            if (capture.active) keyboard_finish(&capture);
            break;
        }
    }
    gtk_widget_destroy(dialog);
}

enum class CaptureStep {
    A, B, X, Y, Back, Start, LeftShoulder, RightShoulder,
    DPadUp, DPadDown, DPadLeft, DPadRight,
    LeftStick, RightStick, LeftTrigger, RightTrigger, Done
};

static const char* capture_step_label(CaptureStep step) {
    static const char* labels[] = {
        "Press A", "Press B", "Press X", "Press Y", "Press Back / Select",
        "Press Start", "Press Left Shoulder (LB)", "Press Right Shoulder (RB)",
        "Press D-pad Up", "Press D-pad Down", "Press D-pad Left", "Press D-pad Right",
        "Move the Left Stick any direction", "Move the Right Stick any direction",
        "Pull the Left Trigger (LT)", "Pull the Right Trigger (RT)", "Done"
    };
    return labels[static_cast<int>(step)];
}

struct ControllerCapture {
    SDL_Joystick* joystick = nullptr;
    GtkWidget* label = nullptr;
    CaptureStep step = CaptureStep::A;
    std::string guid, name;
    std::string a, b, x, y, back, start, lb, rb;
    std::string dpu, dpd, dpl, dpr, lsx, lsy, rsx, rsy, lt, rt;
    bool waiting_release = false;
};

static std::string button_token(int button) { return "b" + std::to_string(button); }
static std::string axis_token(int axis, bool positive) {
    return "a" + std::to_string(axis) + (positive ? "" : "-");
}
static std::string hat_token(int hat, int direction) {
    return "h" + std::to_string(hat) + "." + std::to_string(direction);
}

static void controller_finish(ControllerCapture* capture) {
    std::string mapping = capture->guid + "," + capture->name + ",";
    const std::pair<const char*, const std::string*> fields[] = {
        {"a", &capture->a}, {"b", &capture->b}, {"x", &capture->x}, {"y", &capture->y},
        {"back", &capture->back}, {"start", &capture->start},
        {"leftshoulder", &capture->lb}, {"rightshoulder", &capture->rb},
        {"lefttrigger", &capture->lt}, {"righttrigger", &capture->rt},
        {"dpup", &capture->dpu}, {"dpdown", &capture->dpd},
        {"dpleft", &capture->dpl}, {"dpright", &capture->dpr},
        {"leftx", &capture->lsx}, {"lefty", &capture->lsy},
        {"rightx", &capture->rsx}, {"righty", &capture->rsy},
    };
    for (const auto& field : fields)
        if (!field.second->empty())
            mapping += std::string(field.first) + ":" + *field.second + ",";
    mapping += "platform:Linux,";
    settings.controller_mappings.push_back(mapping);
    save_settings();
    write_merged_controller_db();
    gtk_label_set_text(GTK_LABEL(capture->label),
        (capture->a.empty() || capture->b.empty())
            ? "Mapping saved. Some buttons were left unassigned."
            : "Mapping saved. Close this window.");
}

static void controller_advance(ControllerCapture* capture) {
    capture->step = static_cast<CaptureStep>(static_cast<int>(capture->step) + 1);
    capture->waiting_release = true;
    if (capture->step == CaptureStep::Done) controller_finish(capture);
    else gtk_label_set_text(GTK_LABEL(capture->label), capture_step_label(capture->step));
}

static void assign_controller_button(ControllerCapture* c, const std::string& token) {
    switch (c->step) {
        case CaptureStep::A: c->a = token; break; case CaptureStep::B: c->b = token; break;
        case CaptureStep::X: c->x = token; break; case CaptureStep::Y: c->y = token; break;
        case CaptureStep::Back: c->back = token; break; case CaptureStep::Start: c->start = token; break;
        case CaptureStep::LeftShoulder: c->lb = token; break;
        case CaptureStep::RightShoulder: c->rb = token; break;
        default: break;
    }
}

static void assign_controller_hat(ControllerCapture* c, int hat, int direction) {
    const std::string token = hat_token(hat, direction);
    switch (c->step) {
        case CaptureStep::DPadUp: c->dpu = token; break;
        case CaptureStep::DPadDown: c->dpd = token; break;
        case CaptureStep::DPadLeft: c->dpl = token; break;
        case CaptureStep::DPadRight: c->dpr = token; break;
        default: break;
    }
}

static bool assign_controller_axis(ControllerCapture* c, int axis, bool positive) {
    const std::string token = axis_token(axis, positive);
    switch (c->step) {
        case CaptureStep::LeftStick:
            if (axis == 0) { c->lsx = token; return !c->lsy.empty(); }
            if (axis == 1) { c->lsy = token; return !c->lsx.empty(); }
            break;
        case CaptureStep::RightStick:
            if (axis == 2) { c->rsx = token; return !c->rsy.empty(); }
            if (axis == 3) { c->rsy = token; return !c->rsx.empty(); }
            break;
        case CaptureStep::LeftTrigger:
            if (axis == 4 || axis == 5) { c->lt = token; return true; }
            break;
        case CaptureStep::RightTrigger:
            if (axis == 5 || axis == 4) { c->rt = token; return true; }
            break;
        default: break;
    }
    return false;
}

static int hat_direction(Uint8 value) {
    if (value & SDL_HAT_UP) return 1;
    if (value & SDL_HAT_RIGHT) return 2;
    if (value & SDL_HAT_DOWN) return 4;
    if (value & SDL_HAT_LEFT) return 8;
    return 0;
}

static gboolean poll_controller(gpointer data) {
    auto* c = static_cast<ControllerCapture*>(data);
    if (!c->joystick || c->step == CaptureStep::Done) return G_SOURCE_CONTINUE;
    SDL_JoystickUpdate();
    const int buttons = SDL_JoystickNumButtons(c->joystick);
    const int axes = SDL_JoystickNumAxes(c->joystick);
    const int hats = SDL_JoystickNumHats(c->joystick);
    if (c->waiting_release) {
        bool released = true;
        for (int i = 0; i < buttons && released; ++i)
            released = SDL_JoystickGetButton(c->joystick, i) == 0;
        for (int i = 0; i < axes && released; ++i)
            released = std::abs(SDL_JoystickGetAxis(c->joystick, i)) < 8192;
        for (int i = 0; i < hats && released; ++i)
            released = SDL_JoystickGetHat(c->joystick, i) == SDL_HAT_CENTERED;
        if (released) c->waiting_release = false;
        return G_SOURCE_CONTINUE;
    }

    bool dpad = c->step >= CaptureStep::DPadUp && c->step <= CaptureStep::DPadRight;
    bool stick = c->step == CaptureStep::LeftStick || c->step == CaptureStep::RightStick;
    bool trigger = c->step == CaptureStep::LeftTrigger || c->step == CaptureStep::RightTrigger;
    if (dpad) {
        for (int i = 0; i < hats; ++i) {
            int direction = hat_direction(SDL_JoystickGetHat(c->joystick, i));
            if (direction) { assign_controller_hat(c, i, direction); controller_advance(c); return G_SOURCE_CONTINUE; }
        }
        for (int i = 0; i < axes; ++i) {
            Sint16 value = SDL_JoystickGetAxis(c->joystick, i);
            if (std::abs(value) > 16384) {
                int direction = i == 0 ? (value > 0 ? 2 : 8) : (value > 0 ? 4 : 1);
                assign_controller_hat(c, 0, direction); controller_advance(c); return G_SOURCE_CONTINUE;
            }
        }
    } else if (stick || trigger) {
        for (int i = 0; i < axes; ++i) {
            Sint16 value = SDL_JoystickGetAxis(c->joystick, i);
            if (std::abs(value) > 16384 && assign_controller_axis(c, i, value > 0)) {
                controller_advance(c); return G_SOURCE_CONTINUE;
            }
        }
        if (trigger) for (int i = 0; i < buttons; ++i)
            if (SDL_JoystickGetButton(c->joystick, i)) {
                if (c->step == CaptureStep::LeftTrigger) c->lt = button_token(i);
                else c->rt = button_token(i);
                controller_advance(c); return G_SOURCE_CONTINUE;
            }
    } else {
        for (int i = 0; i < buttons; ++i)
            if (SDL_JoystickGetButton(c->joystick, i)) {
                assign_controller_button(c, button_token(i)); controller_advance(c); return G_SOURCE_CONTINUE;
            }
        for (int i = 0; i < hats; ++i) {
            int direction = hat_direction(SDL_JoystickGetHat(c->joystick, i));
            if (direction) {
                assign_controller_button(c, hat_token(i, direction)); controller_advance(c); return G_SOURCE_CONTINUE;
            }
        }
    }
    return G_SOURCE_CONTINUE;
}

static void open_controller_dialog(GtkButton*, gpointer) {
    SDL_InitSubSystem(SDL_INIT_JOYSTICK | SDL_INIT_GAMECONTROLLER);
    SDL_JoystickUpdate();
    GtkWidget* dialog = gtk_dialog_new_with_buttons(
        "Controller setup", GTK_WINDOW(main_window), GTK_DIALOG_MODAL,
        "Start capture", GTK_RESPONSE_APPLY, "Skip", 1, "Close", GTK_RESPONSE_CLOSE, nullptr);
    gtk_window_set_default_size(GTK_WINDOW(dialog), 540, 220);
    GtkWidget* box = gtk_box_new(GTK_ORIENTATION_VERTICAL, 12);
    gtk_container_set_border_width(GTK_CONTAINER(box), 18);
    gtk_box_pack_start(GTK_BOX(gtk_dialog_get_content_area(GTK_DIALOG(dialog))), box, TRUE, TRUE, 0);
    GtkWidget* devices = gtk_combo_box_text_new();
    for (int i = 0; i < SDL_NumJoysticks(); ++i)
        gtk_combo_box_text_append_text(GTK_COMBO_BOX_TEXT(devices),
            SDL_JoystickNameForIndex(i) ? SDL_JoystickNameForIndex(i) : "Controller");
    if (SDL_NumJoysticks() > 0) gtk_combo_box_set_active(GTK_COMBO_BOX(devices), 0);
    gtk_box_pack_start(GTK_BOX(box), devices, FALSE, FALSE, 0);
    GtkWidget* label = gtk_label_new(
        "Select your device and press Start capture. Skip leaves the current input unassigned.");
    gtk_label_set_line_wrap(GTK_LABEL(label), TRUE);
    gtk_box_pack_start(GTK_BOX(box), label, TRUE, TRUE, 0);
    ControllerCapture capture;
    capture.label = label;
    guint timer = g_timeout_add(16, poll_controller, &capture);
    gtk_widget_show_all(dialog);
    while (true) {
        gint response = gtk_dialog_run(GTK_DIALOG(dialog));
        if (response == GTK_RESPONSE_APPLY) {
            int index = gtk_combo_box_get_active(GTK_COMBO_BOX(devices));
            if (index < 0 || index >= SDL_NumJoysticks()) {
                show_message(GTK_MESSAGE_ERROR, "No controller",
                             "No controller was detected. Connect one and reopen this window.");
                continue;
            }
            if (capture.joystick) SDL_JoystickClose(capture.joystick);
            capture = ControllerCapture{};
            capture.label = label;
            capture.joystick = SDL_JoystickOpen(index);
            if (!capture.joystick) {
                show_message(GTK_MESSAGE_ERROR, "Controller error", SDL_GetError());
                continue;
            }
            char guid[64]{};
            SDL_JoystickGetGUIDString(SDL_JoystickGetGUID(capture.joystick), guid, sizeof(guid));
            capture.guid = guid;
            capture.name = SDL_JoystickName(capture.joystick)
                ? SDL_JoystickName(capture.joystick) : "controller";
            std::replace(capture.name.begin(), capture.name.end(), ',', ' ');
            gtk_label_set_text(GTK_LABEL(label), capture_step_label(capture.step));
        } else if (response == 1 && capture.joystick && capture.step != CaptureStep::Done) {
            controller_advance(&capture);
        } else {
            break;
        }
    }
    g_source_remove(timer);
    if (capture.joystick) SDL_JoystickClose(capture.joystick);
    gtk_widget_destroy(dialog);
}

static void open_settings(GtkButton*, gpointer) {
    GtkWidget* dialog = gtk_dialog_new_with_buttons(
        "Settings — JUSDecomp", GTK_WINDOW(main_window), GTK_DIALOG_MODAL,
        "Cancel", GTK_RESPONSE_CANCEL, "OK", GTK_RESPONSE_ACCEPT, nullptr);
    gtk_window_set_default_size(GTK_WINDOW(dialog), 680, 430);
    GtkWidget* grid = gtk_grid_new();
    gtk_grid_set_row_spacing(GTK_GRID(grid), 10);
    gtk_grid_set_column_spacing(GTK_GRID(grid), 20);
    gtk_container_set_border_width(GTK_CONTAINER(grid), 16);
    gtk_box_pack_start(GTK_BOX(gtk_dialog_get_content_area(GTK_DIALOG(dialog))), grid, TRUE, TRUE, 0);

    GtkWidget* mods_frame = gtk_frame_new("Mods (take effect next launch)");
    GtkWidget* mods_box = gtk_box_new(GTK_ORIENTATION_VERTICAL, 6);
    gtk_container_set_border_width(GTK_CONTAINER(mods_box), 10);
    gtk_container_add(GTK_CONTAINER(mods_frame), mods_box);
    std::vector<GtkWidget*> mod_checks;
    for (const auto& mod : mods) {
        std::string title = mod.name + "  (v" + mod.version + ")";
        GtkWidget* check = gtk_check_button_new_with_label(title.c_str());
        gtk_toggle_button_set_active(GTK_TOGGLE_BUTTON(check), mod_enabled(mod.id));
        gtk_widget_set_tooltip_text(check, mod.description.c_str());
        gtk_box_pack_start(GTK_BOX(mods_box), check, FALSE, FALSE, 0);
        mod_checks.push_back(check);
    }
    if (mods.empty()) gtk_box_pack_start(GTK_BOX(mods_box), gtk_label_new("(no bundled mods)"), FALSE, FALSE, 0);
    gtk_grid_attach(GTK_GRID(grid), mods_frame, 0, 0, 1, 6);

    auto label_at = [&](const char* text, int row) {
        GtkWidget* label = gtk_label_new(text);
        gtk_widget_set_halign(label, GTK_ALIGN_START);
        gtk_grid_attach(GTK_GRID(grid), label, 1, row, 1, 1);
    };
    label_at("Screen layout", 0);
    GtkWidget* layout = gtk_combo_box_text_new();
    gtk_combo_box_text_append(GTK_COMBO_BOX_TEXT(layout), "stacked", "Stacked screens");
    gtk_combo_box_text_append(GTK_COMBO_BOX_TEXT(layout), "separate", "Separate screens");
    gtk_combo_box_set_active_id(GTK_COMBO_BOX(layout), settings.display_layout.c_str());
    gtk_grid_attach(GTK_GRID(grid), layout, 2, 0, 1, 1);

    label_at("Controller", 1);
    GtkWidget* controller = gtk_button_new_with_label("Configure controller…");
    g_signal_connect(controller, "clicked", G_CALLBACK(open_controller_dialog), nullptr);
    gtk_grid_attach(GTK_GRID(grid), controller, 2, 1, 1, 1);
    label_at("Keyboard", 2);
    GtkWidget* keyboard = gtk_button_new_with_label("Map keyboard…");
    g_signal_connect(keyboard, "clicked", G_CALLBACK(open_keyboard_dialog), nullptr);
    gtk_grid_attach(GTK_GRID(grid), keyboard, 2, 2, 1, 1);

    label_at("Player name (online)", 3);
    GtkWidget* player = gtk_entry_new();
    gtk_entry_set_text(GTK_ENTRY(player), settings.player_name.c_str());
    gtk_grid_attach(GTK_GRID(grid), player, 2, 3, 1, 1);
    GtkWidget* online = gtk_check_button_new_with_label("Online mode (Wiimmfi)");
    gtk_toggle_button_set_active(GTK_TOGGLE_BUTTON(online), settings.online_mode);
    gtk_grid_attach(GTK_GRID(grid), online, 2, 4, 1, 1);

    GtkWidget* save_box = gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 6);
    GtkWidget* import = gtk_button_new_with_label("Import save file…");
    GtkWidget* remove = gtk_button_new_with_label("Delete save (fresh start)");
    g_signal_connect(import, "clicked", G_CALLBACK(import_save), nullptr);
    g_signal_connect(remove, "clicked", G_CALLBACK(delete_save), nullptr);
    gtk_box_pack_start(GTK_BOX(save_box), import, TRUE, TRUE, 0);
    gtk_box_pack_start(GTK_BOX(save_box), remove, TRUE, TRUE, 0);
    gtk_grid_attach(GTK_GRID(grid), save_box, 0, 6, 3, 1);

    gtk_widget_show_all(dialog);
    if (gtk_dialog_run(GTK_DIALOG(dialog)) == GTK_RESPONSE_ACCEPT) {
        settings.mods_enabled.clear();
        for (size_t i = 0; i < mod_checks.size(); ++i)
            if (gtk_toggle_button_get_active(GTK_TOGGLE_BUTTON(mod_checks[i])))
                settings.mods_enabled.push_back(mods[i].id);
        const char* id = gtk_combo_box_get_active_id(GTK_COMBO_BOX(layout));
        settings.display_layout = id ? id : "stacked";
        settings.player_name = gtk_entry_get_text(GTK_ENTRY(player));
        settings.online_mode = gtk_toggle_button_get_active(GTK_TOGGLE_BUTTON(online));
        save_settings();
        write_merged_controller_db();
        log_line("settings saved from Linux launcher");
    }
    gtk_widget_destroy(dialog);
}

static gboolean watch_runner(gpointer data) {
    pid_t pid = static_cast<pid_t>(GPOINTER_TO_INT(data));
    int status = 0;
    pid_t result = waitpid(pid, &status, WNOHANG);
    if (result == 0) return G_SOURCE_CONTINUE;
    gtk_widget_set_sensitive(play_button, rom_valid);
    if (result < 0) {
        log_line(std::string("waitpid failed: ") + std::strerror(errno));
        return G_SOURCE_REMOVE;
    }
    if (WIFEXITED(status) && WEXITSTATUS(status) == 0) {
        log_line("game exited cleanly");
    } else {
        std::string detail = WIFEXITED(status)
            ? "exit code " + std::to_string(WEXITSTATUS(status))
            : WIFSIGNALED(status)
                ? "signal " + std::to_string(WTERMSIG(status)) : "unknown status";
        log_line("game stopped unexpectedly (" + detail + ")");
        show_message(GTK_MESSAGE_ERROR, "Game stopped",
            "The game stopped unexpectedly. Your progress is saved automatically. "
            "Use Open log when asking for help.");
    }
    return G_SOURCE_REMOVE;
}

static void launch_game(GtkButton*, gpointer) {
    if (!rom_valid) {
        show_message(GTK_MESSAGE_ERROR, "Cannot launch", "Select a valid ROM first.");
        return;
    }
    const fs::path runner = runner_path();
    const fs::path bios = bios_path();
    if (!fs::exists(runner)) {
        show_message(GTK_MESSAGE_ERROR, "Cannot launch",
            "The Linux runner is missing. Run tools/scripts/build_linux.sh first.");
        return;
    }
    ensure_user_dir();
    if (!write_text(run_config_path(), compose_run_config())) {
        show_message(GTK_MESSAGE_ERROR, "Cannot launch", "Could not write run.toml.");
        return;
    }
    write_merged_controller_db();
    fs::path save = settings.save_path.empty()
        ? default_save_path() : fs::path(settings.save_path);
    std::vector<std::string> args = {
        runner.string(), bios.string(), "--interactive", "--port", "19888",
        "--rom", settings.rom_path, "--config", run_config_path().string(),
        "--startup-mode", "automatic", "--freebios", "--generated-firmware",
        "--boot", "direct", "--save-path", save.string()
    };
    if (settings.online_mode) {
        args.insert(args.end(), {"--network", "on", "--wfc", "on",
            "--wfc-provider", "wiimmfi"});
        if (!settings.player_name.empty())
            args.insert(args.end(), {"--player-name", settings.player_name});
        args.insert(args.end(), {"--firmware-state-path",
            (user_dir() / "jus.fwstate").string(), "--live-overlay-enable",
            "--live-overlay-auto", "--live-overlay-activation-delay-ms", "15000",
            "--live-overlay-auto-delay-ms", "15000",
            "--live-overlay-auto-cooldown-ms", "20000",
            "--live-overlay-cache", live_cache_path().string()});
        if (app_root() == PROJECT_ROOT) {
            std::string command = "python3 " +
                (PROJECT_ROOT / "tools/ndsrecomp/tools/compile_live_shards.py").string() +
                " --ndsrecomp-root " + (PROJECT_ROOT / "tools/ndsrecomp").string() +
                " --runner-build " +
                (PROJECT_ROOT / "tools/ndsrecomp/runner/build-linux").string() +
                " --recompiler " +
                (PROJECT_ROOT / "tools/ndsrecomp/recompiler/build-linux/nds_recompile").string() +
                " --gcc gcc";
            args.insert(args.end(), {"--live-overlay-command", command});
        }
    }
    std::string command;
    for (const auto& arg : args) {
        if (!command.empty()) command += ' ';
        command += shell_escape_for_log(arg);
    }
    log_line("launch: " + command);

    pid_t pid = fork();
    if (pid < 0) {
        show_message(GTK_MESSAGE_ERROR, "Cannot launch", std::strerror(errno));
        return;
    }
    if (pid == 0) {
        setsid();
        chdir(app_root().c_str());
        setenv("NDS_GAMECONTROLLERDB",
               (user_dir() / "gamecontrollerdb.txt").c_str(), 1);
        int log_fd = open(game_log_path().c_str(), O_WRONLY | O_CREAT | O_TRUNC, 0644);
        int null_fd = open("/dev/null", O_RDONLY);
        if (log_fd >= 0) { dup2(log_fd, STDOUT_FILENO); dup2(log_fd, STDERR_FILENO); }
        if (null_fd >= 0) dup2(null_fd, STDIN_FILENO);
        std::vector<char*> argv;
        for (auto& arg : args) argv.push_back(arg.data());
        argv.push_back(nullptr);
        execv(runner.c_str(), argv.data());
        _exit(127);
    }
    log_line("runner started with pid " + std::to_string(pid));
    gtk_widget_set_sensitive(play_button, FALSE);
    g_timeout_add(500, watch_runner, GINT_TO_POINTER(static_cast<int>(pid)));
}

static void open_log(GtkButton*, gpointer) {
    ensure_user_dir();
    if (!fs::exists(launcher_log_path())) write_text(launcher_log_path(), "");
    std::string uri = "file://" + launcher_log_path().string();
    GError* error = nullptr;
    gtk_show_uri_on_window(GTK_WINDOW(main_window), uri.c_str(),
                           GDK_CURRENT_TIME, &error);
    if (error) {
        show_message(GTK_MESSAGE_ERROR, "Open log failed", error->message);
        g_error_free(error);
    }
}

static void open_guide(GtkButton*, gpointer) {
    fs::path guide = app_root() / "docs/USER_GUIDE.txt";
    if (!fs::exists(guide)) guide = PROJECT_ROOT / "docs/USER_GUIDE.md";
    if (!fs::exists(guide)) {
        show_message(GTK_MESSAGE_ERROR, "Guide unavailable",
                     "The user guide could not be found.");
        return;
    }
    gchar* uri = g_filename_to_uri(guide.c_str(), nullptr, nullptr);
    GError* error = nullptr;
    gtk_show_uri_on_window(GTK_WINDOW(main_window), uri, GDK_CURRENT_TIME, &error);
    g_free(uri);
    if (error) {
        show_message(GTK_MESSAGE_ERROR, "Open guide failed", error->message);
        g_error_free(error);
    }
}

int main(int argc, char** argv) {
    gtk_init(&argc, &argv);
    if (SDL_Init(SDL_INIT_JOYSTICK | SDL_INIT_GAMECONTROLLER) != 0)
        log_line(std::string("SDL controller initialization failed: ") + SDL_GetError());
    ensure_user_dir();
    log_line(std::string("===== JUSDecomp ") + APP_VERSION + " started =====");
    load_settings();
    load_modindex();

    main_window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
    gtk_window_set_title(GTK_WINDOW(main_window), "JUSDecomp Linux Launcher");
    gtk_window_set_default_size(GTK_WINDOW(main_window), 700, 320);
    gtk_container_set_border_width(GTK_CONTAINER(main_window), 20);
    g_signal_connect(main_window, "destroy", G_CALLBACK(gtk_main_quit), nullptr);

    GtkWidget* box = gtk_box_new(GTK_ORIENTATION_VERTICAL, 14);
    gtk_container_add(GTK_CONTAINER(main_window), box);
    GtkWidget* title = gtk_label_new(nullptr);
    gtk_label_set_markup(GTK_LABEL(title),
        "<span size='x-large' weight='bold'>Jump Ultimate Stars</span>\nNative Linux launcher");
    gtk_box_pack_start(GTK_BOX(box), title, FALSE, FALSE, 0);

    rom_label = gtk_label_new("");
    gtk_label_set_ellipsize(GTK_LABEL(rom_label), PANGO_ELLIPSIZE_MIDDLE);
    gtk_box_pack_start(GTK_BOX(box), rom_label, FALSE, FALSE, 0);
    status_label = gtk_label_new("");
    gtk_box_pack_start(GTK_BOX(box), status_label, FALSE, FALSE, 0);

    play_button = gtk_button_new_with_label("Play Jump Ultimate Stars");
    gtk_widget_set_size_request(play_button, -1, 48);
    g_signal_connect(play_button, "clicked", G_CALLBACK(launch_game), nullptr);
    gtk_box_pack_start(GTK_BOX(box), play_button, FALSE, FALSE, 4);

    GtkWidget* buttons = gtk_button_box_new(GTK_ORIENTATION_HORIZONTAL);
    gtk_button_box_set_layout(GTK_BUTTON_BOX(buttons), GTK_BUTTONBOX_CENTER);
    GtkWidget* rom = gtk_button_new_with_label("Change ROM…");
    GtkWidget* prefs = gtk_button_new_with_label("Settings");
    GtkWidget* guide = gtk_button_new_with_label("Guide");
    GtkWidget* logs = gtk_button_new_with_label("Open log");
    g_signal_connect(rom, "clicked", G_CALLBACK(choose_rom), nullptr);
    g_signal_connect(prefs, "clicked", G_CALLBACK(open_settings), nullptr);
    g_signal_connect(guide, "clicked", G_CALLBACK(open_guide), nullptr);
    g_signal_connect(logs, "clicked", G_CALLBACK(open_log), nullptr);
    gtk_container_add(GTK_CONTAINER(buttons), rom);
    gtk_container_add(GTK_CONTAINER(buttons), prefs);
    gtk_container_add(GTK_CONTAINER(buttons), guide);
    gtk_container_add(GTK_CONTAINER(buttons), logs);
    gtk_box_pack_start(GTK_BOX(box), buttons, FALSE, FALSE, 0);

    refresh_rom_status();
    gtk_widget_show_all(main_window);
    gtk_main();
    save_settings();
    log_line("===== JUSDecomp Linux launcher exiting =====");
    SDL_Quit();
    return 0;
}
