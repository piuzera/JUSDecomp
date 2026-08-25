#!/usr/bin/env python3
"""live_preseed.py — pre-seed ndsrecomp live-overlay caches with native banks
for ALL ROM overlay code (and optionally the ARM7 WRAM binary), compiled
offline from the ROM + the dsd symbol tables.

Why: RAM-resident overlay pages (ARM9 region A/B) run on the Tier-3
interpreter until live-overlay promotes them. In-session promotion converges
slowly for overlays because region A/B pages are churned by overlay swaps —
a bank compiled for one overlay is rejected while another overlay is
resident at the same address — so online play pays an interpreter tax on
the WFC/DWC stack (ov008/ov010) for the first sessions. This tool compiles
every overlay's pages ahead of time so each session boots fully native: no
convergence wait, no per-session compile churn.

How: it synthesizes the schema-3 tier3-coverage manifest that
tools/ndsrecomp/tools/compile_live_shards.py consumes (4096-byte resident
page payloads + function entry points from
decomp/arm9/overlays/<ov>/symbols.txt) and runs that tool against a
STAGING cache. The produced DLLs are then copied into every requested
cache dir — the runner discovers banks by scanning the cache directory
(live_overlay.cpp rescan_cache), so DLLs on disk are all it needs.

Usage (repo root):
  python tools/scripts/live_preseed.py                     # all overlays -> all caches
  python tools/scripts/live_preseed.py --overlays 8,10     # just WFC + comm services
  python tools/scripts/live_preseed.py --dry-run           # show pages, compile nothing
  python tools/scripts/live_preseed.py --caches recomp/live-cache-2p-a

Requires gcc on PATH (or C:\\msys64\\ucrt64\\bin\\gcc.exe), the ndsrecomp
recompiler build, and the runner build's import library — the same
prerequisites as in-session promotion. Re-runs are cheap: the staging
index dedupes already-compiled captures.
"""

from __future__ import annotations

import argparse
import base64
import hashlib
import json
import re
import os
import shutil
import struct
import subprocess
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
PAGE = 4096
SYMBOL_RE = re.compile(
    r"^(?P<name>\S+)\s+kind:function\((?P<mode>thumb|arm)[,)]"
    r"(?:size=(?P<size>0x[0-9a-fA-F]+))?\).*addr:(?P<addr>0x[0-9a-fA-F]+)")


def rom_sha1(path: Path) -> str:
    digest = hashlib.sha1()
    with path.open("rb") as handle:
        while chunk := handle.read(1024 * 1024):
            digest.update(chunk)
    return digest.hexdigest()


def parse_overlays(rom: bytes) -> list[dict]:
    """Parse the ARM9 overlay table. Returns entries with resolved ROM
    extents via the FAT (overlay entries carry a NitroFS file id, not a
    direct ROM offset)."""
    arm9_ovt = struct.unpack_from("<I", rom, 0x50)[0]
    fat_off = struct.unpack_from("<I", rom, 0x48)[0]
    if not arm9_ovt or arm9_ovt >= len(rom):
        return []
    count = max(0, (fat_off - arm9_ovt) // 32)
    overlays = []
    for index in range(min(count, 128)):
        entry = struct.unpack_from("<8I", rom, arm9_ovt + index * 32)
        (oid, ram_addr, size, bss, sinit_init, sinit_start,
         file_id, flags) = entry
        if oid != index:  # ids are sequential from 0
            break
        if not ram_addr or not size:
            continue
        compressed = bool(flags & 0x80000000)
        fat_entry = struct.unpack_from("<2I", rom, fat_off + file_id * 8)
        rom_off, rom_end = fat_entry
        overlays.append({
            "id": oid,
            "ram": ram_addr,
            "size": size,
            "file_id": file_id,
            "rom_off": rom_off,
            "rom_end": rom_end,
            "compressed": compressed,
        })
    return overlays


def load_symbols(overlay_id: int) -> list[tuple[int, str]]:
    """Function entry points (addr, mode) from the dsd symbol table."""
    path = REPO / "decomp" / "arm9" / "overlays" / f"ov{overlay_id:03d}" / "symbols.txt"
    if not path.is_file():
        return []
    entries: list[tuple[int, str]] = []
    for line in path.read_text(encoding="utf-8", errors="replace").splitlines():
        match = SYMBOL_RE.match(line.strip())
        if match:
            entries.append((int(match.group("addr"), 16),
                            match.group("mode")))
    entries.sort()
    return entries


def build_pages(rom: bytes, overlays: list[dict],
                overlay_ids: set[int] | None,
                priority_ids: set[int]) -> list[dict]:
    """One manifest page entry per FULL 4096-byte page inside an overlay's
    RAM extent that contains at least one function entry point. Partial
    first/last pages are skipped: their resident bytes are not fully part
    of the overlay, so a synthetic payload could never validate."""
    pages: list[dict] = []
    seen: set[tuple[int, str]] = set()
    for overlay in overlays:
        if overlay_ids is not None and overlay["id"] not in overlay_ids:
            continue
        if overlay["compressed"]:
            print(f"ov{overlay['id']:03d}: COMPRESSED in ROM — skipped "
                  "(JUS overlays are uncompressed; investigate if this "
                  "fires)", file=sys.stderr)
            continue
        blob = rom[overlay["rom_off"]:overlay["rom_off"] + overlay["size"]]
        if len(blob) != overlay["size"]:
            print(f"ov{overlay['id']:03d}: ROM extent short — skipped",
                  file=sys.stderr)
            continue
        symbols = load_symbols(overlay["id"])
        start = (overlay["ram"] + PAGE - 1) & ~(PAGE - 1)
        end = (overlay["ram"] + overlay["size"]) & ~(PAGE - 1)
        count = 0
        for page_base in range(start, end, PAGE):
            entries = [
                {"addr": f"0x{addr:08x}", "mode": mode, "hits": 1,
                 "kind": "root"}
                for addr, mode in symbols
                if page_base <= addr < page_base + PAGE
            ]
            if not entries:
                continue
            data = blob[page_base - overlay["ram"]:
                        page_base - overlay["ram"] + PAGE]
            sha1 = hashlib.sha1(data).hexdigest()
            key = (page_base, sha1)
            if key in seen:  # same content at same address (identical overlay)
                continue
            seen.add(key)
            pages.append({
                "cpu": 9,
                "addr": f"0x{page_base:08x}",
                "sha1": sha1,
                "data": base64.b64encode(data).decode("ascii"),
                "executions": 2 if overlay["id"] in priority_ids else 1,
                "entry_points": entries,
            })
            count += 1
        print(f"ov{overlay['id']:03d}: ram 0x{overlay['ram']:08X} "
              f"size 0x{overlay['size']:X} file {overlay['file_id']} "
              f"symbols {len(symbols)} -> {count} pages")
    return pages


def gcc_env() -> dict[str, str]:
    env = os.environ.copy()
    if shutil.which("gcc") is None:
        fallback = Path("C:/msys64/ucrt64/bin/gcc.exe")
        if fallback.is_file():
            env["PATH"] = str(fallback.parent) + os.pathsep + env.get("PATH", "")
    return env


def main(argv: list[str] | None = None) -> int:
    ap = argparse.ArgumentParser(
        description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--rom", type=Path, default=REPO / "rom" / "jus.nds")
    ap.add_argument("--caches", type=Path, nargs="+", default=[
        REPO / "recomp" / "live-cache",
        REPO / "recomp" / "live-cache-2p-a",
        REPO / "recomp" / "live-cache-2p-b",
    ])
    ap.add_argument("--stage", type=Path,
                    default=REPO / "recomp" / "live-cache-preseed",
                    help="staging cache compiled once, then copied to --caches")
    ap.add_argument("--overlays", default="all",
                    help="comma-separated overlay ids (default: all), e.g. 8,10")
    ap.add_argument("--priority", default="8,10",
                    help="overlay ids compiled first (WFC + comm)")
    ap.add_argument("--max-pages", type=int, default=100000,
                    help="pages compiled per tool run (default: all)")
    ap.add_argument("--dry-run", action="store_true",
                    help="list pages + entry counts, compile nothing")
    ap.add_argument("--ndsrecomp-root", type=Path,
                    default=REPO / "tools" / "ndsrecomp")
    ap.add_argument("--runner-build", type=Path,
                    default=REPO / "tools" / "ndsrecomp" / "runner" / "build-mingw")
    ap.add_argument("--recompiler", type=Path,
                    default=REPO / "tools" / "ndsrecomp" / "recompiler" / "build"
                    / "nds_recompile.exe")
    ap.add_argument("--gcc", default="gcc")
    args = ap.parse_args(argv)

    if not args.rom.is_file():
        raise SystemExit(f"ROM not found: {args.rom}")
    if not args.recompiler.is_file():
        raise SystemExit(f"recompiler not found: {args.recompiler} "
                         "(build ndsrecomp first)")

    rom = args.rom.read_bytes()
    sha1 = rom_sha1(args.rom)
    overlays = parse_overlays(rom)
    if not overlays:
        raise SystemExit("no ARM9 overlays parsed — unexpected ROM layout")

    overlay_ids = None
    if args.overlays.lower() != "all":
        overlay_ids = {int(part) for part in args.overlays.split(",")}
        missing = overlay_ids - {o["id"] for o in overlays}
        if missing:
            raise SystemExit(f"unknown overlay ids: {sorted(missing)}")
    priority = {int(part) for part in args.priority.split(",")}

    print(f"ROM sha1 {sha1}, {len(overlays)} overlays")
    pages = build_pages(rom, overlays, overlay_ids, priority)
    if not pages:
        raise SystemExit("no pages to compile (no symbol tables?)")
    print(f"total pages: {len(pages)}")

    if args.dry_run:
        for page in pages:
            print(f"  cpu9 {page['addr']} sha1 {page['sha1'][:12]} "
                  f"entries {len(page['entry_points'])}")
        return 0

    # Stage the compile once; the manifest is content-only and cache-independent.
    args.stage.mkdir(parents=True, exist_ok=True)
    manifest = args.stage / f"preseed-manifest-{sha1[:8]}.json"
    manifest.write_text(json.dumps({
        "kind": "ndsrecomp-tier3-coverage",
        "schema": 3,
        "rom_sha1": sha1,
        "pages": {"entries": pages},
    }), encoding="utf-8")

    tool = args.ndsrecomp_root / "tools" / "compile_live_shards.py"
    command = [
        sys.executable, str(tool),
        "--manifest", str(manifest),
        "--cache", str(args.stage),
        "--rom-sha1", sha1,
        "--ndsrecomp-root", str(args.ndsrecomp_root),
        "--runner-build", str(args.runner_build),
        "--recompiler", str(args.recompiler),
        "--gcc", args.gcc,
        "--max-pages", str(args.max_pages),
    ]
    print("+ " + " ".join(command), flush=True)
    result = subprocess.run(command, env=gcc_env())
    if result.returncode != 0:
        return result.returncode

    # Copy the produced DLLs into every target cache. The runner only needs
    # the DLL files on disk (rescan_cache globs the cache directory); the
    # live index stays per-cache and only affects future compile dedupe.
    produced = sorted((args.stage / "gcc").glob("*.dll"))
    print(f"staging produced {len(produced)} DLLs")
    for cache in args.caches:
        target = cache / "gcc"
        target.mkdir(parents=True, exist_ok=True)
        copied = 0
        for dll in produced:
            dest = target / dll.name
            if not dest.is_file():
                shutil.copy2(dll, dest)
                copied += 1
        print(f"{cache}: +{copied} DLLs (total {len(list(target.glob('*.dll')))})")
    return 0


if __name__ == "__main__":
    sys.exit(main())
