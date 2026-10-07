"""Replay the sole frozen lower-store compile and actual native proof."""
import json
from pathlib import Path
import subprocess
import sys
import store

HERE=Path(__file__).resolve().parent


def replay(output: Path) -> Path:
    output=output.resolve();output.mkdir()
    pins_path=HERE/'evidence-pins.json';pins_bytes=pins_path.read_bytes();pins=json.loads(pins_bytes)['input_sha256']
    for name,pin in pins.items():assert store._sha((HERE/name).read_bytes())==pin,name
    manifest=json.loads((HERE/'original-manifest.json').read_text());recipe=json.loads((HERE/'recipe.json').read_text())
    for name,pin in recipe['tools_sha256'].items():assert store._sha(Path(name).read_bytes())==pin,name
    source=HERE/manifest['source'];assert store._sha(source.read_bytes())==manifest['source_sha256']
    originals=store._originals(manifest,recipe,output)
    local_source=output/source.name;local_source.write_bytes(source.read_bytes())
    object_path=output/'compiled.o'
    argv=[recipe['runner'],recipe['compiler'],*recipe['flags'],str(local_source),'-o',str(object_path)]
    command=store._run(argv,output,'compile-command.json')
    assert command['returncode']==0 and command['stdout']==command['stderr']=='',command
    elf=store._inspect_object(object_path,manifest)
    readobj=subprocess.run([recipe['llvm_readobj'],'--file-headers','--sections','--symbols','--relocations',str(object_path)],capture_output=True,text=True,check=True)
    assert readobj.stderr=='';(output/'elf-readback.txt').write_text(readobj.stdout.replace(str(object_path),object_path.name))
    text=bytes.fromhex(elf['text_hex']);code=text[:elf['instruction_bytes']]
    llvm=subprocess.run([recipe['llvm_mc'],'--disassemble','--triple=armv4t-none-eabi'],input=' '.join(f'0x{x:02x}'for x in code)+'\n',capture_output=True,text=True,check=True)
    assert llvm.stderr=='';(output/'compiled-llvm.txt').write_text(llvm.stdout)
    match=all(text==original['code']for original in originals)and elf['pool_bytes']==0 and elf['relocations']==[]
    programs=[]
    if match:
        assert elf['object_sha256']==manifest['object_sha256']
        programs=store._native(output/'native',object_path,originals,manifest,recipe)
    for name,pin in recipe['tools_sha256'].items():assert store._sha(Path(name).read_bytes())==pin,name
    for name,pin in pins.items():assert store._sha((HERE/name).read_bytes())==pin,name
    assert pins_path.read_bytes()==pins_bytes
    assert store._sha(store.ROM.read_bytes())==originals[0]['layout']['identity']['parent_rom_sha256']
    receipt={'status':'actual_lower_store_native_exact_original_images'if match else'fixed_lower_store_mismatch_stop',
             'source_sha256':manifest['source_sha256'],'compile_command':command,'elf':elf,
             'originals':[original['readback']for original in originals],'programs':programs,
             'native_link_attempted':match,'input_sha256':pins,'tool_sha256':recipe['tools_sha256'],
             'inputs_unchanged':True,'source_credit_bytes':0,'original_names_types_ABI_extent_version_ownership_established':False}
    path=output/'trial-proof.json';path.write_text(json.dumps(receipt,indent=2)+'\n');return path


if __name__=='__main__':
    print(replay(Path(sys.argv[1])))
