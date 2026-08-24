#!/usr/bin/env python3
"""Build orchestrator for the JUS Decomp project.

Wraps the ds-decomp (`dsd`) workflow so all steps are reproducible:

    delink -> lcf -> (assemble/link via mwldarm if available) -> check modules

The Metrowerks CodeWarrior linker (`mwldarm`) is proprietary and not bundled.
If it is found on PATH or in MWLDARM_PATH, the full link + verification runs;
otherwise only the toolchain-independent steps (delink, lcf, objdiff) execute.

Usage:
    python tools/scripts/build.py [--link] [--check] [--all] [--dis]

Options:
    --all     Run every step that is possible (default behavior).
    --link    Attempt the mwldarm link step (final_link.o + module bins).
    --check   Run `dsd check modules` after linking.
    --dis     Regenerate reference disassembly into decomp/asm.
"""

from __future__ import annotations

import os
import shutil
import subprocess
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
DSD = REPO / "tools" / "dsd" / "dsd.exe"
CONFIG = REPO / "decomp" / "arm9" / "config.yaml"
BUILD = REPO / "build"

# mwldarm lookup (extend as needed if you install CodeWarrior):
#   1. MWLDARM_PATH environment variable
#   2. tools/mwccarm/**/mwldarm.exe  (mwccarm.zip from the DS Decompilation
#      Discord: https://discord.com/invite/gwN6M3HQrA — resources channel.
#      The 1.2/sp2p3 tree is the linker version DS decomp projects pin.)
MWLDARM_CANDIDATES = [
    Path(os.environ.get("MWLDARM_PATH", "")) if os.environ.get("MWLDARM_PATH") else None,
    Path("C:/Program Files (x86)/NDS/mwldarm.exe"),
    Path("C:/devkitPro/mwldarm/mwldarm.exe"),
]
# Preferred mwldarm versions, in order (first match wins).
MWLDARM_VERSION_PREFERENCES = ["1.2/sp2p3", "1.2/sp2", "1.2/base"]


def run(cmd: list[str], **kw) -> bool:
    print(f"$ {' '.join(str(c) for c in cmd)}")
    result = subprocess.run([str(c) for c in cmd], cwd=REPO, **kw)
    return result.returncode == 0


def find_mwldarm() -> Path | None:
    found = shutil.which("mwldarm")
    if found:
        return Path(found)
    for candidate in MWLDARM_CANDIDATES:
        if candidate and candidate.is_file():
            return candidate
    # tools/mwccarm/<version>/mwldarm.exe from mwccarm.zip (preferred versions first).
    mwccarm_root = REPO / "tools" / "mwccarm"
    if mwccarm_root.is_dir():
        for version in MWLDARM_VERSION_PREFERENCES:
            hit = mwccarm_root / version / "mwldarm.exe"
            if hit.is_file():
                return hit
        # Fall back to any mwldarm.exe found under tools/mwccarm/.
        hits = sorted(mwccarm_root.rglob("mwldarm.exe"))
        if hits:
            return hits[0]
    return None


def step_delink() -> bool:
    return run([DSD, "delink", "-c", CONFIG])


def step_lcf() -> bool:
    return run([DSD, "lcf", "-c", CONFIG])


def step_objdiff() -> bool:
    return run([DSD, "objdiff", "-c", CONFIG, "-o", REPO / "decomp" / "objdiff"])


def step_dis() -> bool:
    return run([DSD, "dis", "-c", CONFIG, "-a", REPO / "decomp" / "asm"])


def step_link(mwldarm: Path) -> bool:
    lcf = BUILD / "arm9.lcf"
    objects = BUILD / "objects.txt"
    out_elf = BUILD / "final_link.o"
    if not lcf.is_file() or not objects.is_file():
        print("error: run the lcf step first", file=sys.stderr)
        return False
    # mwldarm syntax (per pokediamond's proven invocation): flags, then the LCF as a
    # positional argument, then @objlist. Note: `-lcf` would parse as `-l cf`
    # (link library named "cf") — do NOT use it.
    cmd = [
        mwldarm,
        "-w", "off",          # suppress warnings
        "-sym", "on",         # generate symbol table
        "-nodead",            # keep all sections (no dead-strip)
        "-proc", "v5te",      # ARMv5TE (ARM946E-S)
        "-interworking",      # ARM/Thumb interworking
        "-map", "closure,unused",
        "-symtab", "sort",
        "-nostdlib",          # bare-metal: no MSL runtime
        "-m", "Entry",        # entry symbol (ARM9 entry @ 0x02000800)
        "-o", out_elf,
        lcf,
        f"@{objects}",
    ]
    return run(cmd)


def step_check() -> bool:
    return run([DSD, "check", "modules", "-c", CONFIG, "-f"])


def main() -> int:
    args = set(sys.argv[1:])
    do_all = not args or "--all" in args

    mwldarm = find_mwldarm()
    can_link = "--link" in args or do_all
    can_check = "--check" in args or do_all

    steps: list[tuple[str, bool]] = [
        ("delink (reference ELF objects from ROM)", step_delink()),
        ("lcf (linker script + objects list)", step_lcf()),
        ("objdiff config", step_objdiff()),
    ]
    if "--dis" in args:
        steps.append(("reference disassembly", step_dis()))

    if can_link:
        if mwldarm:
            steps.append(("link (mwldarm)", step_link(mwldarm)))
            if can_check:
                steps.append(("check modules vs base ROM", step_check()))
        else:
            print("\n[skip] mwldarm (Metrowerks linker) not found.")
            print("       Provide it on PATH or set MWLDARM_PATH to enable linking.")
            print("       Track A code matching requires this proprietary toolchain.")

    print("\n== Build summary ==")
    ok = True
    for name, success in steps:
        status = "OK" if success else "FAILED"
        ok &= success
        print(f"  [{status:^6}] {name}")
    return 0 if ok else 1


if __name__ == "__main__":
    raise SystemExit(main())