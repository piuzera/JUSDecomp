#!/usr/bin/env python3
"""
package_release.py — build the beginner-friendly JUSDecomp distribution.

Produces dist/JUSDecomp/ containing:
    JUSDecomp.exe            the launcher (GUI, single entry point)
    app/nds_runner.exe       patched recomp runner + its DLLs
    app/bios/                FreeBIOS banks + generated firmware/identity
    data/gamecontrollerdb.txt  base SDL2 mapping database
    mods/                    bundled mod packs (prebuilt payloads + modindex.json)
    docs/USER_GUIDE.txt      player guide (+ LICENSE/CHANGELOG copies)

Requirements on the BUILD machine (this is a developer/owner-only step, the
ROM never touches CI): MSYS2 UCRT64 toolchain, built runner at
tools/ndsrecomp/runner/build-mingw, your stock ROM at rom/jus.nds and its
dsd extraction under extract/.

Usage:
    py tools/scripts/package_release.py [--portable]
"""
from __future__ import annotations

import argparse
import hashlib
import json
import os
import re
import shutil
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
DIST = ROOT / "dist" / "JUSDecomp"
MSYS = Path("C:/msys64/ucrt64")
STOCK_SHA1 = "ba58e20ee60eb81c33dcd4934a21271baa9f954a"


def run(cmd: list[str], cwd: Path | None = None, env: dict | None = None):
    print(f"$ {' '.join(map(str, cmd))}")
    e = dict(os.environ)
    if env:
        e.update(env)
    subprocess.run([str(c) for c in cmd], cwd=cwd or ROOT, env=e, check=True)


def build_launcher() -> Path:
    build = ROOT / "launcher" / "build"
    env = {"PATH": f"{MSYS / 'bin'};{os.environ['PATH']}"}
    run(["cmake", "-G", "Ninja", "-S", str(ROOT / "launcher"),
         "-B", str(build), "-DCMAKE_BUILD_TYPE=Release",
         f"-DSDL2_DIR={MSYS / 'lib' / 'cmake' / 'SDL2'}"], env=env)
    run(["cmake", "--build", str(build)], env=env)
    exe = build / "JUSDecomp.exe"
    if not exe.is_file():
        raise SystemExit("[!] launcher build produced no JUSDecomp.exe")
    return exe


def check_rom() -> None:
    rom = ROOT / "rom" / "jus.nds"
    if not rom.is_file():
        raise SystemExit("[!] rom/jus.nds not found — the release bundle is "
                         "built from YOUR legally dumped ROM (never in CI).")
    h = hashlib.sha1(rom.read_bytes()).hexdigest()
    if h != STOCK_SHA1:
        raise SystemExit(f"[!] ROM sha1 {h} != stock {STOCK_SHA1}")
    print("ROM verified (stock dump)")


def collect_mods() -> None:
    """Build every enabled pack from the user's extract and precompute its
    overlays for the stock ROM (offsets are ROM-sha1-constant)."""
    sys.path.insert(0, str(ROOT / "tools" / "scripts"))
    import mods_build
    import mods_manage

    rom = (ROOT / "rom" / "jus.nds").read_bytes()
    mods = []
    for mod in mods_manage.iter_mods():
        if not mod.enabled:
            continue
        print(f"[mod] {mod.id}: building payloads")
        mods_manage.run_hook(mod)
        overlays, _notes = mods_build.resolve_mod_files(rom, mod.files_dir)
        if not overlays:
            raise SystemExit(f"[!] {mod.id}: no overlays resolved")
        rel_overlays = []
        for offset, rel in overlays:
            # project path: recomp/mods/<id>/files/... -> bundle path: mods/<id>/files/...
            bundle_rel = rel.replace(f"recomp/mods/{mod.id}/files",
                                     f"mods/{mod.id}/files", 1)
            rel_overlays.append({"offset": f"0x{offset:X}", "file": bundle_rel})
        mods.append({
            "id": mod.id,
            "name": mod.name,
            "version": mod.version,
            "author": str(mod.manifest.get("author", "")),
            "description": mod.description,
            "overlays": rel_overlays,
        })
    index = {"version": 1, "mods": mods}
    (DIST / "mods").mkdir(parents=True, exist_ok=True)
    (DIST / "mods" / "modindex.json").write_text(
        json.dumps(index, ensure_ascii=False, indent=2), encoding="utf-8")
    for mod in mods:
        src = ROOT / "recomp" / "mods" / mod["id"] / "files"
        dst = DIST / "mods" / mod["id"] / "files"
        if src.is_dir():
            if dst.exists():
                shutil.rmtree(dst)
            shutil.copytree(src, dst)
    print(f"bundled {len(mods)} mod pack(s)")


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--portable", action="store_true",
                    help="create portable.txt so settings live next to the exe")
    args = ap.parse_args()

    # Preserve the user's portable-mode data (settings/saves) across repacks.
    # Copy (not move) so a locked file (e.g. in-game save while playing) is
    # survivable, and restore afterwards without destroying fresh content.
    backup_user = DIST / ".." / ".data-user-backup"
    if (DIST / "data-user").is_dir():
        if backup_user.exists():
            shutil.rmtree(backup_user)
        shutil.copytree(DIST / "data-user", backup_user)
    had_portable = (DIST / "portable.txt").is_file()

    def _rename_locked_aside(func, path, exc):
        # A running JUSDecomp.exe cannot be deleted, but it CAN be renamed.
        try:
            p = os.fspath(path)
            os.rename(p, p + ".old")
        except OSError:
            pass  # leave it; still locked (cleaned up on a later run)

    if DIST.exists():
        # Never remove DIST itself: it may be some process's working
        # directory (e.g. a terminal cd'd into it). Clear the children only.
        for child in DIST.iterdir():
            if child.is_dir() and not child.is_symlink():
                shutil.rmtree(child, onexc=_rename_locked_aside)
            else:
                try:
                    child.unlink()
                except OSError:
                    _rename_locked_aside(None, child, None)
    (DIST / "app" / "bios").mkdir(parents=True, exist_ok=True)
    (DIST / "data").mkdir(parents=True, exist_ok=True)
    (DIST / "docs").mkdir(parents=True, exist_ok=True)

    check_rom()

    # 1. launcher + its runtime DLLs. JUSDecomp.exe dynamically imports
    # SDL2.dll and (until static-linked) libwinpthread-1.dll. They MUST sit
    # next to the exe in the bundle root: Windows never searches the app/
    # subdirectory, and a clean machine without MSYS2 on PATH would otherwise
    # resolve a wrong-architecture copy from System32/PATH -> 0xc000007b
    # (STATUS_INVALID_IMAGE_FORMAT). libgcc/libstdc++ are static-linked into
    # the launcher but are bundled too for safety.
    launcher_exe = build_launcher()
    shutil.copy2(launcher_exe, DIST / "JUSDecomp.exe")
    for dll in ["SDL2.dll", "libwinpthread-1.dll", "libgcc_s_seh-1.dll",
                "libstdc++-6.dll"]:
        src = MSYS / "bin" / dll
        if src.is_file():
            shutil.copy2(src, DIST / dll)
    print("launcher built + copied (with runtime DLLs next to the exe)")

    # 2. runner + DLLs (mingw runtime deps + SDL2)
    runner = ROOT / "tools" / "ndsrecomp" / "runner" / "build-mingw" / "nds_runner.exe"
    if not runner.is_file():
        raise SystemExit("[!] runner not built — see README.md developer setup")
    shutil.copy2(runner, DIST / "app" / "nds_runner.exe")
    for dll in ["SDL2.dll", "libgcc_s_seh-1.dll", "libstdc++-6.dll",
                "libwinpthread-1.dll"]:
        src = MSYS / "bin" / dll
        if src.is_file():
            shutil.copy2(src, DIST / "app" / dll)
    print("runner + DLLs copied")

    # 3. FreeBIOS/firmware (the runner's first positional arg directory)
    bios_src = ROOT / "tools" / "ndsrecomp" / "bios"
    if bios_src.is_dir():
        for item in bios_src.iterdir():
            dst = DIST / "app" / "bios" / item.name
            if item.is_dir():
                shutil.copytree(item, dst, dirs_exist_ok=True)
            else:
                shutil.copy2(item, dst)
    print("bios bundle copied")

    # 4. base controller database (may be empty; SDL2 has built-ins)
    db = ROOT / "recomp" / "gamecontrollerdb.txt"
    if db.is_file():
        shutil.copy2(db, DIST / "data" / "gamecontrollerdb.txt")

    # 5. bundled mods (prebuilt from the verified stock ROM)
    collect_mods()

    # 6. docs
    guide = ROOT / "docs" / "USER_GUIDE.md"
    if guide.is_file():
        (DIST / "docs" / "USER_GUIDE.txt").write_text(
            guide.read_text(encoding="utf-8"), encoding="utf-8")
    shutil.copy2(ROOT / "LICENSE", DIST / "docs" / "LICENSE.txt")
    if (ROOT / "CHANGELOG.md").is_file():
        shutil.copy2(ROOT / "CHANGELOG.md", DIST / "docs" / "CHANGELOG.txt")
    online_guide = ROOT / "recomp" / "ONLINE_TEST.md"
    if online_guide.is_file():
        shutil.copy2(online_guide, DIST / "docs" / "ONLINE_TEST.txt")

    if args.portable or had_portable:
        (DIST / "portable.txt").write_text(
            "Portable mode: settings are stored next to this executable.\n",
            encoding="utf-8")

    if backup_user.is_dir():
        shutil.copytree(backup_user, DIST / "data-user", dirs_exist_ok=True)
        shutil.rmtree(backup_user, ignore_errors=True)

    # leftovers from a previous in-place repack while the app was running
    for old in DIST.rglob("*.old"):
        try:
            os.remove(old)
        except OSError:
            print(f"[note] {old} is locked (app running?) — it will be "
                  f"cleaned up on a later run")

    print(f"\nBundle ready at {DIST}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
