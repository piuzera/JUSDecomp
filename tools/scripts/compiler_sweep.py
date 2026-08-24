#!/usr/bin/env python3
"""Compiler version sweep for the JUS Decomp project.

Compiles a single C/C++ source file against every mwccarm.exe found under
tools/mwccarm/ and reports which version(s) produce .text bytes matching a
given slice of the original ROM. Used to identify (or narrow down) which
CodeWarrior build was used to compile a specific object file/overlay.

Usage:
    python tools/scripts/compiler_sweep.py <source.c> <orig_bin> <offset_hex> \
        [--proc arm946e] [--size N]

Example:
    python tools/scripts/compiler_sweep.py decomp/src/ov000/test_trampoline.c \
        extract/arm9_overlays/ov000.bin 0x1120 --size 20

Notes:
    - Compares PRE-LINK .text bytes. Any trailing relocation slots (calls/data
      addresses not yet resolved) will legitimately differ - pass --size to
      limit comparison to the portion before the first relocation, or inspect
      manually.
    - Requires: pip install pyelftools
"""
from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path

try:
    from elftools.elf.elffile import ELFFile
except ImportError:
    sys.exit("error: pip install pyelftools")

REPO = Path(__file__).resolve().parents[2]
MWCCARM_ROOT = REPO / "tools" / "mwccarm"


def find_compilers() -> list[Path]:
    return sorted(MWCCARM_ROOT.rglob("mwccarm.exe"))


def compile_with(compiler: Path, source: Path, out: Path, proc: str) -> bytes | None:
    subprocess.run(
        [str(compiler), "-c", "-proc", proc, "-o", str(out), str(source)],
        capture_output=True, text=True, cwd=REPO,
    )
    if not out.is_file():
        return None
    with open(out, "rb") as f:
        elf = ELFFile(f)
        sec = elf.get_section_by_name(".text")
        return sec.data() if sec else None


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("source", type=Path)
    ap.add_argument("orig_bin", type=Path)
    ap.add_argument("offset", help="hex offset into orig_bin, e.g. 0x1120")
    ap.add_argument("--proc", default="arm946e")
    ap.add_argument("--size", type=int, default=None,
                     help="bytes to compare (default: full original slice length)")
    args = ap.parse_args()

    offset = int(args.offset, 16)
    orig_data = args.orig_bin.read_bytes()

    compilers = find_compilers()
    if not compilers:
        sys.exit(f"error: no mwccarm.exe found under {MWCCARM_ROOT}")
    print(f"Found {len(compilers)} compiler version(s).")

    out = REPO / "build" / "sweep.o"
    out.parent.mkdir(parents=True, exist_ok=True)

    results: dict[str, list[str]] = {}
    for compiler in compilers:
        version = compiler.relative_to(MWCCARM_ROOT).parent.as_posix()
        text = compile_with(compiler, args.source, out, args.proc)
        if text is None:
            print(f"{version:<20} COMPILE FAILED")
            continue
        size = args.size or len(text)
        mine = text[:size]
        orig = orig_data[offset:offset + size]
        match = "MATCH" if mine == orig else ""
        print(f"{version:<20} {mine.hex()} {match}")
        results.setdefault(match or "no-match", []).append(version)

    print("\n== Summary ==")
    for status, versions in results.items():
        print(f"{status}: {', '.join(versions)}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
