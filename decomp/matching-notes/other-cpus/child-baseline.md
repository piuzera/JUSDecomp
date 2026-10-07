# Candidate child ARM9 reference baseline

The candidate tool passes strict initialization, native linking, all three initialized-image comparisons, linked load and BSS boundaries, dsd module and symbol checks, and 35,092 independent relocation checks. This baseline uses original reference objects exclusively. It gives zero source credit and does not establish a matching compressed child ROM, an ARM7 baseline, or T10 completion.

`dsd-child-swi-report.json` records the source parent, patch, source tree, compiler and binary hashes. `child-arm9-native-baseline.json` records the emitted image and artifact hashes. The independently pinned LLVM tool hashes match the existing toolchain lock. The original dsd remains the integration pin.

The missing call is a real Thumb BL to `CpuSet` at `0x02000822`. The child puts BIOS wrappers between offsets `0x800` and `0x850`, following a zero-filled secure area. The specialized scanner excluded this range. Generic discovery aligned the six-byte `Mod` wrapper's end to four bytes and skipped the two-aligned `CpuSet` start. The specialized state machine also discarded the first instruction of each adjacent wrapper. The patch extends the strict SWI matcher through the bounded pre-entry prefix and resets it after each emitted wrapper. Generic alignment and strict missing-call errors remain unchanged.

Three invented fixtures reproduce the defects and check prefix bounds. Both missing-wrapper regressions failed with one function instead of two before the state reset. All five library tests pass afterward. Stable `cargo fmt --all -- --check` rejects pre-existing upstream formatting that uses nightly options, including untouched files. No repository-wide reformat was applied.

## Build the candidate tool

Use a separate source checkout. Apply the patch only to the exact parent revision:

```sh
git clone https://github.com/AetiasHax/ds-decomp.git "$DSD_SOURCE"
git -C "$DSD_SOURCE" checkout 9f6c1b11c8f4b384ffcdc75b2c6d863cd371dcfe
git -C "$DSD_SOURCE" apply "$JUS_ROOT/decomp/matching-notes/other-cpus/dsd-child-swi.patch"
cargo test --locked --manifest-path "$DSD_SOURCE/Cargo.toml" -p ds-decomp --lib
cargo build --locked --manifest-path "$DSD_SOURCE/Cargo.toml" --profile release-fast -p ds-decomp-cli
```

The producer's local source commit is `78630f8f54835e0e627cd4e45a9626d88c307f8b`, directly after the original parent. Its native macOS ARM64 binary SHA256 is `d1117b6126a27c3c1f8d429840c61671f492d7bcb22bedc84e42ed8509a5041f`. Record the hash of an independently built artifact before using it. Tool version output remains `ds-decomp-cli 0.12.0`, so the version string alone does not identify this repair.

## Build and check the child reference images

Set `PATCHED_DSD` to the candidate binary, `BUILD` to a fresh absolute ignored directory, and `CHILD_CONFIG` to the fresh child extraction's `config.yaml`. Set `LLD` and `CLANG` to the independently pinned LLVM executables. Run from the JUSDecomp root:

```sh
"$PATCHED_DSD" init --rom-config "$CHILD_CONFIG" --output-path "$BUILD/config" --build-path "$BUILD/linked"
python3 - "$BUILD/config/arm9/config.yaml" <<'PY'
from pathlib import Path
import sys
p = Path(sys.argv[1])
p.write_text(p.read_text().replace('delinks_path: ../../linked/delinks', 'delinks_path: ../../delinks'))
PY
"$PATCHED_DSD" delink -c "$BUILD/config/arm9/config.yaml"
"$PATCHED_DSD" lcf -c "$BUILD/config/arm9/config.yaml"
python3 tools/scripts/native_link.py --lcf "$BUILD/linked/arm9.lcf" --objects "$BUILD/delinks" --output "$BUILD/native-link" --lld "$LLD" --clang "$CLANG"
python3 - "$BUILD" <<'PY'
from pathlib import Path
import shutil, sys
b = Path(sys.argv[1])
for name in ('arm9.bin', 'itcm.bin', 'dtcm.bin'):
    shutil.copyfile(b / 'native-link' / name, b / 'linked/build' / name)
PY
"$PATCHED_DSD" check modules -c "$BUILD/config/arm9/config.yaml" --fail
"$PATCHED_DSD" check symbols -c "$BUILD/config/arm9/config.yaml" -e "$BUILD/native-link/dsd-check.elf" --fail
python3 - "$BUILD" <<'PY'
from pathlib import Path
import json, sys
sys.path.insert(0, 'tools/scripts')
from relocation_check import validate_relocations
b = Path(sys.argv[1])
result = validate_relocations(sorted((b / 'delinks').glob('*.o')), b / 'native-link/linked.elf')
print(json.dumps(result, indent=2))
assert result['status'] == 'passed'
PY
```

The producer also checked live linker argv, scripts and selected objects through `verify.verify_link_record`, using independent LLVM hashes. Each emitted payload equals its fresh extracted image and the initialized prefix of its linked ELF section. Original load bases and BSS sizes are main `0x02000000` with 105,760 bytes, ITCM `0x01ff8000` with zero bytes, and DTCM `0x027c0000` with 32 bytes. The ELF BSS start and end symbols and section memory sizes match those values.

The child main extraction clears `compressed_static_end`. Its raw linked SHA256 is `50598daa262a3e1f174b46b76fc24024a020f562e55a00318a674c116290452d`. Restoring only the original word from pinned metadata yields the original expanded main hash. `other_executables.verify_extracted_arm9_modules` enforces this comparison and rejects other byte changes.

The analyzer emits 7,174 main function records and ten ITCM records. Thirteen main records overlap earlier function extents, including BIOS return tails. These are generated records, not a verified count of original source functions. Every source-function count remains zero, and the remaining original function boundaries remain unresolved.

Root independently applied and built the published patch, obtaining the same
native tool hash. `dsd-child-swi-root-report.json` and its test log record strict
child initialization and all five Rust tests. `child-arm9-root-baseline.json`
records independently emitted image, symbol and relocation checks.
The candidate tool also passes strict parent initialization and the existing
19-stage exact parent ROM reconstruction. `patched-parent-strict-init.json`,
`patched-parent-source-report.json` and `patched-parent-toolchain.lock.json`
record these isolated compatibility checks. The temporary lock pins the repaired
source commit; the production lock still uses the original release tool.
