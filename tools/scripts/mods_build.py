#!/usr/bin/env python3
"""
mods_build.py — package host-side ROM overlay mods for the ndsrecomp runner.

Layout convention (mirrors the NitroFS tree):
  mods/
    bin/koma.bin            -> NitroFS file replacement (growth supported)
    bin/komatxt.bin         -> ditto
    koma/koma.aar/koma/dt_20.dtx
                            -> archive-INTERNAL member replacement (same size
                               required; the member is located by NAME through
                               the ALAR3 index, so content collisions with
                               other files don't matter)

For each modded NitroFS file the tool:
  1. locates the ORIGINAL in the stock ROM by content search
     (originals come from extract/files/<same path>), preferring occurrences
     that coincide with a FAT extent start,
  2. matches the FAT entry that starts exactly there,
  3. checks growth against the slack before the next FAT extent; if the slack
     is insufficient, RELOCATES the payload into the ROM's trailing free
     space (after the last FAT extent, before the ROM end — plain padding on
     stock 64 MiB dumps) and repoints the FAT entry there,
  4. emits `[[mods.overlays]]` entries: the data overlay plus, for grown or
     relocated files, an overlay of the FAT entry (start/end) so the game
     sees the new size/location. The ROM itself is never touched.

For archive-internal members the tool locates the archive in the ROM by
content search, parses the ALAR3 index to resolve the member's offset by
name, and emits a same-size sub-range overlay at that absolute ROM offset.

Usage:
  py tools/scripts/mods_build.py <rom> <mods_dir> <out_toml>
"""
from __future__ import annotations

import os
import struct
import sys
from pathlib import Path

try:
    sys.stdout.reconfigure(encoding="utf-8")
except Exception:
    pass

EXTRACT = Path(__file__).resolve().parents[2] / "extract" / "files"
# Overlay `file =` paths are resolved by the runner against its working
# directory (the project root, where recomp/play_mod.cmd runs from).
PROJECT_ROOT = Path(__file__).resolve().parents[2]


def load_fat(rom: bytes):
    fat_off, fat_size = struct.unpack_from("<II", rom, 0x48)
    return fat_off, [list(struct.unpack_from("<II", rom, fat_off + i * 8))
                     for i in range(fat_size // 8)]


def find_original(rom: bytes, relpath: str,
                  fat_starts: set[int] | None = None) -> int:
    original = (EXTRACT / relpath).read_bytes()
    off = rom.find(original)
    if off < 0:
        raise SystemExit(f"[!] {relpath}: original content not found in ROM")
    if fat_starts is not None:
        # Prefer an occurrence that coincides with a FAT extent start so the
        # payload is anchored to the file the game actually reads.
        hits: list[int] = []
        o = off
        while o >= 0 and len(hits) < 4:
            if o in fat_starts:
                hits.append(o)
            o = rom.find(original, o + 1)
        if hits:
            if len(hits) > 1:
                print(f"[!] {relpath}: multiple FAT-anchored occurrences — "
                      f"using 0x{hits[0]:X} (verify manually)")
            return hits[0]
        raise SystemExit(
            f"[!] {relpath}: content found in ROM but not at any FAT extent "
            f"start (first hit 0x{off:X})")
    if rom.find(original, off + 1) >= 0:
        print(f"[!] {relpath}: original content is not unique in the ROM — "
              f"proceeding with first hit (verify manually)")
    return off


def align_up(value: int, alignment: int) -> int:
    return (value + alignment - 1) & ~(alignment - 1)


def read_cstring(data: bytes, offset: int) -> tuple[str, int]:
    end = data.index(b"\x00", offset)
    return data[offset:end].decode("ascii", errors="replace"), end + 1


def alar3_entries(rom: bytes, archive_off: int) -> list[tuple[str, int, int]]:
    """Parse the ALAR3 index at archive_off; returns [(name, start, size)]."""
    data = rom
    base = archive_off
    if data[base:base + 4] != b"ALAR":
        raise SystemExit(f"[!] no ALAR at 0x{base:X}")
    if data[base + 4] != 3:
        raise SystemExit(f"[!] ALAR type {data[base + 4]} at 0x{base:X} "
                         f"(only type 3 supported)")
    num_files = struct.unpack_from("<H", data, base + 6)[0]
    entries = []
    for i in range(num_files):
        rel_offset = struct.unpack_from("<H", data, base + 18 + i * 2)[0]
        file_id, start, size, flags = struct.unpack_from(
            "<IIII", data, base + rel_offset)
        name = None
        if (flags >> 31) & 1:
            pos = base + rel_offset + 16 + 2
            name, _ = read_cstring(data, pos)
        if name:
            entries.append((name.replace("\\", "/"), start, size))
    if not entries:
        raise SystemExit(f"[!] ALAR3 at 0x{base:X} has no named entries")
    return entries


def resolve_mod_files(rom: bytes, mods_dir: Path, reloc_state: dict | None = None
                      ) -> tuple[list[tuple[int, str]], list[str]]:
    """Resolve every payload file under `mods_dir` to ROM overlay entries.

    Returns (overlays, notes) where each overlay is (offset, project-relative
    path) ready for a `[[mods.overlays]]` block. FAT-entry overlays are written
    next to the payload as `_fat_<id>.bin` (side effect, same as before).
    `mods_dir` is typically one mod pack's `files/` tree (NitroFS mirror).

    `reloc_state` (optional, shared dict) carries the relocation cursor across
    calls so multiple packs never collide in the trailing free space.
    """
    fat_off, fat = load_fat(rom)
    starts = sorted((e[0], i) for i, e in enumerate(fat) if e[1] > e[0])
    rom_len = len(rom)
    fat_start_set = {s for s, _i in starts}
    if reloc_state is None:
        reloc_state = {}
    reloc_state.setdefault(
        "cursor", align_up(max((e for _s, e in fat if e > _s), default=0),
                           0x200))

    overlays: list[tuple[int, str]] = []
    notes: list[str] = []

    def add_data(offset: int, rel_path: Path, note: str | None) -> None:
        rel_file = os.path.relpath(rel_path, PROJECT_ROOT).replace("\\", "/")
        overlays.append((offset, rel_file))
        if note:
            notes.append(note)

    for modfile in sorted(mods_dir.rglob("*")):
        if not modfile.is_file() or modfile.name.startswith("_fat_"):
            continue
        rel = modfile.relative_to(mods_dir).as_posix()
        data = modfile.read_bytes()
        parts = rel.split("/")
        if len(parts) >= 3 and parts[1].endswith(".aar"):
            # ---- archive-internal member: resolve by ALAR3 name ----
            archive_rel = f"{parts[0]}/{parts[1]}"
            member = "/".join(parts[2:])
            archive_off = find_original(rom, archive_rel)
            entries = alar3_entries(rom, archive_off)
            hit = [e for e in entries if e[0] == member]
            if not hit:
                raise SystemExit(
                    f"[!] {rel}: member '{member}' not in ALAR3 index of "
                    f"{archive_rel}")
            name, start, size = hit[0]
            original = rom[archive_off + start: archive_off + start + size]
            if len(data) != size:
                raise SystemExit(
                    f"[!] {rel}: archive members must keep the same size "
                    f"(original {size}, modded {len(data)}; growth inside an "
                    f"archive needs an archive rebuild)")
            # sanity: extracted copy must match the ROM bytes we target
            # (dsd extraction replaces dots in filenames with underscores)
            extracted = (EXTRACT / parts[0] /
                         f"{parts[1].replace('.', '_')}_out" / member)
            if extracted.is_file() and extracted.read_bytes() != original:
                raise SystemExit(
                    f"[!] {rel}: extracted copy disagrees with ROM bytes at "
                    f"0x{archive_off + start:X}")
            abs_off = archive_off + start
            add_data(abs_off, modfile,
                     f"# {rel}: ALAR3 member '{name}' @ 0x{abs_off:X} "
                     f"({size} bytes)")
            continue
        # ---- plain NitroFS file (growth supported; overflow relocates) ----
        orig_off = find_original(rom, rel, fat_start_set)
        fid = None
        for i, (s, e) in enumerate(fat):
            if s == orig_off:
                fid = i
                break
        if fid is None:
            raise SystemExit(f"[!] {rel}: no FAT entry starts at 0x{orig_off:X}")
        start, end = fat[fid]
        old_len = end - start
        gap = None
        for s, _i in starts:
            if s > end:
                gap = s - end
                break
        growth = len(data) - old_len
        if growth > 0 and (gap is None or growth > gap):
            # In-place growth impossible: relocate the payload into the ROM's
            # trailing free space and repoint this file's FAT entry. Same
            # documented mechanism as in-place growth (data overlay + FAT
            # entry overlay) — the game reads the FAT at runtime, so the
            # payload is served from its new home. MODS.md §4/§8.
            new_start = align_up(reloc_state["cursor"], 0x200)
            if new_start + len(data) > rom_len:
                raise SystemExit(
                    f"[!] {rel}: growth {growth} exceeds slack {gap} and the "
                    f"trailing relocation space is exhausted "
                    f"(need up to 0x{new_start + len(data):X}, "
                    f"ROM is 0x{rom_len:X})")
            fat_file = mods_dir / f"_fat_{fid}.bin"
            fat_file.write_bytes(struct.pack(
                "<II", new_start, new_start + len(data)))
            add_data(new_start, modfile,
                     f"# {rel}: RELOCATED (slack {gap} < growth {growth})")
            add_data(fat_off + fid * 8, fat_file, None)
            reloc_state["cursor"] = new_start + len(data)
            notes.append(
                f"# {rel}: RELOCATED 0x{start:X} -> 0x{new_start:X} "
                f"(FAT id {fid} repointed, slack {gap} < growth {growth}, "
                f"size {old_len} -> {len(data)})")
            continue
        add_data(start, modfile, None)
        if growth != 0:
            # overlay the FAT entry so the game sees the new size
            new_end = start + len(data)
            fatbytes = struct.pack("<II", start, new_end)
            fat_file = mods_dir / f"_fat_{fid}.bin"
            fat_file.write_bytes(fatbytes)
            add_data(fat_off + fid * 8, fat_file, None)
            notes.append(
                f"# {rel}: FAT id {fid} overlain "
                f"(0x{end:X} -> 0x{new_end:X}, slack was {gap})")
        notes.append(f"# {rel}: @ 0x{start:X} size {old_len} -> {len(data)}")

    return overlays, notes


def write_overlays_toml(rom_path: str | Path, mods_dir: Path,
                        out_toml: Path) -> int:
    """Standalone CLI behavior: resolve one mods tree and write a TOML."""
    rom = Path(rom_path).read_bytes()
    overlays, notes = resolve_mod_files(rom, Path(mods_dir))
    lines = ["# Generated by tools/scripts/mods_build.py — do not hand-edit.",
             f"# Stock ROM: {rom_path}", "",
             "# Overlay notes:", *notes, ""]
    for offset, rel_file in overlays:
        lines.append("[[mods.overlays]]")
        lines.append(f'offset = 0x{offset:X}')
        lines.append(f'file = "{rel_file}"')
        lines.append("")
    out_toml.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print(f"wrote {out_toml} ({len(overlays)} overlays)")
    return 0


def main() -> int:
    return write_overlays_toml(sys.argv[1], Path(sys.argv[2]), Path(sys.argv[3]))


if __name__ == "__main__":
    raise SystemExit(main())
