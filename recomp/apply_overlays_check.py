#!/usr/bin/env python3
"""
apply_overlays_check.py — pre-flight the [[mods.overlays]] config.
Mimics the runner's gamecard-read overlay application: copy the stock ROM
and overwrite each [offset, offset+len(file)) range with the overlay file,
then assert the artifacts the game will actually see (NitroFS FAT sizes,
koma.bin record 890, komatxt.bin entry 890, the koma.aar member art).
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
    return applied


def main() -> int:
    rom = bytearray((ROOT / "rom" / "jus.nds").read_bytes())
    stock = bytes(rom)
    applied = apply_overlays(rom)
    print(f"applied {len(applied)} overlays:")
    for off, n, rel in applied:
        print(f"  0x{off:07X} +{n:6d}  {rel}")

    fat_off = struct.unpack_from("<I", rom, 0x48)[0]

    def fat_entry(fid):
        s, e = struct.unpack_from("<II", rom, fat_off + fid * 8)
        return s, e

    # ── koma.bin: 891 records; 890 = Jodio; 871 = category lever ──────────
    s66, e66 = fat_entry(66)
    koma = rom[s66:e66]
    n = len(koma) // 12
    assert n == 891, f"koma.bin records={n}"
    img = struct.unpack_from("<H", koma, 890 * 12)[0]
    assert img == 0x0367, f"record 890 ImageID=0x{img:04X}"
    assert koma[890 * 12 + 4] == 42, f"record 890 ntbl={koma[890 * 12 + 4]}"
    assert koma[890 * 12 + 5] == 1, f"record 890 namenum={koma[890 * 12 + 5]}"
    assert struct.unpack_from("<H", koma, 871 * 12)[0] == 0x0366, \
        f"record 871 ImageID=0x{struct.unpack_from('<H', koma, 871 * 12)[0]:04X}"
    assert koma[871 * 12 + 4] == 14, f"record 871 ntbl={koma[871 * 12 + 4]}"
    assert koma[871 * 12 + 5] == 0, f"record 871 namenum={koma[871 * 12 + 5]}"
    print(f"koma.bin: FAT66 0x{s66:X}..0x{e66:X} {n} records; "
          f"record 890 ImageID=0x{img:04X} ntbl=42 namenum=1 (tile = dt_01); "
          f"record 871 ImageID=0x0366 ntbl=14 (category lever)")

    # ── komatxt.bin: 891 entries; 871 + 890 = full-width JODIO ────────────
    s67, e67 = fat_entry(67)
    komatxt = rom[s67:e67]
    count = struct.unpack_from("<I", komatxt, 0)[0] // 12
    assert count == 891, f"komatxt count={count}"
    jodio = "ＪＯＤＩＯ".encode("shift_jis")

    def name_of(entry_id: int) -> bytes:
        rel = struct.unpack_from("<I", komatxt, entry_id * 12)[0]
        off = entry_id * 12 + rel
        return komatxt[off:off + 16].split(b"\x00")[0]

    assert name_of(871) == jodio, name_of(871).hex()
    assert name_of(890) == jodio, name_of(890).hex()
    # entry metadata stays stock-flavored (871 its own, 890 = 870's)
    u1 = struct.unpack_from("<I", komatxt, 871 * 12 + 4)[0]
    u2 = struct.unpack_from("<I", komatxt, 871 * 12 + 8)[0]
    assert (u1, u2) == (0x00485122, 0x00000135), f"871 unk {u1:X}/{u2:X}"
    u1 = struct.unpack_from("<I", komatxt, 890 * 12 + 4)[0]
    u2 = struct.unpack_from("<I", komatxt, 890 * 12 + 8)[0]
    assert (u1, u2) == (0x00150247, 0x00000134), f"890 unk {u1:X}/{u2:X}"
    assert name_of(870) == b"\x82\x60\x83\x52\x83\x7d", \
        f"870 name changed: {name_of(870).hex()}"
    assert name_of(872) == b"\x82\x62\x83\x52\x83\x7d", \
        f"872 name changed: {name_of(872).hex()}"
    print(f"komatxt.bin: FAT67 0x{s67:X}..0x{e67:X} {count} entries; "
          f"871 + 890 = \"{jodio.decode('shift_jis')}\", 870/872 intact")

    # ── koma.aar member dt_01.dtx: owner's art; dt_20 = STOCK ─────────────
    off01 = 0x2BBBA18
    dtx = rom[off01:off01 + 1244]
    assert dtx[:4] == b"DSTX" and dtx[5] == 0x04, "dt_01.dtx not DTX4"
    dtx_rels = [rel for _, _, rel in applied if rel.endswith("koma/dt_01.dtx")]
    assert dtx_rels, "no overlay for koma/dt_01.dtx in the config"
    modded = (ROOT / dtx_rels[0]).read_bytes()
    assert dtx == modded, "dt_01 overlay not applied"
    print(f"dt_01.dtx @ 0x{off01:X}: DTX4 ok (owner's PNG art)")
    # the battle empty-slot template dt_20 must stay STOCK
    off20 = 0x2BC7540
    assert rom[off20:off20 + 1244] == stock[off20:off20 + 1244], \
        "dt_20.dtx modified (empty-slot template must stay stock)"
    print(f"dt_20.dtx @ 0x{off20:X} untouched (stock empty-slot template)")
    # archive index itself untouched
    assert rom[0x2AEFE00:0x2AEFE04] == b"ALAR"
    print("koma.aar header intact at 0x2AEFE00")

    # ── stock regions untouched outside overlays ──────────────────────────
    ranges = [(off, off + n) for off, n, _ in applied]
    changed_outside = 0
    for i in range(len(rom)):
        if rom[i] == stock[i]:
            continue
        if not any(lo <= i < hi for lo, hi in ranges):
            changed_outside += 1
    print(f"changed bytes OUTSIDE overlay ranges: {changed_outside}")
    assert changed_outside == 0, "unexpected modification outside overlays"
    print("ALL CHECKS PASSED")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
