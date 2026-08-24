# analyze_auxspi.py — parse the NDS_TRACE_AUXSPI=1 runner log and reconstruct
# what the guest saw on the AUXSPI backup bus vs what was expected.
#
# Usage: py recomp/analyze_auxspi.py [logfile]
import collections
import re
import sys

LOG = sys.argv[1] if len(sys.argv) > 1 else "recomp/auxspi-trace-run.log"

lines = open(LOG, encoding="utf-8", errors="replace").read().splitlines()
aux = [l for l in lines if "[auxspi]" in l]

W_RE = re.compile(
    r"W pos=(\d+) val=0x([0-9A-Fa-f]{2}) cmd=0x([0-9A-Fa-f]{2}) "
    r"addr=0x([0-9A-Fa-f]+) -> 0x([0-9A-Fa-f]{2})")

# 1) command histogram (pos=0 bytes)
cmds = collections.Counter()
for l in aux:
    m = W_RE.search(l)
    if m and m.group(1) == "0":
        cmds[int(m.group(2), 16)] += 1
print("=== command histogram (pos=0) ===")
for c, n in sorted(cmds.items()):
    print(f"  0x{c:02X}: {n}")

# 2) reconstruct write transactions: (cmd, addr bytes, data bytes) for
# program/erase commands, with the sram offset each data byte targeted.
print("\n=== write transactions (0x02/0x0A/0xD8/0xDB) ===")
tx = None          # current transaction dict
txs = []           # finished transactions
for l in aux:
    m = W_RE.search(l)
    if not m:
        continue
    pos, val = int(m.group(1)), int(m.group(2), 16)
    cmd, addr = int(m.group(3), 16), int(m.group(4), 16)
    ret = int(m.group(5), 16)
    if pos == 0:
        if tx:
            txs.append(tx)
        tx = None
        if cmd in (0x02, 0x0A, 0xD8, 0xDB):
            tx = {"cmd": cmd, "addrb": [], "data": [], "start": None}
    elif tx is not None:
        # pos 1..3 are address bytes (flash), data from pos 4
        if pos <= 3:
            tx["addrb"].append(val)
        else:
            tx["data"].append((addr - 1, val, ret))  # addr is post-increment
if tx:
    txs.append(tx)

for t in txs[:40]:
    a = 0
    for b in t["addrb"]:
        a = (a << 8) | b
    print(f"  cmd=0x{t['cmd']:02X} addr=0x{a:04X} data={t['data']}")

# 2b) enumerate every 0x03 read transaction: (address, data byte count)
print("\n=== all 0x03 read transactions (addr, len) ===")
txs3 = []
cur = None
for l in aux:
    m = W_RE.search(l)
    if not m:
        continue
    pos = int(m.group(1))
    cmd = int(m.group(3), 16)
    if pos == 0:
        if cur and cur["data"]:
            txs3.append((cur["addr"], len(cur["data"])))
        cur = None
        if cmd == 0x03:
            cur = {"addr": 0, "data": []}
    elif cur is not None:
        val = int(m.group(2), 16)
        ret = int(m.group(5), 16)
        if pos <= 3:
            cur["addr"] = (cur["addr"] << 8) | val
        else:
            cur["data"].append(ret)
if cur and cur["data"]:
    txs3.append((cur["addr"], len(cur["data"])))
seen = []
for a, n in txs3:
    seen.append(f"0x{a:05X}+{n}")
print("  count:", len(txs3))
print("  ranges:", ", ".join(seen))

# 3) first full 0x03 read transaction, reconstructed as received bytes
print("\n=== first 0x03 read stream (what the guest received) ===")
read_stream = []
in_read = False
for l in aux:
    m = W_RE.search(l)
    if not m:
        continue
    pos, val = int(m.group(1)), int(m.group(2), 16)
    cmd = int(m.group(3), 16)
    ret = int(m.group(5), 16)
    if pos == 0:
        if in_read:
            break
        in_read = (cmd == 0x03)
    elif in_read and pos >= 4:
        read_stream.append(ret)
for i in range(0, len(read_stream), 16):
    chunk = read_stream[i:i + 16]
    print(f"  {i:04X}: " + " ".join(f"{b:02X}" for b in chunk))

# 3b) sram-head dumps emitted by the runner
print("\n=== sram head dumps ===")
for l in lines:
    if "sram[0..0x1F]" in l:
        print(" ", l)

# 3c) compare against the expected file (passed as arg 2)
if len(sys.argv) > 2:
    import hashlib
    exp = open(sys.argv[2], "rb").read()
    print("\n=== expected file ===")
    print("  sha1:", hashlib.sha1(exp).hexdigest(), "size:", len(exp))
    for i in range(0, 0x20, 16):
        print(f"  {i:04X}: " + " ".join(f"{b:02X}" for b in exp[i:i + 16]))
    if read_stream:
        diffs = [i for i in range(min(len(exp), len(read_stream)))
                 if exp[i] != read_stream[i]]
        print(f"  first guest/expected diffs: {diffs[:16]}")

# 4) save/firmware plumbing + anomalies
print("\n=== plumbing ===")
for l in lines:
    if "[save]" in l or "[firmware]" in l:
        print(" ", l)
print("  DROPPED (busy) writes:", sum(1 for l in aux if "DROPPED" in l))
print("  busy reads:", sum(1 for l in aux if "(busy)" in l))
print("  auxspi lines:", len(aux))

# 5) unknown/unhandled commands beyond the model's set
known = {0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x0A, 0x0B, 0x9F, 0xD8, 0xDB}
unknown = {c: n for c, n in cmds.items() if c not in known}
print("\n=== commands NOT implemented by flash model ===")
for c, n in sorted(unknown.items()):
    print(f"  0x{c:02X}: {n}")

# 6) every RDSR (0x05) response the guest read, first 24
print("\n=== first 24 RDSR transactions (cmd, then status byte) ===")
count = 0
for l in aux:
    m = W_RE.search(l)
    if not m:
        continue
    pos = int(m.group(1))
    cmd = int(m.group(3), 16)
    ret = int(m.group(5), 16)
    if pos == 0 and cmd == 0x05:
        if count >= 24:
            break
        count += 1
        print(f"  #{count}: cmd 0x05 -> 0x{ret:02X}")
