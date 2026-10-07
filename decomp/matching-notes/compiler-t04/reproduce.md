# Reproduce the compiler sweep

Supply a successful private T03 verification directory, the pinned dsd binary,
the extracted compiler archive, and wibo. Use a fresh output directory for each
sweep. Run these commands from the repository root.

Set the private paths:

```sh
export T04_BASE=/private/tmp/jus-track-a/build/verify-t03-final
export T04_DSD=/private/tmp/jus-track-a/tools/dsd/dsd-macos-arm64
export T04_COMPILERS=/private/tmp/jus-track-a/tools/mwccarm
export T04_RUNNER=/private/tmp/jus-track-a/tools/wibo/wibo-macos
export T04_TARGETS="$PWD/build/compiler-t04-reproduction"
```

Create a private configuration with the saved target ranges:

```sh
python3 - <<'PY'
import json, os, re, shutil
from pathlib import Path
base = Path(os.environ['T04_BASE']).resolve()
out = Path(os.environ['T04_TARGETS']).resolve()
out.mkdir(parents=True, exist_ok=False)
shutil.copytree(base / 'config', out / 'config')
config = out / 'config/config.yaml'
text = config.read_text()
for key, path in [('rom_config', base / 'extract/config.yaml'),
                  ('build_path', out / 'linked'), ('delinks_path', out / 'delinks')]:
    text = re.sub(r'^' + key + r':.*$', key + ': ' + str(path), text, flags=re.M)
config.write_text(text)
manifest = json.loads(Path('decomp/compiler-experiments.json').read_text())
for unit in manifest['translation_units']:
    identity = unit['identity']
    path = out / 'config' / ('delinks.txt' if identity['module'] == 'main'
                             else 'overlays/' + identity['module'] + '/delinks.txt')
    start, end = identity['address'], identity['address'] + identity['size']
    entry = unit['object'][:-2] + '.c'
    with path.open('a') as stream:
        stream.write('\n' + entry + ':\n    complete\n    .text start:' + hex(start)
                     + ' end:' + hex(end) + '\n')
PY
"$T04_DSD" delink -c "$T04_TARGETS/config/config.yaml"
```

Run the pinned sweep:

```sh
python3 tools/scripts/compiler_experiments.py \
  --manifest decomp/compiler-experiments.json \
  --root "$PWD" \
  --reference-dir "$T04_TARGETS/delinks" \
  --tool-root "$T04_COMPILERS" \
  --runner "$T04_RUNNER" \
  --output build/compiler-t04-reproduced-sweep
```

Inspect `build/compiler-t04-reproduced-sweep/report.json`. The saved experiment
has 288 successful compilations and zero exact original matches. Source coverage
remains zero for these targets. The runner rejects a reference with a different
hash. Keep all reference and compiled object files private.

Run public rejection tests:

```sh
python3 -m unittest discover -s tests/matching -p test_compiler_experiments.py
```
