#!/usr/bin/env py
# save_islands.py — per-0x100-page dump of non-FF content in JUS .sav files.
# Usage: py recomp/save_islands.py [file.sav]
import sys

path = sys.argv[1] if len(sys.argv) > 1 else "recomp/jus.sav"
d = open(path, "rb").read()
lines = [f"=== {path} ({len(d)} bytes)"]
for pg in range(0, len(d), 0x100):
    blk = d[pg:pg + 0x100]
    nonff = sum(1 for b in blk if b != 0xFF)
    if nonff:
        zeros = sum(1 for b in blk if b == 0x00)
        lines.append(f"  {pg:#07x}: nonFF={nonff:3d} zeros={zeros:3d} "
                     f"first48={blk[:48].hex(' ')}")
lines.append(f"total non-FF: {sum(1 for b in d if b != 0xFF)}")
lines.append(f"total non-FF non-00: {sum(1 for b in d if b not in (0, 0xFF))}")
with open("recomp/save_islands.txt", "w") as f:
    f.write("\n".join(lines) + "\n")
print("wrote recomp/save_islands.txt")
