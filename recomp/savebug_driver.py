#!/usr/bin/env python3
"""
savebug_driver.py — drives the nds_runner debug server for the SAVEBUG
save/load reproduction sessions (see decomp/docs/SAVEBUG.md).

Usage (phases, one per invocation):
  py recomp/savebug_driver.py wait      [--sec 15]      # wait for server, ping
  py recomp/savebug_driver.py shot      [--tag NAME]    # framebuffer PPMs + save snapshot
  py recomp/savebug_driver.py save      [--tag NAME]    # dump chip image (hex->bin)
  py recomp/savebug_driver.py scanram                   # find JSSGXu / import bytes in ARM9 RAM
  py recomp/savebug_driver.py key       [--mask N --hold-ms 300]
  py recomp/savebug_driver.py touch     [--x 128 --y 100 --hold-ms 200]
  py recomp/savebug_driver.py flush
  py recomp/savebug_driver.py exit
Everything appends to recomp/savebug-driver-log.txt.
"""
from __future__ import annotations

import json
import socket
import sys
import time
import zlib
from pathlib import Path

HOST, PORT = "127.0.0.1", 19842
ROOT = Path(__file__).resolve().parent
LOG = ROOT / "savebug-driver-log.txt"


def log(msg: str) -> None:
    line = f"[{time.strftime('%H:%M:%S')}] {msg}"
    print(line)
    with LOG.open("a", encoding="utf-8") as f:
        f.write(line + "\n")


class Client:
    def __init__(self, host: str = HOST, port: int = PORT) -> None:
        self.host = host
        self.port = port
        self.sock = None
        self.buf = b""

    def connect(self, timeout: float = 30.0) -> None:
        deadline = time.time() + timeout
        last = None
        while time.time() < deadline:
            try:
                self.sock = socket.create_connection(
                    (self.host, self.port), timeout=5.0)
                # Long-running commands (run_to_pc/run_to_event with big
                # budgets) can take minutes; wait patiently once connected.
                self.sock.settimeout(600.0)
                self.buf = b""
                return
            except OSError as e:  # server not up yet
                last = e
                time.sleep(0.5)
        raise RuntimeError(f"debug server never came up on "
                           f"{self.host}:{self.port}: {last}")

    def req(self, obj: dict) -> dict:
        self.sock.sendall(json.dumps(obj, separators=(",", ":")).encode() + b"\n")
        while b"\n" not in self.buf:
            chunk = self.sock.recv(1 << 16)
            if not chunk:
                raise ConnectionError("server closed")
            self.buf += chunk
        nl = self.buf.index(b"\n")
        resp, self.buf = self.buf[:nl], self.buf[nl + 1:]
        return json.loads(resp.decode())


def ppm(path: Path, rgb_hex: str, w: int, h: int) -> None:
    raw = bytes.fromhex(rgb_hex)
    with path.open("wb") as f:
        f.write(f"P6\n{w} {h}\n255\n".encode())
        f.write(raw)
    log(f"screenshot {path.name} ({w}x{h}, mean="
        f"{sum(raw) / max(1, len(raw)):.1f})")


def png(path: Path, rgb_hex: str, w: int, h: int) -> None:
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
    log(f"screenshot {path.name} ({w}x{h}, mean="
        f"{sum(raw) / max(1, len(raw)):.1f})")


def arg(name: str, default: str = "") -> str:
    if name in sys.argv:
        i = sys.argv.index(name)
        return sys.argv[i + 1] if i + 1 < len(sys.argv) else default
    return default


def main() -> int:
    phase = sys.argv[1] if len(sys.argv) > 1 else "wait"
    c = Client()
    c.connect()
    log(f"connected; phase={phase} argv={sys.argv[1:]}")

    if phase == "wait":
        sec = float(arg("--sec", "15"))
        r = c.req({"cmd": "ping"})
        log(f"ping: {r}")
        time.sleep(sec)
        log(f"slept {sec}s")

    elif phase == "shot":
        tag = arg("--tag", time.strftime("%H%M%S"))
        for engine in ("A", "B"):
            r = c.req({"cmd": "framebuffer", "engine": engine})
            if "rgb" not in r:
                log(f"framebuffer {engine}: {r}")
                continue
            png(ROOT / f"savebug-shot-{tag}-{engine}.png",
                r["rgb"], r["w"], r["h"])
        info = c.req({"cmd": "cart_save_info"})
        log(f"cart_save_info: {info}")

    elif phase == "save":
        tag = arg("--tag", time.strftime("%H%M%S"))
        r = c.req({"cmd": "cart_save"})
        if "hex" not in r:
            log(f"cart_save: {r}")
            return 1
        data = bytes.fromhex(r["hex"])
        out = ROOT / f"savebug-chip-{tag}.sav"
        out.write_bytes(data)
        head = data[:0x40].hex(" ")
        nonff = sum(1 for b in data if b != 0xFF)
        jssg = [i for i in range(len(data) - 6) if data[i:i + 6] == b"JSSGXu"]
        log(f"chip dump {out.name}: size={len(data)} dirty={r['dirty']} "
            f"nonFF={nonff} JSSGXu@{[hex(x) for x in jssg]} head={head}")

    elif phase == "scanram":
        # Scan main RAM for the save mirror / JSSGXu magic.
        hits = []
        chunks = []
        base, size = 0x02000000, 0x400000
        for off in range(0, size, 0x10000):
            r = c.req({"cmd": "read_mem", "cpu": 9,
                       "addr": base + off, "len": 0x10000})
            if "hex" not in r:
                continue
            data = bytes.fromhex(r["hex"])
            chunks.append((base + off, data))
            idx = data.find(b"JSSGXu")
            while idx >= 0:
                hits.append(base + off + idx)
                idx = data.find(b"JSSGXu", idx + 1)
        log(f"JSSGXu in ARM9 RAM at: {[hex(h) for h in hits]}")
        # import save signature: HMAC bytes B4 32 66 71 FA C6 CF 97 at +0x10
        sig = bytes.fromhex("b4326671fac6cf97")
        for addr, data in chunks:
            i = data.find(sig)
            while i >= 0:
                log(f"import HMAC signature at RAM {hex(addr + i)}")
                i = data.find(sig, i + 1)
        # store newest chunk set for diffing sessions
        blob = b"".join(d for _, d in chunks)
        (ROOT / "savebug-ram-scan.bin").write_bytes(blob)
        log(f"RAM scan blob saved ({len(blob)} bytes)")

    elif phase == "key":
        mask = int(arg("--mask", "0x3FF"), 0)
        hold = float(arg("--hold-ms", "300")) / 1000.0
        released = int(arg("--release", "0x3FF"), 0)
        c.req({"cmd": "keys", "mask": mask})
        log(f"keys mask={hex(mask)} held {hold}s")
        time.sleep(hold)
        c.req({"cmd": "keys", "mask": released})
        log(f"keys released")

    elif phase == "touch":
        x = int(arg("--x", "128"), 0)
        y = int(arg("--y", "100"), 0)
        hold = float(arg("--hold-ms", "200")) / 1000.0
        c.req({"cmd": "touch", "x": x, "y": y, "down": True})
        log(f"touch ({x},{y}) held {hold}s")
        time.sleep(hold)
        c.req({"cmd": "touch", "x": x, "y": y, "down": False})
        log("touch released")

    elif phase == "runrounds":
        count = int(arg("--count", "1000"), 0)
        r = c.req({"cmd": "run_rounds", "count": count})
        log(f"run_rounds({count}): {r}")

    elif phase == "frames":
        # Advance N vblanks (game frames), then screenshot + save info.
        n = int(arg("--n", "60"), 0)
        tag = arg("--tag", "")
        state = ROOT / "savebug-frame-counter.txt"
        done = int(state.read_text()) if state.exists() else 0
        for i in range(n):
            r = c.req({"cmd": "run_to_event", "event": "vblank9",
                       "count": done + i + 1})
            if not r.get("reached"):
                log(f"run_to_event stopped early: {r}")
                break
        done += i + 1
        state.write_text(str(done))
        info = c.req({"cmd": "cart_save_info"})
        cyc = c.req({"cmd": "event_counts"})
        log(f"frames: now {done} vblanks; save={info} "
            f"irq9={cyc.get('irq9')} ipc={cyc.get('ipcsync_w')}")
        if tag:
            for engine in ("A", "B"):
                fr = c.req({"cmd": "framebuffer", "engine": engine})
                if "rgb" in fr:
                    png(ROOT / f"savebug-shot-{tag}-{engine}.png",
                        fr["rgb"], fr["w"], fr["h"])

    elif phase == "mem":
        addr = int(arg("--addr", "0"), 0)
        length = int(arg("--len", "0x100"), 0)
        out = arg("--out", "")
        r = c.req({"cmd": "read_mem", "cpu": 9, "addr": addr, "len": length})
        if "hex" not in r:
            log(f"read_mem: {r}")
            return 1
        data = bytes.fromhex(r["hex"])
        if out:
            path = ROOT / out
            path.write_bytes(data)
            log(f"dumped {len(data)} bytes from {hex(addr)} to {out}")
        for off in range(0, len(data), 16):
            chunk = data[off:off + 16]
            log(f"{addr + off:08X}  {chunk.hex(' ')}")

    elif phase == "cycles":
        r = c.req({"cmd": "event_counts"})
        log(f"event_counts: {r}")

    elif phase == "flush":
        r = c.req({"cmd": "cart_save_flush"})
        log(f"cart_save_flush: {r}")

    elif phase == "exit":
        r = c.req({"cmd": "frontend_exit"})
        log(f"frontend_exit: {r}")

    else:
        log(f"unknown phase {phase}")
        return 2
    return 0


if __name__ == "__main__":
    sys.exit(main())
