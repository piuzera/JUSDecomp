#!/usr/bin/env py
# save_layout_report.py — structural dump of JUS .sav files (SAVEBUG symptom A/B forensics).
# Usage: py recomp/save_layout_report.py [file.sav ...]
import sys

DEFAULTS = [
    "recomp/jus-trace.sav",       # pristine hardware import
    "recomp/jus-failed-save.sav", # pre-fix corrupted write
    "recomp/jus.sav",             # current post-fix runner save
]

def dump(path):
    with open(path, "rb") as f:
        d = f.read()
    out = []
    out.append(f"=== {path} ({len(d)} bytes)")
    out.append("head[0x00:0x60]: " + d[:0x60].hex(" "))
    nonff = [i for i, b in enumerate(d) if b != 0xFF]
    zero = sum(1 for b in d if b == 0)
    out.append(f"non-FF bytes: {len(nonff)}  zero bytes: {zero}")
    if nonff:
        out.append(f"first non-FF: {nonff[0]:#x}  last non-FF: {nonff[-1]:#x}")
    pages = [f"{pg:#06x}" for pg in range(0, len(d), 0x1000)
             if any(b != 0xFF for b in d[pg:pg + 0x1000])]
    out.append("4KiB pages with non-FF: " + " ".join(pages))
    out.append("JSSGXu at: " + " ".join(f"{i:#x}" for i in range(len(d) - 6)
                                        if d[i:i + 6] == b"JSSGXu") or "-")
    out.append("JUJA   at: " + " ".join(f"{i:#x}" for i in range(len(d) - 4)
                                        if d[i:i + 4] == b"JUJA") or "-")
    return "\n".join(out)

if __name__ == "__main__":
    targets = sys.argv[1:] or DEFAULTS
    lines = [dump(t) for t in targets]
    report = "\n\n".join(lines) + "\n"
    with open("recomp/save_layout_report.txt", "w") as f:
        f.write(report)
    print(report)
