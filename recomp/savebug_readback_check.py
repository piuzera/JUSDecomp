#!/usr/bin/env py
# savebug_readback_check.py — verify, from an AUXSPI trace log, that the
# bytes the guest clocked out of a 0x03 read at a given address exactly match
# the expected save file. Answers: is the CURRENT runner's read path still
# byte-perfect?
#
# Trace line format (io.cpp):
#   [auxspi] cpuN pc=0x... cyc=... W pos=N val=0xVV cmd=0xCC addr=0xAAAAA -> 0xRR <flags>
# The "-> 0xRR" is g_auxspi_data after the byte transfer; for a read's data
# phase (pos>3) that is the byte the guest will read from the port.
#
# Usage: py recomp/savebug_readback_check.py <trace.log> <expected.sav>
import re
import sys

trace, exp_path = sys.argv[1], sys.argv[2]
expected = open(exp_path, "rb").read()

addr = None
data = bytearray()
cur_cmd = None
reads = []  # (start_addr, bytes)

for line in open(trace, errors="replace"):
    m = re.search(
        r"W pos=(\d+) val=0x([0-9A-Fa-f]{2}) .*cmd=0x([0-9A-Fa-f]{2}) "
        r"addr=0x([0-9A-Fa-f]+) -> 0x([0-9A-Fa-f]{2})", line)
    if not m:
        continue
    pos, val, cmd, afield, result = (int(m.group(1)), int(m.group(2), 16),
                                     int(m.group(3), 16),
                                     int(m.group(4), 16),
                                     int(m.group(5), 16))
    if pos == 0:
        if cur_cmd == 0x03 and data:
            reads.append((read_start, bytes(data)))
        cur_cmd = cmd if cmd != 0x04 and cmd != 0x06 else cur_cmd
        if cmd == 0x03:
            addr = 0
            data = bytearray()
            read_start = None
        continue
    if cur_cmd == 0x03:
        if pos <= 3:
            addr = (addr << 8) | val
            read_start = addr
        else:
            data.append(result)
if cur_cmd == 0x03 and data:
    reads.append((read_start, bytes(data)))

print(f"{trace}: {len(reads)} reconstructed 0x03 reads")
bad = 0
for start, blob in reads:
    # The runner wraps addresses at the chip size; map into the file.
    off = start % len(expected)
    end = min(off + len(blob), len(expected))
    want = expected[off:end]
    got = blob[:len(want)]
    if got != want:
        bad += 1
        if bad <= 3:
            first = next(i for i, (a, b) in enumerate(zip(got, want))
                         if a != b) if got != want else 0
            print(f"  MISMATCH read@{start:#x}: first diff at +{first}: "
                  f"got {got[first:first+8].hex(' ')} want "
                  f"{want[first:first+8].hex(' ')}")
if bad == 0 and reads:
    total = sum(len(b) for _, b in reads)
    print(f"ALL {len(reads)} reads ({total} bytes) byte-identical to "
          f"{exp_path} (modulo chip-size wrap)")
sys.exit(1 if bad else 0)
