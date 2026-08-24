#!/usr/bin/env py
# savebug_probe_order.py — reconstruct the chronological order of the boot
# geometry-probe reads from an AUXSPI trace log (SAVEBUG symptom A).
#
# Usage: py recomp/savebug_probe_order.py <trace.log> [max-reads]
import re
import sys

log = sys.argv[1] if len(sys.argv) > 1 else "recomp/savebug-session1.log"
max_reads = int(sys.argv[2], 0) if len(sys.argv) > 2 else 10 ** 9

# A read transaction: cmd byte 0x03 at pos=0..2 (address), data at pos>=3.
# Track addr accumulation per transfer: reset on pos=0 cmd=0x03.
addr = None
reads = []          # (index, addr, datalen)
data_count = 0
cur_got = []
n = 0
for line in open(log, errors="replace"):
    m = re.search(r"W pos=(\d+) val=0x([0-9A-Fa-f]{2}) .*cmd=0x([0-9A-Fa-f]{2}) "
                  r"addr=0x([0-9A-Fa-f]+)", line)
    if not m:
        continue
    pos, val, cmd, addr_field = (int(m.group(1)), int(m.group(2), 16),
                                 int(m.group(3), 16), int(m.group(4), 16))
    if pos == 0:
        addr = None
        data_count = 0
        if cmd == 0x03:
            addr = 0
        continue
    if cmd == 0x03 and addr is not None:
        if pos <= 3:
            addr = (addr << 8) | val
        else:
            data_count += 1
            if pos == 4:  # first data byte read back
                cur_got.append(addr)
        if "islast" in line or line.rstrip().endswith("LAST"):
            reads.append((len(reads), addr - (data_count - 1) if data_count else addr,
                          data_count))
            if len(reads) >= max_reads:
                break

out = []
out.append(f"{log}: {len(reads)} completed 0x03 reads")
order = [r[1] for r in reads]
out.append("chronological start addresses (hex block index):")
out.append(" ".join(f"{a // 0x10000:02X}" for a in order))
# run-length encode the block sequence
runs = []
for a in order:
    b = a // 0x10000
    if runs and runs[-1][0] == b:
        runs[-1][1] += 1
    else:
        runs.append([b, 1])
out.append("block-index runs: " + "  ".join(f"{b:02X}x{n}" for b, n in runs))
out.append("first 5 reads detail: " + " ".join(f"{r[1]:#x}+{r[2]}" for r in reads[:5]))
out.append("last 5 reads detail: " + " ".join(f"{r[1]:#x}+{r[2]}" for r in reads[-5:]))
# read lengths histogram
from collections import Counter
out.append("length histogram: " + str(Counter(r[2] for r in reads)))
with open("recomp/savebug_probe_order.txt", "w") as f:
    f.write("\n".join(out) + "\n")
print("wrote recomp/savebug_probe_order.txt")
