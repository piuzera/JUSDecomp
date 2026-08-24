#!/usr/bin/env python3
"""
analyze_ownsave.py — analyze a manual-play own-save capture.

Inputs:
  recomp/play-auxspi.log  — AUXSPI byte trace (NDS_TRACE_AUXSPI=1)
  recomp/jus-play.sav     — resulting chip image (written by the runner)
  recomp/jus-afterintro-save.sav — hardware fresh-save reference

Does:
  1. Parse the trace into SPI transactions (cmd / addr / data), report every
     WRITE-class transaction (0x01 WRSR, 0x02/0x0A program, 0xD8/0x20 erase)
     with the driving CPU+PC and the programmed bytes.
  2. Reconstruct the chip image from the trace alone (0xFF base; 0x02 = AND,
     0x0A = store; erase = 0xFF fill) and diff it against jus-play.sav —
     proves the trace fully accounts for the on-disk image.
  3. Structural report vs the hardware fresh-save shape (JSSGXu at 0x0000 and
     0x8000, non-FF counts, header fields).

Usage:
  py recomp/analyze_ownsave.py [--log recomp/play-auxspi.log]
                               [--sav recomp/jus-play.sav]
"""
from __future__ import annotations

import argparse
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent

W_RE = re.compile(
    r"\[auxspi\] cpu(?P<cpu>\d) pc=0x(?P<pc>[0-9A-Fa-f]{8}) cyc=\d+ "
    r"W pos=(?P<pos>\d+) val=0x(?P<val>[0-9A-Fa-f]{2}) "
    r"cmd=0x(?P<cmd>[0-9A-Fa-f]{2}) addr=0x(?P<addr>[0-9A-Fa-f]{5}) "
    r"-> 0x(?P<res>[0-9A-Fa-f]{2})(?P<flags>.*)")

WRITE_CMDS = {0x01, 0x02, 0x0A}
ERASE_CMDS = {0xD8, 0x20, 0x52, 0xC7, 0xD7}


def parse_log(path: Path):
    """Yield dicts for every traced write byte; also track erases/status."""
    txs: list[dict] = []
    cur: dict | None = None
    for line in path.read_text(encoding="utf-8", errors="replace").splitlines():
        m = W_RE.match(line)
        if not m:
            continue
        g = m.groupdict()
        d = {
            "cpu": int(g["cpu"]),
            "pc": int(g["pc"], 16),
            "pos": int(g["pos"]),
            "val": int(g["val"], 16),
            "cmd": int(g["cmd"], 16),
            "addr": int(g["addr"], 16),
        }
        cmd = d["cmd"]
        if cur is None or cur["cmd"] != cmd or cur["addr"] != d["addr"]:
            cur = {"cmd": cmd, "addr": d["addr"], "bytes": [], "cpu": d["cpu"],
                   "pc": d["pc"], "pos0": d["pos"]}
            txs.append(cur)
        cur["bytes"].append((d["pos"], d["val"]))
    return txs


def reconstruct(txs: list[dict], size: int) -> bytes:
    img = bytearray(b"\xFF" * size)
    for t in txs:
        cmd, addr = t["cmd"], t["addr"]
        data = [v for _, v in sorted(t["bytes"])]
        if cmd in ERASE_CMDS:
            length = 0x10000 if cmd == 0xD8 else 0x1000
            for i in range(min(length, size - addr)):
                img[addr + i] = 0xFF
        elif cmd in (0x02, 0x0A):
            for i, v in enumerate(data):
                if addr + i < size:
                    img[addr + i] = (img[addr + i] & v) if cmd == 0x02 else v
        elif cmd == 0x01:
            pass  # status register, not memory
    return bytes(img)


def struct_report(img: bytes, ref: bytes | None) -> dict:
    def fields(data: bytes, off: int):
        return {
            "magic": data[off:off + 8].rstrip(b"\0").hex(),
            "u08": int.from_bytes(data[off + 8:off + 12], "little"),
            "u0c": int.from_bytes(data[off + 12:off + 16], "little"),
            "mac": data[off + 16:off + 24].hex(),
        }
    r = {
        "size": len(img),
        "nonff": sum(1 for b in img if b != 0xFF),
        "nonzero": sum(1 for b in img if b not in (0, 0xFF)),
        "jssgxu_0000": img.find(b"JSSGXu", 0, 0x100) == 0,
        "jssgxu_8000": img.find(b"JSSGXu", 0x8000, 0x8100) == 0x8000,
        "bank0_head": img[0:0x48].hex(" "),
        "bank1_head": img[0x8000:0x8048].hex(" "),
        "hdr0": fields(img, 0),
        "hdr1": fields(img, 0x8000),
        "bank0_eq_bank1": img[0:0x8000] == img[0x8000:0x10000],
    }
    if ref is not None:
        r["ref_size"] = len(ref)
        r["ref_jssgxu_0000"] = ref.find(b"JSSGXu", 0, 0x100) == 0
        r["ref_jssgxu_8000"] = ref.find(b"JSSGXu", 0x8000, 0x8100) == 0x8000
        if len(ref) == len(img):
            diffs = sum(1 for a, b in zip(img, ref) if a != b)
            r["diff_vs_hw_fresh"] = diffs
    return r


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--log", default="recomp/play-auxspi.log")
    ap.add_argument("--sav", default="recomp/jus-play.sav")
    ap.add_argument("--ref", default="recomp/jus-afterintro-save.sav")
    args = ap.parse_args()

    log = Path(args.log)
    sav = Path(args.sav)
    if not log.exists():
        print(f"missing log {log}")
        return 1
    txs = parse_log(log)
    wr = [t for t in txs if t["cmd"] in WRITE_CMDS]
    er = [t for t in txs if t["cmd"] in ERASE_CMDS]
    total_prog = sum(len(t["bytes"]) for t in wr)
    print(f"trace: {len(txs)} transactions "
          f"({len(wr)} program/WRSR, {len(er)} erase)")
    print(f"programmed bytes across write transactions: {total_prog}")
    cpus = {}
    for t in wr:
        cpus.setdefault(t["cpu"], 0)
        cpus[t["cpu"]] += 1
    print(f"write transactions by CPU: {cpus}")
    for t in er:
        print(f"ERASE cmd=0x{t['cmd']:02X} addr=0x{t['addr']:05X} "
              f"cpu{t['cpu']} pc=0x{t['pc']:08X}")
    for t in wr:
        data = bytes(v for _, v in sorted(t["bytes"]))
        print(f"WRITE cmd=0x{t['cmd']:02X} addr=0x{t['addr']:05X} "
              f"len={len(data)} cpu{t['cpu']} pc=0x{t['pc']:08X}")
        if t["cmd"] != 0x01:
            head = " ".join(f"{b:02x}" for b in data[:32])
            print(f"     data[:32]: {head}")

    img = reconstruct(txs, 0x20000)
    img = img[:0x20000]
    print("\nreconstructed image vs disk file:")
    if sav.exists():
        disk = sav.read_bytes()[:0x20000]
        bad = sum(1 for a, b in zip(img, disk) if a != b)
        print(f"  mismatches: {bad} of {min(len(img), len(disk))} "
              f"(disk size {len(disk)})")
        target = disk if bad else img
        (ROOT / "savebug-reconstructed.sav").write_bytes(img)
    else:
        print(f"  {sav} missing — using reconstruction")
        target = img

    ref = Path(args.ref).read_bytes() if Path(args.ref).exists() else None
    print("\nstructure report:")
    rep = struct_report(target, ref)
    for k, v in rep.items():
        print(f"  {k}: {v}")
    out = {"log": str(log), "sav": str(sav),
           "write_tx": len(wr), "erase_tx": len(er),
           "prog_bytes": total_prog, "cpus": cpus, "report": rep}
    (ROOT / "ownsave-analysis.json").write_text(
        __import__("json").dumps(out, indent=1) + "\n")
    print("\nwrote recomp/ownsave-analysis.json")
    return 0


if __name__ == "__main__":
    sys.exit(main())
