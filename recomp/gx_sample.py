#!/usr/bin/env python3
"""gx_sample.py — sample the 3D polygon list twice and compare, to tell
whether JUS submits live 3D geometry during a scene or the list is stale."""
import hashlib
import json
import sys
import time
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from savebug_driver import Client  # noqa: E402


def hash_list(polys):
    return hashlib.sha1(
        json.dumps(polys, sort_keys=True).encode()).hexdigest()[:16]


def main():
    port = int(sys.argv[1]) if len(sys.argv) > 1 else 19888
    gap = float(sys.argv[2]) if len(sys.argv) > 2 else 4.0
    c = Client(port=port)
    c.connect(timeout=30)
    for t in range(3):
        r = c.req({"cmd": "gx_polygons"})
        polys = r.get("polygons", [])
        print(f"t{t}: count={r.get('count')} hash={hash_list(polys)}")
        if t < 2:
            time.sleep(gap)
    return 0


if __name__ == "__main__":
    sys.exit(main())
