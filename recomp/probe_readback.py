#!/usr/bin/env python3
"""
probe_readback.py — SAVEBUG session 3: trace the ARM9 bank-read pipeline live.

Open question (SAVEBUG-SESSION2.md): CARD_ReadBackup (func_02062444) delivers
nothing — the save mirror stays zeroed and the validator verdict is "invalid".

Method: reset the runner, then rotate run_to_pc breakpoints across the read
pipeline. On every hit dump regs + CARD ctx (0x020AEC40 ARM7-shared /
0x020AECA0 ARM9 bookkeeping) + request struct + the new ARM9->7 FIFO send
words. The FIFO words show the PXI op sequence (op 2 identify-init, op 6
236-read scan, op 9 SPI read), which tells us whether the bank read is ever
issued. ARM7 targets are opportunistic: tier3 never checks the break pc, so
they only fire if that page was promoted to native code.

Usage:
  py recomp/probe_readback.py [port] [--budget ROUNDS] [--max-miss N]
                              [--max-hits N] [--out recomp/probe-readback.json]
"""
from __future__ import annotations

import json
import sys
import time
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from savebug_driver import Client  # noqa: E402

LOG = Path("recomp/probe-readback.log")
CTX_ARM7 = 0x020AEC40  # ctx shared with ARM7 backup driver
CTX_ARM9 = 0x020AECA0  # ARM9-side CARD bookkeeping (read pump lives here)
MIRROR = 0x020B02B8    # save mirror the validator checks
STAGE = 0x020AEDC0     # staging buffer used by identify + reads


def arg(name: str, default: str) -> str:
    if name in sys.argv:
        i = sys.argv.index(name)
        return sys.argv[i + 1] if i + 1 < len(sys.argv) else default
    return default


def note(msg: str) -> None:
    line = f"[{time.strftime('%H:%M:%S')}] {msg}"
    print(line, flush=True)
    with LOG.open("a", encoding="utf-8") as f:
        f.write(line + "\n")


def hexdump(data: bytes) -> str:
    return " ".join(
        f"{data[i]:02x}" for i in range(0, len(data), 1)
    )[0:512] if data else "(none)"


def mem(c: Client, cpu: int, addr: int, length: int) -> bytes:
    r = c.req({"cmd": "read_mem", "cpu": cpu, "addr": addr, "len": length})
    return bytes.fromhex(r["hex"]) if "hex" in r else b""


def u32(b: bytes, off: int) -> int:
    return int.from_bytes(b[off:off + 4], "little") if len(b) >= off + 4 else 0


# ── breakpoint table ─────────────────────────────────────────────────────
# (pc, name, cpu, per-target hit cap)
TARGETS = [
    (0x02062444, "CARD_ReadBackup", 9, 10),
    (0x02062B60, "card_op_send", 9, 40),
    (0x02062AF8, "card_pump", 9, 10),
    (0x02062608, "read_async_wrap", 9, 6),
    (0x020626DC, "read_completion", 9, 6),
    (0x020623E8, "readback_async_api", 9, 6),
    (0x020557C8, "os_pxi_send", 9, 30),
    (0x0205587C, "os_pxi_call", 9, 30),
    (0x02062C48, "card_op_loop", 9, 10),
    (0x020728D8, "save_load_validate", 9, 6),
    (0x02072A60, "validator", 9, 6),
    (0x03803E20, "arm7_pxi_dispatch", 7, 30),
    (0x038034C0, "arm7_op9_handler", 7, 12),
]


def dump_ctx(c: Client, tag: str, hits: list) -> None:
    c7 = mem(c, 7, CTX_ARM7, 0x40)
    c9 = mem(c, 9, CTX_ARM9, 0x140)
    note(f"{tag} ctx7@020AEC40 {c7.hex(' ')}")
    note(f"{tag} ctx9@020AECA0[0:80] {c9[:0x80].hex(' ')}")
    hits.append({"tag": tag, "ctx7": c7.hex(), "ctx9_head": c9[:0x80].hex()})


def main() -> int:
    port = int(sys.argv[1]) if len(sys.argv) > 1 else 19887
    budget = int(arg("--budget", "2400000"), 0)
    max_miss = int(arg("--max-miss", "2"), 0)
    max_hits = int(arg("--max-hits", "120"), 0)
    out = Path(arg("--out", "recomp/probe-readback.json"))
    wall_cap = float(arg("--wall-cap", "1500"))  # seconds

    if LOG.exists():
        LOG.unlink()
    c = Client(port=port)
    c.connect(timeout=30)
    note(f"ping {c.req({'cmd': 'ping'})}")
    note(f"reset {c.req({'cmd': 'reset'})}")
    time.sleep(2)

    # initial fifo send watermark (fifo9to7 count)
    ev = c.req({"cmd": "event_counts"})
    last_fifo = int(ev.get("fifo9to7", 0))
    note(f"boot fifo9to7 watermark = {last_fifo}")

    hits = []
    fifo_words = []
    miss = {pc: 0 for pc, *_ in TARGETS}
    hits_for = {pc: 0 for pc, *_ in TARGETS}
    active = {pc for pc, *_ in TARGETS}
    t0 = time.time()
    total = 0

    while active and total < max_hits and (time.time() - t0) < wall_cap:
        made_progress = False
        for pc, name, cpu, cap in TARGETS:
            if pc not in active:
                continue
            if time.time() - t0 > wall_cap:
                break
            r = c.req({"cmd": "run_to_pc", "pc": pc, "max_rounds": budget})
            reached = r.get("reached")
            rounds = r.get("rounds", 0)
            if reached:
                miss[pc] = 0
                hits_for[pc] += 1
                total += 1
                made_progress = True
                regs = c.req({"cmd": "regs", "cpu": cpu})
                rr = regs.get("r", [])
                lr = rr[14] if len(rr) > 14 else 0
                sp = rr[13] if len(rr) > 13 else 0
                stk = (mem(c, cpu, sp, 0x18)
                       if 0x02000000 <= sp < 0x02400000 else b"")
                hit = {
                    "pc": pc, "name": name, "cpu": cpu,
                    "rounds": rounds, "r": rr, "lr": lr, "sp": sp,
                    "stack": stk.hex(),
                }
                if cpu == 9:
                    hit["ctx7_head"] = mem(c, 9, CTX_ARM7, 0x60).hex()
                    hit["stage_head"] = mem(c, 9, STAGE, 0x40).hex()
                # context-specific dumps
                if name == "CARD_ReadBackup" and rr:
                    req = mem(c, 9, rr[0], 0x140)
                    hit["req0"] = rr[0]
                    hit["req_fields"] = {
                        "ctx_ptr": u32(req, 0), "f1c": u32(req, 0x1C),
                        "f20": u32(req, 0x20), "f24": u32(req, 0x24),
                        "f2c_op": u32(req, 0x2C), "f30": u32(req, 0x30),
                        "f34_mode": u32(req, 0x34), "f38": u32(req, 0x38),
                        "f3c": u32(req, 0x3C), "f114_flags": u32(req, 0x114),
                    }
                    hit["staging120"] = req[0x120:0x140].hex()
                elif name == "card_op_send" and rr:
                    hit["req0"] = rr[0]
                    hit["op"] = rr[1] if len(rr) > 1 else -1
                    hit["retry"] = rr[2] if len(rr) > 2 else -1
                    req = mem(c, 9, rr[0], 0x40)
                    hit["req_head"] = req.hex()
                    hit["req_ctx"] = u32(req, 0)
                elif name == "card_pump" and rr:
                    hit["dst"] = rr[0]
                    hit["dst_head"] = mem(c, 9, rr[0], 0x30).hex()
                    c9 = mem(c, 9, CTX_ARM9, 0x40)
                    hit["ctx9_1c_24"] = {
                        "f1c": u32(c9, 0x1C), "f20": u32(c9, 0x20),
                        "f24": u32(c9, 0x24),
                    }
                elif name == "save_load_validate" and rr:
                    hit["r0r3"] = rr[:4]
                elif name == "validator" and rr:
                    hit["buf"] = rr[0]
                    hit["buf_head"] = mem(c, 9, rr[0], 0x48).hex()
                elif cpu == 7:
                    c7 = mem(c, 7, CTX_ARM7, 0x60)
                    hit["ctx7_head"] = c7.hex()
                    hit["ctx7_fields"] = {
                        "state": u32(c7, 0), "cursor": u32(c7, 0x0C),
                        "bufptr": u32(c7, 0x10), "len": u32(c7, 0x14),
                        "f18": u32(c7, 0x18), "f24": u32(c7, 0x24),
                        "f48": u32(c7, 0x48),
                    }
                note(f"HIT {name}@{pc:#x} cpu{cpu} rounds={rounds} "
                     f"r={[hex(x) for x in rr[:8]]} lr={hex(lr)}")
                hits.append(hit)
                if hits_for[pc] >= cap:
                    note(f"drop {name} (cap {cap})")
                    active.discard(pc)
            else:
                miss[pc] += 1
                if miss[pc] >= max_miss:
                    note(f"drop {name}@{pc:#x}: {max_miss} misses "
                         f"(rounds={rounds}, reason9={r.get('reason9')}, "
                         f"reason7={r.get('reason7')})")
                    active.discard(pc)
                elif r.get("reason9") or r.get("reason7"):
                    note(f"halt without hit {name}@{pc:#x}: "
                         f"reason9={r.get('reason9')} "
                         f"reason7={r.get('reason7')}")
            # collect any new FIFO sends 9->7
            try:
                ev2 = c.req({"cmd": "event_counts"})
                now_fifo = int(ev2.get("fifo9to7", 0))
                for n in range(last_fifo + 1, min(now_fifo, last_fifo + 65) + 1):
                    fs = c.req({"cmd": "fifo_sample", "cpu": 9, "count": n})
                    if fs.get("found"):
                        fifo_words.append(
                            {"n": n, "value": fs["value"],
                             "at_hit": name if reached else "miss"})
                        note(f"FIFO9->7 #{n}: value={fs['value']:#x} "
                             f"({name if reached else 'miss'})")
                if now_fifo > last_fifo:
                    last_fifo = now_fifo
            except Exception as e:  # noqa: BLE001
                note(f"fifo tracking error: {e}")
        if not made_progress:
            # nothing hit in a full pass: give every remaining target one
            # more miss so the loop can converge without re-spinning budgets
            for pc in list(active):
                miss[pc] += 1
                if miss[pc] >= max_miss:
                    note(f"drop {pc:#x}: no hits in pass")
                    active.discard(pc)

    note(f"rotation done: total_hits={total} active={active} "
         f"elapsed={time.time() - t0:.1f}s")
    dump_ctx(c, "FINAL", hits)
    final = {
        "port": port,
        "total_hits": total,
        "hits": hits,
        "fifo9to7": fifo_words,
        "mirror_head": mem(c, 9, MIRROR, 0x60).hex(),
        "stage_head": mem(c, 9, STAGE, 0x80).hex(),
        "probe_cache_head": mem(c, 9, 0x021DE700, 0x200).hex(),
        "dirty": c.req({"cmd": "cart_save_info"}).get("dirty"),
        "counts": c.req({"cmd": "event_counts"}),
    }
    out.write_text(json.dumps(final, indent=1) + "\n")
    note(f"wrote {out}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
