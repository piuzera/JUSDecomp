# Verify a fresh native ARM9 baseline

Run the strict verifier with the pinned tools in
[toolchain.lock.json](../../toolchain.lock.json) and the owner-supplied original
ROM. Choose an output directory that does not exist.

```sh
python3 tools/scripts/verify.py \
	--rom /path/to/jus.nds \
	--output build/verify-fresh \
	--dsd tools/dsd/dsd-macos-arm64 \
	--lld /opt/homebrew/bin/ld.lld \
	--clang /opt/homebrew/opt/llvm/bin/clang
```

The command exits 0 and prints `"status": "passed"` only after all 13 required
stages pass. Read `build/verify-fresh/report.json` for commands, exit statuses,
input hashes, actual linker inputs, module comparisons, and relocation results.
An existing output directory fails without changing its contents. The rejection
report is written beside that directory under a unique name.

Run the public regression suite without a ROM:

```sh
python3 -m unittest discover -s tests/matching -v
```

The recorded run passed 40 tests. [The verification contract](contract.md)
describes supported inputs and scope. [The canonical report](report.json) and
[independent review](review.json) record the passing build at `47ed91d`.
