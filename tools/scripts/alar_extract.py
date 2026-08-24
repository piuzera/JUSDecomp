#!/usr/bin/env python3
"""ALAR archive extractor for the JUS Decomp project.

Ports JUSToolkit's Binary2Alar2/Binary2Alar3 C# readers (priverop/JUSToolkit,
src/JUS.Tool/Containers/Converters/) to Python, so we don't need a .NET runtime
in our asset pipeline.

Usage:
    python tools/scripts/alar_extract.py <archive.aar> <output_dir>
"""
from __future__ import annotations

import struct
import sys
from pathlib import Path


def read_cstring(data: bytes, offset: int) -> tuple[str, int]:
    end = data.index(b"\x00", offset)
    return data[offset:end].decode("ascii", errors="replace"), end + 1


def extract_alar3(data: bytes, out_dir: Path) -> list[dict]:
    """ALAR type 3 (used by e.g. ChrArc.aar, Deck.aar)."""
    magic = data[0:4]
    if magic != b"ALAR":
        raise ValueError(f"not an ALAR file: {magic!r}")
    ftype = data[4]
    if ftype != 3:
        raise ValueError(f"not ALAR type 3: type={ftype}")

    feature_flags = data[5]
    num_files = struct.unpack_from("<H", data, 6)[0]
    first_file_id = struct.unpack_from("<I", data, 8)[0]
    last_file_id = struct.unpack_from("<I", data, 12)[0]
    # 2 bytes: offset to file data (unused by reader, informational)
    header_end = 18

    entries = []
    for i in range(num_files):
        offset_pos = header_end + i * 2
        rel_offset = struct.unpack_from("<H", data, offset_pos)[0]

        file_id, start, size, flags = struct.unpack_from("<IIII", data, rel_offset)
        pos = rel_offset + 16
        name = None
        if (flags >> 31) & 1:
            # name_hash(u16) + null-terminated path string
            pos += 2
            name, pos = read_cstring(data, pos)
        entries.append({
            "id": file_id, "start": start, "size": size,
            "flags": flags, "name": name,
        })

    out_dir.mkdir(parents=True, exist_ok=True)
    for i, e in enumerate(entries):
        rel_name = e["name"] or f"file_{e['id']}"
        rel_name = rel_name.replace("\\", "/").lstrip("/")
        out_path = out_dir / rel_name if e["name"] else out_dir / rel_name
        out_path.parent.mkdir(parents=True, exist_ok=True)
        out_path.write_bytes(data[e["start"]:e["start"] + e["size"]])

    print(f"ALAR3: {num_files} files, id range {first_file_id}-{last_file_id}, "
          f"features={feature_flags:#x}")
    return entries


def extract_alar2(data: bytes, out_dir: Path) -> list[dict]:
    """ALAR type 2 (simpler container)."""
    magic = data[0:4]
    if magic != b"ALAR":
        raise ValueError(f"not an ALAR file: {magic!r}")
    ftype = data[4]
    if ftype != 2:
        raise ValueError(f"not ALAR type 2: type={ftype}")
    num_files = struct.unpack_from("<H", data, 6)[0]
    # 8 bytes of "ID1..ID8" after header
    idx_off = 16
    entries = []
    for i in range(num_files):
        off = idx_off + i * 16
        file_type, start, size = struct.unpack_from("<III", data, off)
        entries.append({"type": file_type, "start": start, "size": size})

    out_dir.mkdir(parents=True, exist_ok=True)
    for i, e in enumerate(entries):
        out_path = out_dir / f"file_{i:04d}.bin"
        out_path.write_bytes(data[e["start"]:e["start"] + e["size"]])

    print(f"ALAR2: {num_files} files")
    return entries


def main() -> int:
    if len(sys.argv) != 3:
        print("usage: alar_extract.py <archive.aar> <output_dir>", file=sys.stderr)
        return 1

    archive = Path(sys.argv[1])
    out_dir = Path(sys.argv[2])
    data = archive.read_bytes()

    ftype = data[4]
    if ftype == 3:
        extract_alar3(data, out_dir)
    elif ftype == 2:
        extract_alar2(data, out_dir)
    else:
        print(f"error: unsupported ALAR type {ftype}", file=sys.stderr)
        return 1

    print(f"Extracted to {out_dir}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
