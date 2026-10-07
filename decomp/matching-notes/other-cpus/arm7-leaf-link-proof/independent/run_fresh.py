"""Use exact public linker experiment with independently compiled pinned objects."""
from pathlib import Path
import importlib.util

SCRIPT=Path('/private/tmp/jus-arm7-leaf-link-independent/decomp/matching-notes/other-cpus/arm7-leaf-link-proof/run.py')
spec=importlib.util.spec_from_file_location('public_link_experiment',SCRIPT)
module=importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)
module.MW_OBJECT=Path('/private/tmp/jus-arm7-leaf-independent-proof/closed-reproduced/O4p/compiled.o')
module.WRONG_OBJECT=Path('/private/tmp/jus-arm7-leaf-independent-proof/closed-reproduced/baseline/compiled.o')
raise SystemExit(module.main(Path('/private/tmp/jus-arm7-leaf-link-independent-proof/actual-fresh')))
