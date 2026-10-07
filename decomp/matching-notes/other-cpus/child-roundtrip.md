# Child ARM9 binary roundtrip candidate

The existing ds-rom 0.8.0 compressor reproduces all 1,955,956 original stored child ARM9 bytes. A fresh encoding of the verified native main, ITCM and DTCM images, plus the original 24-byte autoload table, reproduces the complete `ChildRom/JSS2Child.srl` SHA256 `1f68f8a95818ca23e359aa24ab21b7353b6e3515964957f0f519caaaa6ec4986`. No codec change is required.

This proves a reference binary roundtrip. Source bytes and functions remain zero. ARM7 is preserved, its linked baseline remains unresolved, and T10 remains open. These candidate tools are separate from production tool pins and the parent verification pipeline.

## Reproduce the candidate

First follow [the child baseline instructions](child-baseline.md) to obtain the independently patched analyzer and verified native reference images. Keep the original tool lock unchanged. The codec example below uses the original upstream Cargo.lock; it imports the unchanged ds-rom 0.8.0 library. The analyzer repair does not change the compressor.

Set `JUS_ROOT` to this repository, `DSD_SOURCE` to that isolated source checkout, `CHILD` to the original extracted child, `NATIVE` to the verified child native-link directory, and `OUTPUT` to a fresh ignored directory. Independently verify the native linker inputs and actual LLVM tool hashes using `verify.verify_link_record` before packaging. The packer checks actual image hashes against the pinned executable inventory, but it does not substitute for that link check.

```sh
mkdir -p "$DSD_SOURCE/lib/examples"
cp "$JUS_ROOT/decomp/matching-notes/other-cpus/child_compression_probe.rs" "$DSD_SOURCE/lib/examples/t10_compression_probe.rs"
cargo test --locked --manifest-path "$DSD_SOURCE/Cargo.toml" -p ds-decomp --example t10_compression_probe
cargo build --locked --manifest-path "$DSD_SOURCE/Cargo.toml" --profile release-fast -p ds-decomp --example t10_compression_probe
CODEC="$DSD_SOURCE/target/release-fast/examples/t10_compression_probe"
shasum -a 256 "$CODEC" "$DSD_SOURCE/Cargo.lock" "$JUS_ROOT/decomp/matching-notes/other-cpus/child_compression_probe.rs"
python3 -m unittest discover -s tests/matching -p test_child_rom_roundtrip.py
```

Record the actual independently built codec hash as `CODEC_SHA256`. The producer's artifact hash is `99f89606cc359780861c44416cf7b6bae8fc2af1afa8a29e9ecb94914d1c3c51`; a rebuild on another host need not produce that artifact hash. The original Cargo.lock SHA256 is `836cf74bb237bf4ca61295c586af6a09564fb8e2620405ff8b863639c97907e2`, and the published example source SHA256 is `9baf8ab864540b9eaca6b7916f57074459ce89b5b95bb98d62bfa2c3180783c6`.

```sh
python3 tools/scripts/child_rom_roundtrip.py \
  --child "$CHILD" \
  --ledger decomp/matching-notes/other-cpus/residual-executables.json \
  --native "$NATIVE" \
  --encoder "$CODEC" --encoder-sha256 "$CODEC_SHA256" \
  --output "$OUTPUT/rebuilt-child.srl" --report "$OUTPUT/roundtrip.json"
shasum -a 256 "$CHILD" "$OUTPUT/rebuilt-child.srl"
cmp "$CHILD" "$OUTPUT/rebuilt-child.srl"
```

The packer reads each native image, verifies its original-domain hash, and assembles the complete expanded image. It clears the extraction-normalized compression pointer before encoding, as ds-rom does. It invokes the approved codec into a fresh temporary output, rehashes all live inputs, and requires its decoded output to equal the assembled native images. It then writes the generated `compressed_static_end` word at offset `0xbb8`, requires the exact original stored ARM9 hash, replaces the entire ARM9 region, and requires the exact whole-child hash. Header, FNT/FAT, ARM7, assets, padding and multiboot signature are preserved from the original template. Every declared child ARM9 image comes from the native files; original stored ARM9 bytes are used only for comparison and layout metadata.

The public tests use invented bytes. They reject changed or omitted native modules, changed preserved bytes, a wrong codec hash, missing codec output, input mutation during encoding, copied original stored bytes with an uncleared compression pointer, an alternative valid encoding of different size, and incomplete expanded layouts. Existing outputs cannot be overwritten.

## Why the generic ROM builder is insufficient

The pinned `dsd rom build` fails before producing a child ROM. Its extracted config names an empty `files/` directory that extraction does not create. Creating that directory reveals a panic in ds-rom 0.8.0 `src/rom/file.rs:238`: `find_first_file_id` assumes every directory has a child. The original child has a nine-byte root-only FNT and a zero-byte FAT.

The builder also reconstructs layout. `Rom::build` starts ARM9 at the next configured alignment after its header placeholder, whereas the child stores it at `0x4000`. It pads the result to a power of two, whereas the original child is trimmed to 2,141,384 bytes, including the 136-byte multiboot signature after the declared used ROM size. These source behaviors are independent of compression and are left unchanged. The bounded packer preserves the authoritative original layout instead.

The public [metadata report](child-rom-roundtrip.json) records hashes, source revisions, codec footer fields, preserved scope and the remaining limitations. No ROM, extracted executable or tool binary is committed.

Root independently rebuilt the codec with the same source, Cargo.lock and
artifact hash. `child-codec-root-build.json` and the codec test log record that
run. `child-rom-root-roundtrip.json` records a fresh whole-child comparison
using the independently linked root native images. All 11 public packer tests
pass in `child-rom-root-tests.log`. This remains zero-credit binary verification.
