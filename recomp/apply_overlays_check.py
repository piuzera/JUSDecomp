#!/usr/bin/env python3
"""
apply_overlays_check.py — generic pre-flight for the [[mods.overlays]] config.

Mimics the runner's gamecard-read overlay application: copy the stock ROM and
overwrite each [offset, offset+len(file)) range with the overlay file, then
assert:

  1. every overlay file exists and was applied,
  2. nothing outside the overlay ranges changed,
  3. every overlay range is either an 8-byte FAT entry, inside a stock FAT
     extent (in-place replacement/growth/shrink), or in the trailing free
     space after the last stock extent (relocation),
  4. the effective FAT still resolves sane extents.

For per-mod semantic verification (e.g. the english-translation pack), run
tools/scripts/eng_verify.py instead.
"""
from __future__ import annotations

import struct
import sys
from pathlib import Path

try:
    sys.stdout.reconfigure(encoding="utf-8")
except Exception:
    pass

ROOT = Path(__file__).resolve().parents[1]


def config_path() -> Path:
    """Composed config wins; fall back to the no-mod base template."""
    gen = ROOT / "recomp" / "game-mod.generated.toml"
    if gen.is_file():
        return gen
    return ROOT / "recomp" / "game-mod.toml"


def apply_overlays(rom: bytearray) -> list[tuple[int, int, str]]:
    applied = []
    in_overlay = False
    offset = None
    for line in config_path().read_text(encoding="utf-8").splitlines():
        s = line.strip()
        if s.startswith("[[mods.overlays]]"):
            in_overlay = True
            offset = None
            continue
        if not in_overlay:
            continue
        if s.startswith("offset"):
            offset = int(s.split("=")[1].strip(), 0)
        elif s.startswith("file"):
            rel = s.split("=")[1].strip().strip('"')
            data = (ROOT / rel).read_bytes()
            assert offset is not None
            rom[offset:offset + len(data)] = data
            applied.append((offset, len(data), rel))
            in_overlay = False
    return applied


def main() -> int:
    rom = bytearray((ROOT / "rom" / "jus.nds").read_bytes())
    stock = bytes(rom)
    applied = apply_overlays(rom)
    print(f"applied {len(applied)} overlays:")
    for off, n, rel in applied:
        print(f"  0x{off:07X} +{n:6d}  {rel}")

    # ── 1. all overlay files existed (read_bytes would have thrown) ────────
    # (assertion by construction)

    # ── 2. nothing changed outside the overlay ranges ──────────────────────
    ranges = [(off, off + n) for off, n, _ in applied]
    changed_outside = 0
    for i in range(len(rom)):
        if rom[i] == stock[i]:
            continue
        if not any(lo <= i < hi for lo, hi in ranges):
            changed_outside += 1
    print(f"changed bytes OUTSIDE overlay ranges: {changed_outside}")
    assert changed_outside == 0, "unexpected modification outside overlays"

    # ── 3. overlay range hygiene ───────────────────────────────────────────
    fat_off = struct.unpack_from("<I", rom, 0x48)[0]
    fat_size = struct.unpack_from("<I", rom, 0x4C)[0]
    n_entries = fat_size // 8
    fat_entry_ranges = {fat_off + i * 8: fat_off + i * 8 + 8
                        for i in range(n_entries)}
    extents = sorted((s, e) for s, e in
                     (struct.unpack_from("<II", stock, fat_off + i * 8)
                      for i in range(n_entries)) if e > s)
    by_start = {s: e for s, e in extents}
    starts = sorted(by_start)
    free_start = max(e for _s, e in extents)
    problems = 0
    for off, n, rel in applied:
        hi = off + n
        if off in fat_entry_ranges and n == 8:
            kind = "FAT entry"
        elif off in by_start:
            idx = starts.index(off)
            nxt = starts[idx + 1] if idx + 1 < len(starts) else free_start
            assert hi <= nxt, f"{rel}: in-place growth overruns next extent"
            kind = "in-place"
        elif off >= free_start and hi <= len(stock):
            kind = "relocated"
        else:
            print(f"[FAIL] {rel} at 0x{off:X}..0x{hi:X} violates overlay rules")
            problems += 1
            continue
        print(f"  kind: {kind:9s} 0x{off:07X}..0x{hi:X} {rel}")
    assert problems == 0

    # ── 4. effective FAT sanity ────────────────────────────────────────────
    bad = 0
    for i in range(n_entries):
        s, e = struct.unpack_from("<II", rom, fat_off + i * 8)
        if s == 0 and e == 0:
            continue
        if not (0 < s < e <= len(rom)):
            print(f"[FAIL] FAT entry {i} insane: 0x{s:X}..0x{e:X}")
            bad += 1
    assert bad == 0, "effective FAT has insane entries"

    print("ALL CHECKS PASSED")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
