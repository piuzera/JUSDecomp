"""Independently ground two explicit ARM prefixes and one raw literal."""
from pathlib import Path
import hashlib
import json
import struct
import subprocess

OUT = Path(__file__).resolve().parent
ROM = Path('/Users/djdjo/Documents/mine/rom/jus.nds')
REPO = Path('/private/tmp/jus-arm7-branch-grounding')
BASE = REPO/'decomp/matching-notes/other-cpus'
LAYOUT = BASE/'arm7-checked-layouts.json'
PROBE = Path('/private/tmp/jus-arm7-reachable-root-cache/target/release/examples/arm7_reachable_probe')
sha = lambda b: hashlib.sha256(b).hexdigest()
ROM_SHA='a9c9bf89e6d99548b7c87e822b217c3fb74ef25186535b06193a6fb73d0d6d27'
LAYOUT_SHA='8a518abf785a1c24756d5485ee669f64e304af20a69b0d02a889fb60410d9fcc'
PROBE_SHA='28e47852e593d3636d66c797c67963f5c052840c7e0e171ea7dd0dd1bda497ff'
REQUEST_SHA='c5e7b7b0911462ddd213dbf60ef25986f64896bb36288e3788743d2bcb1aad63'
REPORT_SHA='994cadc35863bb4e0f7306a692c4a2a8792cf3064ed69a7b184d23e8de4c8e90'
rom = ROM.read_bytes()
layout_bytes = LAYOUT.read_bytes()
probe_bytes = PROBE.read_bytes()
assert (sha(rom),sha(layout_bytes),sha(probe_bytes))==(ROM_SHA,LAYOUT_SHA,PROBE_SHA)
layouts=json.loads(layout_bytes)
requests=json.loads((BASE/'arm7-callee-prefix-proof/requests.json').read_bytes())
for req in requests:
    req['selections'].extend([{'region':{'autoload':0},'mode':'Arm','extent':{'start':a,'end':b}} for a,b in [(0x037fd044,0x037fd064),(0x037fd0c0,0x037fd0c8)]])
request_bytes=(json.dumps(requests,indent=2)+'\n').encode()
assert sha(request_bytes)==REQUEST_SHA
request_path=OUT/'requests.json'
request_path.write_bytes(request_bytes)
fnt_offset,fnt_size,fat_offset,fat_size=struct.unpack_from('<4I',rom,0x40)
fnt=memoryview(rom)[fnt_offset:fnt_offset+fnt_size]
dirs=struct.unpack_from('<H',fnt,6)[0]
catalog={}
visited=set()
pending=[(0xf000,'')]
while pending:
    directory,path=pending.pop()
    n=directory-0xf000
    assert 0<=n<dirs and directory not in visited
    visited.add(directory)
    pos,next_file,_=struct.unpack_from('<IHH',fnt,n*8)
    while fnt[pos]:
        tag=fnt[pos];pos+=1
        name=bytes(fnt[pos:pos+(tag&127)]).decode('ascii');pos+=tag&127
        if tag&128:
            child=struct.unpack_from('<H',fnt,pos)[0];pos+=2
            pending.append((child,path+name+'/'))
        else:
            assert path+name not in catalog and (next_file+1)*8<=fat_size
            catalog[path+name]=next_file;next_file+=1
assert catalog['ChildRom/JSS2Child.srl']==79
start,end=struct.unpack_from('<II',rom,fat_offset+79*8)
assert (start,end)==(0x23b800,0x4464c8)
raw_records=[]
expected_words=[(0xe3a00001,0xe5810000,0xebffffcc,0xe1a01000,0xe3a00001,0xebffffae,0xe3a00001,0xebffffb1),(0xe28dd004,0xe8bd4000)]
expected_lines=[['mov\tr0, #1','str\tr0, [r1]','bl\t#-208','mov\tr1, r0','mov\tr0, #1','bl\t#-328','mov\tr0, #1','bl\t#-316'],['add\tsp, sp, #4','ldm\tsp!, {lr}']]
for index,(program,rom_base,layout) in enumerate(zip((rom,rom[start:end]),(0,start),layouts,strict=True)):
    assert sha(program)==layout['identity']['program_sha256']
    image_offset,entry,base,size=struct.unpack_from('<4I',program,0x30)
    assert [image_offset,entry,base,size]==[layout[k] for k in ('image_offset','entry','base','image_bytes')]
    assert sha(program[:0x4000])==layout['header_sha256']
    image=program[image_offset:image_offset+size]
    assert len(image)==size and sha(image)==layout['image_sha256']
    params=image[layout['params_offset']:layout['params_offset']+20]
    assert sha(params)==layout['params_sha256']
    table_start,table_end,data_start,_,_=struct.unpack('<5I',params)
    table=image[table_start-base:table_end-base]
    assert sha(table)==layout['table_sha256']
    assert {'start':table_start-base,'end':table_end-base}==layout['table_extent']
    stored=data_start-base
    regions=[]
    for i in range(len(table)//12):
        runtime,initialized,bss=struct.unpack_from('<3I',table,i*12)
        region=layout['regions'][i+1]
        assert region['kind']=={'autoload':i}
        assert (runtime,bss)==(region['runtime_base'],region['bss_bytes'])
        assert {'start':stored,'end':stored+initialized}==region['stored_extent']
        assert sha(image[stored:stored+initialized])==region['sha256']
        regions.append((runtime,initialized,bss,stored));stored+=initialized
    runtime,initialized,bss,stored=regions[0]
    assert (runtime,initialized,bss,stored)==(0x037f8000,0x10248,0x3a48,0x1b0)
    spans=[]
    for span_index,((a,b),words,llvm_lines) in enumerate(zip([(0x037fd044,0x037fd064),(0x037fd0c0,0x037fd0c8)],expected_words,expected_lines,strict=True)):
        location=stored+a-runtime
        selected=image[location:location+b-a]
        assert struct.unpack('<'+'I'*len(words),selected)==words
        cmd=['/opt/homebrew/opt/llvm/bin/llvm-mc','--disassemble','--triple=armv4t-none-eabi']
        llvm=subprocess.run(cmd,input=' '.join('0x%02x'%v for v in selected)+'\n',capture_output=True,text=True)
        assert llvm.returncode==0 and not llvm.stderr
        lines=[s.strip() for s in llvm.stdout.splitlines() if s.strip() and s.strip()!='.text']
        assert lines==llvm_lines,(lines,llvm_lines)
        (OUT/('llvm-program-%d-span-%d.txt'%(index,span_index))).write_text(llvm.stdout)
        calls=[]
        for j,w in enumerate(words):
            if w&0x0f000000==0x0b000000:
                imm=struct.unpack('<i',struct.pack('<I',(w&0xffffff)<<8))[0]>>8
                calls.append({'source':a+j*4,'target':a+j*4+8+imm*4,'guard':'always','return_continuation':a+j*4+4,'continuation_guard':'call_returned'})
        spans.append({'start':a,'end':b,'stored_offset':location,'original_rom_offset':rom_base+image_offset+location,'sha256':sha(selected),'words':['0x%08x'%w for w in words],'calls':calls,'llvm_stdout_sha256':sha(llvm.stdout.encode()),'llvm_argv':cmd})
    literal_address=0x037fd034+8+0x90
    assert literal_address==0x037fd0cc
    literal_offset=stored+literal_address-runtime
    literal=image[literal_offset:literal_offset+4]
    pointer,=struct.unpack('<I',literal)
    assert pointer==0x03808430 and sha(literal)=='57b0891abc6d6b61a7345b6a995c20fdeb937a1f7ca61ffa06b012074e0e73a4'
    bss_start=runtime+initialized;bss_end=bss_start+bss
    assert (bss_start,bss_end)==(0x03808248,0x0380bc90) and bss_start<=pointer< bss_end
    assert not any(r<=pointer<r+n for r,n,_,_ in regions)
    raw_records.append({'identity':layout['identity'],'arm7_image_offset':image_offset,'autoloads':regions,'spans':spans,'literal':{'address':literal_address,'original_rom_offset':rom_base+image_offset+literal_offset,'word':pointer,'sha256':sha(literal),'target_mapping':'autoload0 BSS only; no stored value','bss_extent':[bss_start,bss_end]},'branch_feasibility':'unknown','runtime_pointed_to_value':'unknown'})
argv=[str(PROBE),str(ROM),str(LAYOUT),LAYOUT_SHA,str(request_path),REQUEST_SHA,PROBE_SHA]
run=subprocess.run(argv,capture_output=True)
(OUT/'report.json').write_bytes(run.stdout)
(OUT/'probe-stderr.txt').write_bytes(run.stderr)
assert run.returncode==0 and not run.stderr
assert sha(run.stdout)==REPORT_SHA
report=json.loads(run.stdout)
assert report['source_bytes']==0 and report['inputs_unchanged'] is True
assert all(report[k] is False for k in ('arm7_binary_baseline_complete','executable_coverage_established','function_extents_established','original_relocations_established'))
assert report['status']=='bounded_arm7_candidate_graphs_verified'
for p,req,raw in zip(report['programs'],requests,raw_records,strict=True):
    graph=p['graph'];edges=graph['edges']
    assert p['identity']==graph['program']==req['program']==raw['identity']
    assert len(graph['nodes'])==21 and len(edges)==27 and len(graph['observations'])==5
    assert all(n['identity']['program']==req['program'] and n['mode']=='Arm' and not n['mode_conflict'] for n in graph['nodes'])
    assert all(o['executability']=='unknown' for o in graph['observations'])
    assert sum(e['resolution']['kind']=='frontier' for e in edges)==7
    root,=graph['roots']
    assert len(root['visited_nodes'])==21 and root['edge_examinations']==27 and len(root['frontiers'])==7
    for i,target,guard in [(2,0x037f8470,'call_returned'),(6,0x037fced8,'call_returned')]:
        assert edges[i]['resolution']=={'kind':'frontier','reason':'outside_selection'}
        assert edges[i]['original']['target']['address']==target and edges[i]['original']['guard']==guard
    for i,target,guard in [(12,0x037fd0c0,'condition_passed'),(13,0x037fd044,'condition_failed')]:
        assert edges[i]['source_condition']=='ne' and edges[i]['original']['guard']==guard
        assert edges[i]['original']['target']['address']==target and edges[i]['resolution']['kind']=='selected'
    for call in raw['spans'][0]['calls']:
        matches=[e for e in edges if e['original']['source']==call['source']]
        assert len(matches)==2
        assert any(e['original']['kind']=='call' and e['original']['target']['address']==call['target'] and e['original']['guard']=='always' and e['resolution']['kind']=='frontier' for e in matches)
        assert any(e['original']['kind']=='call_continuation' and e['original']['target']['address']==call['return_continuation'] and e['original']['guard']=='call_returned' for e in matches)
    assert any(e['original']['target']['address']==0x037fd0c8 and e['resolution']=={'kind':'frontier','reason':'outside_selection'} for e in edges)
    assert all(e['original']['target']['mapping']['identity']['program']==req['program'] for e in edges)
    assert graph['scope']=='root_assumed_selected_interpretations'
assert ROM.read_bytes()==rom and LAYOUT.read_bytes()==layout_bytes and PROBE.read_bytes()==probe_bytes
receipt={'status':'raw_and_full_graph_checks_passed_pending_public_commit_review','findings':[],'rom_sha256':ROM_SHA,'producer_sha256':PROBE_SHA,'layout_sha256':LAYOUT_SHA,'request_sha256':REQUEST_SHA,'report_sha256':REPORT_SHA,'report_bytes':len(run.stdout),'fnt_directory_count':len(visited),'fnt_file_count':len(catalog),'child_file_id':79,'child_rom_extent':[start,end],'programs':raw_records,'source_bytes':0,'branch_feasibility':'unknown','runtime_pointed_to_value':'unknown','inputs_unchanged':True,'probe_argv':argv}
(OUT/'independent-receipt.json').write_text(json.dumps(receipt,indent=2)+'\n')
print('Independent raw literal/prefix mapping, LLVM decode, and 21-node/27-edge graph checks passed; public commit review pending.')
