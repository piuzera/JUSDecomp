import json
from pathlib import Path

dist = Path("dist/JUSDecomp")
print("== dist tree ==")
for p in sorted(dist.rglob("*")):
    if p.is_file() and ("mods/" not in p.as_posix() or p.name in
                        ("modindex.json",)):
        print(f"  {p.as_posix()}  ({p.stat().st_size:,} B)")

idx = json.loads((dist / "mods" / "modindex.json").read_text(encoding="utf-8"))
print("\n== modindex ==")
for m in idx["mods"]:
    print(f"  {m['id']} v{m['version']} — {m['name']}")
    print(f"  overlays: {len(m['overlays'])}, first: {m['overlays'][0]}")
files = list((dist / "mods" / "english-translation" / "files").rglob("*"))
n_files = [p for p in files if p.is_file()]
print(f"  payload files in bundle: {len(n_files)} "
      f"({sum(p.stat().st_size for p in n_files):,} B total)")

print("\n== keyboard feature in bundled runner ==")
exe = (dist / "app" / "nds_runner.exe").read_bytes()
for needle in (b"input.keyboard", b"unknown DS button name"):
    print(f"  {needle.decode()}: {'FOUND' if needle in exe else 'MISSING'}")

print("\n== launcher exe ==")
lexe = (dist / "JUSDecomp.exe").read_bytes()
for needle in (b"Map keyboard...", b"Keyboard setup", b"keyboard_mappings"):
    print(f"  {needle.decode()}: {'FOUND' if needle in lexe else 'MISSING'}")

# stale settings residue check (harmless, informational)
su = dist / "data-user" / "settings.json"
if su.is_file():
    t = su.read_text(encoding="utf-8")
    print(f"\nsettings.json: koma-890 residue = {'koma-890' in t} "
          f"(harmless — unknown ids are ignored)")
