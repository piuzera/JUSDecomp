#!/usr/bin/env python3
"""
probe_long.py — long-horizon acceptance probe: run many frames in chunks,
reporting per-chunk AUXSPI growth, framebuffer means, and save state.
Ends with the standard RAM acceptance scan.

Usage: py recomp/probe_long.py --port 19879 --total 3600 --chunk 300 --tag fw
"""
from __future__ import annotations

import argparse
import json
import sys
import time
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from savebug_driver import Client  # noqa: E402

ROOT = Path(__file__).resolve().parent
RAM_BASE, RAM_LEN = 0x02000000, 0x400000
TEMPLATE_NAME = b"\x83\x66\x83\x62\x83\x4c"
imp = (ROOT / "jus-trace.sav").read_bytes()
WIN_4000 = imp[0x4000:0x4020]
LOG = ROOT / "savebug-long.log"


def auxspi_lines(path: Path) -> int:
    n = 0
    if path.exists():
        with path.open(errors="replace") as f:
            for _ in f:
                n += 1
    return n


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--port", type=int, required=True)
    ap.add_argument("--total", type=int, default=3600)
    ap.add_argument("--chunk", type=int, default=300)
    ap.add_argument("--tag", default="x")
    ap.add_argument("--runner-log", default="recomp/savebug-fwtest.log")
    ap.add_argument("--out", default="recomp/probe-long.json")
    args = ap.parse_args()

    def note(msg: str) -> None:
        line = f"[{time.strftime('%H:%M:%S')}] {msg}"
        print(line, flush=True)
        with LOG.open("a") as f:
            f.write(line + "\n")

    c = Client(port=args.port)
    c.connect(timeout=60)
    c.req({"cmd": "ping"})
    base_lines = auxspi_lines(ROOT.parent / args.runner_log)
    note(f"tag={args.tag} start: auxspi baseline {base_lines} lines")

    done = 0
    prev_lines = base_lines
    chunks = []
    while done < args.total:
        target = min(done + args.chunk, args.total)
        for i in range(done + 1, target + 1):
            r = c.req({"cmd": "run_to_event", "event": "vblank9", "count": i})
            if not r.get("reached"):
                note(f"stall at frame {i}: {r}")
                break
        done = target
        now_lines = auxspi_lines(ROOT.parent / args.runner_log)
        fa = c.req({"cmd": "framebuffer", "engine": "A"})
        mean = None
        if "rgb" in fa:
            raw = bytes.fromhex(fa["rgb"])
            mean = sum(raw) / len(raw)
        info = c.req({"cmd": "cart_save_info"})
        note(f"frame {done}: auxspi +{now_lines - prev_lines} "
             f"(total {now_lines}), fbA mean={mean:.1f}, save={info}")
        chunks.append({"frame": done, "auxspi_delta": now_lines - prev_lines,
                       "fbA_mean": mean, "dirty": info.get("dirty")})
        prev_lines = now_lines

    blob = bytearray()
    for off in range(0, RAM_LEN, 0x10000):
        r = c.req({"cmd": "read_mem", "cpu": 9, "addr": RAM_BASE + off,
                   "len": 0x10000})
        blob += (bytes.fromhex(r["hex"]) if "hex" in r
                 else b"\x00" * 0x10000)
    ram = bytes(blob)
    deck = ram[0x020B0000 - RAM_BASE:0x020C0000 - RAM_BASE]
    res = {
        "tag": args.tag, "port": args.port, "frames": done, "chunks": chunks,
        "win4000_in_ram": ram.find(WIN_4000) >= 0,
        "deck_default_init": deck.find(TEMPLATE_NAME) >= 0,
        "jssgxu_hits": [hex(RAM_BASE + i) for i in range(len(ram) - 6)
                        if ram[i:i + 6] == b"JSSGXu"][:12],
        "import_hmac_hits": [hex(RAM_BASE + i) for i in range(len(ram) - 8)
                             if ram[i:i + 8] == imp[0x10:0x18]][:12],
    }
    res["accepted"] = res["win4000_in_ram"] and not res["deck_default_init"]
    Path(args.out).write_text(json.dumps(res, indent=1) + "\n")
    note(f"final: {json.dumps(res)}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
