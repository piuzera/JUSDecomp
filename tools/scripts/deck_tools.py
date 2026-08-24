#!/usr/bin/env python3
"""
deck_tools.py — deck injection tooling for the JUS ndsrecomp runner.

Operates on the runtime deck tables via the debug server (127.0.0.1:19842).
The 92-byte (0x5C) deck record format (runtime-confirmed 2026-08-22):

    0x00..0x3F  16 koma slots, each { u16 koma_id, u16 flags }
                koma_id = direct koma.bin index (0-889); 0xFFFF = empty
    0x40..      null-terminated deck name (Shift-JIS, full-width)

    Live oracle (user-built deck): Sena 1-koma = 0, Luffy 4-koma = 823,
    Zoro 2-koma = 830.  One Piece = NameTableIdx 41.

Subcommands:
  dump                 print deck table 1 (counts, komas, names)
  export SLOT FILE     write deck table 1 slot SLOT to FILE (92 bytes)
  import FILE SLOT     write FILE (92 bytes) into deck table 1 slot SLOT
  copy SRC DST         copy deck table 1 slot SRC -> slot DST
  append FILE          append FILE as a new deck (slot = count, count++)
  select PLAYER SLOT   set selected-deck byte for PLAYER (0-3) to SLOT
  koma-unlock-all      apply the AR-validated all-Koma unlock values

All writes go through the runner's write_mem (bus-write path, correct write
provenance). Deck table 1 = player decks (0x020B0DBC), count at 0x020B0D6C.
"""

from __future__ import annotations

import argparse
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from jus_debug_client import DebugClient  # noqa: E402


DECK1_BASE = 0x020B0DBC
DECK1_COUNT = 0x020B0D6C
DECK2_BASE = 0x020B2E8C
DECK2_COUNT = 0x020B0D6D
AUX_BASE = 0x020B1FB4
SELECTED = 0x020AFEB4
KOMA_BLOCK = 0x020B0BAC
KOMA_COMPANION_1 = 0x020B0C14
KOMA_COMPANION_2 = 0x020B0C18
KOMA_COMPANION_3 = 0x020B0D2C
KOMA_COMPANION_4 = 0x020B0D30

RECORD_SIZE = 0x5C
AUX_SIZE = 0x4C
MAX_DECKS = 50
N_SLOTS = 16
NAME_OFF = 0x40


def fmt_slots(record: bytes) -> str:
    slots = []
    for i in range(N_SLOTS):
        off = i * 4
        koma_id = int.from_bytes(record[off:off + 2], "little")
        unk = int.from_bytes(record[off + 2:off + 4], "little")
        slots.append("--" if koma_id == 0xFFFF else f"{koma_id}/{unk:#06x}")
    return " ".join(slots)


def deck_name(record: bytes) -> str:
    raw = record[NAME_OFF:]
    end = raw.find(b"\x00")
    if end < 0:
        end = len(raw)
    try:
        return raw[:end].decode("shift_jis")
    except Exception:
        return "HEX:" + raw[:end].hex()


def cmd_dump(c: DebugClient, args) -> int:
    for base, count_addr, label in (
        (DECK1_BASE, DECK1_COUNT, "Deck table 1 (player)"),
        (DECK2_BASE, DECK2_COUNT, "Deck table 2 (rival)"),
    ):
        count = c.read_u8(count_addr)
        print(f"=== {label} (base 0x{base:08X}) count={count} ===")
        for i in range(min(count, MAX_DECKS)):
            rec = c.read_mem(base + i * RECORD_SIZE, RECORD_SIZE)
            print(f"  [{i:2d}] {fmt_slots(rec)}  name={deck_name(rec)!r}")
    return 0


def cmd_export(c: DebugClient, args) -> int:
    rec = c.read_mem(DECK1_BASE + args.slot * RECORD_SIZE, RECORD_SIZE)
    Path(args.file).write_bytes(rec)
    print(f"exported slot {args.slot} -> {args.file} ({len(rec)} bytes)")
    return 0


def cmd_import(c: DebugClient, args) -> int:
    data = Path(args.file).read_bytes()
    if len(data) != RECORD_SIZE:
        print(f"[!] expected {RECORD_SIZE} bytes, got {len(data)}", file=sys.stderr)
        return 1
    n = c.write_mem(DECK1_BASE + args.slot * RECORD_SIZE, data)
    print(f"imported {args.file} -> slot {args.slot} ({n} bytes written)")
    return 0


def cmd_copy(c: DebugClient, args) -> int:
    rec = c.read_mem(DECK1_BASE + args.src * RECORD_SIZE, RECORD_SIZE)
    n = c.write_mem(DECK1_BASE + args.dst * RECORD_SIZE, rec)
    print(f"copied slot {args.src} -> slot {args.dst} ({n} bytes)")
    return 0


def cmd_append(c: DebugClient, args) -> int:
    data = Path(args.file).read_bytes()
    if len(data) != RECORD_SIZE:
        print(f"[!] expected {RECORD_SIZE} bytes, got {len(data)}", file=sys.stderr)
        return 1
    count = c.read_u8(DECK1_COUNT)
    if count >= MAX_DECKS:
        print(f"[!] deck table full ({count} decks)", file=sys.stderr)
        return 1
    # Mimic Deck_Append (func_020723cc): write record, zero aux entry, bump count.
    c.write_mem(DECK1_BASE + count * RECORD_SIZE, data)
    c.write_mem(AUX_BASE + count * AUX_SIZE, bytes(AUX_SIZE))
    c.write_u8(DECK1_COUNT, count + 1)
    print(f"appended {args.file} as slot {count} (count now {count + 1})")
    return 0


def cmd_select(c: DebugClient, args) -> int:
    if not (0 <= args.player <= 3):
        print("[!] player must be 0-3", file=sys.stderr)
        return 1
    c.write_u8(SELECTED + args.player, args.slot)
    print(f"set selected-deck byte for player {args.player} to {args.slot}")
    return 0


def cmd_koma_unlock_all(c: DebugClient, args) -> int:
    # AR-validated all-Koma unlock (see deep-research-ar.md + DECK_INJECTION.md).
    c.write_mem(KOMA_BLOCK, bytes([0xFF] * 0x68))
    c.write_u32(KOMA_COMPANION_1, 0xFFFFFFFF)
    c.write_u32(KOMA_COMPANION_2, 0x03FFFFFF)
    c.write_u32(KOMA_COMPANION_3, 0xFFFFFFFE)
    c.write_u32(KOMA_COMPANION_4, 0x0001FFFF)
    print("applied all-Koma unlock (0x68 bytes FF + companion flags)")
    return 0


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--host", default="127.0.0.1")
    ap.add_argument("--port", type=int, default=19842)
    sub = ap.add_subparsers(dest="cmd", required=True)

    sub.add_parser("dump")

    p = sub.add_parser("export")
    p.add_argument("slot", type=int)
    p.add_argument("file")

    p = sub.add_parser("import")
    p.add_argument("file")
    p.add_argument("slot", type=int)

    p = sub.add_parser("copy")
    p.add_argument("src", type=int)
    p.add_argument("dst", type=int)

    p = sub.add_parser("append")
    p.add_argument("file")

    p = sub.add_parser("select")
    p.add_argument("player", type=int)
    p.add_argument("slot", type=int)

    sub.add_parser("koma-unlock-all")

    args = ap.parse_args()

    try:
        sys.stdout.reconfigure(encoding="utf-8")
    except Exception:
        pass

    with DebugClient(args.host, args.port) as c:
        c.ping()
        handlers = {
            "dump": cmd_dump,
            "export": cmd_export,
            "import": cmd_import,
            "copy": cmd_copy,
            "append": cmd_append,
            "select": cmd_select,
            "koma-unlock-all": cmd_koma_unlock_all,
        }
        return handlers[args.cmd](c, args)


if __name__ == "__main__":
    raise SystemExit(main())
