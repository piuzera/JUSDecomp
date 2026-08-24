#!/usr/bin/env python3
"""
mods_manage.py — mod pack manager for the JUS recomp runner.

Mod packs live in recomp/mods/<id>/:

    mod.toml   manifest: [manifest] id, name, version, author, description,
               enabled (true/false)
    src/       original source assets — committed to git
    build.py   OPTIONAL hook: def build(ctx) writes the payload tree under
               ctx.files (see decomp/docs/MODS.md for the contract)
    files/     generated NitroFS-mirror payloads — gitignored, built locally
               from the user's own extract/ + the pack's sources

Commands:
    list                 show installed packs and their state
    enable <id>          set enabled = true  in the pack's mod.toml
    disable <id>         set enabled = false in the pack's mod.toml
    build [id ...]       materialize files/ (runs build.py hook when present)
    compose [--rebuild]  resolve overlays for every enabled pack and write
                         recomp/game-mod.generated.toml (base game-mod.toml +
                         the enabled packs' [[mods.overlays]])
"""
from __future__ import annotations

import argparse
import re
import subprocess
import sys
from pathlib import Path
from types import SimpleNamespace

import runpy

REPO = Path(__file__).resolve().parents[2]
MODS_ROOT = REPO / "recomp" / "mods"
EXTRACT_FILES = REPO / "extract" / "files"
SCRIPTS = Path(__file__).resolve().parent
ROM = REPO / "rom" / "jus.nds"
BASE_CONFIG = REPO / "recomp" / "game-mod.toml"
GENERATED_CONFIG = REPO / "recomp" / "game-mod.generated.toml"

try:
    sys.stdout.reconfigure(encoding="utf-8")
except Exception:
    pass


def load_toml(path: Path) -> dict:
    try:
        import tomllib
    except ImportError:
        raise SystemExit("[!] Python 3.11 or newer is required (tomllib).")
    with open(path, "rb") as f:
        return tomllib.load(f)


class Mod:
    def __init__(self, root: Path) -> None:
        self.root = root
        toml_path = root / "mod.toml"
        if not toml_path.is_file():
            raise SystemExit(f"[!] {root.name}: missing mod.toml")
        self.manifest = load_toml(toml_path).get("manifest", {})
        if not self.manifest:
            raise SystemExit(f"[!] {root.name}: mod.toml has no [manifest]")
        self.id = self.manifest.get("id") or root.name
        self.enabled = bool(self.manifest.get("enabled", True))
        self.files_dir = root / "files"
        self.src_dir = root / "src"
        self.build_py = root / "build.py"

    @property
    def name(self) -> str:
        return str(self.manifest.get("name", self.id))

    @property
    def version(self) -> str:
        return str(self.manifest.get("version", "?"))

    @property
    def description(self) -> str:
        return str(self.manifest.get("description", "")).strip()

    def built_payloads(self) -> list[Path]:
        if not self.files_dir.is_dir():
            return []
        return [p for p in sorted(self.files_dir.rglob("*"))
                if p.is_file() and not p.name.startswith("_fat_")]

    def set_enabled(self, value: bool) -> None:
        toml_path = self.root / "mod.toml"
        text = toml_path.read_text(encoding="utf-8")
        text, n = re.subn(r"(?m)^enabled\s*=\s*(true|false)\s*$",
                          f"enabled = {str(value).lower()}", text, count=1)
        if n != 1:
            raise SystemExit(
                f"[!] {self.id}: no 'enabled = ...' line found in mod.toml")
        toml_path.write_text(text, encoding="utf-8")


def iter_mods() -> list[Mod]:
    mods: list[Mod] = []
    if MODS_ROOT.is_dir():
        for child in sorted(MODS_ROOT.iterdir()):
            if child.is_dir() and (child / "mod.toml").is_file():
                mods.append(Mod(child))
    return mods


def find_mod(mod_id: str) -> Mod:
    for mod in iter_mods():
        if mod.id == mod_id:
            return mod
    raise SystemExit(f"[!] no installed pack with id '{mod_id}' "
                     f"(see: py tools/scripts/mods_manage.py list)")


def run_hook(mod: Mod) -> None:
    """Materialize a pack's files/ payloads via its build.py hook."""
    if mod.build_py.is_file():
        print(f"[build] {mod.id}: running build.py")
        ctx = SimpleNamespace(
            mod=mod,
            root=mod.root,
            files=mod.files_dir,
            src=mod.src_dir,
            extract=EXTRACT_FILES,
            scripts=SCRIPTS,
            repo=REPO,
            rom=ROM,
        )

        def run(cmd: list[str]) -> None:
            print(f"  $ {' '.join(str(c) for c in cmd)}")
            subprocess.run([str(c) for c in cmd], cwd=REPO, check=True)

        ctx.run = run
        mod.files_dir.mkdir(parents=True, exist_ok=True)
        if str(SCRIPTS) not in sys.path:
            sys.path.insert(0, str(SCRIPTS))
        ns = runpy.run_path(str(mod.build_py))
        build_fn = ns.get("build")
        if not callable(build_fn):
            raise SystemExit(
                f"[!] {mod.id}: build.py must define a function 'build(ctx)'")
        build_fn(ctx)
    elif not mod.built_payloads():
        raise SystemExit(
            f"[!] {mod.id}: no files/ payloads and no build.py hook — either "
            f"add a build.py or place replacement files under {mod.id}/files/")


def cmd_list(_args) -> int:
    mods = iter_mods()
    if not mods:
        print("No packs installed under recomp/mods/.")
        return 0
    print(f"{'id':<24} {'enabled':<8} {'version':<8} payloads  name")
    for mod in mods:
        n = len(mod.built_payloads())
        print(f"{mod.id:<24} {'yes' if mod.enabled else 'no':<8} "
              f"{mod.version:<8} {n:<8}  {mod.name}")
    return 0


def cmd_enable(args) -> int:
    mod = find_mod(args.mod_id)
    mod.set_enabled(True)
    print(f"enabled {mod.id} — run 'py tools/scripts/mods_manage.py compose' "
          f"to rebuild game-mod.generated.toml")
    return 0


def cmd_disable(args) -> int:
    mod = find_mod(args.mod_id)
    mod.set_enabled(False)
    print(f"disabled {mod.id} — run 'py tools/scripts/mods_manage.py compose' "
          f"to rebuild game-mod.generated.toml")
    return 0


def cmd_build(args) -> int:
    mods = [find_mod(m) for m in args.mod_ids] if args.mod_ids else iter_mods()
    if not mods:
        print("No packs installed under recomp/mods/.")
        return 0
    for mod in mods:
        run_hook(mod)
        n = len(mod.built_payloads())
        print(f"[build] {mod.id}: {n} payload file(s) in files/")
    return 0


def cmd_compose(args) -> int:
    if not ROM.is_file():
        raise SystemExit(
            "[!] rom/jus.nds not found. Copy your legally dumped JUS ROM to "
            "rom/jus.nds (sha1 gate: see recomp/game.toml) and extract it "
            "with ds-decomp before composing mods.")
    rom_bytes = ROM.read_bytes()
    if not BASE_CONFIG.is_file():
        raise SystemExit("[!] recomp/game-mod.toml (base template) missing")
    from mods_build import resolve_mod_files  # noqa: E402

    base_text = BASE_CONFIG.read_text(encoding="utf-8")
    head = base_text.split("[[mods.overlays]]", 1)[0].rstrip()

    blocks: list[str] = []
    total = 0
    included: list[str] = []
    # Shared relocation cursor: packs whose payloads outgrow their in-place
    # slack are relocated into the ROM's trailing free space; threading the
    # cursor across packs keeps their relocated extents collision-free.
    reloc_state: dict = {}
    for mod in iter_mods():
        if not mod.enabled:
            continue
        if args.rebuild or not mod.built_payloads():
            run_hook(mod)
        if not mod.built_payloads():
            print(f"[!] {mod.id}: nothing to overlay (empty files/) — skipped")
            continue
        overlays, notes = resolve_mod_files(rom_bytes, mod.files_dir,
                                            reloc_state)
        if not overlays:
            print(f"[!] {mod.id}: no overlays resolved — skipped")
            continue
        lines = ["",
                 f"# ── mod: {mod.name} ({mod.id}) v{mod.version} ──"]
        lines += notes
        for offset, rel_file in overlays:
            lines.append("[[mods.overlays]]")
            lines.append(f"offset = 0x{offset:X}")
            lines.append(f'file = "{rel_file}"')
        blocks.append("\n".join(lines))
        included.append(f"{mod.id} ({len(overlays)})")
        total += len(overlays)

    GENERATED_CONFIG.write_text(head + "\n" + "\n".join(blocks) + "\n",
                                encoding="utf-8")
    print(f"wrote {GENERATED_CONFIG.relative_to(REPO)} "
          f"({total} overlays from {len(included)} pack(s): "
          f"{', '.join(included)})")
    print("play with: recomp\\play_mod.cmd")
    return 0


def main() -> int:
    ap = argparse.ArgumentParser(
        description="JUS Decomp mod pack manager (see decomp/docs/MODS.md)",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog=__doc__.split("Commands:", 1)[1].rstrip())
    sub = ap.add_subparsers(dest="cmd", required=True)

    sub.add_parser("list", help="show installed packs")
    sub.add_parser("status", help="alias of list")

    p = sub.add_parser("enable")
    p.add_argument("mod_id")
    p = sub.add_parser("disable")
    p.add_argument("mod_id")

    p = sub.add_parser("build")
    p.add_argument("mod_ids", nargs="*",
                   help="pack ids (default: all installed packs)")

    p = sub.add_parser("compose")
    p.add_argument("--rebuild", action="store_true",
                   help="force rebuild of every enabled pack's files/")

    args = ap.parse_args()
    if args.cmd == "list" or args.cmd == "status":
        return cmd_list(args)
    if args.cmd == "enable":
        return cmd_enable(args)
    if args.cmd == "disable":
        return cmd_disable(args)
    if args.cmd == "build":
        return cmd_build(args)
    return cmd_compose(args)


if __name__ == "__main__":
    raise SystemExit(main())
