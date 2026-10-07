# Bounded ARM7 candidate graph

Task `jus-bjry.17` adds one immutable Rust owner over checked ARM7 span observations. It connects explicitly selected instruction starts and records candidate caller paths, original guards and unresolved frontiers. It never decodes another span, infers a function end or establishes runtime execution.

The native design was selected after two complete candidates and an independent cross-judge. See [selection.md](arm7-reachable-design/selection.md). The new module borrows existing private `SpanObservation` values. JSON is an inspection report and cannot construct a graph. Roots reference an exact supplied observation, instruction start and nonempty caller assumption.

## Build the research producer

Reconstruct accepted DSD source `7b3513f05adc88a1cca8b0365d3a3607a50a1b25` using the [physical baseline recipe](arm7-physical-baseline/README.md). Apply [source.patch](arm7-reachable-proof/source.patch) with strict whitespace checks. The resulting tree must be `75215439eec429f6dd82df8a9f49bba054a16839`; frozen source commit is `71e766e562c78d4b0ec404b3b4edbe242a8d1b0f`. Only the graph module, analysis export, public tests and research example change.

Use private Cargo home and target directories. Prevent generated Python bytecode in the source checkout with `PYTHONDONTWRITEBYTECODE=1`. Prepare and check the pinned local unarm dependency, then run the library, example and documentation tests. The CLI has one additional unit test. Strict clippy uses only the existing `clippy::chunks_exact_to_as_chunks` allowance at unchanged baseline sites.

The reviewed release recipe builds the CLI and both examples together. Building only the graph probe uses a different dependency feature set and produces a different binary. [release-recipe.json](arm7-reachable-proof/worker/release-recipe.json) records the exact argv, tool hashes and environment. With Rust/Cargo 1.98.1 on macOS arm64, set source remapping to `/dsd-source` and Cargo-home remapping to `/cargo-home`, in that order:

```sh
cargo build -p ds-decomp-cli -p ds-decomp --release --locked --offline \
  --bin dsd --example arm7_reachable_probe --example arm7_physical_baseline
```

The research producer SHA256 is `28e47852e593d3636d66c797c67963f5c052840c7e0e171ea7dd0dd1bda497ff`. Worker, root and independent reviewer reproduce all three release hashes. Existing canonical production and analyzer/codec role pins remain unchanged. The changed legacy CLI and physical-example binaries are compatibility evidence, not replacements for those approved roles.

## Supply selections and assumptions

The producer takes six positional arguments:

```text
arm7_reachable_probe ROM LAYOUT_JSON LAYOUT_SHA256 REQUESTS_JSON REQUESTS_SHA256 SELF_SHA256
```

The request contains separate full program identities, selected region/mode/extents and roots referencing a selection index. The probe constructs fresh checked observations before converting those indexes into actual borrows. [calls-requests.json](arm7-reachable-proof/calls-requests.json) and [startup-requests.json](arm7-reachable-proof/startup-requests.json) provide the bounded fixtures. The header justifies an address; mode and execution remain explicit assumptions. Unknown fields and malformed identities, selections, roots or pins reject without a success report.

Same-mode duplicates and overlaps reject atomically. Opposite-mode overlap blocks every intersecting whole instruction. Only a mapped initialized target with matching full program, CPU, region and required mode can join a selected instruction start. Thumb BL interiors, BSS, unresolved mappings, indirect transfers and unselected addresses remain frontiers. Adding another observation never repairs omitted byte ownership. Witnesses preserve every original transfer; they do not solve guard feasibility or establish that calls return.

Each root visits at most N supplied instructions and examines at most E retained edges. Back edges stay in the graph. Retained graph and per-root predecessor/frontier storage use `O(N + E + R*(N + E))` space for R roots. The checked observer emits at most three transfers per instruction, so `E <= 3N` and this simplifies to the design bound `O(N + E + R*N)` for current API inputs. A witness is materialized on demand and returns `Result` for allocation failure. Report size can be larger than retained graph storage.

## Verified results

Both distinct program instances reproduce the five-instruction call chain from `037f8468` through `037f846c`, `037fcecc`, `037fced0` and `037fced4`. Seven original transfers yield four joins and three frontiers: call destination `037fd02c` and guarded call-return continuations `037f8470` and `037fced8`. Equal payload bytes never merge parent and child identity.

The startup root visits eleven instructions and examines twelve transfers, retaining BLT `02380028 -> 02380020` and its condition-failed frontier at `0238002c`. An independently selected suffix visits three instructions and retains unknown BX at `023800c8`. No path across the unselected gap is asserted. Every selected observation, source condition and transfer matches the accepted grounding evidence exactly.

Root and independent suites pass 97 library/example behavior tests, one constructor-authority doctest and one CLI unit test, with no failures or ignored tests. The worker retains compiled behavior failures before implementation. Independent review passes twenty malformed-probe checks and audits 157 tracked source files, 349 registry packages containing 15,458 archive files, three pinned Git dependencies with recursive submodules, and 47 prepared unarm files. Inventories are identical before and after the build.

Fresh root strict ARM9 initialization preserves all 51 parent and nine child metadata files. Direct original NDS header/FAT and ELF load-segment readback reproduces both 165,552-byte ARM7 images exactly, with six load segments and 21,424 separate BSS bytes each. All 28 snapshotted approval/canonical files, including the old sixteen-file physical capsule, remain unchanged. See [root-proof.json](arm7-reachable-proof/root-proof.json) and [independent-review.json](arm7-reachable-proof/independent/independent-review.json).

This research earns zero ARM7 source bytes. Original function extents, executable classification, original relocations and startup external-RAM dependencies remain unresolved. The accepted canonical reconstruction still has seven parent source functions totaling 304 bytes; global coverage is unknown, emulator smoke is not run, and T06/T10 remain open.

The [final publication review](arm7-reachable-proof/public-final-accepted.json) accepts the package with no remaining findings and binds the [reviewed root proof](arm7-reachable-proof/reviewed-root-proof.json). The current root proof records that acceptance and pins the preserved review receipts.
