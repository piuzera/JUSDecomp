#!/usr/bin/env python3
"""online_perf_probe.py — sample the nds_runner debug server's perf counters
during an online (or offline) JUS session, to isolate the 60 → ~35 FPS drop
reported for WiFi Battle online play.

How it works
------------
The runner exposes cumulative counters on 127.0.0.1:<port> (newline-delimited
JSON, one request -> one response). This probe snapshots them every
`--interval` seconds and prints/diffs the window. Because the counters are
cumulative, everything reported is a rate/delta over the sampling window:

  fps, emu_ms/frame        : from `frontend_stats` (wall-clock emulation time)
  arm9/arm7/wifi/devices
    ms per 1000 rounds     : from `profile`->sched (scheduler phase split;
                             same scale as the exit-time nds_profile_report)
  t3_insns9/s, t3_insns7/s : Tier-3 INTERPRETER retired instructions per
                             second (`static_coverage`) — the smoking gun for
                             "network stack running interpreted"
  dispatch rate + hit%     : from `dispatch_stats` (native dispatch volume)
  present/upload/swap      : frontend phase split and rolling work percentiles
  overlay queues/compiler  : compact live-overlay status (no huge bank list)
  network queues/drops     : host bridge health from `net_state`

Required launcher conditions
----------------------------
- Run the runner with NDS_PROFILE_SCHED=1 set in the environment so the
  `profile`->sched accumulators actually fill (they are zero otherwise).
- The debug server must be up: interactive runs bind --port (19842 for
  instance A, 19843 for B in run_jus_2p.cmd).

Usage
-----
  # while the online session is running (both windows up, in the WiFi Battle):
  python recomp/online_perf_probe.py --port 19842 --interval 5 --out online_a.csv
  python recomp/online_perf_probe.py --port 19843 --interval 5 --out online_b.csv

  # offline baseline (one instance, --network off), in a normal battle:
  python recomp/online_perf_probe.py --port 19842 --interval 5 --out offline.csv

Compare the online vs offline columns: whichever of arm9 / arm7 / wifi /
t3_insns* jumps by ~2x is where the dropped frames are being spent.
"""

from __future__ import annotations

import argparse
import csv
import json
import socket
import sys
import time
from typing import Any, Dict, Optional


def request(sock: socket.socket, obj: Dict[str, Any]) -> Dict[str, Any]:
    """Send one JSON request line, read one JSON response line."""
    sock.sendall((json.dumps(obj, separators=(",", ":")) + "\n").encode("utf-8"))
    buf = b""
    while b"\n" not in buf:
        chunk = sock.recv(65536)
        if not chunk:
            raise ConnectionError("debug server closed the connection")
        buf += chunk
    line, _, rest = buf.partition(b"\n")
    if rest:
        raise ConnectionError("unexpected trailing data from debug server")
    return json.loads(line.decode("utf-8"))


def snapshot(host: str, port: int, timeout: float) -> Dict[str, Any]:
    """Collect one full snapshot of the counters we care about."""
    with socket.create_connection((host, port), timeout=timeout) as sock:
        fs = request(sock, {"cmd": "frontend_stats"})
        prof = request(sock, {"cmd": "profile"})
        sc = request(sock, {"cmd": "static_coverage"})
        ds = request(sock, {"cmd": "dispatch_stats"})
        live = request(sock, {"cmd": "live_overlay_status", "compact": True})
        net = request(sock, {"cmd": "net_state"})
    return {
        "fs": fs,
        "sched": prof.get("sched", {}),
        "sc": sc,
        "ds": ds,
        "live": live,
        "net": net,
        "sample_time": time.monotonic(),
    }


def window_diff(prev: Dict[str, Any], cur: Dict[str, Any], wall: float) -> Dict[str, Any]:
    """Turn two snapshots into windowed rates. All fields float."""
    out: Dict[str, Any] = {}

    # ── frontend / fps ────────────────────────────────────────────────────
    pfs, cfs = prev["fs"], cur["fs"]
    d_frames = cfs.get("frames", 0) - pfs.get("frames", 0)
    d_now = cfs.get("now_ticks", 0) - pfs.get("now_ticks", 0)
    freq = cfs.get("freq", 1) or 1
    d_emu = cfs.get("emu_ticks", 0) - pfs.get("emu_ticks", 0)
    out["fps"] = (d_frames / (d_now / freq)) if d_now > 0 else 0.0
    out["emu_ms_per_frame"] = (
        (d_emu / freq) * 1000.0 / d_frames) if d_frames > 0 else 0.0
    out["frames_in_window"] = float(d_frames)
    for key in ("present_ticks", "adaptive_ticks", "upload_ticks",
                "draw_ticks", "swap_ticks", "drain_ticks"):
        delta = cfs.get(key, 0) - pfs.get(key, 0)
        out[key.replace("_ticks", "_ms_per_frame")] = (
            (delta / freq) * 1000.0 / d_frames) if d_frames > 0 else 0.0
    for key in ("work_p50_ticks", "work_p95_ticks", "work_p99_ticks",
                "work_max_ticks", "max_emu_ticks"):
        out[key.replace("_ticks", "_ms")] = (
            cfs.get(key, 0) * 1000.0 / freq)
    d_deadlines = (cfs.get("deadline_misses", 0) -
                   pfs.get("deadline_misses", 0))
    out["deadline_misses"] = float(d_deadlines)
    out["deadline_miss_pct"] = (
        100.0 * d_deadlines / d_frames) if d_frames > 0 else 0.0
    out["underruns"] = float(cfs.get("underruns", 0) -
                              pfs.get("underruns", 0))
    out["renderer_compute"] = float(cfs.get("renderer_compute", 0))
    out["renderer_demoted"] = float(cfs.get("renderer_demoted", 0))

    # ── scheduler phase split (ms per 1000 rounds, report scale) ─────────
    ps, cs = prev["sched"], cur["sched"]
    d_rounds = cs.get("sampled_rounds", 0) - ps.get("sampled_rounds", 0)
    if d_rounds > 0:
        for key in ("arm9_ns", "arm7_ns", "devices_ns", "display_ns",
                    "spu_ns", "wifi_ns", "rtc_ns", "sysev_ns", "switch_ns",
                    "next_event_ns", "sampled_round_ns"):
            d_ns = cs.get(key, 0) - ps.get(key, 0)
            out[key] = (d_ns / d_rounds) / 1000.0  # ns/round -> ms/1000 rounds
        out["sched_rounds_window"] = float(d_rounds)
    else:
        for key in ("arm9_ns", "arm7_ns", "devices_ns", "display_ns",
                    "spu_ns", "wifi_ns", "rtc_ns", "sysev_ns", "switch_ns",
                    "next_event_ns", "sampled_round_ns"):
            out[key] = 0.0
        out["sched_rounds_window"] = 0.0

    # ── Tier-3 interpreter instruction rates (the key discriminator) ─────
    psc, csc = prev["sc"], cur["sc"]
    for key in ("tier3_insns9", "tier3_insns7",
                "tier3_entries9", "tier3_entries7"):
        d = csc.get(key, 0) - psc.get(key, 0)
        out[key + "_per_s"] = d / wall if wall > 0 else 0.0
        out[key] = float(d)

    # ── dispatch volume / cache health ───────────────────────────────────
    pds, cds = prev["ds"], cur["ds"]
    for cpu, suffix in (("arm9", "9"), ("arm7", "7")):
        pd = pds.get(cpu, {}) if isinstance(pds, dict) else {}
        cd = cds.get(cpu, {}) if isinstance(cds, dict) else {}
        if not isinstance(cd, dict) or not cd:
            # Some builds emit a different shape; fall back to a flat key.
            pd = {k: v for k, v in pds.items() if isinstance(v, (int, float))}
            cd = {k: v for k, v in cds.items() if isinstance(v, (int, float))}
        d_total = cd.get("dispatch_total", 0) - pd.get("dispatch_total", 0)
        out[f"dispatch_{suffix}_per_s"] = d_total / wall if wall > 0 else 0.0
        hit = cd.get("cache_hit", 0) - pd.get("cache_hit", 0)
        absent = cd.get("cache_hit_absent", 0) - pd.get("cache_hit_absent", 0)
        slow = cd.get("cache_slow_lookup", 0) - pd.get("cache_slow_lookup", 0)
        denom = hit + absent + slow
        out[f"cache_hit_{suffix}_pct"] = (100.0 * hit / denom) if denom else 0.0

    # ── live-overlay and host-network health ─────────────────────────────
    plive, clive = prev.get("live", {}), cur.get("live", {})
    out["overlay_preparing"] = float(clive.get("preparing_banks", 0))
    out["overlay_ready"] = float(clive.get("ready_banks", 0))
    out["overlay_busy"] = float(bool(clive.get("busy", False)))
    out["overlay_banks_loaded"] = float(
        clive.get("banks_loaded", 0) - plive.get("banks_loaded", 0))
    out["overlay_runs_started"] = float(
        clive.get("runs_started", 0) - plive.get("runs_started", 0))

    pnet, cnet = prev.get("net", {}), cur.get("net", {})
    out["net_tx_queue"] = float(cnet.get("tx_queue_depth", 0))
    out["net_rx_queue"] = float(cnet.get("rx_queue_depth", 0))
    out["net_tx_drops"] = float(
        cnet.get("tx_queue_drops", 0) - pnet.get("tx_queue_drops", 0))
    out["net_rx_drops"] = float(
        cnet.get("rx_queue_drops", 0) - pnet.get("rx_queue_drops", 0))
    return out


FIELDS = [
    "fps", "emu_ms_per_frame", "present_ms_per_frame",
    "adaptive_ms_per_frame", "upload_ms_per_frame", "draw_ms_per_frame",
    "swap_ms_per_frame", "drain_ms_per_frame", "frames_in_window",
    "work_p50_ms", "work_p95_ms", "work_p99_ms", "work_max_ms",
    "max_emu_ms", "deadline_misses", "deadline_miss_pct", "underruns",
    "renderer_compute", "renderer_demoted",
    "sched_rounds_window",
    "arm9_ns", "arm7_ns", "devices_ns", "display_ns", "spu_ns", "wifi_ns",
    "rtc_ns", "sysev_ns", "switch_ns", "next_event_ns", "sampled_round_ns",
    "tier3_insns9", "tier3_insns7", "tier3_entries9", "tier3_entries7",
    "tier3_insns9_per_s", "tier3_insns7_per_s",
    "dispatch_9_per_s", "dispatch_7_per_s", "cache_hit_9_pct",
    "cache_hit_7_pct",
    "overlay_preparing", "overlay_ready", "overlay_busy",
    "overlay_banks_loaded", "overlay_runs_started",
    "net_tx_queue", "net_rx_queue", "net_tx_drops", "net_rx_drops",
]


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--host", default="127.0.0.1")
    ap.add_argument("--port", type=int, default=19842)
    ap.add_argument("--interval", type=float, default=5.0)
    ap.add_argument("--out", default="", help="CSV output path (default: stdout)")
    ap.add_argument("--duration", type=float, default=0.0,
                    help="seconds to sample; 0 = until Ctrl-C")
    args = ap.parse_args()

    out = sys.stdout
    csvfile = None
    if args.out:
        csvfile = open(args.out, "w", newline="")
        out = csvfile
    writer = csv.writer(out)
    writer.writerow(["t_wall"] + FIELDS)

    prev: Optional[Dict[str, Any]] = None
    t0 = time.monotonic()
    deadline = t0 + args.duration if args.duration > 0 else None
    print(f"[probe] sampling {args.host}:{args.port} every {args.interval}s"
          f"{' for %.1fs' % args.duration if deadline else ' until Ctrl-C'}",
          file=sys.stderr)

    while True:
        if deadline and time.monotonic() >= deadline:
            break
        t_start = time.monotonic()
        try:
            cur = snapshot(args.host, args.port, timeout=max(1.0, args.interval))
        except (ConnectionError, OSError, ValueError) as e:
            print(f"[probe] connection error: {e} (retrying)", file=sys.stderr)
            time.sleep(args.interval)
            continue
        if prev is not None:
            # The old probe divided instruction/dispatch deltas by the time
            # spent issuing the current debug queries (usually milliseconds),
            # not by the interval between snapshots. That inflated every
            # per-second rate. Use the two completed-snapshot timestamps.
            wall = cur["sample_time"] - prev["sample_time"]
            row = window_diff(prev, cur, wall)
            writer.writerow([f"{time.monotonic() - t0:.1f}"] +
                            [f"{row[f]:.3f}" for f in FIELDS])
            out.flush()
        prev = cur
        # Sleep the remainder of the interval (don't drift on slow runs).
        elapsed = time.monotonic() - t_start
        if elapsed < args.interval:
            time.sleep(args.interval - elapsed)

    if csvfile:
        csvfile.close()
    print("[probe] done", file=sys.stderr)
    return 0


if __name__ == "__main__":
    sys.exit(main())
