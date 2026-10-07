# Reproduce the available T01 stages

Run from a clean checkout of `track-a/matching`. Supply your own original ROM.
The commands use a fresh `build/baseline-t01` directory and leave the committed
ARM9 metadata unchanged.

1. Download the pinned native dsd binary and check its digest.

```sh
set -eu
mkdir -p tools/dsd
gh release download v0.12.0 --repo AetiasHax/ds-decomp \
  --pattern dsd-macos-arm64 --dir tools/dsd
shasum -a 256 tools/dsd/dsd-macos-arm64
chmod +x tools/dsd/dsd-macos-arm64
tools/dsd/dsd-macos-arm64 --version
```

The SHA-256 must be
`2225874387adb0a5b2b4c4912337786efd736aca93b9f92617c95abba61d04f5`.
The version output must be `ds-decomp-cli 0.12.0`.

2. Set `JUS_ROM` to your local dump. Reject a different ROM before extraction.

```sh
export JUS_ROM=/absolute/path/to/your/jus.nds
python3 tools/scripts/baseline_intake.py \
  --rom "$JUS_ROM" --output build/intake.json || exit 1
test ! -e build/baseline-t01 || exit 1
mkdir -p build/baseline-t01/logs
tools/dsd/dsd-macos-arm64 rom extract -r "$JUS_ROM" \
  -o build/baseline-t01/extract > build/baseline-t01/logs/extract.log 2>&1
```

For this version the command is `rom extract`. The upstream README's top-level
`extract` command fails.

3. Copy the pinned metadata into the fresh output tree and redirect its paths.

```sh
python3 - <<'PY'
from pathlib import Path
import shutil
root = Path.cwd()
directory = root / 'build/baseline-t01/config'
shutil.copytree(root / 'decomp/arm9', directory)
config = directory / 'config.yaml'
text = config.read_text()
text = text.replace('rom_config: ../../extract/config.yaml',
                    'rom_config: ../extract/config.yaml')
text = text.replace('build_path: ../../build', 'build_path: ../linked')
text = text.replace('delinks_path: ../../build/delinks', 'delinks_path: ../delinks')
text = text.replace('object: ../../build/build/', 'object: ../linked/build/')
config.write_text(text)
PY
```

4. Generate reference objects and linker inputs. Stop at any failed command.

```sh
tools/dsd/dsd-macos-arm64 delink -c build/baseline-t01/config/config.yaml \
  > build/baseline-t01/logs/delink.log 2>&1
tools/dsd/dsd-macos-arm64 lcf -c build/baseline-t01/config/config.yaml \
  > build/baseline-t01/logs/lcf.log 2>&1
tools/dsd/dsd-macos-arm64 objdiff -c build/baseline-t01/config/config.yaml \
  -o build/baseline-t01/objdiff > build/baseline-t01/logs/objdiff.log 2>&1
```

5. If you have the private linker on a compatible host, use the positional LCF.
Run from `build/baseline-t01/linked` so module outputs follow its relative paths.

```sh
cd build/baseline-t01/linked
"$MWLDARM_PATH" -w off -sym on -nodead -proc v5te -interworking \
  -map closure,unused -symtab sort -nostdlib -m Entry \
  -o final_link.o arm9.lcf @objects.txt
cd ../../..
tools/dsd/dsd-macos-arm64 check modules \
  -c build/baseline-t01/config/config.yaml -f \
  > build/baseline-t01/logs/check-modules.log 2>&1
```

Without the linker, the check exits 1. Do not copy extracted originals into the
linked-output paths or interpret successful generation as baseline acceptance.
The recorded missing-output check is [check-result.json](check-result.json).

6. Run the public intake fixtures.

```sh
python3 -m unittest discover -s tests/matching -p 'test_*.py' -v
```
