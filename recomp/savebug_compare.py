#!/usr/bin/env py
# savebug_compare.py — compare JUS save files: hashes, per-bank headers,
# bank-vs-bank and file-vs-file diffs.
import hashlib
import sys

FILES = [
    "recomp/jus-trace.sav",          # pristine import (100%)
    "recomp/jus-100-save.sav",       # owner 100% #2
    "recomp/jus-afterintro-save.sav" # owner fresh (post-intro)
]

def sha(p):
    return hashlib.sha1(open(p, "rb").read()).hexdigest()

def hdr(d, base):
    return {
        "magic": d[base + 0:base + 6],
        "u32_08": int.from_bytes(d[base + 8:base + 12], "little"),
        "u32_0C": int.from_bytes(d[base + 0xC:base + 0x10], "little"),
        "mac10": d[base + 0x10:base + 0x18].hex(),
        "code28": d[base + 0x28:base + 0x2C],
        "val40": d[base + 0x40:base + 0x48].hex(),
    }

lines = []
for p in FILES:
    d = open(p, "rb").read()
    lines.append(f"== {p}  sha1={sha(p)}")
    for name, base in (("bank0", 0), ("bank1", 0x8000)):
        h = hdr(d, base)
        lines.append(f"  {name}: {h['magic']} u32@08={h['u32_08']:#x} "
                     f"u32@0C={h['u32_0C']:#x} mac10={h['mac10']} "
                     f"code={h['code28']} val40={h['val40']}")
    b0, b1 = d[:0x8000], d[0x8000:]
    diff = sum(1 for a, b in zip(b0, b1) if a != b)
    nz0 = sum(1 for x in b0 if x not in (0xFF,))
    nz1 = sum(1 for x in b1 if x not in (0xFF,))
    lines.append(f"  bank0 vs bank1: {diff} differing bytes; "
                 f"bank0 nonFF={nz0} bank1 nonFF={nz1}")

# pairwise file diffs (first divergence, count)
import itertools
for a, b in itertools.combinations(FILES, 2):
    da, db = open(a, "rb").read(), open(b, "rb").read()
    diffs = [i for i, (x, y) in enumerate(zip(da, db)) if x != y]
    first = diffs[0] if diffs else -1
    last = diffs[-1] if diffs else -1
    lines.append(f"diff {a} vs {b}: {len(diffs)} bytes, first {first:#x}, last {last:#x}")

# where does bank1 start being FF in each file (bank tail usage)?
for p in FILES:
    d = open(p, "rb").read()
    for name, blk in (("bank0", d[:0x8000]), ("bank1", d[0x8000:])):
        lastnz = max((i for i, x in enumerate(blk) if x != 0xFF), default=-1)
        lines.append(f"{p} {name}: last non-FF at {lastnz:#x} ({lastnz})")

out = "\n".join(lines)
open("recomp/savebug_compare.txt", "w").write(out + "\n")
print(out)
