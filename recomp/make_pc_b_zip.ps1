$ErrorActionPreference = 'Stop'
$src = 'C:\JUS Decomp'
$stageRoot = 'C:\JUS Decomp\recomp\pcb-staging'
$stage = Join-Path $stageRoot 'JUS Decomp'
$zip = Join-Path ([Environment]::GetFolderPath('Desktop')) 'JUSDecomp-pc-b.zip'
$sevenZip = 'C:\Program Files\7-Zip\7z.exe'

# 1. Sanity: required runtime pieces exist
$required = @(
  'rom\jus.nds',
  'recomp\generated',
  'recomp\jus-100-save.sav',
  'tools\ndsrecomp\generated',
  'tools\ndsrecomp\runner\build-mingw\nds_runner.exe',
  'tools\ndsrecomp\bios'
)
foreach ($r in $required) {
  if (-not (Test-Path (Join-Path $src $r))) { throw "required piece missing: $r" }
}
if (-not (Test-Path $sevenZip)) { throw '7-Zip not found' }

# 2. Fresh staging
if (Test-Path $stageRoot) { Remove-Item $stageRoot -Recurse -Force }
New-Item -ItemType Directory -Force -Path $stage | Out-Null

# 3. robocopy with exclusions (dev/build artifacts + machine-identity files)
$xd = @('.git','build','build-jus','dist','extract','launcher','live-cache','pcb-staging','dsd','JUSToolkit','mwccarm','sdl2','supermario64dsrecomp','recompiler','oracle','ghidra','__pycache__')
$xf = @('*.sav','*.log','*.json','*.bak*','*.fwstate','*.cap','*.pcap','generated-identity.bin','*_test.exe','*.a',
        'C:\JUS Decomp\recomp\jus-mod.nds','C:\JUS Decomp\rom\jus-en.nds','C:\JUS Decomp\rom\Jump Ultimate Stars (Japan).zip')
$rb = @($src, $stage, '/E', '/NFL','/NDL','/NJH','/NJS','/NP')
$rb += '/XD'; $rb += $xd
$rb += '/XF'; $rb += $xf
& robocopy @rb | Out-Null
if ($LASTEXITCODE -ge 8) { throw "robocopy failed (exit $LASTEXITCODE)" }

# 4. Pristine 100% save as recomp\jus.sav
Copy-Item (Join-Path $src 'recomp\jus-100-save.sav') (Join-Path $stage 'recomp\jus.sav') -Force

# 5. Bundle runtime DLLs next to the exe
$dlls = @('libgcc_s_seh-1.dll','libwinpthread-1.dll','libstdc++-6.dll','SDL2.dll')
foreach ($d in $dlls) {
  Copy-Item (Join-Path 'C:\msys64\ucrt64\bin' $d) (Join-Path $stage "tools\ndsrecomp\runner\build-mingw\$d") -Force
}

# 6. Prune build-mingw leftovers (already excluded *.a / *_test.exe during copy)
$bm = Join-Path $stage 'tools\ndsrecomp\runner\build-mingw'
foreach ($d in @('CMakeFiles','vendor')) { $p = Join-Path $bm $d; if (Test-Path $p) { Remove-Item $p -Recurse -Force } }
foreach ($f in @('CMakeCache.txt','build.ninja','cmake_install.cmake','CTestTestfile.cmake','.ninja_deps','.ninja_log','io-build-err.txt','io-err.txt','io-out.txt','t.cpp','t.obj','title_bank_registry.cpp')) {
  $p = Join-Path $bm $f; if (Test-Path $p) { Remove-Item $p -Force }
}

# 7. Zip
if (Test-Path $zip) { Remove-Item $zip -Force }
& $sevenZip a -tzip -mx=5 -bso0 -bsp0 $zip $stage
if ($LASTEXITCODE -ne 0) { throw "7z failed (exit $LASTEXITCODE)" }

# 8. Report
$size = (Get-Item $zip).Length
Write-Output ("ZIP READY: " + $zip + "  (" + [math]::Round($size/1MB,1) + " MB)")
