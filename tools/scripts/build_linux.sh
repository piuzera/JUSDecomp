#!/usr/bin/env bash
# Build the patched ndsrecomp toolchain and JUS runner natively on Linux.
# ROM/extracted inputs and generated banks remain gitignored.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
NDSRECOMP="$ROOT/tools/ndsrecomp"
BASE_COMMIT="e9b530a0e08fe7c270ed97737b1c1495de9d1587"
PATCH="$ROOT/patches/ndsrecomp/0001-jus-runner-modifications.patch"
ROM_SHA1="ba58e20ee60eb81c33dcd4934a21271baa9f954a"
MODE="${1:-full}"

if [[ "$MODE" != "full" && "$MODE" != "--host-only" ]]; then
  echo "Usage: $0 [--host-only]" >&2
  exit 2
fi

need() {
  command -v "$1" >/dev/null 2>&1 || {
    echo "ERROR: missing required command: $1" >&2
    echo "On Arch/Omarchy: sudo pacman -S --needed cmake ninja gcc sdl2 gtk3 python git" >&2
    exit 1
  }
}

for command in git cmake ninja gcc g++ python3 pkg-config; do
  need "$command"
done
if ! pkg-config --exists sdl2 gtk+-3.0; then
  echo "ERROR: SDL2 and GTK3 development files are required." >&2
  echo "On Arch/Omarchy: sudo pacman -S --needed sdl2 gtk3" >&2
  exit 1
fi

build_launcher() {
  cmake -G Ninja -S "$ROOT/launcher" -B "$ROOT/launcher/build-linux" \
    -DCMAKE_BUILD_TYPE=Release
  cmake --build "$ROOT/launcher/build-linux" --parallel
}

if [[ ! -d "$NDSRECOMP/.git" ]]; then
  git clone https://github.com/mstan/ndsrecomp "$NDSRECOMP"
  git -C "$NDSRECOMP" checkout "$BASE_COMMIT"
fi

actual_base="$(git -C "$NDSRECOMP" rev-parse HEAD)"
if [[ "$actual_base" != "$BASE_COMMIT" ]]; then
  echo "ERROR: tools/ndsrecomp is at $actual_base; expected $BASE_COMMIT" >&2
  echo "No files were changed. Check out the pinned commit or move the directory aside." >&2
  exit 1
fi

if git -C "$NDSRECOMP" apply --check "$PATCH" 2>/dev/null; then
  git -C "$NDSRECOMP" apply "$PATCH"
elif ! git -C "$NDSRECOMP" apply --reverse --check "$PATCH" 2>/dev/null; then
  echo "ERROR: ndsrecomp is neither clean nor patched as expected." >&2
  echo "Inspect $NDSRECOMP before continuing; no files were discarded." >&2
  exit 1
fi
git -C "$NDSRECOMP" submodule update --init --recursive third_party/freebios

cmake -G Ninja -S "$NDSRECOMP/recompiler" \
  -B "$NDSRECOMP/recompiler/build-linux" \
  -DCMAKE_BUILD_TYPE=Release
cmake --build "$NDSRECOMP/recompiler/build-linux" --parallel
ctest --test-dir "$NDSRECOMP/recompiler/build-linux" --output-on-failure

RECOMPILER="$NDSRECOMP/recompiler/build-linux/nds_recompile"
FRAMEWORK_BANKS="$NDSRECOMP/generated"
mkdir -p "$FRAMEWORK_BANKS"

generate_bank() {
  "$RECOMPILER" --config "$1" --bin "$2" --out "$3" \
    --bank "$4" --shards "$5"
}

# The runner names both paths unconditionally. Generate the BSD FreeBIOS code
# under the retail and explicit FreeBIOS bank names; no proprietary BIOS is
# needed or included.
generate_bank "$NDSRECOMP/bios/freebios9.toml" \
  "$NDSRECOMP/third_party/freebios/drastic_bios_arm9.bin" \
  "$FRAMEWORK_BANKS" arm9_bios 1
generate_bank "$NDSRECOMP/bios/freebios7.toml" \
  "$NDSRECOMP/third_party/freebios/drastic_bios_arm7.bin" \
  "$FRAMEWORK_BANKS" arm7_bios 1
generate_bank "$NDSRECOMP/bios/freebios9.toml" \
  "$NDSRECOMP/third_party/freebios/drastic_bios_arm9.bin" \
  "$FRAMEWORK_BANKS" freebios_arm9 1
generate_bank "$NDSRECOMP/bios/freebios7.toml" \
  "$NDSRECOMP/third_party/freebios/drastic_bios_arm7.bin" \
  "$FRAMEWORK_BANKS" freebios_arm7 1

if [[ "$MODE" == "--host-only" ]]; then
  cmake -G Ninja -S "$NDSRECOMP/runner" \
    -B "$NDSRECOMP/runner/build-linux" \
    -DCMAKE_BUILD_TYPE=Release \
    -DNDS_BOOTSTRAP_FIRMWARE=ON \
    -DNDS_ENABLE_COMPUTE_RENDERER=ON
  cmake --build "$NDSRECOMP/runner/build-linux" --parallel
  ctest --test-dir "$NDSRECOMP/runner/build-linux" --output-on-failure
  build_launcher

  echo
  echo "Linux host build and tests complete."
  echo "This runner has no JUS title banks; rerun without --host-only after"
  echo "providing your legal ROM and extracted files for a playable build."
  exit 0
fi

if [[ ! -f "$ROOT/rom/jus.nds" ]]; then
  echo "ERROR: $ROOT/rom/jus.nds is missing." >&2
  echo "Place your own legally dumped, unmodified JUS ROM there, extract it as" >&2
  echo "documented in README.md, then rerun this script." >&2
  exit 1
fi

actual_sha1="$(sha1sum "$ROOT/rom/jus.nds" | cut -d' ' -f1)"
if [[ "$actual_sha1" != "$ROM_SHA1" ]]; then
  echo "ERROR: rom/jus.nds SHA-1 is $actual_sha1; expected $ROM_SHA1" >&2
  exit 1
fi

python3 "$ROOT/tools/scripts/prepare_jus.py"
TITLE_BANKS="$ROOT/recomp/generated"
mkdir -p "$TITLE_BANKS"
generate_bank "$ROOT/recomp/config/jus_arm9_main.toml" \
  "$ROOT/extract/arm9/arm9.bin" "$TITLE_BANKS" jus_arm9_main 16
generate_bank "$ROOT/recomp/config/jus_arm9_itcm.toml" \
  "$ROOT/extract/arm9/itcm.bin" "$TITLE_BANKS" jus_arm9_itcm 4
generate_bank "$ROOT/recomp/config/jus_arm9_dtcm.toml" \
  "$ROOT/extract/arm9/dtcm.bin" "$TITLE_BANKS" jus_arm9_dtcm 2
generate_bank "$ROOT/recomp/config/jus_arm7_main.toml" \
  "$ROOT/extract/arm7/arm7.bin" "$TITLE_BANKS" jus_arm7_main 4

cmake -G Ninja -S "$NDSRECOMP/runner" \
  -B "$NDSRECOMP/runner/build-linux" \
  -DCMAKE_BUILD_TYPE=Release \
  -DNDS_BOOTSTRAP_FIRMWARE=ON \
  -DNDS_TITLE_BANK_DIR="$TITLE_BANKS" \
  -DNDS_TITLE_ROM_SHA1="$ROM_SHA1" \
  -DNDS_ENABLE_COMPUTE_RENDERER=ON
cmake --build "$NDSRECOMP/runner/build-linux" --parallel
ctest --test-dir "$NDSRECOMP/runner/build-linux" --output-on-failure

# Pre-seed the live-overlay caches with natively compiled overlay banks, the
# same step tools/scripts/package_release.py runs for the Windows bundle (see
# decomp/docs/ONLINE_FPS.md). Without it every session boots with the RAM
# overlays on the Tier-3 interpreter (~30 fps) and spends minutes compiling
# banks in the background while playing. Defaults seed recomp/live-cache plus
# the two 2P per-instance caches. Re-runs are cheap: the staging index
# dedupes already-compiled captures.
python3 "$ROOT/tools/scripts/live_preseed.py" \
  --rom "$ROOT/rom/jus.nds" \
  --stage "$ROOT/recomp/live-cache-preseed" \
  --ndsrecomp-root "$NDSRECOMP" \
  --runner-build "$NDSRECOMP/runner/build-linux" \
  --recompiler "$NDSRECOMP/recompiler/build-linux/nds_recompile" \
  || echo "WARNING: live-overlay pre-seed failed; sessions will converge in-play at reduced fps" >&2

build_launcher

echo
echo "Linux build complete:"
echo "  $NDSRECOMP/runner/build-linux/nds_runner"
echo "Run it with:"
echo "  launcher/build-linux/JUSDecomp"
