# JUS Decomp

Reverse engineering and **static recompilation** of **Jump Ultimate Stars**
(Nintendo DS, game code `AJUJ`) into a native Windows executable — with a
user-facing **mod pipeline** on top.

The original game runs natively through
[ndsrecomp](https://github.com/mstan/ndsrecomp): dual-CPU scheduler, recompiled
ARM9/ARM7 banks, overlay promotion, melonDS-derived 3D/Wi-Fi, SDL host. The
repository itself contains no game assets — you bring your own legally dumped
ROM (sha1-gated).

> **Status: v0.1.0** — playable proof-of-concept: full intro, in-game saves,
> deck injection, arcade-stick input, and a working runtime mod system.
> A beginner-friendly launcher (`launcher/`, release 0.2.0) is in development.
> See [`decomp/docs/TODO.md`](decomp/docs/TODO.md) for scope and open items.

---

## For players (no programming required)

The launcher release turns the project into a **single self-contained
executable**:

1. Download the `JUSDecomp` release folder (or build it with
   `py tools/scripts/package_release.py`).
2. Run `JUSDecomp.exe`, pick your own legally dumped ROM in the file dialog —
   it is verified automatically.
3. Play. Mods toggle on/off and controller buttons are configured inside the
   app (Settings), with everything saved between sessions.

Full instructions: [`docs/USER_GUIDE.md`](docs/USER_GUIDE.md).
Everything below this point is for developers.

---

## Legal

- The **code, scripts, and documentation** in this repository are released
  under the [MIT License](LICENSE).
- **No Nintendo/Bandai/Shueisha assets are distributed.** The ROM, its
  extraction, and derived binaries are never committed (see
  [`.gitignore`](.gitignore) and [`decomp/docs/REPO_AUDIT.md`](decomp/docs/REPO_AUDIT.md)).
- You must supply your **own legally dumped copy** of Jump Ultimate Stars.
  The build is gated to the stock dump (`sha1 = ba58e20ee60eb81c33dcd4934a21271baa9f954a`).
- This project is an independent, educational work and is not affiliated with
  or endorsed by Nintendo, Bandai Namco, or Shueisha.

## Requirements

- **Windows 10/11**
- **Python 3.11+**
- **MSYS2** (UCRT64) with `mingw-w64-ucrt-x86_64-gcc`, `-SDL2`, `-ninja`, `-cmake`
- **Visual Studio Build Tools 2022** (MSVC) — builds the `nds_recompile` tool
- **ds-decomp** (`dsd`) — place `dsd.exe` in `tools/dsd/`
- Your own dump of Jump Ultimate Stars (stock, unmodified)

## Setup — from a clean clone

```cmd
:: 1. clone + patch the runner/compiler
git clone https://github.com/mstan/ndsrecomp tools/ndsrecomp
cd tools/ndsrecomp
git checkout e9b530a0e08fe7c270ed97737b1c1495de9d1587
git apply ..\..\patches\ndsrecomp\0001-jus-runner-modifications.patch
cd ..\..
:: (full details: patches/README.md)

:: 2. provide your ROM and extract it with ds-decomp
copy <your-jus.nds> rom\jus.nds
tools\dsd\dsd.exe extract -r rom\jus.nds -o extract
:: dsd also produces the decomp project metadata (see decomp/docs/PROJECT.md)

:: 3. generate the recomp bank configs + game.toml
py tools\scripts\prepare_jus.py

:: 4. build the recompiler (MSVC) and generate the ARM9/ARM7 banks
::    (see decomp/docs/NDSRECOMP.md §"Spike results" for the exact commands)
::    -> recomp/generated/ (gitignored, ROM-derived)

:: 5. build the runner (mingw)
cmake -G Ninja -S tools/ndsrecomp/runner -B tools/ndsrecomp/runner/build-mingw ^
  -DNDS_BOOTSTRAP_FIRMWARE=ON -DNDS_TITLE_BANK_DIR=recomp/generated ^
  -DNDS_TITLE_ROM_SHA1=ba58e20ee60eb81c33dcd4934a21271baa9f954a
cmake --build tools/ndsrecomp/runner/build-mingw

:: 6. run (MSYS2 bash)
recomp\run_jus.sh smoke        :: headless boot check
recomp\run_jus.sh interactive :: windowed play
recomp\run_jus.sh live        :: play + auto-promote overlays to native
recomp\run_jus.sh stick       :: arcade-stick / Prime-Controls mode
```

The decompilation pipeline itself (Track A, reference-checking) is:

```cmd
py tools\scripts\build.py --all   :: dsd delink/lcf/objdiff (+ link if mwldarm present)
```

## Modding

The stock ROM is never patched. Mod packs in [`recomp/mods/`](recomp/mods/)
are turned into runtime overlay configs that shadow gamecard reads:

```cmd
py tools\scripts\mods_manage.py list                       :: installed packs
py tools\scripts\mods_manage.py enable  koma-890-jodio     :: example pack (default)
py tools\scripts\mods_manage.py build   koma-890-jodio     :: build payloads from YOUR extract
py tools\scripts\mods_manage.py compose                    :: write game-mod.generated.toml
recomp\play_mod.cmd                                        :: play stock ROM + mods
```

Full documentation: [`decomp/docs/MODS.md`](decomp/docs/MODS.md)
(pack format, manifest reference, build hooks, overlay rules, creating your
own mods). The example pack `koma-890-jodio` adds a brand-new koma with
custom art; see [`recomp/mods/koma-890-jodio/README.md`](recomp/mods/koma-890-jodio/README.md).

## Repository layout

```
├── README.md / CHANGELOG.md / LICENSE / INSTRUCTIONS.md
├── .gitignore / .gitattributes          repo hygiene (see docs/REPO_AUDIT.md)
├── data/                                RE-derived koma/kizuna databases
├── decomp/
│   ├── arm9/                            dsd project (symbols/relocs/delinks/config)
│   ├── asm/                             reference gap assembly
│   ├── docs/                            all reverse-engineering documentation
│   ├── objdiff/                         objdiff config
│   └── src/                             reconstructed sources
├── patches/                             local ndsrecomp modifications (git am)
├── recomp/
│   ├── config/                          generated recomp bank configs
│   ├── game.toml / game-mod.toml        runner + mod base configs
│   ├── mods/                            mod packs + example mod
│   ├── *.cmd / *.sh                     launchers
│   └── *.py                             analysis/probe/save-debug tooling
└── tools/
    ├── scripts/                         the reproducible pipeline (build, mods, RE)
    └── (dsd, mwccarm, JUSToolkit, ndsrecomp — cloned locally, gitignored)
```

`rom/`, `extract/`, generated banks, caches, logs, saves, and session captures
are all gitignored — see [`decomp/docs/REPO_AUDIT.md`](decomp/docs/REPO_AUDIT.md)
for the full publish/ignore policy.

## Documentation index

| Doc | Topic |
|---|---|
| [`decomp/docs/PROJECT.md`](decomp/docs/PROJECT.md) | Project overview, toolchain, methodology |
| [`decomp/docs/TODO.md`](decomp/docs/TODO.md) | Scope, status, and work queue |
| [`decomp/docs/NDSRECOMP.md`](decomp/docs/NDSRECOMP.md) | Track C bring-up recipe + spike results |
| [`decomp/docs/MODS.md`](decomp/docs/MODS.md) | **Mod pipeline: install/create/enable/manage** |
| [`decomp/docs/MEMORY_MAP.md`](decomp/docs/MEMORY_MAP.md) / [`OVERLAYS.md`](decomp/docs/OVERLAYS.md) | ARM9/ARM7 layout, 14 overlays |
| [`decomp/docs/FILE_FORMATS.md`](decomp/docs/FILE_FORMATS.md) / [`DECK_FORMAT.md`](decomp/docs/DECK_FORMAT.md) | NitroFS + proprietary formats |
| [`decomp/docs/NEW_KOMA.md`](decomp/docs/NEW_KOMA.md) | Koma table / art / overlay mod research |
| [`decomp/docs/KOMA_DATABASE.md`](decomp/docs/KOMA_DATABASE.md) | All 890 komas |
| [`decomp/docs/SAVEBUG.md`](decomp/docs/SAVEBUG.md) | Save-chip bug hunt sessions |
| [`decomp/docs/REPO_AUDIT.md`](decomp/docs/REPO_AUDIT.md) | Public-repo publishing policy |

## Known limitations (v0.1.0)

- Windows-only runner; interactive play needs a gamepad or keyboard.
- Open bug: importing an existing 100% save is not always recognized as
  non-blank (see [`decomp/docs/SAVEBUG.md`](decomp/docs/SAVEBUG.md)).
- Mods are directory-based packs (no zip distribution yet); payload growth is
  bounded by NitroFS slack.

## Credits

- [ndsrecomp](https://github.com/mstan/ndsrecomp) — static recompilation
  framework + runner (MIT), with our modifications in [`patches/`](patches/).
- [JUSToolkit](https://github.com/priverop/JUSToolkit) — JUS format
  reference/validation.
- [ds-decomp](https://github.com/Decompollaborate/ds-decomp) — `dsd` tooling.
- ROM brought-up and reverse-engineered by **Gabriel Amoedo**.
