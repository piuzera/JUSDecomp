#!/usr/bin/env python3
"""Overlay→screen mapping analysis for the JUS Decomp project.

Regenerates the analysis documented in decomp/docs/OVERLAYS.md:
  1. Scans ARM9 main + each overlay binary for embedded NitroFS file paths.
  2. Reports per-module top-level directory references (screen identification).
  3. Counts relocation cross-references between modules (from relocs.txt).
     Note: relocs.txt `module:` fields are authoritative (dsd resolved overlay
     ambiguity); address-based resolution cannot distinguish overlays that share
     a load base.

Usage:
    python tools/scripts/overlay_map.py
"""

from __future__ import annotations

import re
from collections import Counter
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
EXTRACT = REPO / "extract"
DECOMP = REPO / "decomp" / "arm9"

RELOC_RE = re.compile(r"^from:0x[0-9a-f]+ kind:\w+ to:0x[0-9a-f]+ module:(\S+)$")


def normalize_module(desc: str) -> str:
    """`main` -> main; `overlay(10)` -> ov010."""
    m = re.fullmatch(r"overlay\((\d+)\)", desc)
    if m:
        return f"ov{int(m.group(1)):03d}"
    return desc


def module_binaries() -> list[tuple[str, Path]]:
    mods = [("main", EXTRACT / "arm9" / "arm9.bin")]
    mods += [
        (f"ov{i:03d}", p)
        for i, p in enumerate(sorted((EXTRACT / "arm9_overlays").glob("ov*.bin")))
    ]
    return mods


def nitrofs_paths() -> list[str]:
    root = EXTRACT / "files"
    return sorted(
        p.relative_to(root).as_posix() for p in root.rglob("*") if p.is_file()
    )


def path_references() -> dict[str, Counter]:
    paths = nitrofs_paths()
    refs: dict[str, Counter] = {}
    for name, binpath in module_binaries():
        data = binpath.read_bytes()
        hits = Counter()
        for p in paths:
            if p.encode("ascii") in data:
                top = p.split("/")[0] if "/" in p else "(root)"
                hits[top] += 1
        refs[name] = hits
    return refs


def cross_references() -> dict[tuple[str, str], int]:
    """Count relocation edges source-module -> target-module."""
    edges: Counter = Counter()
    reloc_files = [(DECOMP / "relocs.txt", "main")]
    reloc_files += [
        (DECOMP / "overlays" / f"ov{i:03d}" / "relocs.txt", f"ov{i:03d}")
        for i in range(14)
    ]
    for path, src in reloc_files:
        if not path.is_file():
            continue
        for line in path.read_text().splitlines():
            m = RELOC_RE.match(line.strip())
            if m:
                edges[(src, normalize_module(m.group(1)))] += 1
    return edges


def main() -> int:
    print("== NitroFS path references per module ==")
    for name, counter in path_references().items():
        total = sum(counter.values())
        dirs = ", ".join(f"{d}({c})" for d, c in counter.most_common())
        print(f"{name:<6} total={total:>3}  {dirs}")

    edges = cross_references()

    print("\n== Cross-module relocation edges (source -> target) ==")
    for (src, dst), count in sorted(edges.items()):
        if src != dst:
            print(f"{src:<6} -> {dst:<6} : {count}")

    print("\n== Self-reference counts (internal call-graph size) ==")
    for (src, dst), count in sorted(edges.items()):
        if src == dst:
            print(f"{src:<6} internal: {count}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())