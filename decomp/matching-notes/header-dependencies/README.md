# Declared header dependency gate

The pinned MW 2.0/base compiler, Wibo 1.2.0 and their locked runtime libraries
compile the public synthetic fixture with a source-relative header, macro-selected
header and forced header. The raw object passes the source-object gate. Changing
the macro include context fails with zero accepted objects; the reference remains
unchanged. This fixture is independent of JUS and earns no JUS source coverage.

Run from the repository root with private pinned tools and a fresh output path:

```sh
python3 decomp/matching-notes/header-dependencies/reproduce.py \
  --compiler "$JUS_MW_COMPILER" --runner "$JUS_MW_RUNNER" \
  --output build/header-dependencies/reproduced
JUS_MW_COMPILER="$JUS_MW_COMPILER" JUS_MW_RUNNER="$JUS_MW_RUNNER" \
  python3 -m unittest discover -s tests/matching -p test_header_dependencies.py
```

`public-fixture-summary.json` records the actual successful fixture's ordered
consumed files and matching before/after hashes. Private output reports contain
the complete subprocess commands, stdout/stderr, exit statuses, object hashes,
captured dependency-text/file hashes and environment digest. No tool binaries or JUS
payloads are included here.

A header-bearing TU declares:

```json
{
  "flags": ["-Cpp_exceptions", "off", "-nostdinc", "-cwd", "source"],
  "include_paths": ["path/to/include"],
  "forced_headers": ["path/to/forced.h"],
  "headers": {
    "path/to/source/local.h": "<sha256>",
    "path/to/include/macro.h": "<sha256>",
    "path/to/forced.h": "<sha256>"
  }
}
```

Compiler, runner and ABI fields retain the existing per-TU pins. `headers` is the
exact set consumed, including conditional and nested includes; every declared
header must be consumed. Include paths and forced headers preserve manifest order.
Header paths must be canonical relative paths under the project root and under a
declared source, include or forced-header directory. Symlinks are rejected.

`capture_and_compile` checks declared hashes before invoking the compiler, runs
`-M` without object generation, then runs `-MD -gccdepends` into fresh object and
`.d` files. Both invocations use identical explicit context and environment. Every
source/header/tool hash is checked after each invocation. Compilation must consume
the same ordered dependency list as preflight. Missing output, changed context,
undeclared or out-of-root headers, malformed records and compiler failures reject
the TU. There is no fallback to compilation without capture.

This Windows compiler requires `-i path` or joined `-Ipath`; separated uppercase
`-I path` is invalid. Generated include paths use `-i`. Forced headers use explicit
Wibo `Z:/absolute/path` arguments. Angle includes can use the explicitly declared
`-I-` flag before generated `-i` paths; this changes searching to explicit paths,
so the source directory must also appear in `include_paths` when needed. The gate
does not insert `-I-` or change include search semantics implicitly.

The bounded make parser accepts one rule, Windows separators, Wibo's `Z:` mapping,
CRLF continuations and backslash-escaped spaces observed in actual MW output.
Other drive mappings, UNC paths, multiple targets/rules, duplicates, make variables,
comments and ambiguous records are rejected. Compiler diagnostics mixed into a
record cannot silently pass. Binary/precompiled headers and raw prefix/precompilation, command-file,
include-path, output or dependency overrides are rejected; use structured fields.

Header-free canonical TUs keep the existing single compilation and record explicit
`dependencies.policy = "header_free"`. Compiler experiments retain their stricter
header-free policy. Dependencies award zero source credit; raw object, link-input,
ownership, relocation, module, symbol and whole-ROM gates remain necessary. A fresh
real JUS run with this change passed all 19 stages and reproduced the original ROM.

Reviewed producer `a2ffe1df8a3da44084978f6d481110bdb3049900` passed 159 tests without skips.
`source-report.json` records the fresh 19-stage JUS source verification;
`tests.log` and `review.json` retain the test and independent review results.
