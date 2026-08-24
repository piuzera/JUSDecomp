#!/usr/bin/env python3
"""
dtx4_mod.py — byte-level DTX4 koma-sprite modder (offline custom-pixel route).

Works directly on the uncompressed .dtx files stored inside koma.aar
(ALAR3) without the .NET toolchain. Output bytes replace input bytes 1:1,
so produced .dtx files are EXACTLY the same size as the original — required
for in-place ROM replacement (no ndstool, no NitroFS rebuild).

Format (reverse-engineered from JUSToolkit's converters, decomp/docs/NEW_KOMA.md):
  DTX4:
    0x00 "DSTX"  0x04 u8 version  0x05 u8 type(=0x04)
    0x06 u16 numSegments  0x08 u16 dsigOffset  0x0A u16 unknown(=1)
    0x0C segment table: {u8 wTiles, u8 hTiles, u16 tileIndex} x numSegments
    dsigOffset: embedded DSIG
  DSIG:
    0x00 "DSIG"  0x04 u8 unknown  0x05 u8 imageFormat (low nibble bpp:
       0=4bpp; high nibble swizzling)
    0x06 u16 numPaletteLines  0x08 u16 width  0x0A u16 height
    0x0C palette: numPaletteLines x 32 bytes (16 x BGR555 per line)
    pixels: 4bpp NDS 8x8 tiles, 32 bytes per tile, byte (y*4 + x//2),
            high nibble = left pixel.

Subcommands:
  dump DTX             parse and print header, palette colors, tile occupancy
  paint DTX OUT        paint a blocky "Z" card into the first 48x48 segment;
                       recolor palette entries 1..2; write OUT
  paint-png DTX PNG OUT
                       import YOUR art: scale to the game's 46x44 koma window
                       and center it at (1,2) in the 48x48 tile; quantize its
                       opaque colors into up to 15 palette slots (index 0 =
                       transparent, unchanged), write OUT
  patch-rom ORIG_DTX NEW_DTX ROM OUT_ROM [--config recomp/game-mod.toml]
                       locate ORIG_DTX bytes in ROM (must be unique), replace
                       with NEW_DTX (same size required), write OUT_ROM and
                       update the [game].sha1 gate in the config
"""

from __future__ import annotations

import argparse
import hashlib
import re
import sys
from pathlib import Path

from PIL import Image

try:
    sys.stdout.reconfigure(encoding="utf-8")
except Exception:
    pass

FONT_Z = [
    0b11111,
    0b00001,
    0b00010,
    0b00100,
    0b01000,
    0b10000,
    0b11111,
]


def bgr555(c: tuple[int, int, int]) -> int:
    r, g, b = (v & 0xFF for v in c)
    return ((b >> 3) << 10) | ((g >> 3) << 5) | (r >> 3)


def unpack555(v: int) -> tuple[int, int, int]:
    return ((v & 0x1F) << 3, (v >> 5 & 0x1F) << 3, (v >> 10 & 0x1F) << 3)


class Dtx4:
    def __init__(self, data: bytes):
        if data[:4] != b"DSTX" or data[5] != 0x04:
            raise ValueError("not a DTX4")
        self.data = bytearray(data)
        self.num_segments = int.from_bytes(data[6:8], "little")
        self.dsig_off = int.from_bytes(data[8:10], "little")
        self.segments = []
        off = 0x0C
        for _ in range(self.num_segments):
            wt, ht = data[off], data[off + 1]
            tile_index = int.from_bytes(data[off + 2:off + 4], "little")
            self.segments.append((wt, ht, tile_index))
            off += 4
        d = data[self.dsig_off:]
        if d[:4] != b"DSIG":
            raise ValueError("embedded DSIG not found")
        self.unknown = d[4]
        self.image_format = d[5]
        self.bpp = self.image_format & 0x0F
        if self.bpp != 0:
            raise ValueError(f"only 4bpp supported (got bpp={self.bpp})")
        self.num_pal_lines = int.from_bytes(d[6:8], "little")
        self.width = int.from_bytes(d[8:10], "little")
        self.height = int.from_bytes(d[10:12], "little")
        pal_bytes = self.num_pal_lines * 32
        self.pixels_start = self.dsig_off + 12 + pal_bytes
        self.palettes = []
        for pl in range(self.num_pal_lines):
            po = self.dsig_off + 12 + pl * 32  # offset into the FULL file
            self.palettes.append(
                [int.from_bytes(self.data[po + 2 * i:po + 2 * i + 2], "little")
                 for i in range(16)])

    def tile_pixels(self, tile_index: int, out: list[int]) -> None:
        """Read one 8x8 4bpp tile into out (64 entries, row-major).

        Nibble order (empirically verified against JUSToolkit's export):
        the LEFT pixel of a pair is the LOW nibble.
        """
        base = self.pixels_start + tile_index * 32
        for y in range(8):
            for x in range(0, 8, 2):
                b = self.data[base + y * 4 + x // 2]
                out[y * 8 + x] = b & 0x0F
                out[y * 8 + x + 1] = b >> 4

    def set_tile_pixels(self, tile_index: int, pixels: list[int]) -> None:
        base = self.pixels_start + tile_index * 32
        for y in range(8):
            for x in range(0, 8, 2):
                self.data[base + y * 4 + x // 2] = (
                    (pixels[y * 8 + x + 1] << 4) | pixels[y * 8 + x])

    def set_palette_color(self, line: int, index: int,
                          rgb: tuple[int, int, int]) -> None:
        po = self.dsig_off + 12 + line * 32 + index * 2
        self.data[po:po + 2] = bgr555(rgb).to_bytes(2, "little")

    def dump(self) -> str:
        lines = [
            f"DTX4: segments={self.num_segments} dsig_off=0x{self.dsig_off:X}",
            f"DSIG: image_format=0x{self.image_format:02X} "
            f"pal_lines={self.num_pal_lines} w={self.width} h={self.height} "
            f"pixels@0x{self.pixels_start:X}",
        ]
        for i, pal in enumerate(self.palettes):
            cols = " ".join(
                f"{unpack555(v)[0]:2d},{unpack555(v)[1]:2d},{unpack555(v)[2]:2d}"
                for v in pal)
            lines.append(f"palette[{i}]: {cols}")
        total_tiles = sum(wt * ht for wt, ht, _ in self.segments)
        lines.append(f"segments: {self.segments}  tiles={total_tiles}")
        return "\n".join(lines)


def cmd_dump(args) -> int:
    dtx = Dtx4(Path(args.dtx).read_bytes())
    print(dtx.dump())
    wt, ht, ti = dtx.segments[0]
    print(f"segments[0]: {wt}x{ht} tiles, tileIndex={ti} "
          f"(art tiles = strip[{ti + 1}..{ti + wt * ht}]; strip[0] = transparent)")
    print("tile occupancy (# = nonzero pixel), 8x8 per cell:")
    for ty in range(ht):
        row_pix: list[str] = []
        for tx in range(wt):
            tile = ti + 1 + ty * wt + tx
            px: list[int] = [0] * 64
            dtx.tile_pixels(tile, px)
            row_pix.append("".join("." if p == 0 else "#" for p in px))
        print("".join(row_pix))
    nbytes = len(dtx.data) - dtx.pixels_start
    print(f"pixel data: {nbytes} bytes = {nbytes // 32} tiles "
          f"({wt * ht} in segment, {nbytes // 32 - wt * ht} extra)")
    return 0


def _design_zcells() -> set[tuple[int, int]]:
    scale = 5
    ox, oy = 11, 6  # glyph top-left: (48-25)/2=11, (48-35)/2=6
    cells: set[tuple[int, int]] = set()
    for gy, row in enumerate(FONT_Z):
        for gx in range(5):
            if row & (1 << (4 - gx)):
                for dy in range(scale):
                    for dx in range(scale):
                        cells.add((ox + gx * scale + dx, oy + gy * scale + dy))
    return cells


def cmd_paint(args) -> int:
    path = Path(args.dtx)
    dtx = Dtx4(path.read_bytes())
    wt, ht, ti = dtx.segments[0]
    zcells = _design_zcells()
    # Full-bleed card: every non-glyph pixel gets the card color so the tile
    # looks the same on light (deck editor) and dark (battle panel) backdrops.
    for ty in range(ht):
        for tx in range(wt):
            tile = ti + 1 + ty * wt + tx
            px: list[int] = [0] * 64
            for by in range(8):
                for bx in range(8):
                    gx, gy = tx * 8 + bx, ty * 8 + by
                    if (gx, gy) in zcells:
                        px[by * 8 + bx] = 2
                    elif gx < 48 and gy < 48:
                        px[by * 8 + bx] = 1
            dtx.set_tile_pixels(tile, px)
    dtx.set_palette_color(0, 1, (255, 255, 255))
    dtx.set_palette_color(0, 2, (230, 30, 30))
    out = Path(args.out)
    out.write_bytes(bytes(dtx.data))
    print(f"wrote {out} ({len(dtx.data)} bytes, original was "
          f"{path.stat().st_size} bytes)")
    return 0


def cmd_paint_png(args) -> int:
    path = Path(args.dtx)
    dtx = Dtx4(path.read_bytes())
    # The game's visible koma window is 46x44 inside the 48x48 tile (owner rip):
    # scale the art to 46x44 and center it at offset (1, 2).
    art = Image.open(args.png).convert("RGBA").resize((46, 44))
    img = Image.new("RGBA", (48, 48), (0, 0, 0, 0))
    img.paste(art, (1, 2))
    px_in = img.load()
    alpha = [[px_in[x, y][3] >= 128 for x in range(48)] for y in range(48)]

    opaque = Image.new("RGB", (48, 48))
    opaque_px = opaque.load()
    for y in range(48):
        for x in range(48):
            opaque_px[x, y] = px_in[x, y][:3] if alpha[y][x] else (0, 0, 0)
    q = opaque.quantize(colors=15, method=Image.Quantize.MEDIANCUT,
                        dither=Image.Dither.NONE)
    q_pal = q.getpalette()
    # Resolve quantized pixel -> RGB via PIL's palette table, then build our
    # own deterministic color list (PIL's palette indices are not ordered).
    rgb_of: dict[int, tuple[int, int, int]] = {}
    for x in range(48):
        for y in range(48):
            qi = q.getpixel((x, y))
            rgb_of.setdefault(qi, tuple(q_pal[qi * 3:qi * 3 + 3]))
    cols = sorted(set(rgb_of.values()))
    n_colors = len(cols)
    rank_of = {c: i + 1 for i, c in enumerate(cols)}
    quant = [[0] * 48 for _ in range(48)]
    for y in range(48):
        for x in range(48):
            if alpha[y][x]:
                quant[y][x] = rank_of[rgb_of[q.getpixel((x, y))]]

    for i, c in enumerate(cols):
        dtx.set_palette_color(0, i + 1, c)

    wt, ht, ti = dtx.segments[0]
    for ty in range(ht):
        for tx in range(wt):
            tile = ti + 1 + ty * wt + tx
            px: list[int] = [0] * 64
            for by in range(8):
                for bx in range(8):
                    gx, gy = tx * 8 + bx, ty * 8 + by
                    if gx < 48 and gy < 48:
                        px[by * 8 + bx] = quant[gy][gx]
            dtx.set_tile_pixels(tile, px)

    out = Path(args.out)
    out.write_bytes(bytes(dtx.data))
    print(f"wrote {out} ({len(dtx.data)} bytes, original was "
          f"{path.stat().st_size} bytes); {n_colors} colors + transparency")
    return 0


def cmd_patch_rom(args) -> int:
    orig = Path(args.orig_dtx).read_bytes()
    new = Path(args.new_dtx).read_bytes()
    if len(new) != len(orig):
        print(f"[!] sizes differ ({len(new)} vs {len(orig)}); in-place ROM "
              f"replacement needs identical size", file=sys.stderr)
        return 1
    rom = bytearray(Path(args.rom).read_bytes())
    off = rom.find(orig)
    if off < 0:
        print("[!] original dtx bytes not found in ROM", file=sys.stderr)
        return 1
    if rom.find(orig, off + 1) >= 0:
        print("[!] dtx bytes occur more than once in the ROM — aborting",
              file=sys.stderr)
        return 1
    rom[off:off + len(new)] = new
    Path(args.out_rom).write_bytes(bytes(rom))
    sha1 = hashlib.sha1(rom).hexdigest()
    print(f"patched ROM @ 0x{off:X} -> {args.out_rom}")
    print(f"sha1: {sha1}")
    if args.config:
        cfg = Path(args.config)
        text = cfg.read_text(encoding="utf-8")
        text2, n = re.subn(r'sha1 = "[0-9a-f]{40}"',
                           f'sha1 = "{sha1}"', text, count=1)
        if n != 1:
            print(f"[!] could not update [game].sha1 in {cfg}", file=sys.stderr)
        else:
            cfg.write_text(text2, encoding="utf-8")
            print(f"updated [game].sha1 in {cfg}")
    return 0


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    sub = ap.add_subparsers(dest="cmd", required=True)

    p = sub.add_parser("dump")
    p.add_argument("dtx")

    p = sub.add_parser("paint")
    p.add_argument("dtx")
    p.add_argument("out")

    p = sub.add_parser("paint-png")
    p.add_argument("dtx")
    p.add_argument("png")
    p.add_argument("out")

    p = sub.add_parser("patch-rom")
    p.add_argument("orig_dtx")
    p.add_argument("new_dtx")
    p.add_argument("rom")
    p.add_argument("out_rom")
    p.add_argument("--config", default="recomp/game-mod.toml")

    args = ap.parse_args()
    if args.cmd == "dump":
        return cmd_dump(args)
    if args.cmd == "paint":
        return cmd_paint(args)
    if args.cmd == "paint-png":
        return cmd_paint_png(args)
    return cmd_patch_rom(args)


if __name__ == "__main__":
    raise SystemExit(main())
