"""Read the proposed finite leaf selection from both original program identities."""
import hashlib
import json
from pathlib import Path
import struct
import subprocess

OUT=Path(__file__).resolve().parent
ROM=Path('/Users/djdjo/Documents/mine/rom/jus.nds')
BASE=Path('/private/tmp/jus-arm7-leaf-independent/decomp/matching-notes/other-cpus')
sha=lambda b:hashlib.sha256(b).hexdigest()
data=ROM.read_bytes()
assert sha(data)=='a9c9bf89e6d99548b7c87e822b217c3fb74ef25186535b06193a6fb73d0d6d27'
layouts=json.loads((BASE/'arm7-checked-layouts.json').read_bytes())
fnt,fnlen,fat,falen=struct.unpack_from('<4I',data,0x40)
files={};dirs=set();todo=[(0xf000,'')]
while todo:
    directory,path=todo.pop();assert directory not in dirs;dirs.add(directory)
    cursor,file_id,_=struct.unpack_from('<IHH',data,fnt+(directory-0xf000)*8)
    cursor+=fnt
    while data[cursor]:
        tag=data[cursor];cursor+=1
        name=data[cursor:cursor+(tag&127)].decode('ascii');cursor+=tag&127
        if tag&128:
            child,=struct.unpack_from('<H',data,cursor);cursor+=2;todo.append((child,path+name+'/'))
        else:
            files[path+name]=file_id;file_id+=1
assert files['ChildRom/JSS2Child.srl']==79
start,end=struct.unpack_from('<II',data,fat+79*8)
assert (start,end)==(0x23b800,0x4464c8)
records=[]
for i,(program,rom_base,layout) in enumerate(zip((data,data[start:end]),(0,start),layouts,strict=True)):
    assert sha(program)==layout['identity']['program_sha256']
    offset,entry,base,size=struct.unpack_from('<4I',program,0x30)
    assert [offset,entry,base,size]==[layout[k] for k in ('image_offset','entry','base','image_bytes')]
    image=program[offset:offset+size]
    assert sha(image)==layout['image_sha256']
    params=image[layout['params_offset']:layout['params_offset']+20]
    assert sha(params)==layout['params_sha256']
    tb,te,ds,_,_=struct.unpack('<5I',params)
    table=image[tb-base:te-base]
    assert sha(table)==layout['table_sha256']
    stored=ds-base;regions=[]
    for j in range(len(table)//12):
        runtime,initialized,bss=struct.unpack_from('<3I',table,j*12)
        region=layout['regions'][j+1]
        assert (runtime,bss)==(region['runtime_base'],region['bss_bytes'])
        assert region['stored_extent']=={'start':stored,'end':stored+initialized}
        regions.append({'initialized':[runtime,runtime+initialized],'bss':[runtime+initialized,runtime+initialized+bss],'stored':stored})
        stored+=initialized
    runtime=regions[0]['initialized'][0]
    location=regions[0]['stored']+0x037fcf18-runtime
    selected=image[location:location+20]
    assert len(selected)==20 and sha(selected)=='1286c0f7baaf3678f915ee9ef9830ab1a2243c5ea8d41e2a75c0b14fa35eaebe'
    words=struct.unpack('<5I',selected)
    cmd=['/opt/homebrew/opt/llvm/bin/llvm-mc','--disassemble','--triple=armv4t-none-eabi']
    run=subprocess.run(cmd,input=' '.join('0x%02x'%b for b in selected)+'\n',text=True,capture_output=True)
    assert run.returncode==0 and not run.stderr
    (OUT/('original-program-%d-llvm.txt'%i)).write_text(run.stdout)
    (OUT/('original-program-%d-code.bin'%i)).write_bytes(selected)
    access=0x027ffdc8
    assert all(not (a<=access<b or a<=access+3<b) for r in regions for a,b in (r['initialized'],r['bss']))
    startup=layout['regions'][0]
    startup_bytes=startup['stored_extent']['end']-startup['stored_extent']['start']
    assert not (startup['runtime_base']<=access<startup['runtime_base']+startup_bytes+startup['bss_bytes'])
    records.append({'identity':layout['identity'],'selection':[0x037fcf18,0x037fcf2c],'stored_image_offset':location,'original_rom_offset':rom_base+offset+location,'words':['0x%08x'%w for w in words],'code_sha256':sha(selected),'llvm_stdout_sha256':sha(run.stdout.encode()),'autoload_regions':regions,'external_store_address_for_index_1':access,'external_to_all_autoload_initialized_and_bss':True})
assert (OUT/'original-program-0-code.bin').read_bytes()==(OUT/'original-program-1-code.bin').read_bytes()
assert ROM.read_bytes()==data
(OUT/'original-read.json').write_text(json.dumps({'status':'passed','parent_rom_sha256':sha(data),'child_file_id':79,'child_rom_extent':[start,end],'programs':records,'inputs_unchanged':True,'source_credit':0,'original_function_extent':'unknown','original_return_type':'unknown'},indent=2)+'\n')
print('Original finite 20-byte candidate selection and external store mapping independently checked in both exact programs.')
