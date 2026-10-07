# Build and verify the first source TU

The source pipeline replaces the existing overlay 0 trampoline with compiled C.
Its verified extent is 24 bytes: 20 ARM instruction bytes and a 4-byte relocated
literal pool. The pointer declaration uses `extern` because its storage belongs
to ARM9 BSS.

## Supply the pinned tools

Use the dsd, lld, and Clang pins from
[toolchain.lock.json](../../toolchain.lock.json). Supply Metrowerks
`mwccarm/2.0/base/mwccarm.exe` and Wibo 1.2.0 separately. The compiler reports
version 3.0 build 114 despite the archive's `2.0/base` directory name.

The current [decomp.me compiler recipes](https://github.com/decompme/compilers/blob/main/values.yaml)
link to the public archive. The pinned macOS runner is published in the
[Wibo 1.2.0 release](https://github.com/decompals/wibo/releases/tag/1.2.0).
This host runs Wibo's x86_64 executable through Rosetta 2. Downloaded tools and
compiled objects remain ignored local files.

In a checkout without those tools, download the two pinned assets:

```sh
mkdir -p tools/wibo
curl -fL -o tools/mwccarm.zip \
	https://github.com/decompme/compilers/releases/download/compilers/mwccarm.zip
curl -fL -o tools/wibo/wibo-macos \
	https://github.com/decompals/wibo/releases/download/1.2.0/wibo-macos
```

Check their hashes before extracting the archive:

```sh
python3 - <<'PY'
import hashlib, json, zipfile
from pathlib import Path
lock = json.loads(Path('decomp/toolchain.lock.json').read_text())
for path, expected in (
	(Path('tools/mwccarm.zip'), lock['source_compiler']['archive']['sha256']),
	(Path('tools/wibo/wibo-macos'), lock['source_compiler_runner']['sha256']),
):
	assert hashlib.sha256(path.read_bytes()).hexdigest() == expected, path
with zipfile.ZipFile('tools/mwccarm.zip') as archive:
	archive.extractall('tools')
Path('tools/wibo/wibo-macos').chmod(0o755)
PY
```

The strict command also checks the executable and compiler DLL hashes. It checks
actual tool versions and keeps source and tool hashes unchanged during the build.

## Run the source pipeline

Choose a new output directory and supply the original owner ROM:

```sh
python3 tools/scripts/verify.py \
	--rom /path/to/jus.nds \
	--output build/verify-source-fresh \
	--dsd tools/dsd/dsd-macos-arm64 \
	--lld /opt/homebrew/bin/ld.lld \
	--clang /opt/homebrew/opt/llvm/bin/clang \
	--source-manifest decomp/source-manifest.json \
	--source-compiler tools/mwccarm/2.0/base/mwccarm.exe \
	--compiler-runner tools/wibo/wibo-macos
```

The command must exit 0 with `"status": "passed"`. Read its `report.json` for
compiler commands, source/reference/object hashes, section and relocation checks,
actual linker inputs, map ownership, module comparisons, and source coverage.
Omit the three source options to verify the binary reference baseline with zero
source credit.

The source manifest selects whole dsd TUs. Their committed delinks declarations
provide section extents. Duplicate object basenames currently reject because
dsd's LCF names inputs by basename. Compiler flags and include directories are
explicit. The current trampoline has no headers; future TUs must declare their
include context before promotion.

[The contract](contract.md) describes the source gates and accounting limits.
