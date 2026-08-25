#!/usr/bin/env python3
"""analyze_perf.py — print a compact timeline from online_perf_probe.py CSVs
and flag the phase transitions (boot -> menu -> online battle) by FPS drop.

Usage: python recomp/analyze_perf.py recomp/perf-online-a.csv [perf-online-b.csv ...]
"""

from __future__ import annotations

import csv
import sys


def load(path: str) -> list[dict]:
    with open(path, newline="") as fh:
        return list(csv.DictReader(fh))


def main() -> int:
    for path in sys.argv[1:]:
        rows = load(path)
        print(f"===== {path}  rows={len(rows)}")
        print("   t    fps   emu   arm9  arm7  wifi | t3ins9/s     t3ins7/s    "
              "dsp9/s    hit9% | flag")
        prev_fps = None
        for row in rows:
            t = float(row["t_wall"])
            fps = float(row["fps"])
            emu = float(row["emu_ms_per_frame"])
            a9 = float(row["arm9_ns"])
            a7 = float(row["arm7_ns"])
            w = float(row["wifi_ns"])
            i9 = float(row["tier3_insns9_per_s"]) / 1e6
            i7 = float(row["tier3_insns7_per_s"]) / 1e6
            d9 = float(row["dispatch_9_per_s"]) / 1e6
            h9 = float(row["cache_hit_9_pct"])
            # Skip the long pre-boot window (probe started before servers up).
            if t < 150:
                continue
            flag = ""
            if fps < 45:
                flag = "<-- LOW FPS"
            elif fps < 52:
                flag = "<-- mid/low"
            print(
                f"{t:6.1f} {fps:5.1f} {emu:5.1f} {a9:5.2f} {a7:5.2f} {w:4.2f} | "
                f"{i9:9.1f} {i7:9.1f} {d9:8.1f} {h9:5.1f} | {flag}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
