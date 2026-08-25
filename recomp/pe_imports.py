#!/usr/bin/env python3
"""pe_imports.py — dump the subsystem and imported DLLs of a Windows PE file.
Works for both PE32 (0x10b) and PE32+ (0x20b). Useful for diagnosing runner
launch failures (missing/stale DLLs -> STATUS_DLL_NOT_FOUND 0xC0000135 /
STATUS_ENTRYPOINT_NOT_FOUND 0xC0000139).

Usage: python recomp/pe_imports.py path\to\app.exe [--first-funcs N]
"""

from __future__ import annotations

import argparse
import struct
import sys


def rva_to_offset(d: bytes, rva: int, pe: int, opt_size: int) -> int | None:
    """Map an RVA to a file offset using the section table."""
    sect = pe + 24 + opt_size
    for _ in range(96):
        if sect + 40 > len(d):
            break
        vs = struct.unpack_from("<I", d, sect + 8)[0]
        va = struct.unpack_from("<I", d, sect + 12)[0]
        raw = struct.unpack_from("<I", d, sect + 20)[0]
        if rva >= va and rva < va + vs:
            return raw + (rva - va)
        sect += 40
    return None


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("path")
    ap.add_argument("--first-funcs", type=int, default=0)
    args = ap.parse_args()

    with open(args.path, "rb") as f:
        d = f.read()

    pe = struct.unpack_from("<I", d, 0x3C)[0]
    opt = pe + 24
    magic = struct.unpack_from("<H", d, opt)[0]
    if magic not in (0x10B, 0x20B):
        print(f"not a PE image (magic {hex(magic)})")
        return 1
    opt_size = struct.unpack_from("<H", d, pe + 20)[0]
    subsystem = struct.unpack_from("<H", d, opt + 68)[0]
    is_pe32plus = magic == 0x20B
    print(f"magic={hex(magic)} ({'PE32+' if is_pe32plus else 'PE32'}) "
          f"subsystem={subsystem} ({'GUI' if subsystem == 2 else 'console' if subsystem == 3 else '?'})")

    # DataDirectory index 1 = Import Table. Layout offset differs PE32/PE32+.
    dd = opt + (112 if is_pe32plus else 96)
    import_rva = struct.unpack_from("<I", d, dd + 8 * 1)[0]
    if not import_rva:
        print("no import table")
        return 0
    off = rva_to_offset(d, import_rva, pe, opt_size)
    if off is None:
        print("import table not found in sections")
        return 0

    while True:
        name_rva = struct.unpack_from("<I", d, off + 12)[0]
        if name_rva == 0:
            break
        no = rva_to_offset(d, name_rva, pe, opt_size)
        if no is None:
            print("  <bad dll name rva>")
        else:
            end = no
            while end < len(d) and d[end] != 0:
                end += 1
            dll = d[no:end].decode("ascii", "replace")
            print(f"  DLL: {dll}")
            if args.first_funcs:
                # Import Lookup Table (ILT) is at offset+0 (PE32+ 8-byte
                # entries, PE32 4-byte). Function names via Hint/Name table.
                ilt_rva = struct.unpack_from("<I", d, off)[0]
                ilt = rva_to_offset(d, ilt_rva, pe, opt_size)
                if ilt is not None:
                    shown = 0
                    for _ in range(2000):
                        if is_pe32plus:
                            entry = struct.unpack_from("<Q", d, ilt)[0]
                            step = 8
                        else:
                            entry = struct.unpack_from("<I", d, ilt)[0]
                            step = 4
                        if entry == 0:
                            break
                        if not (entry & (1 << 63 if is_pe32plus else 1 << 31)):
                            hint_name_rva = entry & 0x7FFFFFFF
                            hn = rva_to_offset(d, hint_name_rva, pe, opt_size)
                            if hn is not None:
                                end = hn + 2
                                while end < len(d) and d[end] != 0:
                                    end += 1
                                fn = d[hn + 2:end].decode("ascii", "replace")
                                print(f"      func: {fn}")
                                shown += 1
                                if shown >= args.first_funcs:
                                    break
                        ilt += step
        off += 20
    return 0


if __name__ == "__main__":
    sys.exit(main())
