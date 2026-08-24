#!/usr/bin/env python3
"""NitroFS inventory generator for the JUS Decomp project.

Regenerates the inventory statistics documented in decomp/docs/FILE_FORMATS.md
directly from the dsd extraction at extract/files/. Keeps reconnaissance
reproducible: re-run after any re-extraction or ROM rebuild.

Usage:
    python tools/scripts/nitrofs_inventory.py [extract_root]

Defaults to <repo>/extract.
"""

from __future__ import annotations

import sys
from collections import Counter
from pathlib import Path

MAGIC_LEN = 4


def hex_dump_head(path: Path, length: int = 16) -> str:
    """First `length` bytes of a file as hex, or '<unreadable>'."""
    try:
        data = path.read_bytes()[:length]
    except OSError:
        return "<unreadable>"
    return " ".join(f"{b:02X}" for b in data)


def main() -> int:
    repo_root = Path(__file__).resolve().parents[2]
    extract_root = Path(sys.argv[1]) if len(sys.argv) > 1 else repo_root / "extract"
    files_root = extract_root / "files"

    if not files_root.is_dir():
        print(f"error: {files_root} not found; run dsd extraction first", file=sys.stderr)
        return 1

    files = sorted(p for p in files_root.rglob("*") if p.is_file())
    total_size = sum(p.stat().st_size for p in files)

    print(f"Files root : {files_root}")
    print(f"Files      : {len(files)}")
    print(f"Total size : {total_size:,} bytes ({total_size / 1024 / 1024:.2f} MiB)")

    by_ext: Counter[str] = Counter()
    ext_size: Counter[str] = Counter()
    for p in files:
        ext = p.suffix.lower() or "<none>"
        by_ext[ext] += 1
        ext_size[ext] += p.stat().st_size

    print("\n== By extension ==")
    for ext, count in by_ext.most_common():
        print(f"{ext:<8} {count:>4}  {ext_size[ext]:>12,} bytes")

    print("\n== By directory ==")
    by_dir: Counter[str] = Counter()
    for p in files:
        rel_dir = p.parent.relative_to(files_root)
        by_dir[str(rel_dir) if str(rel_dir) != "." else "/"] += 1
    for d, count in by_dir.most_common():
        print(f"{d:<24} {count:>4}")

    print("\n== Largest files ==")
    for p in sorted(files, key=lambda p: p.stat().st_size, reverse=True)[:15]:
        rel = p.relative_to(files_root)
        print(f"{p.stat().st_size:>12,}  {rel}")

    # Magic identification: report the distinct first-4-byte signatures per extension.
    print("\n== Magic signatures (first 4 bytes) per extension ==")
    ext_magics: dict[str, Counter[str]] = {}
    for p in files:
        ext = p.suffix.lower() or "<none>"
        try:
            magic = p.read_bytes()[:MAGIC_LEN].decode("ascii", errors="replace")
        except OSError:
            continue
        ext_magics.setdefault(ext, Counter())[magic] += 1
    for ext in sorted(ext_magics):
        signature_list = ", ".join(
            f"{magic!r}x{count}" for magic, count in ext_magics[ext].most_common()
        )
        print(f"{ext:<8} {signature_list}")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())