#!/usr/bin/env python3
"""koma_xref.py - pin Luffy 4-koma index via ImageID and check NTbl 41 vs 3."""
from __future__ import annotations

import struct
from pathlib import Path

data = Path("extract/files/bin/koma.bin").read_bytes()
n = len(data) // 12
print("records:", n)

print("\n-- ImageID 0x28B4 (AR Luffy 4-koma) --")
for i in range(n):
    img, unk = struct.unpack_from("<HH", data, i * 12)
    if img == 0x28B4:
        print("idx", i, "ImageID=0x%04X" % img, "unk", unk,
              data[i * 12 + 4:i * 12 + 12].hex(" "))

print("\n-- all ImageIDs in 0x2890..0x28F8 --")
for i in range(n):
    img, unk = struct.unpack_from("<HH", data, i * 12)
    if 0x2890 <= img <= 0x28F8:
        print("idx", i, "ImageID=0x%04X" % img, "unk", unk,
              "NTbl", data[i * 12 + 4], "NNum", data[i * 12 + 5])

print("\n-- indices 40..58 (claimed op range) --")
for i in range(40, 59):
    img, unk = struct.unpack_from("<HH", data, i * 12)
    print("idx", i, "ImageID=0x%04X" % img, "unk", unk,
          "NTbl", data[i * 12 + 4], "NNum", data[i * 12 + 5])

print("\n-- indices 815..840 (NTbl 41 zone) --")
for i in range(815, 841):
    img, unk = struct.unpack_from("<HH", data, i * 12)
    print("idx", i, "ImageID=0x%04X" % img, "unk", unk,
          "NTbl", data[i * 12 + 4], "NNum", data[i * 12 + 5])
