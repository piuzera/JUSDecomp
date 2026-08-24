#!/usr/bin/env python3
"""
koma_tools.py — new-koma tooling for the JUS ndsrecomp runner.

Goal: repurpose a placeholder koma id (default 870, "Ａコマ", NTbl 42 cheat
block) into a "new" 1-koma helper — custom display name + reused effect —
entirely via runtime RAM injection (debug-server write_mem, bus-write path).
No table sizes change, so no bounds patches are needed.

Subcommands:

  offline            Read raw game data (no game needed) and print per-id
                     records from extract/files/bin/koma.bin + komatxt.bin.

  locate             Live: find the runtime koma table (ctx 0x0214BD80 [0x30])
                     and the runtime komatxt copy (RAM scan for the name
                     string blob), verifying both against offline bytes.

  patch              Live: rewrite koma id's 12-byte record (effect fields
                     copied from --donor, default 0 = Sena) and rewrite the
                     komatxt name string in place (<= 6 Shift-JIS bytes, the
                     capacity of Ａコマ's string slot).

Facts grounding this tool (2026-08-23):
  - koma.bin image_id == koma id for all 890 records (verified), so art is
    id-selected and is NOT a patchable lever in the 12-byte record. The
    repurposed koma keeps its own existing art ("reused art" by construction).
  - komatxt.bin = 10,680-byte pointer table (890 x 12-byte entries
    {u32 rel-ptr, u32 unk1, u32 unk2}) + 2,682-byte Shift-JIS string blob.
    Entry 870's name "Ａコマ" sits at blob offset 0x33DE, 6 bytes + NUL,
    7 bytes of in-place capacity.
"""

from __future__ import annotations

import argparse
import sys
import time
import zlib
from pathlib import Path

try:
    sys.stdout.reconfigure(encoding="utf-8")
except Exception:
    pass

sys.path.insert(0, str(Path(__file__).resolve().parent))
from jus_debug_client import DebugClient  # noqa: E402

EXTRACT_BIN = Path(__file__).resolve().parents[2] / "extract" / "files" / "bin"
KOMA_BIN = EXTRACT_BIN / "koma.bin"
KOMATXT_BIN = EXTRACT_BIN / "komatxt.bin"

KOMA_REC = 12
KOMATXT_ENTRY = 12
N_KOMA = 890
KOMATXT_TABLE = N_KOMA * KOMATXT_ENTRY  # 10,680

# Runtime addresses (see decomp/docs/DECK_INJECTION_STATUS.md).
CTX_ADDR = 0x0214BD80
CTX_KOMA_TABLE = 0x30
CTX_KOMA_BOUND = 0x18EC

DEFAULT_ID = 870
DEFAULT_DONOR = 0
DEFAULT_NAME = "テスト"  # 6 Shift-JIS bytes, fits Ａコマ's 7-byte slot exactly

SCAN_REGIONS = (
    (0x02000000, 0x02400000),  # main RAM
)
SCAN_CHUNKS = (0x40000, 0x10000)  # try big chunks first, fall back if capped


def read_file(path: Path) -> bytes:
    if not path.exists():
        print(f"[!] missing {path}", file=sys.stderr)
        raise SystemExit(1)
    return path.read_bytes()


def parse_koma(data: bytes, kid: int) -> dict:
    off = kid * KOMA_REC
    raw = data[off:off + KOMA_REC]
    image_id = int.from_bytes(raw[0:2], "little")
    unk2 = int.from_bytes(raw[2:4], "little")
    ntbl, namenum = raw[4], raw[5]
    u6, u7 = raw[6], raw[7]
    kgrp, kelem = raw[8], raw[9]
    u10, u11 = raw[10], raw[11]
    return {
        "id": kid, "raw": raw, "image_id": image_id, "unk2": unk2,
        "ntbl": ntbl, "namenum": namenum, "u6": u6, "u7": u7,
        "kgrp": kgrp, "kelem": kelem, "u10": u10, "u11": u11,
    }


def parse_komatxt(data: bytes, kid: int) -> dict:
    off = kid * KOMATXT_ENTRY
    raw = data[off:off + KOMATXT_ENTRY]
    rel, unk1, unk2 = (int.from_bytes(raw[i:i + 4], "little") for i in (0, 4, 8))
    stropen = off + rel
    end = data.find(b"\x00", stropen)
    name = data[stropen:end] if end >= 0 else data[stropen:]
    return {
        "id": kid, "raw": raw, "rel": rel, "unk1": unk1, "unk2": unk2,
        "str_off": stropen, "name_bytes": name,
        "name_jp": name.decode("shift_jis", errors="replace"),
    }


def build_name_anchor(komatxt: bytes, kid: int, length: int = 40) -> tuple[bytes, int]:
    """A contiguous byte run starting at kid's name string — a scan anchor."""
    off = parse_komatxt(komatxt, kid)["str_off"]
    run = komatxt[off:off + length]
    if len(run) < length:  # near end of blob
        run = komatxt[off:off + 16]
    return run, off


def cmd_offline(args) -> int:
    koma = read_file(KOMA_BIN)
    komatxt = read_file(KOMATXT_BIN)
    print(f"koma.bin:    {len(koma)} bytes, {len(koma) // KOMA_REC} records")
    print(f"komatxt.bin: {len(komatxt)} bytes = {KOMATXT_TABLE}-byte table "
          f"({N_KOMA} entries) + {len(komatxt) - KOMATXT_TABLE}-byte string blob")
    print()
    for kid in args.ids:
        if not (0 <= kid < N_KOMA):
            print(f"[!] id {kid} out of range 0..{N_KOMA - 1}", file=sys.stderr)
            return 1
        k = parse_koma(koma, kid)
        t = parse_komatxt(komatxt, kid)
        print(f"--- koma id {kid} ({t['name_jp']}) ---")
        print(f"  koma.bin  [{k['raw'].hex(' ')}]")
        print(f"    image_id=0x{k['image_id']:04X} ({k['image_id']})  unk2={k['unk2']}  "
              f"ntbl={k['ntbl']}  namenum={k['namenum']}  "
              f"u6={k['u6']} u7={k['u7']}  kgrp={k['kgrp']} kelem={k['kelem']}  "
              f"u10={k['u10']} u11={k['u11']}")
        print(f"  komatxt   [{t['raw'].hex(' ')}]  rel=+{t['rel']} -> str_off 0x{t['str_off']:X}")
        print(f"    name_bytes ({len(t['name_bytes'])}): {t['name_bytes'].hex(' ')}  "
              f"in-place capacity={len(t['name_bytes']) + 1} bytes incl NUL")
        print()
    return 0


def png(path: Path, rgb_hex: str, w: int, h: int) -> None:
    """Minimal RGB->PNG writer (from recomp/savebug_driver.py)."""
    raw = bytes.fromhex(rgb_hex)
    stride = w * 3
    rows = b"".join(
        b"\x00" + raw[y * stride:(y + 1) * stride] for y in range(h))
    def chunk(tag: bytes, data: bytes) -> bytes:
        return (len(data).to_bytes(4, "big") + tag + data
                + (zlib.crc32(tag + data) & 0xFFFFFFFF).to_bytes(4, "big"))
    ihdr = chunk(b"IHDR", w.to_bytes(4, "big") + h.to_bytes(4, "big")
                 + b"\x08\x02\x00\x00\x00")
    idat = chunk(b"IDAT", zlib.compress(rows, 6))
    iend = chunk(b"IEND", b"")
    with path.open("wb") as f:
        f.write(b"\x89PNG\r\n\x1a\n" + ihdr + idat + iend)
    print(f"screenshot -> {path} ({w}x{h})")


def cmd_shot(c: DebugClient, args) -> int:
    r = c._request({"cmd": "framebuffer", "engine": args.engine})
    if "rgb" not in r:
        print(f"[!] framebuffer: {r}", file=sys.stderr)
        return 1
    png(Path(args.out), r["rgb"], r["w"], r["h"])
    return 0


def cmd_tap(c: DebugClient, args) -> int:
    c._request({"cmd": "touch", "x": args.x, "y": args.y, "down": True})
    time.sleep(args.hold_ms / 1000.0)
    c._request({"cmd": "touch", "x": args.x, "y": args.y, "down": False})
    print(f"tapped ({args.x},{args.y}) held {args.hold_ms} ms")
    return 0


def cmd_key(c: DebugClient, args) -> int:
    r = c._request({"cmd": "keys", "mask": args.mask})
    print(f"keys mask=0x{args.mask:X}: {r}")
    return 0


def cmd_run(c: DebugClient, args) -> int:
    ok = advance(c, args.frames)
    print(f"advanced to vblank9 count {args.frames}: reached={ok}")
    return 0


def scan_anchor(c: DebugClient, needle: bytes) -> list[int]:
    """All occurrences of `needle` across SCAN_REGIONS (overlapping chunks)."""
    hits: list[int] = []
    for start, end in SCAN_REGIONS:
        pos = start
        chunk_size = SCAN_CHUNKS[0]
        n_done = 0
        while pos < end:
            length = min(chunk_size, end - pos)
            try:
                chunk = c.read_mem(pos, length)
            except RuntimeError:
                if chunk_size == SCAN_CHUNKS[-1]:
                    raise
                chunk_size = SCAN_CHUNKS[-1]
                print(f"[*] falling back to {chunk_size} byte chunks")
                continue
            if not chunk:
                break
            i = chunk.find(needle)
            while i != -1:
                hits.append(pos + i)
                i = chunk.find(needle, i + 1)
            pos += max(1, len(chunk) - len(needle) + 1)
            n_done += 1
            if n_done % 32 == 0:
                print(f"[*] scanned to 0x{pos:08X} ({n_done} chunks) ...")
    return hits


def find_komatxt(c: DebugClient, komatxt: bytes, kid: int) -> dict:
    """Scan RAM for the komatxt string blob; verify pointer-table plausibility."""
    anchor, anchor_off = build_name_anchor(komatxt, kid)
    print(f"[*] scanning for komatxt anchor ({len(anchor)} bytes at blob+0x{anchor_off:X}): "
          f"{anchor.hex(' ')}")
    hits = scan_anchor(c, anchor)
    if not hits:
        print("[*] primary anchor not found; trying per-name fallback anchors ...")
        for fallback_kid in (kid, 0, 820):  # target, Sena, Luffy 1-koma
            alt_info = parse_komatxt(komatxt, fallback_kid)
            alt = alt_info["name_bytes"]
            if alt == anchor[:len(alt)]:
                continue
            print(f"[*] fallback anchor kid {fallback_kid} ({len(alt)} bytes): {alt.hex(' ')}")
            alt_hits = scan_anchor(c, alt)
            print(f"[*]   {len(alt_hits)} hit(s): {['0x%08X' % h for h in alt_hits[:16]]}")
            if alt_hits:
                anchor, anchor_off, hits = alt, alt_info["str_off"], alt_hits
                break
    print(f"[*] {len(hits)} anchor hit(s): {['0x%08X' % h for h in hits[:16]]}")
    candidates = []
    for hit in hits:
        blob_start = hit - anchor_off
        table_base = blob_start - KOMATXT_TABLE
        if table_base < 0x02000000:
            continue
        entry = c.read_mem(table_base + kid * KOMATXT_ENTRY, KOMATXT_ENTRY)
        candidates.append({
            "hit": hit, "blob": blob_start, "table": table_base,
            "entry": entry,
            "entry_matches_raw": entry == komatxt[kid * KOMATXT_ENTRY:
                                                  (kid + 1) * KOMATXT_ENTRY],
        })
    best = None
    for cand in candidates:
        m = "exact" if cand["entry_matches_raw"] else "rebased? "
        print(f"  candidate: blob=0x{cand['blob']:08X} table=0x{cand['table']:08X} "
              f"entry870={cand['entry'].hex(' ')} [{m}]")
        if cand["entry_matches_raw"] and best is None:
            best = cand
    if best is None and candidates:
        best = candidates[0]
        print("[!] no exact pointer-table match — pointers may be rebased at load; "
              "using first candidate (name-string rewrite does not touch pointers)")
    return best


def advance(c: DebugClient, frames: int) -> bool:
    """Run the guest to `frames` vblank9 events (serve-mode time control)."""
    r = c._request({"cmd": "run_to_event", "event": "vblank9", "count": frames})
    return bool(r.get("reached"))


def cmd_locate(c: DebugClient, args) -> int:
    koma = read_file(KOMA_BIN)
    komatxt = read_file(KOMATXT_BIN)
    kid = args.id

    if args.frames > 0:
        ok = advance(c, args.frames)
        print(f"[*] advanced to vblank9 count {args.frames}: reached={ok}")

    ctx = c.read_u32(CTX_ADDR)
    print(f"ctx @ 0x{CTX_ADDR:08X} = 0x{ctx:08X}")
    if not ctx:
        print("[!] ctx is NULL — koma table not yet loaded (deck/battle ctx "
              "may init later); continuing with the komatxt scan only")
    else:
        koma_base = c.read_u32(ctx + CTX_KOMA_TABLE)
        bound = c.read_u32(ctx + CTX_KOMA_BOUND)
        print(f"runtime koma table: base=0x{koma_base:08X}  bound={bound}")
        rec = c.read_mem(koma_base + kid * KOMA_REC, KOMA_REC)
        exp = koma[kid * KOMA_REC:(kid + 1) * KOMA_REC]
        print(f"record {kid}: live [{rec.hex(' ')}]  offline [{exp.hex(' ')}]  "
              f"{'MATCH' if rec == exp else 'DIFFERENT!'}")

    print(f"\n[*] locating runtime komatxt...")
    found = find_komatxt(c, komatxt, kid)
    if found is None:
        print("[!] komatxt not found in scanned regions", file=sys.stderr)
        return 1
    t = parse_komatxt(komatxt, kid)
    str_addr = found["blob"] + t["str_off"]
    live_name = c.read_mem(str_addr, len(t["name_bytes"]) + 1)
    print(f"runtime name string @ 0x{str_addr:08X}: {live_name.hex(' ')}  "
          f"= {live_name.split(b'\x00')[0].decode('shift_jis', errors='replace')!r}")
    return 0


def cmd_patch(c: DebugClient, args) -> int:
    koma = read_file(KOMA_BIN)
    komatxt = read_file(KOMATXT_BIN)
    kid, donor = args.id, args.donor
    if not (0 <= kid < N_KOMA) or not (0 <= donor < N_KOMA):
        print(f"[!] ids must be 0..{N_KOMA - 1}", file=sys.stderr)
        return 1

    # --- name encoding / capacity check -------------------------------------
    try:
        name_bytes = args.name.encode("shift_jis")
    except UnicodeEncodeError:
        print("[!] name has characters not representable in Shift-JIS", file=sys.stderr)
        return 1
    t = parse_komatxt(komatxt, kid)
    capacity = len(t["name_bytes"])  # slot bytes before NUL (6 for Ａコマ)
    if len(name_bytes) > capacity:
        print(f"[!] name '{args.name}' encodes to {len(name_bytes)} Shift-JIS bytes; "
              f"in-place slot holds {capacity} (<= 3 full-width chars). "
              f"Longer names need a repoint (not implemented).", file=sys.stderr)
        return 1
    padded = name_bytes + b"\x00" * (capacity - len(name_bytes) + 1)

    # --- koma record: donor effect fields into target skeleton --------------
    src = parse_koma(koma, donor)
    dst = parse_koma(koma, kid)
    new_rec = bytearray(dst["raw"])
    # image_id (0:2) stays == kid (art is id-selected, verified offline).
    new_rec[2:4] = src["unk2"].to_bytes(2, "little")   # help ordinal -> effect
    new_rec[6] = src["u6"]
    new_rec[7] = src["u7"]                              # effect-group id
    new_rec[10] = src["u10"]
    new_rec[11] = src["u11"]
    # ntbl/namenum/kgrp/kelem unchanged (series tag + 1-tile shape).

    ctx = c.read_u32(CTX_ADDR)
    koma_base = c.read_u32(ctx + CTX_KOMA_TABLE) if ctx else 0
    authoritative = koma_base + kid * KOMA_REC if koma_base else None

    # --- patch every RAM copy of the target 12-byte record --------------------
    rec_hits = scan_anchor(c, dst["raw"])
    print(f"[*] record {kid} copies in RAM: {['0x%08X' % a for a in rec_hits]}")
    if authoritative is not None and authoritative not in rec_hits:
        if c.read_mem(authoritative, KOMA_REC) == dst["raw"]:
            rec_hits.append(authoritative)
    if not rec_hits:
        print("[!] no record copies found in RAM; record patch skipped",
              file=sys.stderr)
    else:
        for addr in sorted(set(rec_hits)):
            c.write_mem(addr, bytes(new_rec))
            back = c.read_mem(addr, KOMA_REC)
            tag = "ctx-table" if addr == authoritative else "copy"
            print(f"patched record {kid} @ 0x{addr:08X} [{tag}]: "
                  f"{dst['raw'].hex(' ')} -> {back.hex(' ')}")
        print(f"donor {donor} effect fields copied: unk2={src['unk2']} "
              f"u6={src['u6']} u7={src['u7']} u10={src['u10']} u11={src['u11']}")

    # --- patch every RAM copy of the name string ------------------------------
    anchor, _ = build_name_anchor(komatxt, kid)
    str_hits = scan_anchor(c, anchor)
    if not str_hits:
        print("[*] 40-byte anchor not found; retrying with the bare name ...")
        str_hits = scan_anchor(c, t["name_bytes"])
    if not str_hits:
        print("[!] name string not found in RAM; name patch skipped", file=sys.stderr)
        return 1
    print(f"[*] name-string copies in RAM: {['0x%08X' % a for a in str_hits]}")
    for addr in sorted(set(str_hits)):
        c.write_mem(addr, padded)
        back = c.read_mem(addr, capacity + 1)
        print(f"patched name @ 0x{addr:08X}: {back.hex(' ')}  "
              f"= {back.split(b'\x00')[0].decode('shift_jis', errors='replace')!r}")
    print("verify in-game: open the deck viewer / koma picker and look for the new name.")
    return 0


def cmd_find(c: DebugClient, args) -> int:
    for hexstr in args.needles:
        needle = bytes.fromhex(hexstr)
        hits = scan_anchor(c, needle)
        print(f"needle {hexstr} ({len(needle)} bytes): {len(hits)} hit(s): "
              f"{['0x%08X' % h for h in hits[:32]]}")
    return 0


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--host", default="127.0.0.1")
    ap.add_argument("--port", type=int, default=19842)
    sub = ap.add_subparsers(dest="cmd", required=True)

    p = sub.add_parser("offline", help="dump koma.bin/komatxt.bin entries (no game)")
    p.add_argument("ids", nargs="+", type=int)

    p = sub.add_parser("locate", help="live: find runtime koma table + komatxt copy")
    p.add_argument("--id", type=int, default=DEFAULT_ID)
    p.add_argument("--frames", type=int, default=0,
                   help="advance the guest to this vblank9 count first (serve mode)")

    p = sub.add_parser("patch", help="live: rename + donor-effect patch a koma id")
    p.add_argument("--id", type=int, default=DEFAULT_ID)
    p.add_argument("--donor", type=int, default=DEFAULT_DONOR)
    p.add_argument("--name", default=DEFAULT_NAME)

    p = sub.add_parser("shot", help="save a framebuffer PNG")
    p.add_argument("--engine", default="B", choices=("A", "B"))
    p.add_argument("--out", default="recomp/koma-shot.png")

    p = sub.add_parser("tap", help="inject a stylus tap")
    p.add_argument("x", type=int)
    p.add_argument("y", type=int)
    p.add_argument("--hold-ms", type=int, default=200)

    p = sub.add_parser("key", help="inject a key mask")
    p.add_argument("mask", type=lambda s: int(s, 0))

    p = sub.add_parser("run", help="advance guest to vblank9 count")
    p.add_argument("frames", type=int)

    p = sub.add_parser("find", help="scan RAM for hex needles")
    p.add_argument("needles", nargs="+")

    args = ap.parse_args()

    if args.cmd == "offline":
        return cmd_offline(args)

    with DebugClient(args.host, args.port) as c:
        c.ping()
        handlers = {
            "locate": cmd_locate,
            "patch": cmd_patch,
            "shot": cmd_shot,
            "tap": cmd_tap,
            "key": cmd_key,
            "run": cmd_run,
            "find": cmd_find,
        }
        return handlers[args.cmd](c, args)
    return 1


if __name__ == "__main__":
    raise SystemExit(main())
