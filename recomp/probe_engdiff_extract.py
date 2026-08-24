import json
from pathlib import Path

rep = json.loads(Path("recomp/eng_diff.json").read_text(encoding="utf-8"))
ext = Path("extract/files")
print("== extract availability of changed files ==")
missing = []
for r in rep["files"]["changed"]:
    p = r["path"]
    cand = ext / p
    alts = []
    if not cand.is_file():
        # dsd may replace dots with underscores in some names
        alts = list(ext.glob(p.replace(".", "_")))
    ok = cand.is_file() or alts
    print(f"  [{'OK' if ok else 'MISS'}] {p}"
          + (f"  (alt: {alts[0].name})" if alts else ""))
    if not ok:
        missing.append(p)
print(f"\nmissing: {missing}")

# how many extract bytes differ from ROM at the FAT extent (sanity for a few)
import sys
sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "tools" / "scripts"))
import eng_diff as ed

s = ed.NdsRom(Path("rom/jus.nds"))
checked = 0
for r in rep["files"]["changed"]:
    p = r["path"]
    cand = ext / p
    if not cand.is_file():
        cand = next(iter(ext.glob(p.replace(".", "_"))), None)
        if cand is None:
            continue
    fid = s.fnt[p]
    st, en = s.fat[fid]
    rom_bytes = s.data[st:en]
    disk = cand.read_bytes()
    same = rom_bytes == disk
    checked += 1
    if not same:
        print(f"  !! {p}: extract copy != ROM bytes ({len(disk)} vs {en - st})")
print(f"verified {checked} extract copies against stock ROM FAT extents")
