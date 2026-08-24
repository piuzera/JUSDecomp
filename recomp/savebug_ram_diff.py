#!/usr/bin/env py
# savebug_ram_diff.py — offline analysis of the captured ARM9 RAM blob
# (recomp/savebug-ram-scan.bin, 4 MiB from 0x02000000).
# Q: did the imported save's BANK DATA land in RAM (validation OK) or only the header?
import sys

RAM_BASE = 0x02000000
ram = open("recomp/savebug-ram-scan.bin", "rb").read()
imp = open("recomp/jus-trace.sav", "rb").read()

def find_all(hay: bytes, needle: bytes, limit: int = 8):
    out, i = [], hay.find(needle)
    while i >= 0 and len(out) < limit:
        out.append(i)
        i = hay.find(needle, i + 1)
    return out

report = []
report.append(f"RAM blob {len(ram)} bytes @ {RAM_BASE:#x}; import {len(imp)} bytes")

# 1) 64-byte header
hdr = imp[:0x48]
hits = find_all(ram, hdr)
report.append(f"import header[0:0x48] found at RAM: {[hex(RAM_BASE + h) for h in hits]}")

# 2) sample deep-bank windows: 32 bytes at several offsets (data, not header)
for off in (0x100, 0x400, 0x800, 0xB04, 0x1000, 0x2000, 0x2BD4, 0x4000,
            0x8000, 0x8048, 0x9000, 0xB000, 0xF000, 0xF400):
    win = imp[off:off + 32]
    if win == b"\xFF" * 32 or win == b"\x00" * 32:
        report.append(f"  import[{off:#06x}:+32] is uniform ({win[0]:#04x}) - skipped")
        continue
    hits = find_all(ram, win)
    report.append(f"import[{off:#06x}:+32] {win[:8].hex()}.. -> "
                  f"{[hex(RAM_BASE + h) for h in hits] if hits else 'NOT IN RAM'}")

# 3) default template SJIS marker from blank-init
tpl = bytes.fromhex("8366836283 4c".replace(" ", ""))
hits = find_all(ram, b"\x83\x66\x83\x62\x83\x4c", 20)
report.append(f"default-template name '83 66 83 62 83 4c' at RAM: "
              f"{[hex(RAM_BASE + h) for h in hits]}")

# 4) how much of the import's bank-0 tail (0x6000..0x7FFF) exists in RAM?
tail = imp[0x6000:0x6040]
hits = find_all(ram, tail)
report.append(f"import[0x6000:+0x40] -> {[hex(RAM_BASE + h) for h in hits] if hits else 'NOT IN RAM'}")

with open("recomp/savebug_ram_diff.txt", "w") as f:
    f.write("\n".join(report) + "\n")
print("wrote recomp/savebug_ram_diff.txt")
