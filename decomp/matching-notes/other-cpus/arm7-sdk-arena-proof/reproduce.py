"""Replay this package into a new private directory.

Usage: python3 reproduce.py NEW_OUTPUT_DIRECTORY
The original ROM, layout, producer, and LLVM remain read-only external inputs.
"""
import hashlib
import json
import subprocess
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
OUT = Path(sys.argv[1]).resolve()
OUT.mkdir()
argv = json.loads((HERE / 'commands.json').read_text())[0]
argv[4] = str(HERE / 'requests.json')
assert hashlib.sha256((HERE / 'requests.json').read_bytes()).hexdigest() == argv[5]
assert hashlib.sha256(Path(argv[0]).read_bytes()).hexdigest() == argv[6]
result = subprocess.run(argv, capture_output=True, check=True)
assert result.stderr == b''
(OUT / 'report.json').write_bytes(result.stdout)
(OUT / 'replay-commands.json').write_text(json.dumps([argv], indent=2) + '\n')
subprocess.run([sys.executable, str(HERE / 'read_original.py'), str(OUT)], check=True)
subprocess.run([sys.executable, str(HERE / 'summarize_report.py'), str(OUT)], check=True)
for name in ('graph-summary.json', 'original-read.json',
             'llvm-setter-pair.txt', 'llvm-caller-tail.txt'):
    assert (OUT / name).read_bytes() == (HERE / name).read_bytes(), name
print('Fresh graph, independent original reads, and LLVM match the published capsule.')
