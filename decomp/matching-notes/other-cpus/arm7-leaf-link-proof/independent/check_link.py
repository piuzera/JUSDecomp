"""Independent ELF-only image reconstruction and direct original-ROM checks."""
import hashlib
import json
from pathlib import Path
import struct
import subprocess

OUT=Path(__file__).resolve().parent
REPO=Path('/private/tmp/jus-arm7-leaf-link-trial')
BASE=REPO/'decomp/matching-notes/other-cpus'
PUBLIC=BASE/'arm7-leaf-link-proof'
COMMIT='3a31415773e78617a5dde5f13889b98cabbc4d13'
sha=lambda b:hashlib.sha256(b).hexdigest()
u16=lambda b,o:int.from_bytes(b[o:o+2],'little')
u32=lambda b,o:int.from_bytes(b[o:o+4],'little')
def strz(b,o):
    z=b.find(b'\x00',o);assert z>=o
    return b[o:z].decode('ascii')
rom=Path('/Users/djdjo/Documents/mine/rom/jus.nds').read_bytes()
assert sha(rom)=='a9c9bf89e6d99548b7c87e822b217c3fb74ef25186535b06193a6fb73d0d6d27'
fnt,fnlen,fat,falen=struct.unpack_from('<4I',rom,0x40)
todo=[(0xf000,'')];files={};visited=set()
while todo:
    d,path=todo.pop();assert d not in visited;visited.add(d)
    pos,next_file,_=struct.unpack_from('<IHH',rom,fnt+(d-0xf000)*8);pos+=fnt
    while rom[pos]:
        tag=rom[pos];pos+=1;name=rom[pos:pos+(tag&127)].decode('ascii');pos+=tag&127
        if tag&128:
            child,=struct.unpack_from('<H',rom,pos);pos+=2;todo.append((child,path+name+'/'))
        else:files[path+name]=next_file;next_file+=1
assert files['ChildRom/JSS2Child.srl']==79
cs,ce=struct.unpack_from('<II',rom,fat+79*8);assert (cs,ce)==(0x23b800,0x4464c8)
layouts=json.loads((BASE/'arm7-checked-layouts.json').read_bytes())
published=json.loads((PUBLIC/'proof.json').read_bytes())
fresh=json.loads((OUT/'actual-fresh/result.json').read_bytes())
assert fresh['status']==published['status']=='actual_MW_object_linked_exact_original_images'
assert fresh['inputs_unchanged'] is published['inputs_unchanged'] is True
assert fresh['input_sha256']==published['input_sha256'] and fresh['tool_sha256']==published['tool_sha256']
assert published['source_credit_bytes']==0 and published['canonical_update'] is False and published['T10_complete'] is False

def decode_elf(path, original_image, layout):
    b=path.read_bytes()
    assert b[:7]==b'\x7fELF\x01\x01\x01' and u16(b,16)==2 and u16(b,18)==40
    assert u32(b,24)==layout['entry'] and u32(b,36)==0x05000200
    pstart=u32(b,28);pstride=u16(b,42);pcount=u16(b,44)
    assert pstride==32 and pcount==6
    segments=[]
    for i in range(pcount):
        p=pstart+i*pstride
        row={k:u32(b,p+j*4) for j,k in enumerate(('type','offset','vma','lma','file_bytes','memory_bytes','flags','align'))}
        assert row['type']==1 and row['align']==4
        assert row['offset']+row['file_bytes']<=len(b)
        assert row['offset']%4==row['vma']%4
        segments.append(row)
    sstart=u32(b,32);stride=u16(b,46);count=u16(b,48);sidx=u16(b,50)
    assert stride==40 and sstart+stride*count<=len(b)
    sections=[{k:u32(b,sstart+i*stride+j*4) for j,k in enumerate(('name_offset','type','flags','vma','offset','size','link','info','align','entry_size'))} for i in range(count)]
    strings=sections[sidx];names=b[strings['offset']:strings['offset']+strings['size']]
    for s in sections:s['name']=strz(names,s['name_offset'])
    allocated=[s for s in sections if s['flags']&2 and s['size']]
    assert len(allocated)==6
    assert not any(s['type'] in (4,9) for s in sections)
    reconstructed=bytearray(len(original_image));coverage=bytearray(len(original_image))
    for p,s in zip(segments,allocated,strict=True):
        assert p['vma']==s['vma'] and p['memory_bytes']==s['size'] and p['offset']==s['offset']
        assert s['align']==4
        assert s['type']==(1 if p['file_bytes'] else 8)
        assert s['flags']==(6 if s['name']=='.arm7.autoload0' else (2 if p['file_bytes'] else 3))
        assert p['flags']==(4 if p['file_bytes'] else 6)
        if p['file_bytes']:
            assert p['file_bytes']==p['memory_bytes']
            begin=p['lma']-layout['base'];end=begin+p['file_bytes']
            assert 0<=begin<end<=len(original_image)
            assert not any(coverage[begin:end])
            coverage[begin:end]=bytes([1])*p['file_bytes']
            reconstructed[begin:end]=b[p['offset']:p['offset']+p['file_bytes']]
    assert all(coverage) and bytes(reconstructed)==original_image
    assert sha(reconstructed)=='0540bd6fba14f886c542b3bfa15b1c0391b23dd4eaa3688367e1813cbc021139'
    assert sum(p['memory_bytes'] for p in segments if p['file_bytes']==0)==21424
    symbols=[]
    for s in sections:
        if s['type']!=2:continue
        strings=sections[s['link']];names=b[strings['offset']:strings['offset']+strings['size']]
        assert s['entry_size']==16
        for p in range(s['offset'],s['offset']+s['size'],16):
            symbols.append({'name':strz(names,u32(b,p)),'value':u32(b,p+4),'size':u32(b,p+8),'binding':b[p+12]>>4,'type':b[p+12]&15,'section':u16(b,p+14)})
    trial=[s for s in symbols if s['name']=='arm7_store_trial'];assert len(trial)==1
    t=trial[0];assert (t['value'],t['size'],t['binding'],t['type'])==(0x037fcf18,20,1,2)
    start,=[s for s in symbols if s['name']=='__leaf_start'];end,=[s for s in symbols if s['name']=='__leaf_end']
    assert start['value']==0x037fcf18 and end['value']==0x037fcf2c
    assert sha(reconstructed[0x50c8:0x50dc])=='1286c0f7baaf3678f915ee9ef9830ab1a2243c5ea8d41e2a75c0b14fa35eaebe'
    return {'linked_elf_sha256':sha(b),'linked_elf_bytes':len(b),'entry':u32(b,24),'elf_flags':u32(b,36),'segments':segments,'allocated_sections':[{k:s[k] for k in ('name','type','flags','vma','size','align')} for s in allocated],'trial_symbol':t,'image_bytes':len(reconstructed),'image_sha256':sha(reconstructed),'BSS_bytes':21424,'zero_relocation_sections':True,'ELF_only_original_reconstruction':True}

results=[]
for i,(program,layout,expected,actual) in enumerate(zip((rom,rom[cs:ce]),layouts,published['programs'],fresh['programs'],strict=True)):
    assert sha(program)==layout['identity']['program_sha256']
    offset,entry,base,size=struct.unpack_from('<4I',program,0x30)
    assert [offset,entry,base,size]==[layout[k] for k in ('image_offset','entry','base','image_bytes')]
    image=program[offset:offset+size]
    assert sha(image)==layout['image_sha256']
    params=image[layout['params_offset']:layout['params_offset']+20]
    assert sha(params)==layout['params_sha256']
    tb,te,ds,_,_=struct.unpack('<5I',params)
    table=image[tb-base:te-base];assert sha(table)==layout['table_sha256']
    cursor=ds-base
    for j in range(len(table)//12):
        runtime,initialized,bss=struct.unpack_from('<3I',table,j*12);r=layout['regions'][j+1]
        assert runtime==r['runtime_base'] and bss==r['bss_bytes']
        assert r['stored_extent']=={'start':cursor,'end':cursor+initialized}
        assert sha(image[cursor:cursor+initialized])==r['sha256'];cursor+=initialized
    assert layout['identity']==actual['identity']==expected['identity']
    folder=OUT/'actual-fresh'/('program-%d'%i)/'positive'
    decoded=decode_elf(folder/'linked.elf',image,layout)
    assert decoded['linked_elf_sha256']==expected['linked_elf_sha256']==actual['readback']['linked_elf_sha256']
    assert decoded['segments']==published['common_elf_layout']['load_segments']
    assert decoded['allocated_sections']==published['common_elf_layout']['allocated_sections']
    assert (folder/'compiled.o').read_bytes()==Path('/private/tmp/jus-arm7-leaf-independent-proof/closed-reproduced/O4p/compiled.o').read_bytes()
    assert sha((folder/'physical.map').read_bytes())==expected['physical_map_sha256']
    assert b'compiled.o:(.text)' in (folder/'physical.map').read_bytes()
    assert sha((folder/'physical.ld').read_bytes())==expected['script_sha256']
    assert sha((folder/'lld.log').read_bytes())==expected['positive_LLD_log_sha256']
    assert sha((folder/'llvm-readobj.log').read_bytes())==expected['llvm_readobj_log_sha256']
    for name,digest in expected['generated_opaque_object_sha256'].items():assert sha((folder/name).read_bytes())==digest
    assert sha((folder/'prefix.bin').read_bytes())==expected['opaque_prefix_sha256'] and sha((folder/'suffix.bin').read_bytes())==expected['opaque_suffix_sha256']
    bad=folder/'tampered-load-offset.elf'
    assert sha(bad.read_bytes())==expected['tampered_load_offset_elf_sha256']
    try:decode_elf(bad,image,layout)
    except AssertionError:mutated_rejected=True
    else:raise AssertionError('Independent reader accepted corrupt segment offset')
    negative=actual['wrong_object_negative']
    assert negative['LLD_exit_code']==expected['wrong_object_LLD_exit_code']==1
    assert negative['LLD_stderr']==expected['wrong_object_stderr']
    assert all(s in negative['LLD_stderr'] for s in ('leaf end','leaf size','size','virtual address range overlaps','load address range overlaps'))
    assert negative['log_sha256']==expected['wrong_object_LLD_log_sha256']
    assert actual['link_argv']==published['link_argv'] and actual['LLD_exit_code']==0
    results.append({'identity':layout['identity'],'independent_readback':decoded,'actual_object_consumed_sha256':sha((folder/'compiled.o').read_bytes()),'tampered_PT_LOAD_offset_independently_rejected':mutated_rejected,'wrong_36_byte_object_LLD_exit_code':negative['LLD_exit_code'],'wrong_object_actual_stderr':negative['LLD_stderr']})
before=json.loads((OUT/'input-snapshot-before.json').read_bytes());after={n:sha(Path(n).read_bytes()) for n in before};assert before==after
(OUT/'input-snapshot-after.json').write_text(json.dumps(after,indent=2)+'\n')
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=REPO,text=True).strip()==COMMIT
files=subprocess.check_output(['git','diff-tree','--no-commit-id','--name-only','-r',COMMIT],cwd=REPO,text=True).splitlines();assert len(files)==4
hashes={}
for name in files:
    assert name.startswith('decomp/matching-notes/other-cpus/arm7-leaf-link')
    blob=subprocess.check_output(['git','show',COMMIT+':'+name],cwd=REPO);assert (REPO/name).read_bytes()==blob;hashes[name]=sha(blob)
receipt={'status':'accepted','findings':[],'reviewed_commit':COMMIT,'public_git_blobs_sha256':hashes,'programs':results,'inputs_unchanged':True,'before_input_snapshot_sha256':sha((OUT/'input-snapshot-before.json').read_bytes()),'after_input_snapshot_sha256':sha((OUT/'input-snapshot-after.json').read_bytes()),'fresh_complete_result_sha256':sha((OUT/'actual-fresh/result.json').read_bytes()),'source_credit_bytes':0,'canonical_update':False,'T10_complete':False,'scope_review':'Actual independently compiled unmodified MW object consumed directly through compiled.o(.text), not incbin. Exact ELF-only image reconstruction is physical link feasibility, with no original entry/extent/ABI/link relocation/source/runtime/external-address contract claims. The actual input has no relocations, so no general MW relocation support established. Autoload0 executable section flag6 and nonexecutable segment flag4 confined to private experiment; canonical opaque validator unchanged.','independent_scripts_sha256':{n:sha((OUT/n).read_bytes()) for n in ('run_fresh.py','check_link.py')}}
(OUT/'independent-receipt.json').write_text(json.dumps(receipt,indent=2)+'\n')
print('Accepted, no findings: actual native links and full artifact pins match; independent direct-ROM/ELF reconstruction and both negatives pass.')
