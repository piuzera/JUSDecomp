#!/usr/bin/env python3
"""ntbl_dump.py - decode chr_b_t.bin / chr_s_t.bin pointer tables to resolve
(NameTableIdx, NameNum) -> text."""
from __future__ import annotations

import struct
import sys
from pathlib import Path


def dump_to_str(path: str, limit_ptrs: int = 400) -> str:
    d = Path(path).read_bytes()
    lines = [f"== {path} size={len(d)} (0x{len(d):X}) =="]
    ptrs = []
    for i in range(0, limit_ptrs * 4, 4):
        p = struct.unpack_from("<I", d, i)[0]
        if p >= len(d):
            break
        ptrs.append(p)
    lines.append(f"first {len(ptrs)} pointers")
    for idx, p in enumerate(ptrs):
        end = d.index(b"\x00", p) if b"\x00" in d[p:p + 64] else p + 64
        raw = d[p:end]
        try:
            s = raw.decode("shift_jis")
        except Exception:
            s = raw.hex()
        lines.append(f"  [{idx:4d}] off=0x{p:04X}: {s!r}")
    return "\n".join(lines)


if __name__ == "__main__":
    src = sys.argv[1] if len(sys.argv) > 1 else "extract/files/bin/chr_b_t.bin"
    dst = sys.argv[2] if len(sys.argv) > 2 else src + ".dump.txt"
    with open(dst, "w", encoding="utf-8") as f:
        f.write(dump_to_str(src))
    print("wrote", dst)
