#!/usr/bin/env python3
"""arm9_disasm.py — capstone-based ARM9 disassembler + literal-pool finder
for SAVEBUG session 2+ (see decomp/docs/SAVEBUG-SESSION2.md).

Usage:
  py recomp/arm9_disasm.py dis  <addr> <len> [thumb|arm]   # disassemble
  py recomp/arm9_disasm.py find <hexaddr> [<hexaddr>...]   # find LE u32
                                                            # literal-pool refs
Binary: extract/arm9/arm9.bin, base 0x02000000 (extract/arm9/arm9.yaml).
"""
import sys
from pathlib import Path

import capstone

ROOT = Path(__file__).resolve().parent.parent
BIN = ROOT / "extract/arm9/arm9.bin"
BASE = 0x02000000
data = BIN.read_bytes()

SYMBOLS = {}
sym_path = ROOT / "decomp/arm9/symbols.txt"
if sym_path.exists():
    for line in sym_path.read_text().splitlines():
        parts = line.split()
        if len(parts) >= 2 and parts[0].startswith("func_"):
            try:
                SYMBOLS[int(parts[0][5:], 16)] = parts[0]
            except ValueError:
                pass


def sym(addr: int) -> str:
    return SYMBOLS.get(addr, "")


def disasm_stream(md, code: bytes, start: int):
    """Yield instructions, resyncing past literal pools / bad bytes.

    capstone's generator stops at the first undecodable word (literal
    pools look like garbage instructions); when it stops early we emit
    the stall bytes as .short data and retry, so a whole region dumps
    in one pass.
    """
    pos = 0
    end = len(code)
    while pos < end:
        decoded_any = False
        for insn in md.disasm(code[pos:end], start + pos):
            decoded_any = True
            yield insn
            pos = insn.address + insn.size - start
        if not decoded_any:
            step = 4 if not (start + pos) & 3 else 2
            step = min(step, end - pos)
            yield None, code[pos:pos + step], start + pos  # data marker
            pos += step


def dis(addr: int, length: int, thumb: bool) -> None:
    off = addr - BASE
    if off < 0 or off >= len(data):
        print(f"address {addr:#x} outside arm9.bin")
        return
    md = capstone.Cs(capstone.CS_ARCH_ARM,
                     capstone.CS_MODE_THUMB if thumb else capstone.CS_MODE_ARM)
    md.detail = False
    code = data[off:off + length]
    for item in disasm_stream(md, code, addr):
        if isinstance(item, tuple):
            _, raw, daddr = item
            val = int.from_bytes(raw, "little")
            note = sym(val) or sym(val & ~1)
            print(f"{daddr:08x}  {raw.hex():<10} .{'word' if len(raw) == 4 else 'half'} "
                  f"{val:#x} {note} ; pool?")
            continue
        insn = item
        name = sym(insn.address)
        ops = insn.op_str
        # annotate branch targets with symbol names
        if insn.mnemonic.startswith(("b", "cb")) and "x" != insn.mnemonic[1:2]:
            try:
                target = int(ops.split()[-1].rstrip("}"), 0)
                s = sym(target) or sym(target | 1) or sym(target & ~1)
                if s:
                    ops += f"  ; {s}"
            except ValueError:
                pass
        prefix = f"; {name}" if name else ""
        print(f"{insn.address:08x}  {insn.bytes.hex():<10} "
              f"{insn.mnemonic:<8} {ops} {prefix}")
        # annotate literal loads: ldr rX, [pc, #imm] -> pool value
        if insn.mnemonic == "ldr" and ops.startswith("r") and "[pc" in ops:
            try:
                imm = int(ops.split("#")[1].rstrip("]"), 0)
                pool = (insn.address + 4) & ~3
                pool_addr = pool + imm
                poff = pool_addr - BASE
                if 0 <= poff <= len(data) - 4:
                    val = int.from_bytes(data[poff:poff + 4], "little")
                    note = sym(val) or sym(val & ~1)
                    print(f"{'':8}  {'':<10} {'':<8} "
                          f"; pool[{pool_addr:#x}] = {val:#x} {note}")
            except (IndexError, ValueError):
                pass


def find(values):
    for v in values:
        needle = v.to_bytes(4, "little")
        hits = []
        start = 0
        while True:
            i = data.find(needle, start)
            if i < 0:
                break
            hits.append(i)
            start = i + 1
        printable = ", ".join(
            f"{BASE + h:#x}" + (f" ({sym(BASE + h)})" if sym(BASE + h) else "")
            for h in hits)
        print(f"{v:#010x}: {len(hits)} hit(s) at file "
              f"{'/'.join(hex(h) for h in hits)} -> {printable}")


def main() -> int:
    if len(sys.argv) < 3:
        print(__doc__)
        return 2
    mode = sys.argv[1]
    if mode == "dis":
        addr = int(sys.argv[2], 0)
        length = int(sys.argv[3], 0)
        thumb = len(sys.argv) < 5 or sys.argv[4].startswith("t")
        dis(addr, length, thumb)
    elif mode == "find":
        find([int(a, 0) for a in sys.argv[2:]])
    else:
        print(__doc__)
        return 2
    return 0


if __name__ == "__main__":
    sys.exit(main())
