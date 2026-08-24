#!/usr/bin/env python3
"""nitrofs_map.py — locate NitroFS files in a ROM by content search and
cross-reference them against the FAT (start/end + slack analysis), without
parsing the FNT names.

Usage: py recomp/nitrofs_map.py <rom> <content-file> [content-file ...]
"""
from __future__ import annotations

import struct
import sys
from pathlib import Path


def main() -> int:
    rom_path = Path(sys.argv[1])
    rom = rom_path.read_bytes()
    fat_off, fat_size = struct.unpack_from("<II", rom, 0x48)
    fat = []
    for i in range(fat_size // 8):
        fat.append(struct.unpack_from("<II", rom, fat_off + i * 8))
    starts = sorted((s, i) for i, (s, e) in enumerate(fat))
    print(f"FAT @ 0x{fat_off:X}, {len(fat)} entries")
    print(f"data blocks: {len([1 for s, e in fat if e > s])}")

    for cpath in sys.argv[2:]:
        content = Path(cpath).read_bytes()
        off = rom.find(content)
        if off < 0:
            print(f"{cpath}: NOT FOUND (unique content?)")
            continue
        # match to FAT entry
        fid = None
        for i, (s, e) in enumerate(fat):
            if s == off and e - s == len(content):
                fid = i
                break
        if fid is None:
            # maybe stored with padding: find entry containing the offset
            for i, (s, e) in enumerate(fat):
                if s <= off < e:
                    fid = i
                    break
        start, end = fat[fid] if fid is not None else (off, off + len(content))
        gap = None
        for s, _i in starts:
            if s >= end and s != end:
                gap = s - end
                break
        print(f"{cpath}: ROM 0x{off:X} size={len(content)} "
              f"fat_id={fid} fat=(0x{start:X},0x{end:X}) slack_after={gap}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
