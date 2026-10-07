# Reproduce the native ARM9 baseline

Complete steps 1 through 4 of [reproduce.md](reproduce.md) in a fresh directory.
Use LLVM lld and Clang 23.1.2 with the hashes in
[toolchain.lock.json](../../toolchain.lock.json).

1. Link the reference objects with the native adapter.

```sh
set -eu
test ! -e build/baseline-t01/native-link-final
python3 tools/scripts/native_link.py \
  --lcf build/baseline-t01/linked/arm9.lcf \
  --objects build/baseline-t01/delinks \
  --output build/baseline-t01/native-link-final \
  --lld /opt/homebrew/bin/ld.lld \
  --clang /opt/homebrew/opt/llvm/bin/clang
```

2. Point a copied dsd configuration at the emitted module files.

```sh
python3 - <<'PY'
from pathlib import Path
import shutil
run = Path('build/baseline-t01')
directory = run / 'native-final-config'
shutil.copytree(run / 'config', directory)
path = directory / 'config.yaml'
path.write_text(path.read_text().replace(
    'object: ../linked/build/', 'object: ../native-link-final/'))
PY
```

3. Run the original module and symbol checks.

```sh
tools/dsd/dsd-macos-arm64 check modules \
  -c build/baseline-t01/native-final-config/config.yaml -f
tools/dsd/dsd-macos-arm64 check symbols \
  -c build/baseline-t01/native-final-config/config.yaml \
  -e build/baseline-t01/native-link-final/dsd-check.elf -f
python3 -m unittest discover -s tests/matching -p 'test_*.py' -v
```

Both checks must exit 0. The module check lists main, ITCM, DTCM, and overlays 0
through 13 as `OK`. Symbol checking succeeds without diagnostic output.
The ELF and generated modules are private artifacts under ignored `build/`.
