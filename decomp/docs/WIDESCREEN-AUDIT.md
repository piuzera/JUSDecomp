# Widescreen audit — Jump Ultimate Stars (2026-08-22)

Session goal: determine what it takes to give the JUS top screen a true 16:9
view. Status: **paused** (widescreen is not core project scope). This document
records the ground truth gathered and the resume checklist.

## Verified facts

### 1. The 3D engine is not used during battle

- `gx_polygons` (`RenderNumPolygons`, [`gpu3d.cpp:556`](../tools/ndsrecomp/runner/src/gpu3d.cpp:556))
  reports 50 quads — but the polygon list is **byte-identical across 8+ seconds
  of live battle** (same sha1 over three samples). The counter only updates
  when a 3D frame actually renders
  ([`GPU3D.cpp:2506`](../tools/ndsrecomp/runner/vendor/melonds/GPU3D.cpp:2506)),
  so these are a **stale frame from the battle intro** (a transient
  3D-textured-quad cut-in), not live battle rendering.
- During battle `GXSTAT = 0x8e000000` (idle pattern) and DISPCNT mode is 3.
- The battle intro's mode-6 frames would already be eligible for the runner's
  existing 3D adaptive widescreen path — a future freebie.

### 2. Battle top-screen register profile (engine A on top, POWCNT1=0x820F)

Sampled over 60+ frames in a live battle; stable:

| Register | Value | Meaning |
|---|---|---|
| DISPCNT_A | `0x40111F1B` | **mode 3** (all-text BGs), BG0-3 + OBJ on, no windows, display mode 1 |
| BG0CNT_A | `0x0001` | text 256x256, prio 1, map screen 0, tiles char 0 |
| BG1CNT_A | `0xE00A` | text 512x512, prio 2, map screen 14, tiles char 2 |
| BG2CNT_A | `0xC40F` | text 512x512, prio 3, map screen 4, tiles char 1 |
| BG3CNT_A | `0xA812` | text 256x512, prio 2, map screen 8, tiles char 0 |
| BLDCNT_A | `0x3E41` | alpha blend: 1st = BG0+colorspecial, 2nd = BG1-3+OBJ+backdrop |
| MOSAIC / WIN* | `0` | unused |
| DISPCAPCNT | `0` | no display capture |
| Engine B | mode 0, BG0 text + OBJ, WININ=0x1F1F | bottom screen (koma panel) |

### 3. The camera is NOT register-driven — the scene is software-rendered

- All BG scroll registers (BG0X..BG3Y) read **constant 0 across 100 samples
  while the player moved** (10-second coordinated capture,
  [`recomp/probe-scroll.json`](../recomp/probe-scroll.json)).
- The BG maps in VRAM are effectively static during play.
- **VRAM bank E — the LCD/BG bank — is rewritten every frame** (confirmed via
  the `read_region` raw-bank dumps; see
  [`recomp/probe-display.json`](../recomp/probe-display.json) session notes).
  Only the first 2KB chunk was observed changing in the tail of the session,
  but that tail likely was no longer a live battle — re-verify on resume.
- Engine-A OAM is nearly empty (~2-3 active entries, x within 0..254; rest
  parked at y=192) while the scene clearly shows fighters — **the fighters and
  stage viewport are drawn by the game into BG tile graphics in VRAM bank E
  each frame**, with the camera applied in software.
- VRAMCNT during battle: A=ARM7 (`0x81`), B/C/D=OBJ (`0x83/0x8B/0x93`),
  **E=BG (`0x82`)**, F=palette (`0x83`), G=LCD (`0x8C`), H=BG ext-pal (`0x81`),
  I=OBJ ext-pal (`0x82`). All BG maps+tiles therefore live in bank E
  (`0x06880000` raw), which appears at LCD `0x06000000..0x0600FFFF`.

## Consequence for a 16:9 top screen

The original hypothesis — "the runner's wide-2D compositor can reveal more
stage by continuing the BG decode beyond x=255" — is **wrong for JUS battles**.
The game only materialises the native 256px viewport in VRAM; there is no
stage content beyond it for a host compositor to reveal. The runner-side
compositor work ([`nds_gpu2d_adaptive_framebuffer`](../tools/ndsrecomp/runner/src/gpu2d.cpp:1722))
remains useful infrastructure, but real 16:9 requires a **game-side patch of
the battle software renderer** (ov011 battle core / ov006 battle UI):

1. RE the renderer that blits the world window into bank-E tiles; find the
   256-wide viewport constant and the camera center/clamp logic.
2. Patch it to draw a ~340px-wide world window, laid out so the host can
   reveal it (e.g. across the full 512 columns of a text BG, or onto an
   affine rot-scale BG), with HUD layers kept native-anchored.
3. Optionally add a runner wide-2D branch to display the wider slice, or
   (simpler) accept a zoom-out style where the wide world is scaled into
   256px.
4. The battle intro's transient mode-6 frames work with the existing 3D
   adaptive path once `adaptive_capability = "top"` is declared.

Cheaper alternatives, in order of effort:

- **Pillarboxed 16:9 surface**: `adaptive_widescreen = "top"` +
  `adaptive_capability = "top"` + `adaptive_width = 340` in
  [`recomp/game.toml`](../recomp/game.toml:7). The game image stays 4:3 with
  black side bars — one-line config, no code.
- **Stretched 16:9**: presentation-level scaling; the framework deliberately
  refuses stretching, so this would need an explicit new display option.

## Tooling created this session (all in `recomp/`)

| Script | Purpose |
|---|---|
| [`probe_display.py`](../recomp/probe_display.py) | multi-register scene sampler + PNG snapshots + scene signatures |
| [`probe_scroll.py`](../recomp/probe_scroll.py) | time-boxed scroll-register watcher for coordinated captures |
| [`vram_banks.py`](../recomp/vram_banks.py) | hash all raw VRAM banks/OAM/palettes via `read_region` |
| [`vram_chunks.py`](../recomp/vram_chunks.py) | per-8KB-chunk change detection of a VRAM range |
| [`vram_bands.py`](../recomp/vram_bands.py) | per-column-band BG-map change detection + OAM summary |
| [`vramE_diff.py`](../recomp/vramE_diff.py) | per-2KB diff of raw bank E |
| [`gx_sample.py`](../recomp/gx_sample.py) | 3D polygon-list sampling/hashing |
| [`fb_ascii.py`](../recomp/fb_ascii.py) | framebuffer ASCII art + verbatim OAM dump |

Captures: `recomp/probe-display*.json`, `recomp/probe-scroll.json`,
`recomp/vram-bands.json` (plus `recomp/probe-display*.shots/*.png`).

## Resume checklist

1. During a **confirmed live battle** (ask the player), re-run
   [`vramE_diff.py`](../recomp/vramE_diff.py) and
   [`vram_banks.py`](../recomp/vram_banks.py) to map the exact per-frame write
   pattern of bank E (which tile regions hold the stage vs fighters vs HUD).
2. Dump the BG0/BG1 maps via the runner's own renderer view (add a small
   `read_region`-style debug command for the LCD-mapped view if needed) to
   identify the map layout the renderer targets.
3. Trace the bank-E write call sites in ov011/ov006 (watchpoint on
   `0x06880000` writes via the debug server's `watch` command) to find the
   battle software renderer and its viewport constants.
4. Decide between the real game-side patch and the pillarbox fallback, then
   implement per [`plans/widescreen-2d.md`](../plans/widescreen-2d.md).
