#!/usr/bin/env python3
"""
savebug_ladder.py — SAVEBUG symptom A chip-size ladder experiment.

For each candidate flash size, boots the JUS recomp runner headless with the
pristine import save padded with 0xFF to that size, advances ~240 vblanks,
then decides whether the game ACCEPTED the save:

  acceptance signals
    - import bank DATA window (offset 0x4000, SJIS names) present in ARM9 RAM
    - deck-table BSS at 0x020B0xxx NOT default-initialized (contains import
      bytes, e.g. the 0xB04 deck-table key equal to the header mac10)
  extra telemetry
    - AUXSPI read count beyond the geometry probe (validation reads)
    - reads touching bank1 (0x8000) — never happened on the 64 KiB chip
    - any write commands (fresh-init)

Usage: py recomp/savebug_ladder.py [size:size:...]  (hex, default ladder below)
"""
from __future__ import annotations

import json
import os
import re
import socket
import subprocess
import sys
import time
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from savebug_driver import Client  # noqa: E402

ROOT = Path(__file__).resolve().parent
WS = ROOT.parent
RUNNER = WS / "tools/ndsrecomp/runner/build-mingw/nds_runner.exe"
BIOS = WS / "tools/ndsrecomp/bios"
ROM = WS / "rom/jus.nds"
IMPORT = ROOT / "jus-trace.sav"

LADDER = [0x10000, 0x20000, 0x40000, 0x80000, 0x100000]  # 64K control + up
PORT = 19877
FRAMES = 240
RAM_BASE, RAM_LEN = 0x02000000, 0x400000

WIN_4000 = None      # filled at runtime: import[0x4000:0x4020]
TEMPLATE_NAME = b"\x83\x66\x83\x62\x83\x4c"


def log(msg: str) -> None:
    print(f"[ladder {time.strftime('%H:%M:%S')}] {msg}", flush=True)


def prep(size: int) -> tuple[Path, Path]:
    data = IMPORT.read_bytes()
    padded = data + b"\xFF" * (size - len(data))
    sav = ROOT / f"ladder-{size:x}.sav"
    sav.write_bytes(padded)
    toml = ROOT / f"ladder-{size:x}.toml"
    cfg = (ROOT / "game.toml").read_text()
    cfg = re.sub(r"save_size = \d+", f"save_size = {size}", cfg)
    toml.write_text(cfg)
    return sav, toml


def ram_scan(c: Client) -> dict:
    blob = bytearray()
    ok = True
    for off in range(0, RAM_LEN, 0x10000):
        r = c.req({"cmd": "read_mem", "cpu": 9, "addr": RAM_BASE + off,
                   "len": 0x10000})
        if "hex" not in r:
            ok = False
            blob += b"\x00" * 0x10000
            continue
        blob += bytes.fromhex(r["hex"])
    return {"blob": bytes(blob), "ok": ok}


def analyze(size: int, log_path: Path, ram: bytes) -> dict:
    res = {"size": size}
    text = log_path.read_text(errors="replace") if log_path.exists() else ""
    aux = [l for l in text.splitlines() if l.startswith("[auxspi]")]
    res["auxspi_lines"] = len(aux)
    res["write_lines"] = sum(
        1 for l in aux if re.search(r"cmd=0x0[2A] |cmd=0x[Dd][8Bb] ", l))
    # reads at bank1 window (0x8000..0x80FF) as addresses
    res["bank1_reads"] = sum(
        1 for l in aux if "cmd=0x03 " in l and re.search(r"addr=0x0*80[0-9A-Fa-f]{2}\b", l))
    # any read beyond 64K range (validation reads of padded area are expected
    # to be zero — the probe does them; count reads at 4K-sector granularity)
    res["data_window_in_ram"] = ram.find(WIN_4000) >= 0
    # deck tables default-initialized?
    deck_region = ram[0x020B0000 - RAM_BASE:0x020C0000 - RAM_BASE]
    res["deck_default"] = deck_region.find(TEMPLATE_NAME) >= 0
    m = re.search(r"\[save\] (loaded|ignoring|new) ?([^\n]*)", text)
    res["save_msg"] = m.group(0) if m else "-"
    return res


def run_one(size: int) -> dict:
    sav, toml = prep(size)
    log_path = ROOT / f"ladder-{size:x}.log"
    counter = ROOT / "savebug-frame-counter.txt"
    counter.unlink(missing_ok=True)
    env = dict(os.environ)
    env["NDS_TRACE_AUXSPI"] = "1"
    env["PATH"] = r"C:\msys64\ucrt64\bin;" + env.get("PATH", "")
    out = open(log_path, "w")
    proc = subprocess.Popen(
        [str(RUNNER), str(BIOS), "--serve", "--port", str(PORT),
         "--rom", str(ROM), "--config", str(toml),
         "--startup-mode", "automatic", "--freebios", "--generated-firmware",
         "--boot", "direct", "--save-path", str(sav)],
        cwd=str(WS), env=env, stdout=out, stderr=subprocess.STDOUT)
    try:
        c = Client()
        c.port = PORT
        c.connect(timeout=60)
        c.req({"cmd": "ping"})
        done = 0
        for i in range(FRAMES):
            r = c.req({"cmd": "run_to_event", "event": "vblank9",
                       "count": done + i + 1})
            if not r.get("reached"):
                res = {"size": size, "error": f"stall at frame {i}: {r}"}
                break
        else:
            ram = ram_scan(c)
            res = analyze(size, log_path, ram["blob"])
            res["dirty"] = c.req({"cmd": "cart_save_info"}).get("dirty")
        try:
            c.req({"cmd": "frontend_exit"})
        except Exception:
            pass
    finally:
        try:
            proc.wait(timeout=15)
        except subprocess.TimeoutExpired:
            proc.kill()
        out.close()
    res["accepted"] = (res.get("data_window_in_ram") and
                       not res.get("deck_default", True))
    return res


def main() -> int:
    global WIN_4000
    imp = IMPORT.read_bytes()
    WIN_4000 = imp[0x4000:0x4020]
    sizes = ([int(s, 0) for s in sys.argv[1].split(":")]
             if len(sys.argv) > 1 else LADDER)
    results = []
    for s in sizes:
        log(f"=== size {s:#x} ({s // 1024} KiB)")
        try:
            r = run_one(s)
        except Exception as e:
            r = {"size": s, "error": repr(e)}
        log(json.dumps(r, default=str))
        results.append(r)
    summary = "\n".join(json.dumps(r, default=str) for r in results)
    (ROOT / "ladder-summary.json").write_text(summary + "\n")
    log("summary written to recomp/ladder-summary.json")
    return 0


if __name__ == "__main__":
    sys.exit(main())
