#!/usr/bin/env py
# arm_disasm.py — focused ARM-mode disassembler (v2, fixed class dispatch).
# Usage: py recomp/arm_disasm.py <bin> <file-start> <length> [base-addr] [out]
import sys

COND = ["eq", "ne", "cs", "cc", "mi", "pl", "vs", "vc", "hi", "ls", "ge",
        "lt", "gt", "le", "", "nv"]
R = ["r0", "r1", "r2", "r3", "r4", "r5", "r6", "r7", "r8", "r9", "r10",
     "r11", "r12", "sp", "lr", "pc"]
SH = ["lsl", "lsr", "asr", "ror"]
DP = ["and", "eor", "sub", "rsb", "add", "adc", "sbc", "rsc",
      "tst", "teq", "cmp", "cmn", "orr", "mov", "bic", "mvn"]


def operand2(w):
    if w & (1 << 25):
        rot = ((w >> 8) & 0xF) << 1
        imm = w & 0xFF
        if rot:
            val = ((imm << (32 - rot)) | (imm >> rot)) & 0xFFFFFFFF
        else:
            val = imm
        return f"#{val:#x}"
    rm = R[w & 0xF]
    sh = (w >> 5) & 3
    if (w >> 4) & 1:
        return f"{rm}, {SH[sh]} {R[(w >> 8) & 0xF]}"
    amt = (w >> 7) & 0x1F
    if sh == 0 and amt == 0:
        return rm
    if amt == 0 and sh == 1:
        return f"{rm}, lsr #32"
    return f"{rm}, {SH[sh]} #{amt}"


def dec(w, pc):
    cond = COND[(w >> 28) & 0xF]
    b27 = (w >> 27) & 1
    b26 = (w >> 26) & 1
    b25 = (w >> 25) & 1
    b24 = (w >> 24) & 1
    b22 = (w >> 22) & 1
    b23 = (w >> 23) & 1
    b21 = (w >> 21) & 1
    b20 = (w >> 20) & 1
    b7 = (w >> 7) & 1
    b4 = (w >> 4) & 1
    rd = R[(w >> 12) & 0xF]
    rn = R[(w >> 16) & 0xF]

    # Unconditional space
    if cond == "nv":
        if (w & 0x0FFF0000) == 0x012FFF10 and b27:  # bx/blx reg forms
            pass
        if (w & 0x0FFFFFF0) == 0x012FFF30:
            return "blx r14-ish?"
        if (w & 0x0FFFFFF0) == 0x012FFF10:
            return f"bx {R[w & 0xF]}"
        if (w & 0x0F000000) == 0x0F000000:
            return "swi"
        if (w & 0x0E000000) == 0x0A000000:
            off = w & 0x00FFFFFF
            if off & 0x800000:
                off -= 0x1000000
            return f"blx {(pc + 8 + (off << 2)) & ~3:#x}"
        if (w & 0x0FFF0FF0) == 0x016F0F10:
            return "clz-like?"
    # Branch (incl. link)
    if (w & 0x0E000000) == 0x0A000000:
        off = w & 0x00FFFFFF
        if off & 0x800000:
            off -= 0x1000000
        target = pc + 8 + (off << 2)
        return f"{'bl' if b24 else 'b'}{cond} {target:#x}"
    if (w & 0x0F000000) == 0x0F000000:
        return f"swi{cond} {w & 0xFFFFFF:#x}"
    # BX register (data-processing-ish encoding 0001 0010 1111 1111 1111 0001 nnnn)
    if (w & 0x0FFFFF00) == 0x012FFF00:
        return f"bx{cond} {R[w & 0xF]}"
    # Single data transfer
    if b27 == 0 and b26 == 1:
        mn = ("ldr" if b20 else "str") + ("b" if b22 else "")
        off = f"#{w & 0xFFF:#x}"
        if b25:
            off = R[w & 0xF]
        if not b23:
            off = "-" + off
        base = rn
        if b24:  # pre-index
            addr = f"[{base}, {off}]" if (b25 or (w & 0xFFF)) else f"[{base}]"
        else:
            addr = f"[{base}], {off}"
        wb = "!" if b21 else ""
        return f"{mn}{cond} {rd}, {addr}{wb}"
    # Extra loads/stores (halfword/signed): bits 27-25 = 000, bit7=1, bit4=1
    if b27 == 0 and b26 == 0 and b7 == 1 and b4 == 1:
        L = b20
        S = (w >> 6) & 1
        H = (w >> 5) & 1
        mn = ("ldr" if L else "str") + {0: "d", 1: "b", 2: "h", 3: "sb/sh?"}[
            (S << 1) | H]
        off = (((w >> 8) & 0xF) << 4) | (w & 0xF)
        if b22:  # immediate
            off_str = f"#{off:#x}"
        else:
            off_str = R[off & 0xF] if off < 16 else f"r?{off:#x}"
        if not b23:
            off_str = "-" + off_str
        addr = f"[{rn}, {off_str}]" if b24 else f"[{rn}], {off_str}"
        return f"{mn}{cond} {rd}, {addr}"
    # Multiply / MLA / SWP
    if (w & 0x0FFFFFF0) in (0x00000090, 0x00200090):
        a = R[(w >> 12) & 0xF]
        return (f"{'mla' if b21 else 'mul'}{cond}{ 's' if b20 else ''} "
                f"{a}, {R[w & 0xF]}, {R[(w >> 8) & 0xF]}, {rn}")
    if (w & 0x0FB00FF0) == 0x01000090:
        return f"swp{cond}{'b' if b22 else ''} {rd}, {R[(w >> 8) & 0xF]}, [{rn}]"
    # Block transfer
    if b27 == 0 and b26 == 0 and b25 == 0 and b7 == 0 and b4 == 1 and \
            (w & 0x0FFFFFF0) != 0x012FFF10:
        mn = "ldm" if b20 else "stm"
        suffix = {"01": "ib", "11": "db", "10": "ia", "00": "da"}[
            f"{b24}{b21}"]
        regs = [R[i] for i in range(16) if (w >> i) & 1]
        bang = "!" if b21 else ""
        caret = "^" if (w >> 22) & 1 else ""
        return f"{mn}{cond}{suffix} {rn}{bang}, {{{', '.join(regs)}}}{caret}"
    # Data processing
    if b27 == 0 and b26 == 0 and (b25 == 1 or b7 == 0):
        opc = DP[(w >> 21) & 0xF]
        S = "s" if b20 else ""
        if opc in ("tst", "teq", "cmp", "cmn"):
            return f"{opc}{cond} {rn}, {operand2(w)}"
        if opc in ("mov", "mvn"):
            return f"{opc}{cond}{S} {rd}, {operand2(w)}"
        return f"{opc}{cond}{S} {rd}, {rn}, {operand2(w)}"
    # MRS/MSR
    if (w & 0x0FBF0FFF) == 0x0320F000:
        return f"msr{cond} cpsr, {operand2(w & 0xFF0FFFFF | (1 << 25))}"
    return f".word {w:#010x}"


def main():
    path, start, length = sys.argv[1], int(sys.argv[2], 0), int(sys.argv[3], 0)
    base = int(sys.argv[4], 0) if len(sys.argv) > 4 else start
    out_path = sys.argv[5] if len(sys.argv) > 5 else "recomp/driver_disasm.txt"
    data = open(path, "rb").read()[start:start + length]
    lines = []
    for i in range(0, len(data) - 3, 4):
        w = int.from_bytes(data[i:i + 4], "little")
        lines.append(f"{base + i:08X}: {w:08X}  {dec(w, base + i)}")
    text = "\n".join(lines)
    with open(out_path, "w") as f:
        f.write(text + "\n")
    print(f"{len(lines)} instructions -> {out_path}")


if __name__ == "__main__":
    main()
