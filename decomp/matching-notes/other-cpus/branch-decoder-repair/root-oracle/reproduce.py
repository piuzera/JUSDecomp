#!/usr/bin/env python3
"""Rebuild the public synthetic branch oracle with pinned native LLVM tools."""
import argparse
import hashlib
import json
from pathlib import Path
import re
import subprocess

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument("source", type=Path)
parser.add_argument("output", type=Path)
parser.add_argument("--llvm-bin", type=Path, default=Path("/opt/homebrew/opt/llvm/bin"))
parser.add_argument("--lld", type=Path, default=Path("/opt/homebrew/bin/ld.lld"))
args = parser.parse_args()
src, out = args.source.resolve(), args.output.resolve()
out.mkdir(parents=True, exist_ok=True)
meta = json.loads((src / "verification.json").read_text())
for name, expected in meta["source_hashes"].items():
    assert hashlib.sha256((src / name).read_bytes()).hexdigest() == expected, name
commands, decoded = [], {}
stems = ("arm", "thumb", "thumb-blx-alignment")
for mode in stems:
    for command in (
        [str(args.llvm_bin / "llvm-mc"), "--triple=armv5te-none-eabi", "--filetype=obj",
         str(src / f"{mode}.s"), "-o", str(out / f"{mode}.o")],
        [str(args.lld), "-T", str(src / "layout.ld"), str(out / f"{mode}.o"),
         "-o", str(out / f"{mode}.elf")],
        [str(args.llvm_bin / "llvm-objdump"), "-d", "--mcpu=arm946e-s",
         str(out / f"{mode}.elf")],
    ):
        result = subprocess.run(command, check=True, capture_output=True, text=True)
        commands.append(command)
    (out / f"{mode}-disassembly.txt").write_text(result.stdout)
    for line in result.stdout.splitlines():
        match = re.match(r"\s*([0-9a-f]+):\s+.*?\s(b(?:lx|l|ne)?)\s+0x([0-9a-f]+)", line)
        if match:
            decoded[(mode, int(match[1], 16))] = (match[2], int(match[3], 16))
for row in meta["records"]:
    stem = "thumb-blx-alignment" if row["group"] == "halfword_pc_alignment" else row["mode"].lower()
    assert decoded[(stem, row["address"])] == (
        row["mnemonic"], row["expected_address"]
    ), row["name"]
proof = {
    "status": "verified",
    "synthetic_cases": len(meta["records"]),
    "commands": commands,
    "source_hashes": meta["source_hashes"],
    "tools": {
        str(path): hashlib.sha256(path.read_bytes()).hexdigest()
        for path in (args.llvm_bin / "llvm-mc", args.llvm_bin / "llvm-objdump", args.lld)
    },
    "outputs": {
        path.name: hashlib.sha256(path.read_bytes()).hexdigest()
        for mode in stems
        for path in (out / f"{mode}.o", out / f"{mode}.elf", out / f"{mode}-disassembly.txt")
    },
}
(out / "root-proof.json").write_text(json.dumps(proof, indent=2) + "\n")
print(json.dumps({"status": "verified", "synthetic_cases": len(meta["records"])}))
