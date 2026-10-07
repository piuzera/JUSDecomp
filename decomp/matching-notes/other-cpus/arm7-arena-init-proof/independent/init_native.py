"""Independent direct five-MW-object ARM7 initializer native proof."""
import hashlib,json,re,struct,subprocess
from pathlib import Path
import cluster as c
HERE=Path(__file__).resolve().parent
OUT=HERE/'native-init-02'
INIT_SHA='47a79e6c15b3191c2a1d06f8124596ee94e2e42a6defdb4bf270b5820c2b5112'
ROM_SHA='a9c9bf89e6d99548b7c87e822b217c3fb74ef25186535b06193a6fb73d0d6d27'
IMAGE_SHA='0540bd6fba14f886c542b3bfa15b1c0391b23dd4eaa3688367e1813cbc021139'
sha=lambda b:hashlib.sha256(b).hexdigest()
CALLS=[('arm7_high_getter_trial','highgetter'),('arm7_store_trial','upperstore'),('arm7_low_getter_trial','lowgetter'),('arm7_low_store_trial','lowstore')]*3
CALL_OFFSETS=[0x20,0x2c,0x34,0x40,0x48,0x54,0x5c,0x68,0x70,0x7c,0x84,0x90]

def init_object(original):
 data=c.pinned(HERE/'compiled.o',INIT_SHA)
 header,sec,sym,seg=c.parse_elf(data)
 assert header['type']==1 and header['flags']==0x02100000 and not seg
 text,=[x for x in sec if x['name']=='.text'];assert (text['size'],text['flags'],text['align'])==(164,6,4)
 payload=data[text['offset']:text['offset']+164]
 assert [(s['name'],s['value']) for s in sym if s['name'] in ('$a','$d')]==[('$a',0),('$d',160)]
 f=c.get_symbol(sym,'arm7_arena_init_trial');assert f['size']==164 and f['type']==2 and f['binding']==1
 relsec,=[x for x in sec if x['name']=='.rela.text'];assert relsec['type']==4 and relsec['info']==sec.index(text) and relsec['size']==13*12
 records=[]
 for pos in range(relsec['offset'],relsec['offset']+relsec['size'],12):
  off,info,add=struct.unpack_from('<IIi',data,pos)
  records.append((off,info&255,sym[info>>8]['name'],add))
 assert records==[(off,1,name,-8) for off,(name,_) in zip(CALL_OFFSETS,CALLS)]+[(160,2,'hyp_arena_initialized',0)]
 exc,=[x for x in sec if x['name']=='.exceptix'];assert exc['size']==12 and exc['flags']==2
 rex,=[x for x in sec if x['name']=='.rela.exceptix'];assert rex['size']==12 and rex['type']==4
 off,info,add=struct.unpack_from('<IIi',data,rex['offset']);assert (off,info&255,sym[info>>8]['name'],add)==(0,2,'arm7_arena_init_trial',0)
 assert not any(x['type']==9 and x['size'] for x in sec)
 before=original[20956:21120]
 for j in range(40):
  off=j*4;word=struct.unpack_from('<I',payload,off)[0]
  expected=struct.unpack_from('<I',before,off)[0]
  if off in CALL_OFFSETS:assert word==0xeb000000 and expected>>24==0xeb
  else:assert word==expected,(off,hex(word),hex(expected))
 assert struct.unpack_from('<I',payload,160)[0]==0
 assert struct.unpack_from('<I',before,160)[0]==0x03808430
 return {'object_sha256':sha(data),'text_bytes':164,'code_bytes':160,'text_sha256':sha(payload),'call_relocations':records[:-1],'guard_relocation':records[-1],'exceptix_relocation_discarded':True}

def script(layout,bindings,swap=False,wrong_place=False):
 segs=c.segments_from_layout(layout)
 lines=[f"ARM7_HEADER_ENTRY = {layout['entry']};",'ENTRY(ARM7_HEADER_ENTRY)','PHDRS {']
 lines += [f"p{i} PT_LOAD FLAGS({s['flags']});" for i,s in enumerate(segs)]
 lines += ['}',*[f'{name} = 0x{value:08x};' for name,value in bindings.items()],'SECTIONS {']
 for i,s in enumerate(segs):
  section=s['section']
  if section=='.arm7.autoload0':
   selector='prefix.o(.arm7.autoload0.prefix) '
   for marker,role in [('lowstore','upperstore'),('upperstore','lowstore'),('lowgetter','lowgetter'),('highgetter','highgetter')] if swap else [(x,x) for x in c.OBJECT]:
    selector+=f'__{marker}_start = .; {role}.o(.text) __{marker}_end = .; '
   selector+='bridge.o(.arm7.autoload0.bridge) '
   selector+=('. = . + 4; ' if wrong_place else '')+'__init_start = .; init.o(.text) __init_end = .; suffix.o(.arm7.autoload0.suffix)'
  else:
   selector={'.arm7.startup':'startup.o(.arm7.startup)',
    '.arm7.table':'table.o(.arm7.table)',
    '.arm7.autoload1':'autoload1.o(.arm7.autoload1)',
    '.arm7.bss.autoload1':'autoload1.o(.arm7.bss.autoload1)',
    '.arm7.bss.autoload0':'bss0.o(.arm7.bss.autoload0)'}[section]
  noload='(NOLOAD)' if not s['file_bytes'] else ''
  lines += [f"{section} {s['vma']} {noload} : AT({s['lma']}) {{ {selector} }} :p{i}",f'ASSERT(SIZEOF({section}) == {s["memory_bytes"]}, "section size")']
 lines += ['/DISCARD/ : { init.o(.exceptix) }','}','ASSERT(__init_start == 0x037fd02c, "init start")','ASSERT(__init_end == 0x037fd0d0, "init end")']
 for role,(_,_,size,_,_,vma,_) in c.OBJECT.items():
  lines += [f'ASSERT(__{role}_start == {vma}, "{role} start")',f'ASSERT(__{role}_end == {vma+size}, "{role} end")']
 return '\n'.join(lines)+'\n'

def verify(path,map_path,original,layout,bindings,strict=True,check_roles=True):
 data=path.read_bytes();header,sections,symbols,segments=c.parse_elf(data)
 expected=c.segments_from_layout(layout)
 assert header['type']==2 and header['entry']==layout['entry'] and len(segments)==6
 allocated=[s for s in sections if s['flags']&2 and s['size']]
 assert len(allocated)==6 and {s['name'] for s in allocated}=={s['section'] for s in expected}
 byname={s['name']:s for s in allocated}
 for actual,wanted in zip(segments,expected):
  assert actual['type']==1 and actual['align']==4
  assert all(actual[k]==wanted[k] for k in ('vma','lma','file_bytes','memory_bytes','flags'))
  assert actual['vma']%4==actual['offset']%4
  sec=byname[wanted['section']]
  assert sec['vma']==wanted['vma'] and sec['size']==wanted['memory_bytes'] and sec['align']==4
  assert sec['type']==(1 if wanted['file_bytes'] else 8)
  assert sec['flags']==(6 if wanted['section']=='.arm7.autoload0' else (2 if wanted['file_bytes'] else 3))
  if wanted['file_bytes']:
   assert actual['offset']==sec['offset'] and actual['offset']+actual['file_bytes']<=len(data)
   assert data[actual['offset']:actual['offset']+actual['file_bytes']]==data[sec['offset']:sec['offset']+sec['size']]
 assert not any(s['type']in(4,9)and s['size'] for s in sections)
 bysegment={s['section']:a for s,a in zip(expected,segments)}
 image=b''.join(data[bysegment['.arm7.'+x]['offset']:bysegment['.arm7.'+x]['offset']+bysegment['.arm7.'+x]['file_bytes']] for x in ('startup','autoload0','autoload1','table'))
 assert len(image)==len(original)==165552
 diff=[i for i,(a,b) in enumerate(zip(image,original)) if a!=b]
 if strict:assert not diff and sha(image)==IMAGE_SHA
 assert image[:20660]==original[:20660] and image[21120:]==original[21120:]
 assert image[20916:20956]==original[20916:20956]
 assert sum(s['memory_bytes'] for s in segments if not s['file_bytes'])==21424
 if check_roles:
  for role,(_,digest,size,code,offset,vma,name) in c.OBJECT.items():
   f=c.get_symbol(symbols,name);assert f['value']==vma and f['size']==size
   assert c.get_symbol(symbols,f'__{role}_start')['value']==vma
   assert c.get_symbol(symbols,f'__{role}_end')['value']==vma+size
   pattern=rf'(?m)^\s*{vma:x}\s+[0-9a-f]+\s+{size:x}\s+4\s+{role}\.o:\(\.text\)$'
   assert re.search(pattern,map_path.read_text()),role
 f=c.get_symbol(symbols,'arm7_arena_init_trial');assert f['value']==0x037fd02c and f['size']==164
 assert c.get_symbol(symbols,'__init_start')['value']==0x037fd02c
 assert c.get_symbol(symbols,'__init_end')['value']==0x037fd0d0
 assert re.search(r'(?m)^\s*37fd02c\s+[0-9a-f]+\s+a4\s+4\s+init\.o:\(\.text\)$',map_path.read_text())
 observed={name:c.get_symbol(symbols,name)['value'] for name in bindings}
 assert observed==bindings
 assert not any(s['name']=='.exceptix' and s['flags']&2 for s in sections)
 calls=[]
 for offset,(name,role) in zip(CALL_OFFSETS,CALLS,strict=True):
  source=0x037fd02c+offset
  word=struct.unpack_from('<I',image,20956+offset)[0]
  assert word>>24==0xeb
  disp=word&0xffffff
  if disp&0x800000:disp-=0x1000000
  target=(source+8+disp*4)&0xffffffff
  calls.append({'source':f'{source:08x}','word':f'{word:08x}','target':f'{target:08x}','symbol':name,'role':role})
 return {'elf_sha256':sha(data),'image_sha256':sha(image),'image_bytes':len(image),'mismatch_offsets':diff,'BSS_bytes':21424,'segments':segments,'init_sha256':sha(image[20956:21120]),'guard_literal':struct.unpack_from('<I',image,21116)[0],'observed_bindings':observed,'calls':calls}

def main():
 assert not OUT.exists();OUT.mkdir()
 c.pinned(HERE/'arm7-checked-layouts.json','8a518abf785a1c24756d5485ee669f64e304af20a69b0d02a889fb60410d9fcc')
 layout=json.loads((HERE/'arm7-checked-layouts.json').read_text())
 rom=c.pinned(c.ROM,ROM_SHA)
 c.pinned(c.CLANG,'d64d1ee59d8aff01397eb88adea263e490ac65766faefc8b5323b4a06d0438e5')
 c.pinned(c.LLD,'3c9298dbaf1389f490e72bc055e9595cfe5f125e078deff9bedb4c54ceb15a54')
 c.pinned(HERE/'arena_init_trial.c','b014099daa3d3dc1e2a14ca39a434726946067f448ff0e92ae5c2393bb44507e')
 for role,(name,digest) in c.SOURCE.items():c.pinned(HERE/role/name,digest)
 fat=struct.unpack_from('<I',rom,0x48)[0];a,b=struct.unpack_from('<II',rom,fat+79*8)
 records=[]
 for index,(program,checked) in enumerate(zip((rom,rom[a:b]),layout,strict=True)):
  assert sha(program)==checked['identity']['program_sha256']
  image_offset,entry,base,size=struct.unpack_from('<IIII',program,0x30)
  assert (image_offset,entry,base,size)==tuple(checked[k] for k in ('image_offset','entry','base','image_bytes'))
  image=program[image_offset:image_offset+size]
  assert len(image)==165552 and sha(image)==IMAGE_SHA
  cluster=c.check_objects(image);init=init_object(image)
  folder=OUT/f'program-{index}';folder.mkdir()
  autoload=image[432:66552]
  prefix=autoload[:20228];clusterhole=autoload[20228:20484];bridge=autoload[20484:20524];inithole=autoload[20524:20688];suffix=autoload[20688:]
  assert (len(prefix),len(clusterhole),len(bridge),len(inithole),len(suffix))==(20228,256,40,164,45432)
  parts={'startup':image[:432],'table':image[165528:],'autoload1':image[66552:165528],'prefix':prefix,'bridge':bridge,'suffix':suffix}
  for name,payload in parts.items():
   (folder/f'{name}.bin').write_bytes(payload)
   section=('.arm7.autoload0.' if name in ('prefix','bridge','suffix') else '.arm7.')+name
   asm=f'.cpu arm7tdmi\n.section {section},"a",%progbits\n.balign 4\n.incbin "{name}.bin"\n'
   if name=='autoload1':asm+='.section .arm7.bss.autoload1,"aw",%nobits\n.balign 4\n.space 6504\n'
   (folder/f'{name}.s').write_text(asm)
   p=c.run([c.CLANG,'--target=arm-none-eabi','-mcpu=arm7tdmi','-c',f'{name}.s','-o',f'{name}.o'],folder,f'clang-{name}.log');assert p.returncode==0,p.stderr
  (folder/'bss0.s').write_text('.cpu arm7tdmi\n.section .arm7.bss.autoload0,"aw",%nobits\n.balign 4\n.space 14920\n')
  p=c.run([c.CLANG,'--target=arm-none-eabi','-mcpu=arm7tdmi','-c','bss0.s','-o','bss0.o'],folder,'clang-bss0.log');assert p.returncode==0,p.stderr
  for role,(name,digest,*_) in c.OBJECT.items():(folder/f'{role}.o').write_bytes(c.pinned(HERE/name,digest))
  (folder/'init.o').write_bytes(c.pinned(HERE/'compiled.o',INIT_SHA))
  values={'hyp_subpriv_arena_lo':0x027f9c08,'hyp_wram_arena_lo':0x0380bc90,'hyp_irq_stack_size':0x400,'hyp_system_stack_size':0x400,'hyp_arena_initialized':0x03808430}
  def link(trial,bindings,swap=False,wrong_place=False,omit=None):
   (folder/f'{trial}.ld').write_text(script(checked,bindings,swap,wrong_place))
   selected=['startup.o','table.o','autoload1.o','prefix.o']+[f'{r}.o' for r in c.OBJECT]+['bridge.o','init.o','suffix.o','bss0.o']
   selected=[x for x in selected if x!=omit]
   argv=[c.LLD,'-m','armelf','--nmagic','-T',f'{trial}.ld','-Map',f'{trial}.map','-o',f'{trial}.elf']+selected
   return c.run(argv,folder,f'{trial}-lld.log')
  p=link('positive',values);assert p.returncode==0,p.stderr
  positive=verify(folder/'positive.elf',folder/'positive.map',image,checked,values)
  assert positive['init_sha256']==sha(image[20956:21120]) and positive['guard_literal']==0x03808430
  badguard={**values,'hyp_arena_initialized':0x03808434}
  p=link('wrong-guard',badguard);assert p.returncode==0,p.stderr
  wr=verify(folder/'wrong-guard.elf',folder/'wrong-guard.map',image,checked,badguard,False)
  assert wr['mismatch_offsets']==[21116]
  omissions={}
  for role in ['init',*c.OBJECT]:
   p=link(f'omit-{role}',values,omit=f'{role}.o')
   assert p.returncode!=0
   omissions[role]=p.returncode
  p=link('swap-stores',values,swap=True)
  if p.returncode==0:
   sw=verify(folder/'swap-stores.elf',folder/'swap-stores.map',image,checked,values,False,False)
   assert sw['mismatch_offsets']==[20672,20692,21000,21020,21040,21060,21080,21100]
   expected_targets={'lowstore':0x037fcf18,'upperstore':0x037fcf04,'lowgetter':0x037fcf2c,'highgetter':0x037fcf84}
   assert all(int(x['target'],16)==expected_targets[x['role']] for x in sw['calls'])
   _,_,sy,_=c.parse_elf((folder/'swap-stores.elf').read_bytes())
   actual_functions={role:c.get_symbol(sy,row[6])['value'] for role,row in c.OBJECT.items()}
   assert actual_functions==expected_targets
   map_text=(folder/'swap-stores.map').read_text()
   assert re.search(r'(?m)^\s*37fcf04\s+[0-9a-f]+\s+14\s+4\s+upperstore\.o:\(\.text\)$',map_text)
   assert re.search(r'(?m)^\s*37fcf18\s+[0-9a-f]+\s+14\s+4\s+lowstore\.o:\(\.text\)$',map_text)
   try:verify(folder/'swap-stores.elf',folder/'swap-stores.map',image,checked,values,False,True)
   except AssertionError:swap_reject='actual_role_map_or_function'
   else:raise AssertionError('swapped stores accepted')
   swap_actual={**sw,'actual_function_values':actual_functions,'map_sha256':sha((folder/'swap-stores.map').read_bytes()),'strict_role_rejection':swap_reject}
  else:raise AssertionError('expected successful genuine equal-store swap link')
  p=link('wrong-placement',values,wrong_place=True);assert p.returncode!=0
  malformed=bytearray((folder/'positive.elf').read_bytes());phoff=struct.unpack_from('<I',malformed,28)[0]
  off=struct.unpack_from('<I',malformed,phoff+4)[0];struct.pack_into('<I',malformed,phoff+4,off+4)
  (folder/'malformed.elf').write_bytes(malformed)
  try:verify(folder/'malformed.elf',folder/'positive.map',image,checked,values)
  except AssertionError:malformed_reject=True
  else:raise AssertionError('malformed PT_LOAD accepted')
  records.append({'identity':checked['identity'],'cluster_objects':cluster,'initializer_object':init,'positive':positive,'wrong_guard':wr,'omissions':omissions,'swap_rejected_by':swap_reject,'swap_actual':swap_actual,'wrong_placement_rejected':True,'malformed_load_rejected':malformed_reject})
 c.pinned(HERE/'compiled.o',INIT_SHA)
 c.pinned(c.ROM,ROM_SHA)
 result={'status':'five_actual_MW_objects_initializer_exact_both_images','programs':records,'source_credit_bytes':0,'canonical_bytes':304,'T06_open':True,'T10_open':True}
 (OUT/'result.json').write_text(json.dumps(result,indent=2)+'\n')
 print('Five actual MW objects linked in both original images; guard/call relocations and controls checked.')
if __name__=='__main__':main()
