#!/usr/bin/env python3
"""Prepare the pinned local unarm source without modifying a Cargo registry.

All tracked upstream files and the added regression test are pinned before and
following the patch. An existing checkout is never reset or updated implicitly.
Git ignore rules do not exempt source or configuration from the inventory.
Only generated output under the checkout's root target/ is exempt.
"""
import argparse
import hashlib
import json
from pathlib import Path
import subprocess
import tomllib

BUNDLE = Path(__file__).resolve().parent


def git(checkout, *arguments):
    return subprocess.check_output(['git', '-C', str(checkout), *arguments], stderr=subprocess.STDOUT)


def sha256(path):
    if path.is_symlink() or not path.is_file():
        raise ValueError(f'source is missing or not a regular file: {path}')
    return hashlib.sha256(path.read_bytes()).hexdigest()


def prepare(checkout, bundle=BUNDLE, check_only=False):
    checkout, bundle = Path(checkout).resolve(), Path(bundle).resolve()
    manifest = json.loads((bundle / 'manifest.json').read_text())
    if manifest['schema_version'] != 1:
        raise ValueError('unsupported preparation manifest')
    patch = bundle / manifest['patch']
    if sha256(patch) != manifest['patch_sha256']:
        raise ValueError('patch hash mismatch')
    before, after = manifest['before_files'], manifest['after_files']
    for name in {*before, *after}:
        path = Path(name)
        if path.is_absolute() or '..' in path.parts:
            raise ValueError('unsafe source path in manifest')
    if not checkout.exists():
        if check_only:
            raise ValueError('prepared source checkout missing')
        checkout.parent.mkdir(parents=True, exist_ok=True)
        subprocess.run(['git', 'clone', '--no-checkout', manifest['upstream_url'], str(checkout)], check=True)
        git(checkout, 'checkout', '--detach', manifest['upstream_commit'])
    if Path(git(checkout, 'rev-parse', '--show-toplevel').decode().strip()).resolve() != checkout:
        raise ValueError('source checkout must be the repository root')
    if git(checkout, 'rev-parse', 'HEAD').decode().strip() != manifest['upstream_commit']:
        raise ValueError('upstream commit mismatch')
    if git(checkout, 'diff', '--cached', '--name-only'):
        raise ValueError('staged source changes are not permitted')
    tracked = set(git(checkout, 'ls-files', '-z').decode().strip('\0').split('\0'))
    if tracked != set(before):
        raise ValueError('tracked source inventory mismatch')
    untracked = set(filter(None, git(checkout, 'ls-files', '--others', '-z').decode().split('\0')))
    added = set(after) - set(before)
    # The pinned workspace uses root target/ only for generated Cargo output.
    # Ignored build.rs, .cargo configuration and other source remain inputs.
    if any(not name.startswith('target/') for name in untracked - added):
        raise ValueError('unexpected untracked source files')
    if sha256(checkout / manifest['license_file']) != manifest['license_sha256']:
        raise ValueError('upstream license hash mismatch')
    package = tomllib.loads((checkout / 'disasm/Cargo.toml').read_text())['package']
    if (package['name'], package['version']) != (manifest['name'], manifest['version']):
        raise ValueError('upstream package/version mismatch')

    def matches(files):
        return all((checkout / name).is_file() and not (checkout / name).is_symlink()
                   and sha256(checkout / name) == expected for name, expected in files.items())

    if matches(after) and not any((checkout / name).exists() for name in set(before) - set(after)):
        status = 'already_prepared'
    elif matches(before) and not any((checkout / name).exists() for name in added):
        if check_only:
            raise ValueError('source patch has not been applied')
        git(checkout, 'apply', '--check', str(patch))
        git(checkout, 'apply', str(patch))
        if not matches(after):
            raise ValueError('patched source hash mismatch')
        status = 'prepared'
    else:
        raise ValueError('source hashes match neither pinned upstream nor pinned repair')
    return {'status': status, 'checkout': str(checkout), 'version': manifest['version'],
            'upstream_commit': manifest['upstream_commit'], 'patch_sha256': manifest['patch_sha256'],
            'verified_source_files': len(after), 'license_sha256': manifest['license_sha256'],
            'untracked_output_allowance': ['target/']}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--checkout', type=Path, default=BUNDLE.parents[1] / 'local-deps/unarm')
    parser.add_argument('--check-only', action='store_true')
    args = parser.parse_args()
    try:
        print(json.dumps(prepare(args.checkout, check_only=args.check_only), indent=2))
    except (ValueError, OSError, subprocess.CalledProcessError) as error:
        parser.exit(1, f'Error: {error}\n')


if __name__ == '__main__':
    main()
