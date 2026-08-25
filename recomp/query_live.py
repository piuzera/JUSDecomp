#!/usr/bin/env python3
"""query_live.py — print the compact live_overlay_status fields for a runner.
Usage: python recomp/query_live.py [port ...]"""
import json
import socket
import sys


def query(port: int) -> dict:
    with socket.create_connection(("127.0.0.1", port), timeout=5) as s:
        s.sendall((json.dumps({"cmd": "live_overlay_status"}) + "\n").encode())
        buf = b""
        while b"\n" not in buf:
            chunk = s.recv(65536)
            if not chunk:
                raise ConnectionError("closed")
            buf += chunk
        return json.loads(buf.split(b"\n")[0])


def main() -> int:
    ports = [int(a) for a in sys.argv[1:]] or [19842, 19843]
    for port in ports:
        try:
            d = query(port)
            print(f"port {port}: banks_loaded={d.get('banks_loaded')} "
                  f"rejected={d.get('banks_rejected')} "
                  f"runs_failed={d.get('runs_failed')} "
                  f"busy={d.get('busy')} "
                  f"tier3_arm9={d.get('tier3_arm9')} "
                  f"tier3_arm7={d.get('tier3_arm7')}")
        except Exception as e:
            print(f"port {port}: ERROR {e}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
