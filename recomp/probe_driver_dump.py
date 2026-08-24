#!/usr/bin/env python3
# probe_driver_dump.py — dump the ARM7 WRAM backup-driver page (0x03803000)
# from a running instance, then locate the same bytes in extract/arm7/arm7.bin.
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from savebug_driver import Client  # noqa: E402

PORT = int(sys.argv[1]) if len(sys.argv) > 1 else 19883
BASE = 0x03800000
LEN = 0x10000  # whole ARM7 WRAM mirror window

c = Client(port=PORT)
c.connect(timeout=30)
print(c.req({"cmd": "ping"}))
blob = bytearray()
for off in range(0, LEN, 0x1000):
    r = c.req({"cmd": "read_mem", "cpu": 7, "addr": BASE + off,
               "len": 0x1000})
    blob += (bytes.fromhex(r["hex"]) if "hex" in r else b"\x00" * 0x1000)
wram = bytes(blob)
Path("recomp/arm7-wram-dump.bin").write_bytes(wram)
print(f"dumped {len(wram)} bytes of ARM7 WRAM @ {BASE:#x} "
      f"-> recomp/arm7-wram-dump.bin")

# non-zero ranges
runs = []
i = 0
while i < len(wram):
    if wram[i] != 0:
        j = i
        while j < len(wram) and wram[j] != 0:
            j += 1
        runs.append((BASE + i, j - i))
        i = j
    else:
        i += 1
print("non-zero runs (first 20):",
      [(hex(a), hex(n)) for a, n in runs[:20]])

# locate the driver (around 0x03803974) inside arm7.bin
arm7 = Path("extract/arm7/arm7.bin").read_bytes()
probe = wram[0x3974 - 0x0000:0x3974 + 0x400]  # 0x03803974..0x03803D74
idx = arm7.find(probe[:0x40])
if idx >= 0:
    print(f"driver bytes found in arm7.bin at file offset {idx:#x} "
          f"(WRAM 0x03803974 source)")
else:
    # try the page start
    probe2 = wram[0x3000:0x3000 + 0x40]
    idx2 = arm7.find(probe2)
    print("driver@0x03803974 not found in arm7.bin; "
          f"page-start search: {'found at ' + hex(idx2) if idx2 >= 0 else 'not found'}")
