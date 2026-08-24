#!/usr/bin/env python3
"""
probe_display.py — ground-truth audit of JUS display-register state for the
16:9 top-screen project.

Connects to a running nds_runner debug server and repeatedly samples the
display-relevant IO registers of both 2D engines:

  - POWCNT1: which engine drives which physical screen
  - DISPCNT A/B: display mode, BG/OBJ enables, windows, forced blank, BG0-3D
  - BGCNT + BGxX/BGxY: BG type/size, scroll values
  - MOSAIC / BLDCNT / BLDALPHA / WININ / WINOUT / MASTER_BRIGHT
  - DISPCAPCNT: display-capture use
  - GXSTAT + gx_polygons: 3D-engine activity (expect: none)

Each sample is decoded to text and grouped into "scene signatures" (the
registers that identify a distinct scene, scroll values excluded). For each
new signature the script optionally saves PNG snapshots of both physical
screens.

Usage:
  py recomp/probe_display.py --port 19889 --samples 40 --shots --out recomp/probe-display.json
"""

from __future__ import annotations

import argparse
import json
import socket
import struct
import sys
import time
import zlib
from pathlib import Path

ROOT = Path(__file__).resolve().parent


class Client:
    def __init__(self, host="127.0.0.1", port=19842, timeout=10.0):
        self.sock = socket.create_connection((host, port), timeout=timeout)
        self._buf = b""

    def close(self):
        try:
            self.sock.close()
        except OSError:
            pass

    def req(self, obj: dict):
        self.sock.sendall((json.dumps(obj, separators=(",", ":")) + "\n").encode())
        while b"\n" not in self._buf:
            chunk = self.sock.recv(1 << 20)
            if not chunk:
                raise ConnectionError("debug server closed the connection")
            self._buf += chunk
        nl = self._buf.index(b"\n")
        resp = self._buf[:nl]
        self._buf = self._buf[nl + 1:]
        return json.loads(resp.decode("utf-8"))

    def read_io(self, addr: int, width: int, cpu: int = 9) -> int:
        r = self.req({"cmd": "read_io", "cpu": cpu, "addr": addr,
                      "width": width})
        if "value" not in r:
            raise RuntimeError(f"read_io {addr:#x} failed: {r}")
        return int(r["value"])


# ── IO register map ──────────────────────────────────────────────────────

# address (engine A), name, width
REGISTERS = [
    (0x04000304, "POWCNT1", 16),
    (0x04000000, "DISPCNT_A", 32),
    (0x04000008, "BG0CNT_A", 16),
    (0x0400000A, "BG1CNT_A", 16),
    (0x0400000C, "BG2CNT_A", 16),
    (0x0400000E, "BG3CNT_A", 16),
    (0x04000010, "BG0X_A", 16), (0x04000012, "BG0Y_A", 16),
    (0x04000014, "BG1X_A", 16), (0x04000016, "BG1Y_A", 16),
    (0x04000018, "BG2X_A", 16), (0x0400001A, "BG2Y_A", 16),
    (0x0400001C, "BG3X_A", 16), (0x0400001E, "BG3Y_A", 16),
    (0x04000020, "BG2PA_A", 16), (0x04000022, "BG2PB_A", 16),
    (0x04000024, "BG2PC_A", 16), (0x04000026, "BG2PD_A", 16),
    (0x04000030, "BG3PA_A", 16), (0x04000032, "BG3PB_A", 16),
    (0x04000034, "BG3PC_A", 16), (0x04000036, "BG3PD_A", 16),
    (0x04000040, "WIN0H_A", 16), (0x04000042, "WIN1H_A", 16),
    (0x04000044, "WIN0V_A", 16), (0x04000046, "WIN1V_A", 16),
    (0x04000048, "WININ_A", 16), (0x0400004A, "WINOUT_A", 16),
    (0x0400004C, "MOSAIC_A", 16),
    (0x04000050, "BLDCNT_A", 16), (0x04000052, "BLDALPHA_A", 16),
    (0x04000054, "BLDY_A", 16),
    (0x04000064, "DISPCAPCNT", 32),
    (0x0400006C, "MSTBRIGHT_A", 16),
    (0x04000600, "GXSTAT", 32),
    (0x04001000, "DISPCNT_B", 32),
    (0x04001008, "BG0CNT_B", 16), (0x0400100A, "BG1CNT_B", 16),
    (0x0400100C, "BG2CNT_B", 16), (0x0400100E, "BG3CNT_B", 16),
    (0x04001010, "BG0X_B", 16), (0x04001012, "BG0Y_B", 16),
    (0x04001014, "BG1X_B", 16), (0x04001016, "BG1Y_B", 16),
    (0x04001018, "BG2X_B", 16), (0x0400101A, "BG2Y_B", 16),
    (0x0400101C, "BG3X_B", 16), (0x0400101E, "BG3Y_B", 16),
    (0x04001040, "WIN0H_B", 16), (0x04001042, "WIN1H_B", 16),
    (0x04001044, "WIN0V_B", 16), (0x04001046, "WIN1V_B", 16),
    (0x04001048, "WININ_B", 16), (0x0400104A, "WINOUT_B", 16),
    (0x0400104C, "MOSAIC_B", 16),
    (0x04001050, "BLDCNT_B", 16), (0x04001052, "BLDALPHA_B", 16),
    (0x0400106C, "MSTBRIGHT_B", 16),
]

SCROLL_REGS = {n for _, n, _ in REGISTERS if "X_" in n or "Y_" in n}
SCROLL_REGS |= {n for _, n, _ in REGISTERS if "PA_" in n or "PB_" in n
                or "PC_" in n or "PD_" in n}


def decode_dispcnt(v: int, engine: str) -> dict:
    return {
        "mode2": (v >> 0) & 7,          # engine A: 0..6; engine B: 0..1
        "bg0_3d": (v >> 3) & 1,
        "forced_blank": (v >> 7) & 1,
        "bg_enable": [(v >> (8 + i)) & 1 for i in range(4)],
        "obj_enable": (v >> 12) & 1,
        "win_enable": [(v >> (13 + i)) & 1 for i in range(3)],
        "mode3": (v >> 16) & 3,
    }


def bg_type(mode2: int, engine: str, bg: int, bgcnt: int) -> str:
    size = (bgcnt >> 14) & 3
    if engine == "B":
        # Engine B: 2D-only; BG0/1 text; BG2/3 rot-scale in mode 1 only.
        if bg >= 2 and mode2 == 1:
            return f"affine_s{size}"
        return f"text_s{size}"
    if mode2 <= 2:
        if bg >= 2:
            return f"affine_s{size}"
        return f"text_s{size}"
    if mode2 == 6:
        return "3d" if bg == 0 else "-"
    kinds = ["text", "ext_affine", "large", "bitmap", "bitmap2"]
    return kinds[size] if size < 5 else f"kind{size}"


def decode_bgcnt(mode2: int, engine: str, v: int) -> dict:
    return {
        "prio": v & 3,
        "mosaic": (v >> 6) & 1,
        "pal256": (v >> 7) & 1,
        "size": (v >> 14) & 3,
    }


def sample_display(c: Client) -> dict:
    vals: dict[str, int] = {}
    for addr, name, width in REGISTERS:
        vals[name] = c.read_io(addr, width)
    try:
        r = c.req({"cmd": "gx_polygons"})
        vals["gx_polygons"] = int(r.get("count", -1))
    except Exception:
        vals["gx_polygons"] = -1
    return vals


def scene_signature(vals: dict) -> str:
    parts = []
    for _, name, _ in REGISTERS:
        if name in SCROLL_REGS:
            continue
        parts.append(f"{name}={vals[name]:#x}")
    return "|".join(parts)


def describe(vals: dict) -> list[str]:
    lines = []
    powcnt = vals["POWCNT1"]
    lcd = (powcnt >> 0) & 1
    engine_a_on_top = (powcnt >> 15) & 1
    lines.append(
        f"POWCNT1={powcnt:#06x} lcd={lcd} "
        f"engine_a_on_top={engine_a_on_top}")
    for eng, tag in (("_A", "A"), ("_B", "B")):
        dc = decode_dispcnt(vals[f"DISPCNT{eng}"], tag)
        if not dc["bg_enable"] and not dc["obj_enable"] and not lcd:
            lines.append(f"  eng{tag}: off")
            continue
        lines.append(
            f"  eng{tag}: mode2={dc['mode2']} mode3={dc['mode3']} "
            f"bg0_3d={dc['bg0_3d']} blank={dc['forced_blank']} "
            f"bg={dc['bg_enable']} obj={dc['obj_enable']} "
            f"win={dc['win_enable']}")
        for i in range(4):
            if dc["bg_enable"][i]:
                bgc = vals[f"BG{i}CNT{eng}"]
                b = decode_bgcnt(dc["mode2"], tag, bgc)
                typ = bg_type(dc["mode2"], tag, i, bgc)
                x = vals[f"BG{i}X{eng}"]
                y = vals[f"BG{i}Y{eng}"]
                lines.append(
                    f"    BG{i} {typ}: prio={b['prio']} "
                    f"mosaic={b['mosaic']} pal256={b['pal256']} "
                    f"x={x} y={y}")
        mos = vals[f"MOSAIC{eng}"]
        bld = vals[f"BLDCNT{eng}"]
        winin = vals[f"WININ{eng}"]
        lines.append(
            f"    mosaic={mos:#06x} bldcnt={bld:#06x} "
            f"winin={winin:#06x} winout={vals[f'WINOUT{eng}']:#06x} "
            f"mstbright={vals[f'MSTBRIGHT{eng}']:#06x}")
    cap = vals["DISPCAPCNT"]
    gx = vals["GXSTAT"]
    lines.append(
        f"DISPCAPCNT={cap:#010x} GXSTAT={gx:#010x} "
        f"gx_polygons={vals['gx_polygons']}")
    return lines


def save_png(path: Path, w: int, h: int, rgb: bytes) -> None:
    def chunk(tag: bytes, data: bytes) -> bytes:
        c = tag + data
        return struct.pack(">I", len(data)) + c + \
            struct.pack(">I", zlib.crc32(c) & 0xFFFFFFFF)

    stride = w * 3
    raw = b"".join(
        b"\x00" + rgb[y * stride:(y + 1) * stride] for y in range(h))
    png = (b"\x89PNG\r\n\x1a\n"
           + chunk(b"IHDR", struct.pack(">IIBBBBB", w, h, 8, 2, 0, 0, 0))
           + chunk(b"IDAT", zlib.compress(raw, 6))
           + chunk(b"IEND", b""))
    path.write_bytes(png)


def grab_screen(c: Client, engine: str) -> tuple[int, bytes]:
    r = c.req({"cmd": "framebuffer", "engine": engine})
    if "rgb" not in r:
        raise RuntimeError(f"framebuffer {engine} failed: {r}")
    return int(r["w"]), bytes.fromhex(r["rgb"])


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--port", type=int, default=19889)
    ap.add_argument("--samples", type=int, default=40)
    ap.add_argument("--interval", type=float, default=0.25)
    ap.add_argument("--step", type=int, default=0,
                    help="advance N vblanks between samples via run_to_event "
                         "(headless instances only)")
    ap.add_argument("--shots", action="store_true",
                    help="save PNG snapshots for each new scene signature")
    ap.add_argument("--out", default="recomp/probe-display.json")
    args = ap.parse_args()

    out_dir = Path(args.out).with_suffix(".shots")
    c = Client(port=args.port)
    profiles: dict[str, dict] = {}
    samples: list[dict] = []
    try:
        c.req({"cmd": "ping"})
        for i in range(args.samples):
            if i and args.step:
                r = c.req({"cmd": "run_to_event", "event": "vblank9",
                           "count": i * args.step})
                if not r.get("reached"):
                    print(f"[warn] run_to_event failed at sample {i}: {r}",
                          file=sys.stderr)
            vals = sample_display(c)
            sig = scene_signature(vals)
            entry = {"sample": i, "signature": sig, "regs": vals,
                     "description": describe(vals)}
            samples.append(entry)
            if sig not in profiles:
                profiles[sig] = {"first_sample": i, "count": 1,
                                 "signature": sig, "regs": vals,
                                 "description": describe(vals)}
                if args.shots:
                    shots = {}
                    for eng in ("A", "B"):
                        w, rgb = grab_screen(c, eng)
                        p = out_dir / f"sig{len(profiles):03d}_{eng}.png"
                        out_dir.mkdir(parents=True, exist_ok=True)
                        save_png(p, w, 192, rgb)
                        shots[eng] = str(p)
                    profiles[sig]["shots"] = shots
            else:
                profiles[sig]["count"] += 1
            if args.interval > 0:
                time.sleep(args.interval)
    finally:
        c.close()

    result = {
        "port": args.port,
        "samples": len(samples),
        "raw_samples": samples,
        "profiles": list(profiles.values()),
    }
    Path(args.out).write_text(json.dumps(result, indent=1) + "\n")

    print(f"== {len(samples)} samples, {len(profiles)} distinct scenes ==")
    for n, (sig, p) in enumerate(profiles.items()):
        print(f"-- scene {n} (samples={p['count']}, "
              f"first={p['first_sample']})")
        for line in p["description"]:
            print("   " + line)
        if "shots" in p:
            print("   shots: " + ", ".join(p["shots"][e] for e in ("A", "B")))
    print(f"JSON -> {args.out}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
