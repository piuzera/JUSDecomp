#!/usr/bin/env python3
"""
analyze_decksave.py — diagnose the deck-edit save failure.

Replays the AUXSPI write trace (recomp/decksave-auxspi.log) over the pristine
100%% save and compares, per byte, what the game INTENDED to program vs what
the current flash model STORED (0x02 = AND with cell, real-flash semantics).
Bytes where intended != stored are the model's 0->1 corruption candidates —
exactly what the game's read-back verify would flag as "restart console".

Also reports erase commands (any) and the verify-read pattern after writes.

Usage: py recomp/analyze_decksave.py
"""
from __future__ import annotations

import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent
W_RE = re.compile(
    r"\[auxspi\] cpu(?P<cpu>\d) pc=0x(?P<pc>[0-9A-Fa-f]{8}) cyc=\d+ "
    r"W pos=(?P<pos>\d+) val=0x(?P<val>[0-9A-Fa-f]{2}) "
    r"cmd=0x(?P<cmd>[0-9A-Fa-f]{2}) addr=0x(?P<addr>[0-9A-Fa-f]{5}) "
    r"-> 0x(?P<res>[0-9A-Fa-f]{2})(?P<flags>.*)")


def parse_transfers(path: Path):
    """Split the trace into SPI transfers (pos resets start a new transfer)."""
    txs = []
    cur = []
    for line in path.read_text(errors="replace").splitlines():
        m = W_RE.match(line)
        if not m:
            continue
        d = m.groupdict()
        pos = int(d["pos"])
        val = int(d["val"], 16)
        if pos == 0:
            if cur:
                txs.append(cur)
            cur = [(pos, val)]
        else:
            cur.append((pos, val))
    if cur:
        txs.append(cur)
    return txs


def main() -> int:
    log = ROOT / "decksave-auxspi.log"
    if not log.exists():
        print(f"missing {log}")
        return 1
    img = bytearray((ROOT / "jus-100-save.sav").read_bytes())

    txs = parse_transfers(log)
    print(f"transfers: {len(txs)}")
    erases = []
    corrupt = []
    written = 0
    verify_reads = 0
    program_tx = 0

    for t in txs:
        cmd = t[0][1]
        if cmd in (0x04, 0x06):      # WRDI / WREN
            continue
        if cmd in (0xD8, 0xDB, 0x20, 0x52, 0xC7, 0xD7):
            # address bytes follow the command (2-byte per 64 KiB driver)
            addr = (t[1][1] << 8) | t[2][1]
            erases.append((cmd, addr))
            continue
        if cmd in (0x02, 0x0A):
            program_tx += 1
            # command + 2 address bytes + data
            addr = (t[1][1] << 8) | t[2][1]
            for pos, val in t[3:]:
                old = img[addr]
                stored = (old & val) if cmd == 0x02 else val
                if stored != val:
                    corrupt.append((addr, old, val, stored))
                img[addr] = stored
                addr += 1
                written += 1
            continue
        if cmd in (0x03, 0x0B):
            verify_reads += 1
            continue
        # 0x00 dummy clocks / unknown: ignore
    print(f"program transactions: {program_tx}, programmed bytes: {written}")
    print(f"erase commands: {erases}")
    print(f"read transfers after/between writes: {verify_reads}")
    print(f"CORRUPTED bytes (intended != stored under AND): {len(corrupt)}")
    for addr, old, want, got in corrupt[:40]:
        print(f"  addr=0x{addr:05X} old=0x{old:02X} intended=0x{want:02X} "
              f"stored=0x{got:02X}")
    if corrupt:
        print("  ... (truncated)")
    disk = (ROOT / "jus-play.sav").read_bytes()
    bad = sum(1 for a, b in zip(img, disk) if a != b)
    print(f"replayed-model vs disk mismatches: {bad}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
