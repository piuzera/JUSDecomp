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
- **Wrong buttons?** Open **Settings → Configure controller...** and follow
  the on-screen prompts. Your mapping is saved and reused every session.
- Touchscreen: move the mouse and click to tap (in the default window), or
  use the right stick in separate-screen mode.
- Save progress is automatic, exactly like the original cartridge.

## 3. Mods

Settings → **Mods** lists the bundled mods. Tick a mod to enable it (takes
effect on the next launch). Example bundled mod: **Koma 890 — Jodio**, which
adds a brand-new koma with custom art to the deck builder.

Mods never modify your ROM. The game reads the original file and the mod
layers on top at runtime.

## 4. Save data

- Your save lives in `%APPDATA%\JUSDecomp\jus-play.sav` (portable mode:
  next to the executable).
- **Import save file...** lets you continue an existing `.sav` from an
  emulator or cartridge backup.
- **Delete save (fresh start)** erases all in-game progress.

## 5. Troubleshooting

| Problem | Solution |
|---|---|
| "This is not an unmodified Jump Ultimate Stars dump" | Use a clean dump of the game you own (see §1). |
| "This looks like a trimmed or modified ROM" | Trimming tools strip the ROM; re-dump without trimming. |
| The game stopped unexpectedly | Your progress is safe. Click **Open log** on the main window and share `launcher.log` + `game.log` when asking for help. |
| Controller buttons are wrong | Settings → Configure controller... and follow the prompts. |
| Game runs slowly | Enable Settings → Display → Adaptive widescreen "Original", close other GPU apps. |
| Black screen / graphics errors | Update your GPU driver. |

## 6. FAQ

**Is this legal?** JUSDecomp contains only original code and documentation.
You must supply the game yourself from a cartridge you own.

**Why is there no installer?** The portable folder works from anywhere
(USB stick included). An installer version is planned.

**Does online play work?** Wi-Fi services were discontinued by Nintendo;
local 2-player is being worked on.

**Where are my settings?** `%APPDATA%\JUSDecomp\settings.json` — delete it
to reset everything.
