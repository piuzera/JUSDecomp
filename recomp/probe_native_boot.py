#!/usr/bin/env python3
# probe_native_boot.py — promote the ARM7 WRAM driver page (0x03803000) to
# native via live-overlay, then re-boot and re-evaluate save acceptance.
# Sequence: reset -> step boot (page hot) -> trigger -> wait -> reset -> probe.
import json
import sys
import time
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from savebug_driver import Client  # noqa: E402
import probe_long  # reuse? no — inline minimal probing here

PORT = 19880
LOG = Path("recomp/savebug-native-boot.log")


def note(msg):
    line = f"[{time.strftime('%H:%M:%S')}] {msg}"
    print(line, flush=True)
    with LOG.open("a") as f:
        f.write(line + "\n")


c = Client(port=PORT)
c.connect(timeout=30)
note(f"ping: {c.req({'cmd': 'ping'})}")

# 1. reset to a fresh boot
note(f"reset: {c.req({'cmd': 'reset'})}")
time.sleep(2)

# 2. step the boot probe (driver page becomes hot)
for i in range(1, 151):
    r = c.req({"cmd": "run_to_event", "event": "vblank9", "count": i})
    if not r.get("reached"):
        note(f"stall at frame {i}: {r}")
        break
note("150 frames stepped (boot probe should be done)")

# 3. trigger live-overlay compile including the now-hot page
t = c.req({"cmd": "live_overlay_trigger"})
note(f"trigger: ok={t.get('ok')}")

# 4. wait for the compile to land (banks loading); poll status
deadline = time.time() + 240
have_driver = False
while time.time() < deadline:
    s = c.req({"cmd": "live_overlay_status"})
    loaded = s.get("loaded", [])
    ids = [b["bank_id"] for b in loaded]
    have_driver = any("03803000" in b for b in ids)
    note(f"busy={s.get('busy')} banks={len(ids)} driver_page={have_driver} "
         f"runs={s.get('runs_started')}/{s.get('runs_finished')} "
         f"failed={s.get('runs_failed')}")
    if not s.get("busy") and s.get("generation_pending") is False and \
            s.get("runs_started", 0) >= (t.get("status", {}).get("runs_started", 0) + 1):
        break
    if have_driver and not s.get("busy"):
        break
    time.sleep(10)

if not have_driver:
    note("WARNING: driver page 03803000 still not promoted; "
         "listing arm7 bank ids:")
    s = c.req({"cmd": "live_overlay_status"})
    note(", ".join(b["bank_id"] for b in s.get("loaded", [])
                   if "_arm7_" in b["bank_id"]))

# 5. reset again — banks persist across reset
note(f"reset2: {c.req({'cmd': 'reset'})}")
time.sleep(2)

# 6. probe acceptance at 900 frames
RAM_BASE, RAM_LEN = 0x02000000, 0x400000
imp = Path("recomp/jus-trace.sav").read_bytes()
win = imp[0x4000:0x4020]
tpl = b"\x83\x66\x83\x62\x83\x4c"
for i in range(1, 901):
    r = c.req({"cmd": "run_to_event", "event": "vblank9", "count": i})
    if not r.get("reached"):
        note(f"stall at frame {i}: {r}")
        break
blob = bytearray()
for off in range(0, RAM_LEN, 0x10000):
    r = c.req({"cmd": "read_mem", "cpu": 9, "addr": RAM_BASE + off,
               "len": 0x10000})
    blob += (bytes.fromhex(r["hex"]) if "hex" in r else b"\x00" * 0x10000)
ram = bytes(blob)
deck = ram[0x020B0000 - RAM_BASE:0x020C0000 - RAM_BASE]
res = {
    "win4000_in_ram": ram.find(win) >= 0,
    "deck_default_init": deck.find(tpl) >= 0,
    "jssgxu_hits": [hex(RAM_BASE + i) for i in range(len(ram) - 6)
                    if ram[i:i + 6] == b"JSSGXu"][:12],
    "driver_native": have_driver,
}
res["accepted"] = res["win4000_in_ram"] and not res["deck_default_init"]
note("RESULT " + json.dumps(res))
Path("recomp/probe-native-boot.json").write_text(json.dumps(res, indent=1))
