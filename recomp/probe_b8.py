#!/usr/bin/env python3
# probe_b8.py — dump card-bus events for backup commands (B8 etc.) with the
# response words the runner returned.
import json
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from savebug_driver import Client  # noqa: E402

PORT = int(sys.argv[1]) if len(sys.argv) > 1 else 19883
c = Client(port=PORT)
c.connect(timeout=30)
r = c.req({"cmd": "cartridge", "max": 1024})
evs = r.get("events", [])
print(f"{len(evs)} events")
out = []
for e in evs:
    cmd = e.get("command", "?")
    if not cmd.startswith("b7"):
        out.append(e)
for e in out[:40]:
    print(json.dumps(e))
Path("recomp/b8-events.json").write_text(json.dumps(out, indent=1))
print(f"wrote {len(out)} non-B7 events to recomp/b8-events.json")
