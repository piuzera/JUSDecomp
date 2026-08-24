#!/usr/bin/env python3
"""
jus_debug_client.py — minimal client for the nds_runner debug server.

The runner exposes a newline-delimited JSON protocol on 127.0.0.1:19842
(see tools/ndsrecomp/runner/src/debug_server.cpp). One request line -> one
response line (trailing '\\n'). This module wraps the handful of commands the
deck-injection tooling needs: ping, read_mem, write_mem, watch, regs.

Used by deck_probe.py and deck_tools.py. Read-only by default; write_mem is
only sent when explicitly requested.
"""

from __future__ import annotations

import json
import socket
from typing import Any, Optional


DEFAULT_HOST = "127.0.0.1"
DEFAULT_PORT = 19842


class DebugClient:
    def __init__(self, host: str = DEFAULT_HOST, port: int = DEFAULT_PORT,
                 timeout: float = 5.0):
        self.host = host
        self.port = port
        self.timeout = timeout
        self._sock: Optional[socket.socket] = None
        self._buf = b""

    def connect(self) -> None:
        self._sock = socket.create_connection((self.host, self.port),
                                              timeout=self.timeout)
        self._buf = b""

    def close(self) -> None:
        if self._sock is not None:
            try:
                self._sock.close()
            except OSError:
                pass
            self._sock = None

    def __enter__(self) -> "DebugClient":
        self.connect()
        return self

    def __exit__(self, *exc) -> None:
        self.close()

    def _request(self, obj: dict[str, Any]) -> dict[str, Any]:
        if self._sock is None:
            raise RuntimeError("not connected")
        line = json.dumps(obj, separators=(",", ":")) + "\n"
        self._sock.sendall(line.encode("utf-8"))
        # Read until a full newline-terminated response arrives.
        while b"\n" not in self._buf:
            chunk = self._sock.recv(65536)
            if not chunk:
                raise ConnectionError("debug server closed the connection")
            self._buf += chunk
        nl = self._buf.index(b"\n")
        resp = self._buf[:nl]
        self._buf = self._buf[nl + 1:]
        return json.loads(resp.decode("utf-8"))

    def ping(self) -> dict[str, Any]:
        return self._request({"cmd": "ping"})

    def read_mem(self, addr: int, length: int, cpu: int = 9) -> bytes:
        resp = self._request({"cmd": "read_mem", "cpu": cpu,
                              "addr": addr, "len": length})
        if "hex" not in resp:
            raise RuntimeError(f"read_mem failed: {resp}")
        return bytes.fromhex(resp["hex"])

    def write_mem(self, addr: int, data: bytes, cpu: int = 9) -> int:
        resp = self._request({"cmd": "write_mem", "cpu": cpu,
                              "addr": addr, "hex": data.hex()})
        if "written" not in resp:
            raise RuntimeError(f"write_mem failed: {resp}")
        return int(resp["written"])

    def read_u8(self, addr: int, cpu: int = 9) -> int:
        return self.read_mem(addr, 1, cpu)[0]

    def read_u16(self, addr: int, cpu: int = 9) -> int:
        return int.from_bytes(self.read_mem(addr, 2, cpu), "little")

    def read_u32(self, addr: int, cpu: int = 9) -> int:
        return int.from_bytes(self.read_mem(addr, 4, cpu), "little")

    def write_u8(self, addr: int, value: int, cpu: int = 9) -> int:
        return self.write_mem(addr, bytes([value & 0xFF]), cpu)

    def write_u16(self, addr: int, value: int, cpu: int = 9) -> int:
        return self.write_mem(addr, (value & 0xFFFF).to_bytes(2, "little"), cpu)

    def write_u32(self, addr: int, value: int, cpu: int = 9) -> int:
        return self.write_mem(addr, (value & 0xFFFFFFFF).to_bytes(4, "little"), cpu)

    def watch(self, max_entries: int = 128) -> dict[str, Any]:
        return self._request({"cmd": "watch", "max": max_entries})

    def regs(self, cpu: int = 9) -> dict[str, Any]:
        return self._request({"cmd": "regs", "cpu": cpu})
