#!/usr/bin/env python3
"""rulemess_dump.py - recon dump of rulemess.bin (deck rule messages)."""
from __future__ import annotations

import sys
from pathlib import Path

sys.stdout.reconfigure(encoding="utf-8")
d = Path("extract/files/bin/rulemess.bin").read_bytes()
print(f"size={len(d)} head={d[:32].hex()}")

count = int.from_bytes(d[0:4], "little")
print(f"u32@0 = {count} (0x{count:x})")

ptrs = [int.from_bytes(d[4 + i * 4:8 + i * 4], "little") for i in range(count)]
print(f"first ptrs: {ptrs[:12]}")
print(f"ptrs min={min(ptrs)} max={max(ptrs)}")
table_end = 4 + count * 4
print(f"pointer table ends at {table_end} (0x{table_end:x})")

# candidate bases for relative pointers
for base_name, base in (("file_start", 0), ("table_end", table_end),
                        ("4", 4), ("8", 8)):
    try:
        s = d[base + ptrs[0]:base + ptrs[0] + 60].decode("shift_jis")
        print(f"base={base_name}: ptr0 -> {s!r}")
    except Exception as e:
        print(f"base={base_name}: err {e}")

# brute-force: scan for longest valid shift-jis text runs
best = []
i = 0
while i < len(d):
    run = bytearray()
    j = i
    while j < len(d):
        b = d[j]
        if b == 0:
            break
        if 0x20 <= b <= 0x7E or 0xA1 <= b <= 0xDF:
            run.append(b)
            j += 1
        elif 0x81 <= b <= 0x9F or 0xE0 <= b <= 0xEF:
            if j + 1 < len(d) and d[j + 1] >= 0x40:
                run.append(b)
                run.append(d[j + 1])
                j += 2
            else:
                break
        else:
            break
    if len(run) >= 8:
        try:
            text = run.decode("shift_jis")
            if any(ord(c) > 0x100 for c in text):  # at least some JP
                best.append((i, text))
        except Exception:
            pass
        i = j + 1
    else:
        i = j + 1

print(f"\n{len(best)} text runs:")
for off, text in best[:80]:
    print(f"  0x{off:04x}  {text}")
