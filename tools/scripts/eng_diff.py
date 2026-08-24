#!/usr/bin/env python3
"""
eng_diff.py — byte-for-byte diff & classification between the stock Japanese
JUS ROM and the patched English ROM.

The English ROM is a *rebuilt* image (ndstool-style: files reallocated, header
recomputed, trailing padding stripped), so a raw offset diff alone is
meaningless for modding. This tool therefore diffs both levels:

  1. STRUCTURAL — NDS header fields, arm9, arm7, overlay table (y9ft), FNT,
     FAT, banner: exact ranges, per-field and content comparison (arm9/7 LZ77
     0x10 handled transparently).
  2. LOGICAL — every NitroFS file (resolved through each ROM's own FNT+FAT)
     and every overlay binary, compared by content and by path/overlay id.
     Files that merely moved (content identical) are reported as unchanged;
     only genuine content changes are "diffs" for mod purposes.

Outputs:
  recomp/eng_diff.json            machine-readable manifest (consumed by the
                                  english-translation mod's build.py)
  plans/eng-rom-diff-report.md    human-readable classified report

Usage:
  py tools/scripts/eng_diff.py [--stock PATH] [--english PATH]
"""
from __future__ import annotations

import argparse
import hashlib
import json
import struct
import sys
from dataclasses import dataclass, field
from pathlib import Path

try:
    sys.stdout.reconfigure(encoding="utf-8")
except Exception:
    pass

REPO = Path(__file__).resolve().parents[2]
DEFAULT_STOCK = REPO / "rom" / "jus.nds"
DEFAULT_ENGLISH = REPO / "rom" / "jus-en.nds"
JSON_OUT = REPO / "recomp" / "eng_diff.json"
REPORT_OUT = REPO / "plans" / "eng-rom-diff-report.md"

HEADER_FIELDS = [
    (0x00, 12, "Game title (ASCII)"),
    (0x0C, 4, "Game code"),
    (0x10, 2, "Maker code"),
    (0x12, 1, "Unit code"),
    (0x13, 1, "Device seed"),
    (0x14, 1, "Device size"),
    (0x15, 7, "Reserved"),
    (0x1C, 1, "ROM version / auto-load flags"),
    (0x1D, 3, "Reserved2"),
    (0x20, 4, "ARM9 ROM offset"),
    (0x24, 4, "ARM9 entry address"),
    (0x28, 4, "ARM9 RAM address"),
    (0x2C, 4, "ARM9 size"),
    (0x30, 4, "ARM7 ROM offset"),
    (0x34, 4, "ARM7 entry address"),
    (0x38, 4, "ARM7 RAM address"),
    (0x3C, 4, "ARM7 size"),
    (0x40, 4, "FNT offset"),
    (0x44, 4, "FNT size"),
    (0x48, 4, "FAT offset"),
    (0x4C, 4, "FAT size"),
    (0x50, 4, "ARM9 overlay table offset"),
    (0x54, 4, "ARM9 overlay table size"),
    (0x58, 4, "ARM7 overlay table offset"),
    (0x5C, 4, "ARM7 overlay table size"),
    (0x60, 4, "ROM control: async. prefetch? (0x2000 block)"),
    (0x64, 4, "ARM7 SCI (multiboot) toggle"),
    (0x68, 4, "Banner offset"),
    (0x6C, 4, "Secure CRC16"),
    (0x70, 2, "Secure area delay"),
    (0x72, 2, "ARM9 autoload RAM address"),
    (0x74, 4, "ARM9 autoload start address"),
    (0x78, 4, "ARM9 autoload end address"),
    (0x7C, 4, "ARM7 autoload RAM address"),
    (0x80, 4, "ARM7 autoload start address"),
    (0x84, 4, "ARM7 autoload end address"),
    (0x88, 0x18, "Secure disable (encrypted)"),
    (0xA0, 4, "Total ROM size (regenerated)"),
    (0xA4, 4, "Header size (0x4000)"),
    (0xA8, 0x10, "Nintendo logo (SHA1/hmac region)"),
]


def u16(b: bytes, o: int) -> int:
    return struct.unpack_from("<H", b, o)[0]


def u32(b: bytes, o: int) -> int:
    return struct.unpack_from("<I", b, o)[0]


def sha1(data: bytes) -> str:
    return hashlib.sha1(data).hexdigest()


def diff_runs_exact(a: bytes, b: bytes, base: int = 0) -> list[tuple[int, int]]:
    """Exact differing [start, end) runs between two equal-or-different-length
    buffers, reported against `base`-relative offsets of the longer buffer."""
    runs: list[tuple[int, int]] = []
    n = min(len(a), len(b))
    mv_a, mv_b = memoryview(a), memoryview(b)
    CH = 0x10000
    pos = 0
    while pos < n:
        chunk_end = min(pos + CH, n)
        if mv_a[pos:chunk_end] == mv_b[pos:chunk_end]:
            pos = chunk_end
            continue
        # slow path: byte scan inside this chunk
        i = pos
        while i < chunk_end:
            if a[i] != b[i]:
                j = i
                while j < n and a[j] != b[j]:
                    j += 1
                runs.append((base + i, base + j))
                i = j
            else:
                i += 1
        pos = chunk_end
    if len(a) != len(b):
        runs.append((base + n, base + max(len(a), len(b))))
    return runs


def coalesce(runs: list[tuple[int, int]], gap: int = 0) -> list[tuple[int, int]]:
    out: list[list[int]] = []
    for s, e in sorted(runs):
        if out and s <= out[-1][1] + gap:
            out[-1][1] = max(out[-1][1], e)
        else:
            out.append([s, e])
    return [(s, e) for s, e in out]


def lz77_decompress(data: bytes) -> tuple[bytes, int]:
    """NDS LZ77 type-0x10. Returns (decompressed, declared_size)."""
    if not data or data[0] != 0x10:
        return data, len(data)
    size = data[1] | (data[2] << 8) | (data[3] << 16)
    out = bytearray()
    inpos = 4
    n = len(data)
    while len(out) < size and inpos < n:
        flags = data[inpos]
        inpos += 1
        for bit in range(8):
            if len(out) >= size:
                break
            if flags & (0x80 >> bit):
                if inpos + 1 >= n:
                    return bytes(out), size
                b1, b2 = data[inpos], data[inpos + 1]
                inpos += 2
                ln = ((b1 >> 4) & 0xF) + 3
                disp = (((b1 & 0xF) << 8) | b2) + 1
                for _ in range(ln):
                    out.append(out[-disp])
            else:
                if inpos >= n:
                    return bytes(out), size
                out.append(data[inpos])
                inpos += 1
    return bytes(out), size


@dataclass
class OverlayEntry:
    id: int          # overlay id == FAT file id (JUS reserves FAT ids below FNT base)
    ram_addr: int
    ram_size: int
    file_id: int
    bss_size: int = 0
    sinit_start: int = 0
    sinit_end: int = 0


@dataclass
class NdsRom:
    path: Path
    data: bytes = field(repr=False, default=b"")

    def __post_init__(self) -> None:
        if not self.data:
            self.data = self.path.read_bytes()
        d = self.data
        self.size = len(d)
        self.title = bytes(d[0:12]).decode("ascii", errors="replace").rstrip("\x00 ")
        self.game_code = bytes(d[0x0C:0x10]).decode("ascii", errors="replace")
        self.arm9 = (u32(d, 0x20), u32(d, 0x24), u32(d, 0x28), u32(d, 0x2C))
        self.arm7 = (u32(d, 0x30), u32(d, 0x34), u32(d, 0x38), u32(d, 0x3C))
        self.fnt_off, self.fnt_size = u32(d, 0x40), u32(d, 0x44)
        self.fat_off, self.fat_size = u32(d, 0x48), u32(d, 0x4C)
        self.ovt_off, self.ovt_size = u32(d, 0x50), u32(d, 0x54)
        self.banner_off = u32(d, 0x68)
        self.fat = [(u32(d, self.fat_off + i * 8),
                     u32(d, self.fat_off + i * 8 + 4))
                    for i in range(self.fat_size // 8)]
        self.fnt = self._parse_fnt()
        self.overlays = self._parse_overlays()
        self.path_by_id = {fid: p for p, fid in self.fnt.items()}
        self.max_fnt_id = max(self.fnt.values()) if self.fnt else -1

    # ── FNT ────────────────────────────────────────────────────────────────
    def _parse_fnt(self) -> dict[str, int]:
        d, off = self.data, self.fnt_off
        out: dict[str, int] = {}
        visited: set[int] = set()

        def dirent(idx: int) -> tuple[int, int, int]:
            return (u32(d, off + idx * 8), u16(d, off + idx * 8 + 4),
                    u16(d, off + idx * 8 + 6))

        def walk(dir_id: int, prefix: str) -> None:
            idx = dir_id & 0x0FFF
            if idx in visited:
                return
            visited.add(idx)
            sub, fid, _parent = dirent(idx)
            pos = off + sub
            cur = fid
            while True:
                b = d[pos]
                if b == 0:
                    break
                if b & 0x80:
                    nlen = b & 0x7F
                    name = bytes(d[pos + 1: pos + 1 + nlen]).decode(
                        "ascii", errors="replace")
                    did = u16(d, pos + 1 + nlen)
                    walk(did, prefix + name + "/")
                    pos += 1 + nlen + 2
                else:
                    nlen = b
                    name = bytes(d[pos + 1: pos + 1 + nlen]).decode(
                        "ascii", errors="replace")
                    out[prefix + name] = cur
                    cur += 1
                    pos += 1 + nlen

        walk(0xF000, "")
        return out

    # ── overlay table (y9ft) ───────────────────────────────────────────────
    # JUS ground truth (verified 2026-08-24): the FNT reserves the LOW ids
    # (root first_file_id = 14); FAT ids 0..13 are the overlay binaries
    # ov000..ov013 (their sizes match the valid y9ft entries, which sit at a
    # nonstandard 96-byte stride — ids 0,3,6,9,12 at +0,+96,+192,+288,+384).
    # We therefore treat overlay id == FAT id for ids below the FNT base and
    # ignore the stride oddity (the runner statically recompiles overlays
    # anyway; only content equality matters for the report).
    def _parse_overlays(self) -> list[OverlayEntry]:
        d, off = self.data, self.ovt_off
        base = min(self.fnt.values()) if self.fnt else 0
        ram_by_id: dict[int, tuple[int, int]] = {}
        for i in range(self.ovt_size // 24 - 3):
            o = off + i * 24
            oid, ram, size = u32(d, o), u32(d, o + 4), u32(d, o + 8)
            if oid < base and ram == 0x0214CD20 and 0 < size < 0x400000 \
                    and oid not in ram_by_id:
                ram_by_id[oid] = (ram, size)
        return [OverlayEntry(id=i, ram_addr=ram_by_id.get(i, (0, 0))[0],
                             ram_size=ram_by_id.get(i, (0, 0))[1], file_id=i)
                for i in range(base)]

    # ── helpers ────────────────────────────────────────────────────────────
    def extent(self, fid: int) -> tuple[int, int]:
        return self.fat[fid]

    def read_extent(self, start: int, end: int) -> bytes:
        return self.data[start:end]

    def read_fid(self, fid: int) -> bytes:
        if fid >= len(self.fat):
            return b""
        s, e = self.fat[fid]
        return self.data[s:e]

    def arm9_bytes(self) -> tuple[bytes, bool]:
        off, _entry, _ram, sz = self.arm9
        raw = self.data[off: off + sz]
        if raw[:1] == b"\x10":
            dec, _ = lz77_decompress(raw)
            return dec, True
        return raw, False

    def arm7_bytes(self) -> tuple[bytes, bool]:
        off, _entry, _ram, sz = self.arm7
        raw = self.data[off: off + sz]
        if raw[:1] == b"\x10":
            dec, _ = lz77_decompress(raw)
            return dec, True
        return raw, False

    def banner_bytes(self) -> bytes:
        off = self.banner_off
        if off == 0 or off >= self.size:
            return b""
        version = u16(self.data, off)
        sizes = {0: 0x240, 1: 0x840, 2: 0x940, 3: 0xA40}
        sz = sizes.get(version, 0xA40)
        return self.data[off: off + sz]


# ── classification heuristics ──────────────────────────────────────────────

def classify_file(path: str) -> str:
    p = path.lower()
    if p.endswith(".aar") or ".aar/" in p:
        return "archive (ALAR3: sprites/graphics/members)"
    if any(k in p for k in ("font", "nftr", "ntbl", "clder", "bcstd")):
        return "font / width table"
    if any(k in p for k in ("komatxt", "mes", "msg", "text", "/str", "word")):
        return "text / string table"
    if any(k in p for k in ("snd", "strm", "seq", "sad", "bank", "wave", "bgm")):
        return "audio"
    if any(k in p for k in ("gra", "img", "bgen", "dtx", "nclr", "ncgr",
                            "nscr", "ncar", "nanr", "icon", "menu", "title")):
        return "graphics"
    if "koma" in p:
        return "koma database"
    return "binary data"


def classify_change(path: str, stock: bytes, en: bytes) -> list[str]:
    """Light content sniffing on top of path classification."""
    tags = []
    p = path.lower()
    if any(k in p for k in ("komatxt", "mes", "msg", "text", "/str", "word",
                            "font", "nftr", "ntbl")):
        tags.append("string/pointer data")
    if stock and en and len(stock) == len(en):
        # pointer-density heuristic: count u32 LE values that look like RAM ptrs
        def ptr_density(b: bytes) -> int:
            n = 0
            for i in range(0, len(b) - 3, 4):
                v = u32(b, i)
                if 0x02000000 <= v < 0x02400000 or 0x03000000 <= v < 0x03840000:
                    n += 1
            return n
        tags.append(f"ptr-density stock={ptr_density(stock * 1)}")
    return tags


# ── main analysis ──────────────────────────────────────────────────────────

def analyze(stock: NdsRom, en: NdsRom) -> dict:
    report: dict = {}
    report["stock"] = {"path": str(stock.path), "size": stock.size,
                       "sha1": sha1(stock.data), "title": stock.title,
                       "code": stock.game_code}
    report["english"] = {"path": str(en.path), "size": en.size,
                         "sha1": sha1(en.data), "title": en.title,
                         "code": en.game_code}

    # ── header fields ──
    hdr_diffs = []
    for off, sz, name in HEADER_FIELDS:
        a, b = stock.data[off: off + sz], en.data[off: off + sz]
        if a != b:
            hdr_diffs.append({
                "field": name, "offset": f"0x{off:X}", "size": sz,
                "stock": a.hex(), "english": b.hex(),
                "stock_repr": _repr_field(off, sz, a),
                "english_repr": _repr_field(off, sz, b)})
    report["header"] = {
        "differing_fields": hdr_diffs,
        "same": not hdr_diffs,
    }

    # ── arm9 / arm7 ──
    report["arm9"] = _section_cmp(stock.arm9, en.arm9, "arm9",
                                  stock.arm9_bytes, en.arm9_bytes)
    report["arm7"] = _section_cmp(stock.arm7, en.arm7, "arm7",
                                  stock.arm7_bytes, en.arm7_bytes)

    # ── overlay table + overlay binaries ──
    ovt = {"stock": {"offset": stock.ovt_off, "size": stock.ovt_size,
                     "entries": len(stock.overlays)},
           "english": {"offset": en.ovt_off, "size": en.ovt_size,
                       "entries": len(en.overlays)},
           "table_bytes_equal":
               stock.data[stock.ovt_off: stock.ovt_off + stock.ovt_size] ==
               en.data[en.ovt_off: en.ovt_off + en.ovt_size]}
    ov_entries = []
    for so in stock.overlays:
        eo = next((o for o in en.overlays if o.id == so.id), None)
        if eo is None:
            ov_entries.append({"id": so.id, "status": "missing-in-english"})
            continue
        s_data = stock.read_fid(so.file_id)
        e_data = en.read_fid(eo.file_id)
        rec = {
            "id": so.id,
            "file_id": {"stock": so.file_id, "english": eo.file_id},
            "ram_addr": {"stock": f"0x{so.ram_addr:08X}",
                         "english": f"0x{eo.ram_addr:08X}",
                         "same": so.ram_addr == eo.ram_addr},
            "extent": {"stock": list(stock.extent(so.file_id)),
                       "english": list(en.extent(eo.file_id))},
            "size": {"stock": len(s_data), "english": len(e_data)},
            "content_equal": s_data == e_data,
            "status": "identical" if s_data == e_data else "changed",
        }
        if s_data != e_data:
            rec["diff_runs"] = [list(r) for r in
                                coalesce(diff_runs_exact(s_data, e_data))]
        ov_entries.append(rec)
    new_ids = [o.id for o in en.overlays
               if o.id not in {x.id for x in stock.overlays}]
    ovt["overlays"] = ov_entries
    ovt["new_overlay_ids"] = new_ids
    report["overlay_table"] = ovt

    # ── FNT structural ──
    report["fnt"] = {
        "stock": {"offset": stock.fnt_off, "size": stock.fnt_size,
                  "files": len(stock.fnt)},
        "english": {"offset": en.fnt_off, "size": en.fnt_size,
                    "files": len(en.fnt)},
        "paths_identical": set(stock.fnt) == set(en.fnt),
    }

    # ── FAT structural ──
    report["fat"] = {
        "stock": {"offset": stock.fat_off, "size": stock.fat_size,
                  "entries": len(stock.fat)},
        "english": {"offset": en.fat_off, "size": en.fat_size,
                    "entries": len(en.fat)},
    }

    # ── banner ──
    sb, eb = stock.banner_bytes(), en.banner_bytes()
    report["banner"] = {
        "stock": {"offset": stock.banner_off, "size": len(sb)},
        "english": {"offset": en.banner_off, "size": len(eb)},
        "content_equal": sb == eb,
    }

    # ── NitroFS files, by path ──
    changed, same_files, moved_only = [], [], []
    for path in sorted(stock.fnt):
        if path not in en.fnt:
            continue
        sf, ef = stock.fnt[path], en.fnt[path]
        s_ext, e_ext = stock.extent(sf), en.extent(ef)
        s_data, e_data = stock.read_fid(sf), en.read_fid(ef)
        rec = {
            "path": path,
            "file_id": {"stock": sf, "english": ef},
            "extent": {"stock": list(s_ext), "english": list(e_ext)},
            "size": {"stock": len(s_data), "english": len(e_data)},
            "delta": len(e_data) - len(s_data),
            "relocated": s_ext != e_ext,
        }
        if s_data == e_data:
            rec["status"] = "identical" if s_ext == e_ext else "moved-only"
            (same_files if s_ext == e_ext else moved_only).append(rec)
        else:
            rec["status"] = "changed"
            rec["category"] = classify_file(path)
            rec["diff_runs"] = [list(r) for r in
                                coalesce(diff_runs_exact(s_data, e_data))]
            changed.append(rec)
    only_stock = sorted(set(stock.fnt) - set(en.fnt))
    only_en = sorted(set(en.fnt) - set(stock.fnt))
    report["files"] = {
        "changed": changed,
        "identical": [r["path"] for r in same_files],
        "moved_only": [r["path"] for r in moved_only],
        "only_in_stock": only_stock,
        "only_in_english": only_en,
        "counts": {"changed": len(changed), "identical": len(same_files),
                   "moved_only": len(moved_only),
                   "only_in_stock": len(only_stock),
                   "only_in_english": len(only_en)},
    }

    # ── raw 64 KiB-block differing map (coarse, for the "changed ranges" view)
    report["raw_diff_blocks"] = _raw_block_map(stock.data, en.data)
    return report


def _repr_field(off: int, sz: int, raw: bytes) -> str:
    if off in (0x00, 0x0C, 0x10):
        return raw.decode("ascii", errors="replace").rstrip("\x00 ")
    if sz == 4:
        return f"0x{u32(raw, 0):08X} ({u32(raw, 0)})"
    if sz == 2:
        return f"0x{u16(raw, 0):04X} ({u16(raw, 0)})"
    return raw.hex()


def _section_cmp(s_sec, e_sec, name, s_bytes_fn, e_bytes_fn) -> dict:
    s_off, s_entry, s_ram, s_sz = s_sec
    e_off, e_entry, e_ram, e_sz = e_sec
    s_data, s_lz = s_bytes_fn()
    e_data, e_lz = e_bytes_fn()
    out = {
        "stock": {"rom_offset": f"0x{s_off:X}", "size_raw": s_sz,
                  "entry": f"0x{s_entry:08X}", "ram": f"0x{s_ram:08X}",
                  "lz77_compressed": s_lz,
                  "size_decoded": len(s_data)},
        "english": {"rom_offset": f"0x{e_off:X}", "size_raw": e_sz,
                    "entry": f"0x{e_entry:08X}", "ram": f"0x{e_ram:08X}",
                    "lz77_compressed": e_lz,
                    "size_decoded": len(e_data)},
        "same_entry_and_ram": (s_entry == e_entry and s_ram == e_ram),
        "content_equal_decoded": s_data == e_data,
    }
    if s_data != e_data:
        out["diff_runs"] = [list(r) for r in coalesce(diff_runs_exact(s_data, e_data))]
    return out


def _raw_block_map(a: bytes, b: bytes, block: int = 0x10000) -> dict:
    n = min(len(a), len(b))
    runs: list[tuple[int, int]] = []
    pos = 0
    while pos < n:
        end = min(pos + block, n)
        if a[pos:end] != b[pos:end]:
            runs.append((pos, end))
        pos = end
    if len(a) != len(b):
        runs.append((n, max(len(a), len(b))))
    coalesced = coalesce(runs)
    total = sum(e - s for s, e in coalesced)
    return {
        "block_size": block,
        "ranges": [{"start": f"0x{s:X}", "end": f"0x{e:X}",
                    "bytes": e - s} for s, e in coalesced],
        "coalesced_region_count": len(coalesced),
        "total_bytes_differing_or_moved": total,
        "stock_longer_by": len(a) - len(b),
    }


# ── markdown report ────────────────────────────────────────────────────────

def fmt_extent(ext: tuple[int, int]) -> str:
    return f"0x{ext[0]:X}–0x{ext[1]:X} ({ext[1] - ext[0]} B)"


def render_markdown(rep: dict) -> str:
    L: list[str] = []
    s, e = rep["stock"], rep["english"]
    L.append("# English ROM vs Stock ROM — Diff & Classification Report")
    L.append("")
    L.append(f"Generated by `tools/scripts/eng_diff.py`. Machine-readable "
             f"manifest: `recomp/eng_diff.json`.")
    L.append("")
    L.append("| ROM | Path | Size | SHA1 | Title | Code |")
    L.append("|---|---|---|---|---|---|")
    L.append(f"| Stock | `{s['path']}` | {s['size']} | `{s['sha1']}` | "
             f"{s['title']} | {s['code']} |")
    L.append(f"| English | `{e['path']}` | {e['size']} | `{e['sha1']}` | "
             f"{e['title']} | {e['code']} |")
    L.append("")
    L.append(f"**Nature of the patch:** the English image is a **rebuilt ROM** "
             f"(size differs by {e['size'] - s['size']:+d} bytes), i.e. files "
             f"were reallocated and the trailing padding stripped — not an "
             f"in-place patch. Modding therefore targets *logical* file "
             f"replacement, not raw offset patching.")
    L.append("")

    # overview table
    f = rep["files"]["counts"]
    L.append("## 1. Overview")
    L.append("")
    L.append("| Section | Status |")
    L.append("|---|---|")
    hdr_n = len(rep["header"]["differing_fields"])
    L.append(f"| NDS header | {'identical' if rep['header']['same'] else f'**{hdr_n} field(s) differ**'} |")
    a9 = rep["arm9"]
    L.append(f"| ARM9 | "
             f"{'**content changed**' if not a9['content_equal_decoded'] else 'identical (decoded)'} "
             f"(stock {a9['stock']['rom_offset']} +{a9['stock']['size_raw']}"
             f"{', LZ77' if a9['stock']['lz77_compressed'] else ''}; "
             f"english {a9['english']['rom_offset']} +{a9['english']['size_raw']}"
             f"{', LZ77' if a9['english']['lz77_compressed'] else ''}) |")
    a7 = rep["arm7"]
    L.append(f"| ARM7 | "
             f"{'**content changed**' if not a7['content_equal_decoded'] else 'identical (decoded)'} "
             f"(stock {a7['stock']['rom_offset']} +{a7['stock']['size_raw']}; "
             f"english {a7['english']['rom_offset']} +{a7['english']['size_raw']}) |")
    ovt = rep["overlay_table"]
    ch_ov = [o for o in ovt["overlays"] if o["status"] == "changed"]
    L.append(f"| Overlays (y9ft) | {len(ovt['overlays'])} overlays, "
             f"**{len(ch_ov)} changed**, table bytes "
             f"{'identical' if ovt['table_bytes_equal'] else 'differ (offsets reallocated)'} |")
    L.append(f"| FNT | {rep['fnt']['english']['files']} vs "
             f"{rep['fnt']['stock']['files']} files; path sets "
             f"{'identical' if rep['fnt']['paths_identical'] else '**differ**'} |")
    L.append(f"| Banner | {'identical' if rep['banner']['content_equal'] else '**changed**'} "
             f"(stock 0x{rep['banner']['stock']['offset']:X}, "
             f"english 0x{rep['banner']['english']['offset']:X}) |")
    L.append(f"| NitroFS files | **{f['changed']} changed**, "
             f"{f['moved_only']} moved-only (content identical), "
             f"{f['identical']} identical, "
             f"{f['only_in_stock']} only-in-stock, "
             f"{f['only_in_english']} only-in-english |")
    raw = rep["raw_diff_blocks"]
    L.append(f"| Raw image | {raw['coalesced_region_count']} coalesced "
             f"64 KiB-block regions differ/moved "
             f"({raw['total_bytes_differing_or_moved']:,} bytes); "
             f"stock longer by {raw['stock_longer_by']:,} |")
    L.append("")

    # header
    L.append("## 2. NDS header")
    L.append("")
    if rep["header"]["same"]:
        L.append("Identical.")
    else:
        L.append("| Field | Offset | Stock | English |")
        L.append("|---|---|---|---|")
        for h in rep["header"]["differing_fields"]:
            L.append(f"| {h['field']} | {h['offset']} | "
                     f"`{h['stock_repr']}` | `{h['english_repr']}` |")
    L.append("")

    # arm9/arm7
    for key, name in (("arm9", "ARM9"), ("arm7", "ARM7")):
        sec = rep[key]
        L.append(f"## 3. {name}")
        L.append("")
        L.append(f"- Stock: ROM {sec['stock']['rom_offset']} "
                 f"(+{sec['stock']['size_raw']} raw, "
                 f"{'LZ77' if sec['stock']['lz77_compressed'] else 'uncompressed'}, "
                 f"{sec['stock']['size_decoded']} decoded), entry "
                 f"{sec['stock']['entry']}, RAM {sec['stock']['ram']}")
        L.append(f"- English: ROM {sec['english']['rom_offset']} "
                 f"(+{sec['english']['size_raw']} raw, "
                 f"{'LZ77' if sec['english']['lz77_compressed'] else 'uncompressed'}, "
                 f"{sec['english']['size_decoded']} decoded), entry "
                 f"{sec['english']['entry']}, RAM {sec['english']['ram']}")
        if sec["content_equal_decoded"]:
            L.append(f"- **Content identical after decompression** — no "
                     f"{name} patch needed.")
        else:
            runs = sec.get("diff_runs", [])
            total = sum(b - a for a, b in runs)
            L.append(f"- **CONTENT CHANGED** — {len(runs)} differing run(s), "
                     f"{total} bytes (decoded image):")
            for a, b in runs[:60]:
                L.append(f"  - `0x{a:06X}–0x{b:06X}` ({b - a} B)")
            if len(runs) > 60:
                L.append(f"  - … {len(runs) - 60} more run(s)")
        L.append("")

    # overlays
    L.append("## 4. Overlays")
    L.append("")
    L.append(f"Overlay table: stock {ovt['stock']['offset']:#x} "
             f"({ovt['stock']['entries']} entries), english "
             f"{ovt['english']['offset']:#x} ({ovt['english']['entries']} entries).")
    L.append("")
    L.append("| ID | Stock extent | English extent | Size | Content |")
    L.append("|---|---|---|---|---|")
    for o in ovt["overlays"]:
        if o["status"] == "missing-in-english":
            L.append(f"| {o['id']} | {fmt_extent(tuple(ovt['stock']['offset'] and (0,0)))} | — | — | missing in English |")
            continue
        ext_s = fmt_extent(tuple(o["extent"]["stock"]))
        ext_e = fmt_extent(tuple(o["extent"]["english"]))
        mark = "identical" if o["content_equal"] else "**CHANGED**"
        nruns = len(o.get("diff_runs", []))
        L.append(f"| {o['id']} | {ext_s} | {ext_e} | "
                 f"{o['size']['stock']} → {o['size']['english']} | "
                 f"{mark}{'' if o['content_equal'] else f' ({nruns} runs)'} |")
    L.append("")

    # files changed
    L.append("## 5. NitroFS files — content changes")
    L.append("")
    L.append(f"{f['changed']} file(s) genuinely changed "
             f"({f['moved_only']} more were reallocated but kept identical "
             f"content — those are rebuild noise, not patch content).")
    L.append("")
    L.append("| Path | Category | Stock extent | English extent | Size Δ |")
    L.append("|---|---|---|---|---|")
    for r in rep["files"]["changed"]:
        L.append(f"| `{r['path']}` | {r.get('category','')} | "
                 f"{fmt_extent(tuple(r['extent']['stock']))} | "
                 f"{fmt_extent(tuple(r['extent']['english']))} | "
                 f"{r['size']['stock']} → {r['size']['english']} "
                 f"({r['delta']:+d}) |")
    L.append("")
    if rep["files"]["only_in_stock"] or rep["files"]["only_in_english"]:
        L.append("### Path set differences")
        L.append("")
        for p in rep["files"]["only_in_stock"]:
            L.append(f"- only in stock: `{p}`")
        for p in rep["files"]["only_in_english"]:
            L.append(f"- only in english: `{p}`")
        L.append("")

    # raw blocks
    L.append("## 6. Raw image block diff (64 KiB granularity)")
    L.append("")
    L.append("Coarse map of where the two images disagree (includes pure "
             "reallocation noise). Logical section boundaries above are the "
             "authoritative view.")
    L.append("")
    for r in rep["raw_diff_blocks"]["ranges"]:
        L.append(f"- {r['start']} – {r['end']} ({r['bytes']:,} B)")
    L.append("")
    return "\n".join(L)


def _strip_diff_runs(obj):
    """Drop per-file `diff_runs` arrays from the JSON manifest (they can be
    hundreds of thousands of lines for big archives) — the human-readable
    report keeps them, and build.py / eng_verify.py only need paths, ids,
    extents and sizes."""
    if isinstance(obj, dict):
        return {k: _strip_diff_runs(v) for k, v in obj.items()
                if k != "diff_runs"}
    if isinstance(obj, list):
        return [_strip_diff_runs(v) for v in obj]
    return obj


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__.splitlines()[1])
    ap.add_argument("--stock", type=Path, default=DEFAULT_STOCK)
    ap.add_argument("--english", type=Path, default=DEFAULT_ENGLISH)
    ap.add_argument("--json", type=Path, default=JSON_OUT)
    ap.add_argument("--report", type=Path, default=REPORT_OUT)
    args = ap.parse_args()

    stock = NdsRom(args.stock)
    en = NdsRom(args.english)
    print(f"stock   : {stock.size:,} B  title={stock.title!r} "
          f"files={len(stock.fnt)} overlays={len(stock.overlays)}")
    print(f"english : {en.size:,} B  title={en.title!r} "
          f"files={len(en.fnt)} overlays={len(en.overlays)}")

    rep = analyze(stock, en)

    args.json.parent.mkdir(parents=True, exist_ok=True)
    args.json.write_text(json.dumps(_strip_diff_runs(rep), indent=1),
                         encoding="utf-8")
    print(f"wrote {args.json}")

    args.report.parent.mkdir(parents=True, exist_ok=True)
    args.report.write_text(render_markdown(rep), encoding="utf-8")
    print(f"wrote {args.report}")

    f = rep["files"]["counts"]
    print("\nSummary:")
    print(f"  header fields differing : {len(rep['header']['differing_fields'])}")
    print(f"  arm9 decoded equal      : {rep['arm9']['content_equal_decoded']}")
    print(f"  arm7 decoded equal      : {rep['arm7']['content_equal_decoded']}")
    ch_ov = [o for o in rep["overlay_table"]["overlays"]
             if o["status"] == "changed"]
    print(f"  overlays changed        : {len(ch_ov)} / {len(rep['overlay_table']['overlays'])}")
    print(f"  nitrofs changed         : {f['changed']} "
          f"(moved-only {f['moved_only']}, identical {f['identical']}, "
          f"only-stock {f['only_in_stock']}, only-en {f['only_in_english']})")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
