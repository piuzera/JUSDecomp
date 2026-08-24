#!/usr/bin/env python3
"""probe_deck_live.py - focused live dump of deck t1[0..3], counts, aux, selected."""
from __future__ import annotations

import argparse
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent.parent / "tools" / "scripts"))
from jus_debug_client import DebugClient  # noqa: E402


def fmt(rec: bytes) -> str:
    parts = []
    for i in range(16):
        off = i * 4
        kid = int.from_bytes(rec[off:off + 2], "little")
        fl = int.from_bytes(rec[off + 2:off + 4], "little")
        parts.append("--" if kid == 0xFFFF else f"{kid}/{fl:#06x}")
    name = rec[0x40:].split(b"\x00")[0]
    try:
        nm = name.decode("shift_jis")
    except Exception:
        nm = name.hex()
    return " ".join(parts) + f"  name={nm!r}"


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--port", type=int, default=19888)
    ap.add_argument("--out", default="recomp/deck_live.txt")
    args = ap.parse_args()
    lines = []
    with DebugClient("127.0.0.1", args.port) as c:
        lines.append(f"ping: {c.ping()}")
        lines.append("counts block: " + c.read_mem(0x020B0D60, 0x20).hex(" "))
        for i in range(4):
            rec = c.read_mem(0x020B0DBC + i * 0x5C, 0x5C)
            lines.append(f"t1[{i}]: {fmt(rec)}")
        lines.append("aux[0]: " + c.read_mem(0x020B1FB4, 0x4C).hex(" "))
        lines.append("aux[1]: " + c.read_mem(0x020B1FB4 + 0x4C, 0x4C).hex(" "))
        lines.append("selected @0x020AFEB4: " + c.read_mem(0x020AFEB4, 10).hex(" "))
        lines.append("ctx ptr @0x020B0D70: " + hex(c.read_u32(0x020B0D70)))
        for addr in (0x020AFF4C, 0x020AEE50):
            lines.append(f"copy @0x{addr:08X}: " + c.read_mem(addr, 0x5C).hex(" "))
    Path(args.out).write_text("\n".join(lines), encoding="utf-8")
    print("wrote", args.out)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
