# Verify pinned symbol provenance

The optional local provenance check now reads the actual document and bead
ledger at each claimed Git revision. A nonexistent commit, a different
committed document, or a bead that was still open at that revision rejects.
The working document and live closed-bead checks still apply.

The [actual report](report.json) at producer `6bd4e3a` accepts the same three
reviewed aliases and verifies the original trampoline extent and object hashes.
No linker name or type changes. Offline runs explicitly report `metadata_only`;
local verification reports `working_and_pinned_revision`.

The [test log](tests.log) records 125 passing tests with no skips. Red fixtures
first reproduced nonexistent-commit acceptance and a live closed bead masking
an open bead in the pinned revision.

Supply the metadata root containing `arm9/`, usually `decomp`, to `--config`.
The `--source-build` option expects the verifier report's `source_build` object:

```sh
python3 - <<'PY'
import json
from pathlib import Path
report = json.loads(Path('build/verify-source-fresh/report.json').read_text())
Path('build/source-build.json').write_text(json.dumps(report['source_build']))
PY
python3 tools/scripts/symbol_identities.py \
  --config decomp \
  --aliases decomp/symbol-aliases.json \
  --provenance-root /path/to/jus_re \
  --source-build build/source-build.json \
  --output build/symbol-identities.json
```
