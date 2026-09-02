# JUSDecomp — Player's Guide

Thank you for trying JUSDecomp! This app runs **Jump Ultimate Stars** natively
on your Windows PC. You need your **own legally dumped copy** of the game —
no game files are included with JUSDecomp.

## 1. Getting started (3 steps)

1. **Start JUSDecomp.exe** — no installation needed for the portable version.
2. **Click "Change ROM..."** and select your `Jump Ultimate Stars.nds` file.
   The app verifies it automatically (unmodified dumps only).
3. **Click "Play Jump Ultimate Stars".**

That's it. There is no command line, and nothing else to configure.

### How do I get the ROM?

You must dump the game from a cartridge you own. Use a dumping tool such as
[GodMode9i](https://github.com/RocketRobz/godmode9i) (DSi/3DS) or a DS flash
cart with its dump tool, or `nds-bootstrap`'s dump feature. JUSDecomp accepts
only the **stock, unmodified** dump (64 MB, sha1
`ba58e20ee60eb81c33dcd4934a21271baa9f954a`).

## 2. Controls

- The game uses DS buttons + touch. Your gamepad is mapped automatically for
  most devices.
- **Wrong buttons?** Open **Settings → Configure controller...** and follow the
  on-screen prompts. Press **Skip** to leave any button unassigned — only the
  buttons you actually set are mapped. Your mapping is saved and reused
  every session.
- **Playing on keyboard?** Defaults: Z/X = A/B, A/S = Y/X, Q/W = L/R, arrow
  keys = D-pad, Backspace/Enter = Select/Start, mouse = touch. To change
  them, open **Settings → Map keyboard...** and press the key you want for
  each DS button (**Esc** keeps the default for that button). Only the
  buttons you remap change; everything else keeps the defaults.
- Touchscreen: move the mouse and click to tap (in the default window), or
  use the right stick in separate-screen mode.
- Save progress is automatic, exactly like the original cartridge.

## 3. Display & quality-of-life options

Settings → **Display (QOL)** lets you tune how the game window looks and
behaves. All of these are host-side only — they never change the game's own
logic or your save.

- **Window size** — 1x, 2x, 3x, or 4x scale for the initial window (the
  window is still freely resizable afterwards, and the image always scales
  in whole pixels). Your window size and position are remembered between
  launches.
- **Fullscreen** — borderless fullscreen desktop mode (the image is scaled
  up in whole pixels, with black bars when the aspect doesn't divide evenly).
- **Borderless window** — a normal window without the title bar/borders.
- **On-screen overlay** — a small FPS/emulation-time/speed/network HUD on
  the top screen. Press **F11** in-game to toggle it.
- **In-game settings (F9)** — press **F9** anywhere in the game to open a
  full-screen **Recomp Settings** menu (the game pauses while it's open).
  Navigate with the arrow keys (or gamepad D-pad), change a value with
  Left/Right (A), and close with Esc/F9 (B). Window size, fullscreen,
  borderless, game speed, overlay and screenshots take effect immediately;
  the quality knobs (marked "(R)") are saved but apply on the next launch.
  Changes made here are remembered even after you quit — they carry into
  the launcher's settings automatically.
- **Game speed** — run the game slower (25%–75%) or faster (150%–800%) than
  real time. Note: non-100% speeds mute the audio (the DS audio stream is
  fixed-rate). Hold **Tab** for temporary turbo, or press **F10** to toggle
  turbo on/off.
- **Screenshots** — when enabled, press **F12** in-game to save a stacked
  top+bottom screenshot (BMP) into the chosen folder (default:
  `%APPDATA%\JUSDecomp\screenshots`).
- **Save backups** — before each launch, a timestamped copy of your save is
  kept in `%APPDATA%\JUSDecomp\backups` (choose how many to keep). If a
  save is ever lost, copy the newest backup back to the working save.
- **Quality knobs** — internal resolution (1x–4x), texture upscaling
  (1x/2x/4x), anti-aliasing (off/2x/4x/8x) and supersampling (1x–4x) for the
  accelerated renderer. These cost performance; leave them at defaults on
  weaker hardware.

## 4. Mods

Settings → **Mods** lists the bundled mods. Tick a mod to enable it (takes
effect on the next launch). The bundled mod is **English Translation**, a
faithful reproduction of the community English patch that layers over your
Japanese ROM at runtime.

Mods never modify your ROM. The game reads the original file and the mod
layers on top at runtime.

## 5. Save data

- Your save lives in `%APPDATA%\JUSDecomp\jus-play.sav` (portable mode:
  next to the executable).
- **Import save file...** copies an existing `.sav` (from an emulator or a
  cartridge backup) into the app's own working save. Your original file is
  never modified, referenced, or deleted.
- **Delete save (fresh start)** erases the app's own working save. If the
  save in use lives outside the app's folders, it is only detached — never
  deleted.

## 6. Online play (Wiimmfi)

Jump! Ultimate Stars' **WiFi Battle** works online through the public
**Wiimmfi/Kaeru** service — the runner redirects the game's DNS, so no ROM
patching is needed. Online play runs at ~60 fps.

- **Online mode (Wiimmfi)** is on by default — just open **Settings**, type
  your **player name**, and click Play.
- You need an Internet connection; allow the app through the firewall
  (outbound UDP 53 + TCP to the WFC service).
- In-game: **WiFi Battle → connection test**, then **profile
  registration** to claim your friend code. Each machine's console identity
  produces its own friend code.
- Same router? Two players can also battle on one network (peer frames are
  tunnelled host-to-host; see `ONLINE_TEST.txt` in this folder).

## 7. Known issues

These are known v0.2.2 limitations we are working on — none of them block
progress (your save is always safe):

- **Occasional micro-stutters during online play.** Online WiFi Battle now
  runs at ~60 fps almost all the time (the old 60 → ~35 fps drop is fixed),
  but rare sub-second micro-stutters can still occur. Being investigated.
- **FPS drops during the video intro.** The compressed intro movie is not
   yet full speed on every machine. Gameplay after the intro runs at full
   speed.
- **Fixed in v0.2.2: crash during the intro on some integrated-GPU
   machines.** If the accelerated renderer hits a driver error, the app now
   automatically falls back to the software renderer and keeps playing
   instead of closing.
- **FPS drops on the deck builder.** The deck editor's heavy 2D compositing
  can dip below full speed.
- **Minor visual bugs on some levels.** Scrolling background elements can
  render buggy (split or misaligned layers) on certain stages.

## 8. Troubleshooting

| Problem | Solution |
|---|---|
| "This is not an unmodified Jump Ultimate Stars dump" | Use a clean dump of the game you own (see §1). |
| "This looks like a trimmed or modified ROM" | Trimming tools strip the ROM; re-dump without trimming. |
| The game stopped unexpectedly | Your progress is safe. Click **Open log** on the main window and share `launcher.log` + `game.log` when asking for help. |
| Controller buttons are wrong | Settings → Configure controller... and follow the prompts (press **Skip** for anything you don't use). |
| Game runs slowly | Close other GPU-heavy apps and keep the window size modest. |
| Black screen / graphics errors | Update your GPU driver. |
| The game closes by itself during the intro (integrated graphics) | Fixed in v0.2.2 — the app now falls back to the software renderer automatically. If it still happens, update your GPU driver and share `launcher.log` + `game.log`. |

## 9. FAQ

**Is this legal?** JUSDecomp contains only original code and documentation.
You must supply the game yourself from a cartridge you own.

**Why is there no installer?** The portable folder works from anywhere
(USB stick included). An installer version is planned.

**Does online play work?** Yes — **WiFi Battle** works online through the
public Wiimmfi service. **Online mode (Wiimmfi)** is on by default — open
Settings, type your player name, and Play. Online play runs at ~60 fps.

**Where are my settings?** `%APPDATA%\JUSDecomp\settings.json` — delete it
to reset everything.
