#!/usr/bin/env python3
"""
nitrofs_grow.py — grow NitroFS files IN PLACE inside a NDS ROM by writing the
new content at the file's data start and bumping its FAT end field — valid
only when the slack after the file (gap to the next data block) is big enough.
No data relocation, no FNT changes.

Usage:
  py tools/scripts/nitrofs_grow.py <rom> <out_rom> <fat_id>:<newfile> [...]
      [--config recomp/game-mod.toml]

Safety checks: FAT entry start must match the current file length, the new
content must fit in the slack after the FAT end, and the new content's first
bytes must match the old content's (sanity).
"""
from __future__ import annotations

import argparse
import hashlib
import re
import struct
import sys
from pathlib import Path

try:
    sys.stdout.reconfigure(encoding="utf-8")
except Exception:
    pass


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("rom")
    ap.add_argument("out_rom")
    ap.add_argument("files", nargs="+",
                    help="fat_id:newfile pairs")
    ap.add_argument("--config", default="recomp/game-mod.toml")
    args = ap.parse_args()

    rom = bytearray(Path(args.rom).read_bytes())
    fat_off, fat_size = struct.unpack_from("<II", rom, 0x48)
    fat = []
    for i in range(fat_size // 8):
        fat.append(list(struct.unpack_from("<II", rom, fat_off + i * 8)))

    # starts sorted for slack check
    starts = sorted((fat[i][0], i) for i in range(len(fat)) if fat[i][1] > fat[i][0])

    for spec in args.files:
        fid_s, newfile = spec.split(":", 1)
        fid = int(fid_s)
        content = Path(newfile).read_bytes()
        start, end = fat[fid]
        old_len = end - start
        if len(content) < old_len:
            print(f"[!] fat {fid}: new content is SMALLER than the current "
                  f"file ({len(content)} < {old_len}); shrinking unsupported",
                  file=sys.stderr)
            return 1
        if len(content) == old_len:
            print(f"fat {fid}: content already at target size "
                  f"({old_len}); rewriting identically (idempotent)")
        gap = None
        for s, _i in starts:
            if s >= end and s != end:
                gap = s - end
                break
        if gap is None or gap < 0:
            print(f"[!] fat {fid}: no slack after 0x{end:X}", file=sys.stderr)
            return 1
        if gap < len(content) - old_len:
            print(f"[!] fat {fid}: growth {len(content) - old_len} exceeds "
                  f"slack {gap}", file=sys.stderr)
            return 1
        rom[start:start + len(content)] = content
        fat[fid][1] = start + len(content)
        struct.pack_into("<II", rom, fat_off + fid * 8, start, fat[fid][1])
        print(f"fat {fid}: grew 0x{start:X}+{len(content)} (end "
              f"0x{end:X} -> 0x{fat[fid][1]:X}, slack was {gap})")

    Path(args.out_rom).write_bytes(bytes(rom))
    sha1 = hashlib.sha1(rom).hexdigest()
    print(f"wrote {args.out_rom}  sha1: {sha1}")
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


if __name__ == "__main__":
    raise SystemExit(main())
