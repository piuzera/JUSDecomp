#!/usr/bin/env python3
"""vram_bands.py — watch per-column-band changes of the battle BG maps and
summarize OAM sprite positions.

For each sampled BG map (512-tile text maps), split into 16-column bands and
hash each band. Reports which bands change between samples while the player
moves the camera. Also dumps OAM: count of enabled sprites and how many have
screen x outside [-64, 320).

Usage: py recomp/vram_bands.py --port 19888 --duration 12
"""
from __future__ import annotations

import argparse
import hashlib
import json
import sys
import time
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from savebug_driver import Client  # noqa: E402

MAPS = [
    ("BG0", 0x06000000, 0x0800, 32),   # 256x256 text map = 32x32 tiles
    ("BG2", 0x06002000, 0x2000, 64),   # 512x512 text map = 64x64 tiles
    ("BG3", 0x06004000, 0x2000, 64),   # 256x512 text map = 64x32 tiles
    ("BG1", 0x06007000, 0x2000, 64),   # 512x512 text map = 64x64 tiles
]
OAM_BASE = 0x07000000
OAM_LEN = 0x400


def read_blob(c: Client, addr: int, length: int) -> bytes:
    blob = bytearray()
    for off in range(0, length, 0x1000):
        r = c.req({"cmd": "read_mem", "cpu": 9, "addr": addr + off,
                   "len": min(0x1000, length - off)})
        blob += bytes.fromhex(r["hex"]) if "hex" in r else b"\x00" * 0x1000
    return bytes(blob)


def band_hashes(blob: bytes, width_tiles: int) -> list[str]:
    # 8-tile column bands; each band = width_tiles rows * 8 entries * 2 bytes
    nbands = width_tiles // 8
    band_len = 8 * 2
    hashes = []
    for b in range(nbands):
        data = bytearray()
        for row in range(width_tiles):
            off = (row * width_tiles + b * 8) * 2
            data += blob[off:off + band_len]
        hashes.append(hashlib.sha1(bytes(data)).hexdigest()[:8])
    return hashes


def oam_summary(blob: bytes) -> dict:
    enabled = 0
    offscreen_left = 0
    offscreen_right = 0
    offscreen_up = 0
    offscreen_down = 0
    xs = []
    for n in range(128):
        a0 = int.from_bytes(blob[n * 8:n * 8 + 2], "little")
        if not (a0 & 0x0300) and (a0 & 0xFF00):  # enabled if not disabled
            enabled += 1
        if a0 & 0x0300:
            continue
        a1 = int.from_bytes(blob[n * 8 + 2:n * 8 + 4], "little")
        sy = a0 & 0xFF
        sx = ((a1 << 7) & 0x7FFF) >> 7
        if sx >= 0x200:
            sx -= 0x400
        xs.append(sx)
        if sx < -64:
            offscreen_left += 1
        if sx > 320:
            offscreen_right += 1
        if sy < 0 or sy > 200:
            offscreen_down += 1
    return {
        "enabled": enabled,
        "x_min": min(xs) if xs else None,
        "x_max": max(xs) if xs else None,
        "x_left_margin": offscreen_left,
        "x_right_margin": offscreen_right,
    }


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--port", type=int, default=19888)
    ap.add_argument("--duration", type=float, default=12.0)
    ap.add_argument("--out", default="recomp/vram-bands.json")
    args = ap.parse_args()

    c = Client(port=args.port)
    c.connect(timeout=30)
    c.req({"cmd": "ping"})

    prev = {name: None for name, _, _, _ in MAPS}
    report = {"maps": {}, "oam": []}
    deadline = time.monotonic() + args.duration
    sample_i = 0
    while time.monotonic() < deadline:
        t = time.monotonic()
        row = {}
        for name, base, length, wt in MAPS:
            blob = read_blob(c, base, length)
            hashes = band_hashes(blob, wt)
            changed = []
            if prev[name] is not None:
                changed = [i for i, h in enumerate(hashes)
                           if h != prev[name][i]]
            prev[name] = hashes
            row[name] = {"changed_bands": changed,
                         "band0": hashes[0] if hashes else None}
            print(f"[{sample_i}] {name}: changed={changed}")
        oam = oam_summary(read_blob(c, OAM_BASE, OAM_LEN))
        print(f"[{sample_i}] OAM: {oam}")
        row["oam"] = oam
        report["maps"].setdefault(str(sample_i), row)
        report["oam"].append(oam)
        sample_i += 1
        time.sleep(max(0.05, 1.0 - (time.monotonic() - t)))

    Path(args.out).write_text(json.dumps(report, indent=1) + "\n")
    return 0


if __name__ == "__main__":
    sys.exit(main())
