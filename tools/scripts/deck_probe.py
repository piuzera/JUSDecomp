#!/usr/bin/env python3
"""
deck_probe.py — read-only runtime probe of the JUS deck tables.

Confirms the static findings in decomp/docs/DECK_INJECTION.md against a live
nds_runner debug server (127.0.0.1:19842). Does NOT write anything.

Usage:
    python tools/scripts/deck_probe.py [--host H] [--port P] [--save PATH]

It reports:
  1. Deck table 1 (0x020B0DBC) and table 2 (0x020B2E8C) used-counts and the
     first few records' koma slots, so we can see which table is "player decks"
     vs "rival/received decks".
  2. The selected-deck byte vector at 0x020AFEB4.
  3. The Koma-unlock block at 0x020B0BAC (first 0x68 bytes) and companions.
  4. If --save is given, a diff of the .sav deck region (offset 0xB04) against
     RAM table 1, to confirm the save-offset mapping (0xB04 + slot*0x5C).
"""

from __future__ import annotations

import argparse
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from jus_debug_client import DebugClient  # noqa: E402


# Addresses (see decomp/docs/DECK_INJECTION.md).
DECK1_BASE = 0x020B0DBC
DECK1_COUNT = 0x020B0D6C
DECK2_BASE = 0x020B2E8C
DECK2_COUNT = 0x020B0D6D
AUX_BASE = 0x020B1FB4
SELECTED = 0x020AFEB4
KOMA_BLOCK = 0x020B0BAC
KOMA_COMPANION_1 = 0x020B0C14
KOMA_COMPANION_2 = 0x020B0D2C

RECORD_SIZE = 0x5C  # 92 bytes
AUX_SIZE = 0x4C     # 76 bytes
MAX_DECKS = 50
N_SLOTS = 16
NAME_OFF = 0x40
# Runtime-confirmed save mapping (2026-08-22): deck table 1 records live at
# .sav offset 0xB0C (8-byte region header at 0xB04), count1 at 0xAB5, count2 at 0xAB4.
SAVE_DECK1_OFFSET = 0x0B0C
SAVE_DECK1_COUNT = 0x0AB5
SAVE_DECK2_COUNT = 0x0AB4


def fmt_slots(record: bytes) -> str:
    """Decode the 16 koma slots (offset 0x00..0x3F) as {koma_id u16, flags u16}."""
    slots = []
    for i in range(N_SLOTS):
        off = i * 4
        koma_id = int.from_bytes(record[off:off + 2], "little")
        flags = int.from_bytes(record[off + 2:off + 4], "little")
        if koma_id == 0xFFFF:
            slots.append("--")
        else:
            slots.append(f"{koma_id}/{flags:#06x}")
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


def dump_table(client: DebugClient, base: int, count_addr: int, label: str) -> None:
    count = client.read_u8(count_addr)
    print(f"\n=== {label} (base 0x{base:08X}, count 0x{count_addr:08X}) ===")
    print(f"used-count = {count} (0x{count:02X})")
    for i in range(min(count, MAX_DECKS)):
        rec = client.read_mem(base + i * RECORD_SIZE, RECORD_SIZE)
        print(f"  [{i:2d}] {fmt_slots(rec)}")
        print(f"       name  : {deck_name(rec)!r}")


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--host", default="127.0.0.1")
    ap.add_argument("--port", type=int, default=19842)
    ap.add_argument("--save", default=None,
                    help="path to recomp/jus.sav to diff against RAM table 1")
    args = ap.parse_args()

    try:
        sys.stdout.reconfigure(encoding="utf-8")
    except Exception:
        pass

    with DebugClient(args.host, args.port) as c:
        print("ping:", c.ping())

        dump_table(c, DECK1_BASE, DECK1_COUNT, "Deck table 1 (player?)")
        dump_table(c, DECK2_BASE, DECK2_COUNT, "Deck table 2 (rival?)")

        # Selected-deck byte vector.
        sel = c.read_mem(SELECTED, 10)
        print(f"\n=== selected-deck bytes @ 0x{SELECTED:08X} ===")
        print("  ", sel.hex(" "))

        # Koma unlock block.
        koma = c.read_mem(KOMA_BLOCK, 0x68)
        print(f"\n=== Koma unlock block @ 0x{KOMA_BLOCK:08X} (first 0x68) ===")
        nonzero = sum(1 for b in koma if b != 0)
        print(f"  nonzero bytes: {nonzero}/{len(koma)}")
        print("  first 32:", koma[:32].hex(" "))
        c1 = c.read_u32(KOMA_COMPANION_1)
        c2 = c.read_u32(KOMA_COMPANION_2)
        print(f"  companion 0x{KOMA_COMPANION_1:08X} = 0x{c1:08X}")
        print(f"  companion 0x{KOMA_COMPANION_2:08X} = 0x{c2:08X}")

        # Save diff.
        if args.save:
            save_path = Path(args.save)
            if not save_path.exists():
                print(f"\n[!] save file not found: {save_path}")
                return 1
            sav = save_path.read_bytes()
            count = c.read_u8(DECK1_COUNT)
            sav_c1 = sav[SAVE_DECK1_COUNT]
            sav_c2 = sav[SAVE_DECK2_COUNT]
            print(f"\n=== .sav deck region diff (records @0x{SAVE_DECK1_OFFSET:04X}) ===")
            print(f"  .sav size = {len(sav)} bytes")
            print(f"  .sav counts: @0x{SAVE_DECK1_COUNT:04X}={sav_c1} (table1) "
                  f"@0x{SAVE_DECK2_COUNT:04X}={sav_c2} (table2)")
            if len(sav) < SAVE_DECK1_OFFSET + count * RECORD_SIZE:
                print("  [!] .sav too small for expected deck region")
            else:
                ram = c.read_mem(DECK1_BASE, count * RECORD_SIZE)
                sav_region = sav[SAVE_DECK1_OFFSET:SAVE_DECK1_OFFSET + count * RECORD_SIZE]
                match = (ram == sav_region)
                print(f"  RAM table 1 == .sav[0x{SAVE_DECK1_OFFSET:04X}..] "
                      f"for {count} decks: {match}")
                if not match:
                    for i, (a, b) in enumerate(zip(ram, sav_region)):
                        if a != b:
                            print(f"  first diff at +0x{i:04X}: RAM=0x{a:02X} sav=0x{b:02X}")
                            break

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
