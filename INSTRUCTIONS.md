You are working on a reverse-engineering and native recompilation project for the Nintendo DS game **Jump Ultimate Stars (JUS)**.

## Project goal

The long-term goal is to reconstruct Jump Ultimate Stars into maintainable source code and eventually produce a **native executable that can run without a Nintendo DS emulator**.

The final project should:

* Reconstruct the original game's gameplay logic as accurately as practical.
* Preserve the behavior of the original game.
* Replace Nintendo DS-specific hardware/API functionality with native equivalents where necessary.
* Eventually allow the game to run as a normal desktop application.
* Be structured so that the game can later be modified, extended, translated, and otherwise modded easily.
* Keep reconstructed game logic separate from platform-specific/native runtime code whenever possible.

This is therefore not merely a ROM-hacking project.

It is also not an instruction to write a Nintendo DS emulator.

The intended progression is approximately:

1. Analyze and document the original Nintendo DS program.
2. Reconstruct original functions, data structures, systems, and file formats.
3. Produce matching or behaviorally equivalent source code.
4. Identify dependencies on NitroSDK/Nintendo DS hardware.
5. Create clean abstractions around those dependencies.
6. Implement native replacements for graphics, audio, input, filesystem, timing, etc.
7. Build a native JUS executable.
8. Gradually make the reconstructed systems mod-friendly.

The original game should remain our behavioral reference throughout the process.

---

# Legal/source-material assumptions

Assume that the ROM in this workspace was legally dumped by the project owner from their own copy of the game.

Do not:

* download ROMs,
* search for copyrighted ROM images,
* redistribute Nintendo/Bandai copyrighted assets,
* commit the original ROM to Git,
* commit large extracted copyrighted assets unless explicitly instructed.

Reverse-engineering metadata, documentation, reconstructed source code, symbols, structures, tools, and scripts can be kept separately from original game data.

---

# Current project directory

The workspace root is:

`JUS Decomp`

Do not rename the root directory.

The current directory structure is approximately:

```text
JUS Decomp/
├── rom/
│   └── jus.nds
│
├── tools/
│   └── dsd/
│       └── dsd.exe
│
├── extract/
│   └── [files extracted from the original ROM]
│
└── decomp/
```

The clean original ROM has already been verified against the expected hashes.

The ROM has also already been successfully extracted using **ds-decomp (`dsd`)**.

Therefore:

**Do not repeat ROM verification or extraction unless there is a specific technical reason to do so.**

Treat:

`rom/jus.nds`

as read-only reference material.

Treat:

`extract/`

as the baseline extraction of the original game.

The main working source tree should eventually live under:

`decomp/`

---

# Tools and references

The project is expected to use tools such as:

* ds-decomp / `dsd`
* Ghidra
* NTRGhidra
* objdiff
* melonDS for behavioral/debugging reference when necessary
* GDB where useful
* Python for tooling and format analysis
* Git
* native C/C++ tooling later in the project

An existing reverse-engineering project for **Metroid Prime Hunters**, particularly MphRead and its documentation, can be consulted as a methodological reference.

However, do not blindly copy MphRead's architecture.

Jump Ultimate Stars has different engine requirements and our final objective is specifically a **native, moddable reconstruction**.

There is also existing JUS-specific reverse-engineering work such as **JUSToolkit**, which may contain useful knowledge about proprietary JUS formats including archives, graphics, text, sprites, and related asset structures.

Existing research should be reused when trustworthy rather than rediscovered unnecessarily.

---

# Important architectural principle

Keep these concepts separate:

```text
ORIGINAL GAME LOGIC
        │
        ▼
Reconstructed JUS systems
        │
        ▼
Platform abstraction layer
        │
        ├── Original Nintendo DS behavior/reference
        │
        └── Native implementation
                 │
                 ├── graphics
                 ├── input
                 ├── audio
                 ├── filesystem
                 ├── timing
                 └── other platform services
```

Do not mix native-platform code directly into reconstructed gameplay functions unless unavoidable.

For example, a reconstructed function such as:

```cpp
Player::ApplyDamage(...)
```

should ideally remain game logic.

It should not directly contain SDL, Windows, OpenGL, Vulkan, DirectX, etc.

Platform-specific behavior should live behind explicit interfaces.

This separation will be very important for future modding.

---

# Native port direction

No final native technology stack has been chosen yet.

Do not prematurely commit the project to:

* SDL2/SDL3
* OpenGL
* Vulkan
* DirectX
* GLFW
* SFML
* a custom renderer

without first understanding what JUS actually requires.

A lightweight cross-platform solution will probably be appropriate because JUS is primarily a 2D Nintendo DS game, but the decision should be driven by analysis rather than assumption.

Likewise, do not assume that every Nintendo DS subsystem needs to be recreated.

If the original game interacts with a DS service that can be replaced by a much simpler native abstraction, prefer the simpler implementation while preserving game-visible behavior.

---

# Reverse-engineering priorities

Focus initially on the ARM9 program.

The ARM7 should be investigated when necessary, particularly for systems such as:

* audio,
* wireless/network behavior,
* low-level services,
* system interaction.

Do not spend significant time decompiling generic SDK/library code if it can be confidently identified as standard library/NitroSDK code and isolated from JUS-specific logic.

The highest-value targets are JUS-specific systems such as:

* game state management
* battle logic
* fighters/characters
* attacks
* damage
* knockback
* collision
* physics
* animation
* koma/deck systems
* support characters
* stages
* AI
* menus
* progression
* save data
* scripting/event systems
* asset loading
* sprite systems
* UI
* text
* sound/music control

Do not assume these exact subsystem boundaries exist. Discover the actual architecture first.

---

# Naming policy

Unknown functions will initially have generated names such as:

```text
FUN_020xxxxx
```

Do not rename functions based on weak guesses.

Prefer a progression like:

```text
FUN_02041234
↓
Maybe_UpdateBattleObject
↓
BattleObject_Update
```

only when evidence supports it.

For every meaningful rename, record why the identification was made.

Evidence may include:

* call sites
* accessed data
* strings
* runtime behavior
* known file formats
* repeated structure patterns
* debug observations
* related functions
* SDK signatures

Do not present speculation as fact.

---

# Documentation requirements

Maintain project documentation as discoveries are made.

At minimum, establish documentation for:

```text
decomp/docs/
```

Possible files can include:

```text
PROJECT.md
MEMORY_MAP.md
OVERLAYS.md
FUNCTIONS.md
STRUCTURES.md
FILE_FORMATS.md
GAME_SYSTEMS.md
NITROSDK.md
NATIVE_PORT.md
TODO.md
```

Do not create empty documentation files merely to satisfy this list.

Create them when they become useful.

Important discoveries should not exist only inside chat/agent history. Persist them in the repository.

---

# Reproducibility

Reverse-engineering actions should be reproducible.

Prefer scripts and configuration files over undocumented manual operations.

For example:

```text
tools/
scripts/
config/
symbols/
```

are preferable to instructions such as:

"Open this binary and manually change these ten things."

If something must be done manually in Ghidra, document the procedure.

---

# Git expectations

Before major changes:

* inspect the current repository state,
* avoid deleting unexplained files,
* avoid modifying original extracted files unnecessarily.

Source code, documentation, scripts, configuration, and reconstructed information should be version-controlled.

Original copyrighted ROM data should remain excluded.

Create/update `.gitignore` accordingly when appropriate.

---

# Accuracy over speed

Do not attempt to produce thousands of lines of guessed C/C++ merely to make the project appear to progress.

A correct understanding of one subsystem is more valuable than a speculative reconstruction of twenty.

When uncertain, explicitly distinguish:

* confirmed,
* strongly inferred,
* tentative,
* unknown.

---

# Matching decompilation vs native reconstruction

There are two related but distinct goals.

## Track A: Original-code reconstruction

Where practical, reconstruct functions so that their generated ARM code matches or closely resembles the original.

This helps validate that:

* control flow is correct,
* structures are correct,
* types are correct,
* compiler behavior is understood.

Tools such as `objdiff` can assist here.

## Track B: Native runtime

Eventually, reconstructed game logic should also compile for a modern native target.

Not every function needs to remain byte-identical once moved into the native runtime.

The original ARM build remains the reference for correctness, while the native build prioritizes equivalent behavior and maintainability.

Do not sacrifice understanding of the original game merely to make the native version compile early.

---

# Modding goal

Design reconstructed systems so that they can eventually support modification.

Potential future modding capabilities may include:

* characters
* character parameters
* attacks
* animations
* koma
* decks
* stages
* sprites
* textures
* text
* music
* game rules
* AI behavior

However, do not build a mod API yet.

First reconstruct how the original systems actually work.

Once those systems are understood, we can decide which data should remain original-format compatible and which should gain cleaner external formats.

---

# Your working behavior

Before modifying anything:

1. Inspect the current `JUS Decomp` workspace.
2. Inspect the contents produced by `dsd` under `extract/`.
3. Determine exactly what extraction produced.
4. Identify ARM9, ARM7, overlays, filesystem data, and metadata.
5. Inspect the installed `dsd` version and available commands.
6. Read existing configuration/documentation in the repository before creating replacements.

Do not assume filenames or paths that are not actually present.

If reality differs from this project description, report the difference and adjust accordingly.

---

# FIRST TASK

Do **not** begin decompiling gameplay functions yet.

Your first assignment is reconnaissance.

Inspect the current workspace and produce a concise technical inventory of what we currently have.

Determine:

1. The exact directory tree relevant to the project.
2. What `dsd` produced in `extract/`.
3. ARM9 binary information.
4. ARM7 binary information.
5. Number and organization of ARM9 overlays.
6. ARM7 overlays, if present.
7. NitroFS/file-system structure.
8. Available module/overlay tables.
9. Load addresses and entrypoints where available.
10. Any immediately recognizable NitroSDK/static-library components.
11. Any obvious JUS-specific archive/file formats visible in the filesystem.
12. What information `dsd` can already generate for us that will help initialize the actual decompilation.

Do not alter the original ROM.

Do not make broad architectural changes yet.

You may create small scripts or documentation necessary to record this reconnaissance.

At the end, provide:

### Findings

What you discovered.

### Confidence

Which findings are confirmed versus inferred.

### Recommended next action

Exactly one logical next stage for the project.

### Files changed

Every file you created or modified and why.

The immediate objective is to build an accurate map of the original game before reconstructing code.
