#!/usr/bin/env python3
"""dump_decks.py - print deck records for given files, ASCII-safe."""
from __future__ import annotations

import struct
import sys
from pathlib import Path

for rel in sys.argv[1:]:
    rec = Path(rel).read_bytes()
    slots = []
    for i in range(16):
        kid = struct.unpack_from("<H", rec, i * 4)[0]
        fl = struct.unpack_from("<H", rec, i * 4 + 2)[0]
        if kid != 0xFFFF:
            slots.append(f"{kid}:{fl:#06x}")
    name = rec[0x40:].split(b"\x00")[0]
    print(f"{rel}: slots=[{', '.join(slots)}] name_hex={name.hex()}")
