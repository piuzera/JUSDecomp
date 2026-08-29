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

## 3. Mods

Settings → **Mods** lists the bundled mods. Tick a mod to enable it (takes
effect on the next launch). The bundled mod is **English Translation**, a
faithful reproduction of the community English patch that layers over your
Japanese ROM at runtime.

Mods never modify your ROM. The game reads the original file and the mod
layers on top at runtime.

## 4. Save data

- Your save lives in `%APPDATA%\JUSDecomp\jus-play.sav` (portable mode:
  next to the executable).
- **Import save file...** copies an existing `.sav` (from an emulator or a
  cartridge backup) into the app's own working save. Your original file is
  never modified, referenced, or deleted.
- **Delete save (fresh start)** erases the app's own working save. If the
  save in use lives outside the app's folders, it is only detached — never
  deleted.

## 5. Online play (Wiimmfi)

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

## 6. Known issues

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

## 7. Troubleshooting

| Problem | Solution |
|---|---|
| "This is not an unmodified Jump Ultimate Stars dump" | Use a clean dump of the game you own (see §1). |
| "This looks like a trimmed or modified ROM" | Trimming tools strip the ROM; re-dump without trimming. |
| The game stopped unexpectedly | Your progress is safe. Click **Open log** on the main window and share `launcher.log` + `game.log` when asking for help. |
| Controller buttons are wrong | Settings → Configure controller... and follow the prompts (press **Skip** for anything you don't use). |
| Game runs slowly | Close other GPU-heavy apps and keep the window size modest. |
| Black screen / graphics errors | Update your GPU driver. |
| The game closes by itself during the intro (integrated graphics) | Fixed in v0.2.2 — the app now falls back to the software renderer automatically. If it still happens, update your GPU driver and share `launcher.log` + `game.log`. |

## 8. FAQ

**Is this legal?** JUSDecomp contains only original code and documentation.
You must supply the game yourself from a cartridge you own.

**Why is there no installer?** The portable folder works from anywhere
(USB stick included). An installer version is planned.

**Does online play work?** Yes — **WiFi Battle** works online through the
public Wiimmfi service. **Online mode (Wiimmfi)** is on by default — open
Settings, type your player name, and Play. Online play runs at ~60 fps.

**Where are my settings?** `%APPDATA%\JUSDecomp\settings.json` — delete it
to reset everything.
