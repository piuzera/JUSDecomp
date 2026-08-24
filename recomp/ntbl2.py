#!/usr/bin/env python3
"""ntbl2.py - inspect name-table bins and resolve koma names."""
from __future__ import annotations

import struct
import sys
from pathlib import Path

BIN = Path("extract/files/bin")


def head(name: str, n: int = 48):
    d = (BIN / name).read_bytes()
    print(f"{name} size={len(d)} (0x{len(d):X})")
    print("  head:", d[:n].hex(" "))


def ptr_table(path: str, max_ptrs: int, out: str):
    d = Path(path).read_bytes()
    lines = [f"== {path} size={len(d)} =="]
    ptrs = []
    for i in range(0, max_ptrs * 4, 4):
        p = struct.unpack_from("<I", d, i)[0]
        if p >= len(d):
            break
        ptrs.append(p)
    lines.append(f"{len(ptrs)} pointers")
    for idx, p in enumerate(ptrs):
        end = d.index(b"\x00", p) if b"\x00" in d[p:p + 80] else p + 80
        raw = d[p:end]
        try:
            s = raw.decode("shift_jis")
        except Exception:
            s = raw.hex()
        lines.append(f"  [{idx:4d}] off=0x{p:04X}: {s!r}")
    Path(out).write_text("\n".join(lines), encoding="utf-8")
    print("wrote", out)


if __name__ == "__main__":
    for n in ("pname.bin", "infoname.bin", "komatxt.bin", "piece.bin"):
        head(n)
    ptr_table("extract/files/bin/pname.bin", 300, "recomp/pname.dump.txt")
    ptr_table("extract/files/bin/infoname.bin", 300, "recomp/infoname.dump.txt")
    ptr_table("extract/files/bin/komatxt.bin", 300, "recomp/komatxt.dump.txt")
