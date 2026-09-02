# Changelog

All notable changes to this project are documented here. Version numbers track
the public releases; internal research milestones before v0.1.0 are summarized
below from the project's working history.

## 0.3.1 — 2026-09-02 (quality of life and performance)

- **In-game settings menu (F9):** live window/display, game-speed, input,
  screenshot and renderer-quality controls, with corrected non-mirrored text.
  F10 toggles turbo, F11 toggles the FPS/status overlay, and F12 captures a
  screenshot.
- **Lower scheduler overhead:** fixed-rate LCD, SPU and RTC deadlines are
  retained exactly and device catch-up runs only when due. In an instrumented
  gameplay comparison, sampled scheduler cost fell about 29% (4.530 to 3.215
  ms per 1,000 rounds) without changing guest timing or event order.
- **Cheaper native dispatch and overlay management:** cached banks preload in
  one batched registration before boot; overlay polling moved out of the
  64-cycle scheduler hot loop; successful hit diagnostics are sampled; and
  negative dispatch-cache hits stay within one cache line.
- **Performance diagnostics:** rolling 600-frame p50/p95/p99/max work times,
  deadline misses, renderer state, audio underruns, overlay queues and network
  queue/drop counters are available through the debug server and corrected
  CSV probe. Startup FMV performance is explicitly excluded from gameplay
  conclusions.
- **Stability:** Linux and MinGW Release builds pass, all 14 runner tests pass,
  and bounded headless plus interactive gameplay soaks complete normally.

## 0.3.0 — 2026-09-01 (Linux support)

**Native Linux host** — the full runner and a GTK launcher build and run on
Linux with feature parity to the Windows app. First release with a Linux
target (source build; see [`docs/LINUX.md`](docs/LINUX.md)).

- **One-command Linux build**: `tools/scripts/build_linux.sh` clones, pins,
  and patches ndsrecomp, verifies the ROM SHA-1, generates all title banks,
  builds the runner (GCC, SDL2, OpenGL 4.3 compute renderer with automatic
  software-renderer fallback) and the GTK3 launcher, and runs both test
  suites.
- **GTK launcher (feature parity)**: ROM verification, mod toggles,
  controller and keyboard mapping, save import/reset, display layout,
  Wiimmfi online settings, and session logging. Settings live in
  `~/.config/JUSDecomp` (`$XDG_CONFIG_HOME` respected; portable mode
  supported).
- **Linux-native infrastructure**: live-overlay promotion compiles hot pages
  to `.so` banks in-session; local wireless and the WFC peer relay use POSIX
  sockets. Packet-capture integration remains Windows-only (off by default).
- **Linux framerate pre-seed — 60 fps from first launch.** The Linux build
  now runs `tools/scripts/live_preseed.py` after the runner build to seed
  `recomp/live-cache` (plus both 2P caches) with every ROM overlay page
  compiled to native — the same step the Windows packager applies to its
  bundle. Without it, a fresh Linux install booted with the RAM overlays on
  the Tier-3 interpreter (~30 fps) and then spent minutes compiling banks in
  the background while playing. Verified on the reference machine: the menu
  runs at 59.4 fps with zero interpreted instructions and an idle overlay
  compiler, versus 39–41 fps while converging before. Recovery if a cache is
  ever missing/stale: `python3 tools/scripts/live_preseed.py` (deduped).
  One residual: the ARM7 WRAM Wi-Fi driver pages are assembled by the guest
  at runtime and converge in-session during the first minutes of online
  play (not pre-seedable from ROM data).
- **Docs**: new [`docs/LINUX.md`](docs/LINUX.md) (requirements, build, run,
  native pre-seed + framerate troubleshooting); README and USER_GUIDE Linux
  sections.

## 0.2.2 — 2026-08-29 (intro crash hotfix)

Fixes a silent crash-to-desktop a few seconds into the video intro on some
integrated-GPU machines (e.g. AMD Ryzen APUs with Vega graphics on current
Adrenalin drivers). The auto-selected OpenGL 4.3 compute renderer hit a
driver error (`GL_INVALID_VALUE 0x0501`) on its frame readback and the
runner shut the session down. Now a runtime compute failure automatically
demotes to the faithful threaded software renderer and the game keeps
playing (only the accelerated 3D path is skipped for the rest of the
session). Players can also force the software path from boot by setting the
`NDS_3D_RENDERER=soft` environment variable.

- **Root cause**: `ComputeRenderer::PrepareCaptureFrame()`'s
  `glGetTexImage` readback raised `GL_INVALID_VALUE` on specific AMD
  iGPU/driver combinations mid-intro, and `compute_readback_failed()`
  responded by terminal-halting both CPUs (a clean, dialog-less exit — hence
  "crashes to desktop without logs").
- **Fix**: `compute_readback_failed()` now swaps in the soft renderer
  (`nds_gpu3d_restore_soft_renderer()`) instead of halting the machine; the
  frontend and exit path treat a recovered (demoted) failure as a normal
  session. Framework diff lives in
  [`patches/ndsrecomp/0001-jus-runner-modifications.patch`](patches/ndsrecomp/0001-jus-runner-modifications.patch).

## 0.2.1 — 2026-08-25 (online FPS fix)

Fixes the online WiFi Battle framerate drop (60 → ~35 fps) that shipped in
0.2.0. Online play now runs at ~60 fps almost all the time.

- **Root cause**: the drop was not the emulated WiFi hardware — it was the
  guest WFC/DWC network stack (ARM9 overlays ov008/ov010 + the ARM7 wifi
  driver) running on the Tier-3 interpreter because the online launchers
  never enabled live-overlay promotion (offline `live` mode did — hence
  clean offline battles). Full write-up:
  [`decomp/docs/ONLINE_FPS.md`](decomp/docs/ONLINE_FPS.md).
- **GUI launcher now enables live-overlay promotion in online mode.** The
  launcher (the primary player entry point) previously passed only the
  network flags, so players using it still got ~35 fps. It now passes
  `--live-overlay-enable --live-overlay-auto` with a 15 s activation delay
  and a 20 s auto-cooldown, pointing at the bundle's pre-seeded
  `app/live-cache`.
- **Offline pre-seed integrated into the release package.** The packager
  now runs `tools/scripts/live_preseed.py` to compile every ROM overlay page
  to native ahead of time, so the shipped bundle boots fully native — no
  in-session convergence wait, no runtime compiler needed.
- **WFC profile persistence.** The launcher now passes
  `--firmware-state-path` under the user dir, so the friend code / WFC
  profile persists across relaunches.
- **Online mode on by default.** The launcher's **Online mode (Wiimmfi)**
  setting now defaults to enabled, so players get the fixed online path out
  of the box (just type a player name).
- **Known issue**: occasional sub-second micro-stutters during online play
  remain (documented + next-session plan in `decomp/docs/ONLINE_FPS.md`).

## 0.2.0 — 2026-08-25 (online play)

**Online WiFi Battle over the public Wiimmfi/Kaeru service** — a major
milestone: Jump! Ultimate Stars now plays online, world-wide and on the same
network, through the recompiled runner (no ROM patch; DNS-only redirect).

- **Peer-unicast WFC relay fix**: relayed Wiimmfi NATNEG peer frames are now
  delivered unicast-to-self (the receiving console's MAC) instead of
  broadcast, resolving the match-completion timeout (error 80430) that
  previously blocked friend battles. `--wfc-peer-unicast on|off` (default
  on).
- **Validated** (2026-08-25): room created + joined with distinct friend
  codes on one machine, and a successful match between two different
  networks (this PC and a laptop on a 5G hotspot — no relay).
- **`wiilink` WFC provider** added (`--wfc-provider wiilink`, DNS
  `167.235.229.36`) for A/B testing against the default Kaeru/Wiimmfi
  route.
- **Launcher**: Settings gains **Online mode (Wiimmfi)** and a **player
  name** field (persisted in settings.json); Play passes
  `--network on --wfc on --wfc-provider wiimmfi --player-name ...` to the
  runner.
- **Launchers**: `recomp/run_jus_online.cmd` (single machine) and
  `recomp/run_jus_2p.cmd` (two instances on one machine).
- **Docs**: `recomp/ONLINE_TEST.md` online test guide; NDSRECOMP.md Session 3
  write-up (friend-code identity mechanism, validation evidence).
- **Known issue**: online play runs at ~35 fps instead of the offline 60 fps
  on both machines; being investigated.

## 0.1.1 — 2026-08-25 (hotfix)

Fixes the `0xc000007b` (STATUS_INVALID_IMAGE_FORMAT) startup crash reported on
clean machines when running the public release's `JUSDecomp.exe`.

- **Root cause**: the release packager only bundled the launcher's runtime
  DLLs (`SDL2.dll`, `libwinpthread-1.dll`) inside `app/` for the runner, not
  next to `JUSDecomp.exe` at the bundle root. Windows never searches the
  `app/` subdirectory, so on machines without MSYS2 on PATH the 64-bit
  launcher fell back to a wrong-architecture `SDL2.dll` from System32/PATH →
  `0xc000007b`. It only worked on the build machine because `ucrt64\bin` was
  reachable there.
- **Packaging fix** (`tools/scripts/package_release.py`): the launcher step
  now copies `SDL2.dll`, `libwinpthread-1.dll`, `libgcc_s_seh-1.dll`, and
  `libstdc++-6.dll` next to `JUSDecomp.exe` at the bundle root.
- **Launcher hardening** (`launcher/CMakeLists.txt`): `libstdc++` and
  `libwinpthread` are now statically linked (via
  `-Wl,-Bstatic -lstdc++ -lwinpthread -Wl,-Bdynamic` in the library list —
  after the objects, since static `libstdc++` itself imports pthread
  primitives). The shipped launcher's only non-system runtime dependency is
  now `SDL2.dll`, which ships alongside it.
- The runner bundle in `app/` was already internally consistent and is
  unchanged.

## 0.1.0 — 2026-08-24 (first public release)

First public release: repository cleaned for GitHub publishing, MIT license,
and a user-facing mod pipeline.

- **English Translation mod pack** (`recomp/mods/english-translation/`): a
  faithful, standalone mod-form reproduction of the community English patch.
  A classified byte-level diff (`tools/scripts/eng_diff.py`, report in
  `plans/eng-rom-diff-report.md`, manifest `recomp/eng_diff.json`) proved the
  patch touches only 28 NitroFS files (text tables, tutorials, font width
  tables, graphics archives) — arm9, arm7, all 14 overlays and the banner are
  byte-identical, so no code patches are needed. `build.py` rebuilds the
  payloads locally from the user's own `rom/jus-en.nds`; verification via
  `tools/scripts/eng_verify.py` (effective-ROM byte audit) and an
  owner-validated play session.
- **Overlay resolver: trailing-space relocation** (`tools/scripts/mods_build.py`):
  payloads that outgrow their in-place slack are now relocated into the
  ROM's trailing free space with their FAT entries repointed (shared
  relocation cursor across packs during compose). Content search is
  FAT-anchored to avoid wrong-offset matches.
- **Keyboard remapping** (runner + launcher): new `[[input.keyboard]]` config
  tables rebind host keys (SDL scancode names) to DS buttons; the launcher's
  Settings gains **Map keyboard...** (12-button capture, Esc = keep default,
  reset-to-defaults). Defaults unchanged (Z/X = A/B, A/S = Y/X, Q/W = L/R).
- **Housekeeping**: the koma-890-jodio proof-of-concept pack was removed from
  the shipped build (its research lives on in `decomp/docs/NEW_KOMA.md`);
  `recomp/apply_overlays_check.py` is now a generic overlay pre-flight
  (per-mod semantics live in `tools/scripts/eng_verify.py`); the release
  bundles the English Translation as its sole mod.
- **Beginner-friendly launcher** (`launcher/`): a single GUI executable that
  wraps the runner — ROM selection via file dialog with automatic SHA-1
  verification and friendly error messages, one-click Play, in-app settings.
- **In-app mod management**: bundled mod packs ship prebuilt; Settings → Mods
  toggles them on/off, persisted across sessions.
- **In-app controller setup**: guided button-capture dialog (SDL2) writes
  device mappings to the SDL gamecontroller database automatically.
- **Settings persistence** in `%APPDATA%\JUSDecomp\settings.json`
  (portable mode supported), save-file import/delete, session logging.
- **Packaging**: `tools/scripts/package_release.py` assembles the
  self-contained `dist/JUSDecomp/` bundle (launcher + runner + DLLs + bios +
  prebuilt mods + player guide).
- `docs/USER_GUIDE.md` player guide; README "For players" section.

### Reverse engineering & recompilation

- Reconnaissance of the ARM9/ARM7 binaries: memory map, 14 ARM9 overlays,
  NitroFS layout, format magics, C++ identification (`decomp/docs/`).
- `dsd` project bootstrap: per-module symbols/relocs/delinks + reference gap
  assembly for main, ITCM, DTCM, and all overlays.
- Track A build loop (delink/lcf/objdiff + optional mwldarm link): 100%
  byte-exact gap-asm baseline; first verified function match
  (`func_ov000_0214de00`).
- Adopted **ndsrecomp** static recompilation ("Track C"): authoritative ARM9
  bank (6,017 functions), headless smoke boot passed, full intro plays with
  touch input, overlay/WRAM live promotion works, arcade-stick support with
  controller remapping tool.
- Save-chip reverse engineering: 64 KiB cartridge backup identified as EEPROM
  (not flash), runner write-model bugs fixed, in-game saving works
  (`SAVEBUG*.md`).

### Data & formats

- Deck record format decoded (16 slots × koma/flags + Shift-JIS name),
  including leader/link/row/col flag bits and link-direction enum.
- All **890 komas** harvested and named (`data/koma_db.*`, `KOMA_DATABASE.md`),
  enriched with the owner's Jump Database; kizuna boost relations mapped.
- Runtime deck injection working: authored decks load and battle.
- Brand-new koma id **890** created and packaged via NitroFS growth.

### Mod pipeline (new in 0.1.0)

- `recomp/mods/<id>/` pack format: `mod.toml` manifest + `src/` assets +
  optional `build.py` hook; payloads rebuilt from the user's own extraction —
  no game data ever committed.
- `tools/scripts/mods_manage.py`: `list`, `enable`, `disable`, `build`,
  `compose` (auto-generates `recomp/game-mod.generated.toml`).
- Example pack `koma-890-jodio` (reproduces the validated overlay mod
  byte-for-byte); generalized `recomp/play_mod.cmd` with fresh-save mode.
- Documentation: `decomp/docs/MODS.md`.

### Repository hygiene

- Comprehensive `.gitignore` + `.gitattributes`; public-repo audit and policy
  in `decomp/docs/REPO_AUDIT.md`.
- Local `ndsrecomp` modifications exported as a verified patch series
  (`patches/ndsrecomp/`).
- History rebuilt: one clean initial commit (previous working history kept in
  the local `backup/pre-v0.1` branch).
- MIT license for all original code/scripts/docs.

## Unreleased (pre-0.1 working history)

Milestones captured in git before the public history reset (branch
`backup/pre-v0.1`): reconnaissance docs + dsd init; build infrastructure;
CodeWarrior toolchain research; Track A loop operational; overlay→screen map;
Imp. registry discovery; first function match; scope change to playable POC;
JUSToolkit reuse and deck format RE; koma harvest; deck injection; save bug
sessions; new-koma POC; runtime overlay mod system.
