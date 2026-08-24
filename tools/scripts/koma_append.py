#!/usr/bin/env python3
"""
koma_append.py — build koma.bin and komatxt.bin variants with a NEW koma id
890 appended (the "new entry" route; see decomp/docs/NEW_KOMA.md §9/§10).

Design (Jodio iteration 3, 2026-08-23):
    koma.bin   890 -> 891 records.
              Record 890 = ImageID 0x0367 (871 -> art slot koma/dt_01.dtx,
              donated from cheat-only hidden koma 871; dt_20..dt_27 are the
              battle's empty-slot templates), ntbl=42 namenum=1 (picker TILE
              art = {series}_{namenum} = dt_01 = the owner's art; ntbl=14
              would paint the tile with Gyro's jj_29), Sena's effect fields.
              Record 871 = ImageID 0x0366 (cloned onto 870: its name becomes
              komatxt[870] = Ａコマ and its category record[870].ntbl=42 =
              JUMP), ntbl=14 (the picker CATEGORY of a row is believed to be
              record[ImageID].ntbl — 890's ImageID is 871, so 871's ntbl=14
              puts Jodio in the JoJo tab), namenum=0 (its own tile = jj_00,
              a real JoJo image; 871 is unreachable in normal play).
    komatxt.bin
              pointer table grows 10,680 -> 10,692 (entry 890 appended); the
              string blob shifts +12 so entry 0's rel pointer doubles as the
              table size (count = u32@0/12 -> 891). Every rel += 12. The new
              name "ＪＯＤＩＯ" (full-width Latin, the game's own convention
              like ＤＩＯ — the koma-name font has no ASCII glyphs) is
              appended at the end; entries 871 AND 890 point at it (the name
              lookup is ImageID-keyed: record 890's ImageID=871 ->
              komatxt[871]). Entry metadata (unk1/unk2) is stock: 871 keeps
              its own, 890 copies 870's (as in the validated §9 build).

Usage: py tools/scripts/koma_append.py <koma.bin> <komatxt.bin> <outdir>
"""
from __future__ import annotations

import struct
import sys
from pathlib import Path

try:
    sys.stdout.reconfigure(encoding="utf-8")
except Exception:
    pass

NEW_ID = 890
NEW_NAME = "ＪＯＤＩＯ"     # full-width Latin (font-safe)
DONOR_ID = 871             # hidden koma whose name/art slot is donated


def build_koma(data: bytes) -> bytes:
    assert len(data) == 890 * 12, len(data)
    out = bytearray(data)
    # Record 871: display-cloned onto 870 (Ａコマ + JUMP category), but its
    # ntbl becomes 14 so that record 890 — whose ImageID is 871 — lands in
    # the JoJo picker category (category believed = record[ImageID].ntbl).
    struct.pack_into("<H", out, DONOR_ID * 12, 0x0366)   # ImageID = 870
    out[DONOR_ID * 12 + 4] = 14                           # ntbl = JoJo
    out[DONOR_ID * 12 + 5] = 0                            # namenum -> tile jj_00
    # New record 890.
    rec = bytearray(12)
    struct.pack_into("<H", rec, 0, 0x0367)  # ImageID = 871 -> koma/dt_01.dtx
    struct.pack_into("<H", rec, 2, 1)       # unk2 (Sena's help ordinal)
    rec[4] = 42                              # ntbl = hidden "dt" series
    rec[5] = 1                               # namenum -> tile art dt_01
    rec[6] = 2                               # u6
    rec[7] = 3                               # u7 (Sena's effect group)
    rec[8] = 0                               # kgrp  (1-tile)
    rec[9] = 0                               # kelem
    rec[10] = 1                              # u10
    rec[11] = 48                             # u11
    return bytes(out) + bytes(rec)


def build_komatxt(data: bytes) -> bytes:
    table = bytearray(data[:890 * 12]) + bytearray(12)  # + entry 890
    blob = data[890 * 12:]
    # every rel += 12 (blob shifts +12)
    for i in range(890):
        rel = struct.unpack_from("<I", table, i * 12)[0]
        struct.pack_into("<I", table, i * 12, rel + 12)
    # appended name string at table_end + len(blob)
    str_off = len(table) + len(blob)
    name = NEW_NAME.encode("shift_jis") + b"\x00"
    # Name lookup is ImageID-keyed (record 890's ImageID=871), so BOTH the
    # donated entry 871 and the new entry 890 point at the appended string.
    for eid in (NEW_ID, DONOR_ID):
        struct.pack_into("<I", table, eid * 12, str_off - eid * 12)
    # Entry metadata stays stock-flavored: 871 keeps its own unk fields
    # (already in the table); entry 890 copies 870's (validated §9 build).
    struct.pack_into("<I", table, NEW_ID * 12 + 4,
                     struct.unpack_from("<I", data, 870 * 12 + 4)[0])
    struct.pack_into("<I", table, NEW_ID * 12 + 8,
                     struct.unpack_from("<I", data, 870 * 12 + 8)[0])
    return bytes(table) + blob + name


def main() -> int:
    koma = Path(sys.argv[1]).read_bytes()
    komatxt = Path(sys.argv[2]).read_bytes()
    outdir = Path(sys.argv[3])
    outdir.mkdir(parents=True, exist_ok=True)

    new_koma = build_koma(koma)
    new_komatxt = build_komatxt(komatxt)
    (outdir / "koma.bin").write_bytes(new_koma)
    (outdir / "komatxt.bin").write_bytes(new_komatxt)

    # verification
    n = len(new_koma) // 12
    assert n == 891, n
    rec = struct.unpack_from("<H", new_koma, NEW_ID * 12)[0]
    assert rec == 0x0367, hex(rec)
    assert new_koma[NEW_ID * 12 + 4] == 42, f"890 ntbl={new_koma[NEW_ID * 12 + 4]}"
    assert new_koma[NEW_ID * 12 + 5] == 1, f"890 namenum={new_koma[NEW_ID * 12 + 5]}"
    assert struct.unpack_from("<H", new_koma, DONOR_ID * 12)[0] == 0x0366
    assert new_koma[DONOR_ID * 12 + 4] == 14, f"871 ntbl={new_koma[DONOR_ID * 12 + 4]}"
    assert new_koma[DONOR_ID * 12 + 5] == 0, f"871 namenum={new_koma[DONOR_ID * 12 + 5]}"
    count = struct.unpack_from("<I", new_komatxt, 0)[0] // 12
    assert count == 891, count

    def name_at(entry_id: int) -> str:
        rel = struct.unpack_from("<I", new_komatxt, entry_id * 12)[0]
        off = entry_id * 12 + rel
        return new_komatxt[off:off + 16].split(b"\x00")[0].decode("shift_jis")

    assert name_at(871) == NEW_NAME, name_at(871)
    assert name_at(890) == NEW_NAME, name_at(890)
    # Sena's name still resolves; 870/872 strings untouched
    sena_off = struct.unpack_from("<I", new_komatxt, 0)[0]
    assert new_komatxt[sena_off:sena_off + 4] == b"\x83\x5a\x83\x69", "sena moved"
    for eid, stock in ((870, b"\x82\x60\x83\x52\x83\x7d"),
                       (872, b"\x82\x62\x83\x52\x83\x7d")):
        rel = struct.unpack_from("<I", new_komatxt, eid * 12)[0]
        off = eid * 12 + rel
        assert new_komatxt[off:off + 7] == stock + b"\x00", f"entry {eid} changed"

    print(f"koma.bin:    {len(koma)} -> {len(new_koma)} bytes ({n} records; "
          f"record 890 ImageID=0x{rec:04X}, ntbl=42, namenum=1; "
          f"record 871 ImageID=0x0366, ntbl=14, namenum=0)")
    print(f"komatxt.bin: {len(komatxt)} -> {len(new_komatxt)} bytes "
          f"(entry 871 + 890 both '{name_at(890)}')")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
