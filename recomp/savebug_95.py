#!/usr/bin/env py
# savebug_95.py — extract the trace context around the 95-byte reads at
# 0x750000 / 0xF50000 (SAVEBUG geometry probe): pcs per phase, abort point.
import re
import sys

log = sys.argv[1] if len(sys.argv) > 1 else "recomp/savebug-fwtest.log"
lines = [l.rstrip() for l in open(log, errors="replace")
         if l.startswith("[auxspi]")]

# Find transactions (cmd 0x03) and their start addresses; then print the last
# 8 bytes of the transaction BEFORE the short ones and the short ones fully.
addr = None
cmd = None
txn = []          # list of (pos, val, result, pc, flags)
txns = []
for l in lines:
    m = re.search(r"W pos=(\d+) val=0x([0-9A-Fa-f]{2}) .*cmd=0x([0-9A-Fa-f]{2}) "
                  r"addr=0x([0-9A-Fa-f]+) -> 0x([0-9A-Fa-f]{2})(.*)", l)
    pc = re.search(r"pc=0x([0-9A-Fa-f]+)", l)
    if not m:
        continue
    pos, val, c, a, res, flags = (int(m.group(1)), int(m.group(2), 16),
                                  int(m.group(3), 16), int(m.group(4), 16),
                                  int(m.group(5), 16), m.group(6))
    if pos == 0:
        if cmd == 0x03 and txn:
            txns.append(txn)
        cmd = c
        addr = 0 if c == 0x03 else None
        txn = []
        if c == 0x03:
            txn.append((pos, val, res, pc.group(1) if pc else "?", flags))
        continue
    if cmd == 0x03 and addr is not None:
        if pos <= 3:
            addr = (addr << 8) | val
        txn.append((pos, val, res, pc.group(1) if pc else "?", flags))
if cmd == 0x03 and txn:
    txns.append(txn)

print(f"{len(txns)} read transactions")
for i, t in enumerate(txns):
    nbytes = sum(1 for e in t if e[0] >= 4)
    if nbytes in (94, 95, 96) or nbytes < 200:
        start = t[3][1] if len(t) > 3 else 0
        # start address from addr bytes at pos 1..3
        ab = [e[1] for e in t if 1 <= e[0] <= 3]
        sa = (ab[0] << 16) | (ab[1] << 8) | ab[2] if len(ab) == 3 else -1
        print(f"\n=== txn#{i} start={sa:#x} bytes={nbytes}")
        # pcs histogram
        from collections import Counter
        pc_hist = Counter((e[0] >= 4, e[3]) for e in t)
        print("  phase,pc histogram:", dict(pc_hist))
        # last 6 entries
        for e in t[-6:]:
            print(f"  pos={e[0]} val={e[1]:#04x} res={e[2]:#04x} "
                  f"pc={e[3]} flags={e[4]}")
        # also print previous txn's tail for contrast
        if i > 0:
            prev = txns[i - 1]
            print(f"  (prev txn#{i-1} bytes="
                  f"{sum(1 for e in prev if e[0] >= 4)}, last pc="
                  f"{prev[-1][3]})")
