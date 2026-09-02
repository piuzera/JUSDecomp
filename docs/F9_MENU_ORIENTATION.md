# F9 Recomp-Settings Menu — Orientation / Mirroring Investigation

Status: **RESOLVED AND LIVE-VERIFIED 2026-09-02**.

The problem was inside the bitmap-font renderer, not the framebuffer presenter.
`kFont3x5` stores the leftmost pixel in bit 2, but both text functions treated
bit 0 as the leftmost pixel. This mirrored every asymmetric glyph individually
while preserving the order of the characters in each word. Mirroring the whole
frame therefore corrected each glyph but reversed the words, producing the
reported scrambled result.

The menu also supplied mixed-case labels to a table whose lowercase glyph slots
are blank. Both renderers now map lowercase input to the corresponding uppercase
glyph, read glyph rows from bit 2 to bit 0, and retain the intended directions of
the `<` and `>` glyphs.

The remainder of this document preserves the investigation history.

## 1. What the feature is

The F9 host-side overlay menu ("RECOMP SETTINGS") lets the user change recomp
options live (window size, fullscreen, borderless, game speed, overlay, screenshots,
and restart-required quality knobs), persists them to a key=value override file
(`ingame-settings.txt`), and is implemented entirely in the runner frontend:

- [`frontend.cpp`](../tools/ndsrecomp/runner/src/frontend.cpp) — menu state machine,
  rendering, input, persistence, screenshots.
- The menu is drawn into a scratch copy of the top framebuffer
  (`g_overlay_scratch`) so the guest surface is never modified, then presented as
  the top screen.
- Font: hand-rolled 3x5 bitmap font `kFont3x5[95][5]` (95 ASCII glyphs), drawn
  at 2x integer scale.

## 2. The reported symptom (chronology)

| Build | State | User report |
|---|---|---|
| Initial menu build | corrected font, no mirror | "no highlight, whole page mirrored" / "text mirrored horizontally, top screen" |
| + mirror applied | mirror | "Now it's worse. The words are all scrambled." |
| mirror reverted | no mirror | "The font is still all garbled." / "partly wrong/mirrored/garbled" |
| current (no mirror) | no mirror | "Still mirrored" |
| + one-shot buffer mirror | mirror (horizontal) | "Now the text is garbled." |

Pattern: **no mirror → "mirrored"; mirror → "garbled/scrambled" (worse).** The
one-shot mirror did NOT make the text readable, which rules out a simple
horizontal flip of the presented buffer.

## 3. Hard facts established

### 3.1 Why the screenshot decode was misleading

`jus_shot_6.bmp` was captured by the current build with the menu open. A full
decode (see tools in §6) showed the top buffer contained the characters in
left-to-right order and was not flipped as a whole. It did not establish that
the pixels inside each glyph were oriented correctly. The OCR tooling used the
same font table and therefore reproduced the renderer's mistaken bit-order
assumption instead of exposing it.

### 3.2 The GL compute presenter does not flip (shader analysis)

Active renderer (from `game.log`): `OpenGL 4.3 compute`, NVIDIA RTX 3060.
The present vertex shader in
[`melonds_compute/ComputeHost.cpp`](../tools/ndsrecomp/runner/src/melonds_compute/ComputeHost.cpp)
(`kPresentVertex`):

```glsl
vec2 p = vec2((gl_VertexID << 1) & 2, gl_VertexID & 2);
uv = vec2(p.x, 1.0 - p.y);
gl_Position = vec4(p * 2.0 - 1.0, 0.0, 1.0);
```

Fullscreen triangle vertices: (NDC, uv) = (-1,-1, 0,1), (3,-1, 2,1), (-1,3, 0,-1).
Interpolated: screen-left → `uv.x=0` → texture column 0; screen-top → `uv.y=0` →
texture row 0. The fallback texture is uploaded with
`glTexSubImage2D(..., width, 192, GL_BGRA_INTEGER, GL_UNSIGNED_BYTE, fallback_pixels)`
(row 0 of the buffer = texture row 0), and the fragment fetches
`texelFetch(texFallback, clamp(uv*size), 0)`. **No horizontal or vertical flip.**
The bottom screen goes through the SDL renderer (`SDL_UpdateTexture` +
`SDL_RenderCopy`), also no flip.

### 3.3 The apparent contradiction

- Buffer correct (screenshot), presenter does not flip → screen should be correct.
- User sees mirrored/garbled in every build.
- The game's own text on the same screens renders fine (never complained about).

The missing distinction was between mirroring the complete framebuffer and
mirroring each glyph in place. The latter matched every observation without
requiring any transform in the presenter.

## 4. Failed experiments and what they imply

1. **Mirroring the drawn glyphs** (attempt 1): user → "words are all scrambled".
2. **Mirroring the whole menu buffer** (`mirror_horizontal`: swap `row[x]` with
   `row[fb_w-1-x]`; applied after `draw_recomp_menu`, reverted after test):
   user → "text is garbled".

Since mirroring the buffer made it *worse*, either (a) the presenter does not
flip and the buffer itself is not what the decode suggested, or (b) the flip is
**not** a plain horizontal mirror (e.g., vertical/upside-down, or a diagonal), or
(c) the on-screen issue is not a global mirror at all but per-glyph corruption
("partly wrong" is a recurring description) plus a separate orientation issue.

## 5. Historical hypotheses (superseded)

1. **Vertical (upside-down) flip, not horizontal.** A vertical flip would make a
   correct buffer appear upside down, which a user may describe loosely as
   "mirrored", and a *horizontal* mirror would then produce a diagonal mess
   ("garbled") — matching both reports. Test: draw the menu, then in the same
   build also mirror vertically and see if it reads correctly; or add an
   asymmetric marker (e.g., a big `F` in the top-left and an arrow) and ask the
   user what they see.
2. **The live-presented buffer differs from the screenshot buffer.** The
   screenshot captures `top_pixels` (the scratch). Confirm the presenter receives
   the exact same pointer, or capture the actual GL framebuffer
   (`glReadPixels` after present) and compare with the scratch.
3. **Direct-frame / HD path takeover.** When the menu is open, emulation is
   paused. Check `nds_gpu2d_direct_frame()`: if a direct 3D frame is still
   emitted, the presenter uses `direct_frame`/HD surfaces instead of
   `fallback_pixels`, and the menu would not appear at all — unless the
   still-emitted game frame is what's on screen (which would also explain a
   stale/frozen image). Verify which path is taken with the menu open.
4. **Font table corruption for specific glyphs** ("partly wrong"). Some entries
   may still be wrong or missing. A clean way to rule this out: render each of
   the 95 glyphs into a screenshot grid and OCR/compare against the intended
   ASCII; or switch to a game-provided font (user suggested this).
5. **Adaptive/widescreen buffer** — ruled out for now: `adaptive_widescreen =
   "none"` in the running config.

## 6. Diagnostic tools created (recomp/)

- `bmp_ascii.py` — decodes a stacked screenshot BMP to ASCII (top/bottom).
- `bmp_menu_scan.py` — orientation-independent scan for the menu's dark backdrop
  and bright text in the raw file rows.
- `bmp_menu_render.py` — renders a screen at full resolution (with `--mirror`).
- `bmp_raw.py` — dumps raw file rows 0..191 / 192..383 in either order.
- `bmp_textblock.py` — prints a raw row range with a "not-backdrop" filter.
- `bmp_ocr.py` / `bmp_ocr2.py` — OCR that extracts `kFont3x5` from frontend.cpp
  and matches glyphs. (Alignment was still being tuned.)

### BMP layout facts (important, easy to trip over)

`save_stacked_bmp` writes rows with `for (y = kH-1; y >= 0; --y)` and the first
`fwrite` lands at **file row 0**. So:

- file rows 0..191 = the **top** buffer written bottom-up (top row 0 at file row
  191); file rows 192..383 = the bottom buffer (bottom row 0 at file row 383).
- A naive reader that treats file row 0 as the top screen will show the menu
  "on the bottom screen", upside down. **This caused most of the earlier
  confusion** (the user's "the overlay is on the bottom screen" comment was this
  artifact, not a real swap).
- This was FIXED: `save_stacked_bmp` now writes the top screen upright in the
  top half and the bottom screen upright below. Keep this fix.

## 7. Final code state

- Glyph pixels are read bit 2 first, matching the font table's encoding.
- Lowercase input maps to the matching uppercase glyph.
- The `<` and `>` bitmap entries preserve their intended directions.
- Framebuffer-level mirror experiments remain reverted.
- `save_stacked_bmp` fix kept (upright, correctly-ordered screenshots).
- Temporary unconditional F12 capture removed; screenshots again respect the
  menu's enable/disable setting.
- Patch regenerated: `patches/ndsrecomp/0001-jus-runner-modifications.patch`.

## 8. Verification

The host build and automated runner tests verify compilation and regressions.
The corrected menu was also verified in a playable build, including asymmetric
glyphs and the previously missing mixed-case labels.

## 9. Relevant code locations

- Menu draw + scratch: `frontend.cpp` — `draw_recomp_menu`, `g_overlay_scratch`,
  the `if (menu_open && top_pixels ...)` block, `draw_text_3x5_scaled`,
  `kFont3x5`.
- Screenshot: `frontend.cpp` — `save_stacked_bmp`, the F12 `screenshot_pending`
  block.
- Presenter: `melonds_compute/ComputeHost.cpp` — `kPresentVertex`,
  `kPresentFragment`, `nds_compute_host_present_top`.
- Framebuffers: `gpu2d.cpp` — `nds_gpu2d_framebuffer`, `g_fb[g_front][screen]`,
  `engine_a_on_top` mapping.
