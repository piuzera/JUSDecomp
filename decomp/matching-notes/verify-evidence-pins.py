"""Verify acceptance artifact hashes against Git HEAD and working files."""
import argparse
import hashlib
import json
from pathlib import Path, PurePosixPath
import subprocess
import sys


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('acceptance', nargs='+', type=Path)
    args = parser.parse_args()
    root = Path(subprocess.check_output(['git', 'rev-parse', '--show-toplevel'], text=True).strip())
    tracked = set(subprocess.check_output(['git', 'ls-tree', '-r', '--name-only', '-z', 'HEAD'], cwd=root).decode().split('\0'))
    failures = []
    count = 0
    for manifest in args.acceptance:
        pins = json.loads(manifest.read_text())['artifact_sha256']
        for name, expected in pins.items():
            count += 1
            path = PurePosixPath(name)
            if path.is_absolute() or '..' in path.parts or name not in tracked:
                failures.append(f'{name}: not tracked at HEAD')
                continue
            committed = subprocess.check_output(['git', 'show', 'HEAD:' + name], cwd=root)
            if hashlib.sha256(committed).hexdigest() != expected:
                failures.append(f'{name}: committed hash mismatch')
            target = root / name
            if not target.is_file() or hashlib.sha256(target.read_bytes()).hexdigest() != expected:
                failures.append(f'{name}: working file hash mismatch')
    if failures:
        print('\n'.join(failures), file=sys.stderr)
        return 1
    print(f'Verified {count} published pins against Git HEAD and working files.')
    return 0


if __name__ == '__main__':
    raise SystemExit(main())
