import hashlib,json,struct,subprocess
from pathlib import Path
P=Path('/private/tmp/jus-arm7-reachable-root-proof')
J=Path('/private/tmp/jus-track-a')
B=Path('/private/tmp/jus-track-a-arm7-physical-root-proof')
T=Path('/private/tmp/jus-arm7-reachable-root-cache/target/release')
h=lambda data:hashlib.sha256(data).hexdigest()
cli=T/'dsd'; physical=T/'examples/arm7_physical_baseline'
assert h(cli.read_bytes())=='0e63e31cd3d3a6b7fc5e551c12ad31e7c86156a30c854497645b5106bb5a4ab0'
assert h(physical.read_bytes())=='e7843875fcf159eb680183d663a99e9338d2a76a1fb5dbebcd91ac3f332f1ba6'
rom=Path('/Users/djdjo/Documents/mine/rom/jus.nds');data=rom.read_bytes();assert h(data)=='a9c9bf89e6d99548b7c87e822b217c3fb74ef25186535b06193a6fb73d0d6d27'
fat=struct.unpack_from('<I',data,0x48)[0];start,end=struct.unpack_from('<II',data,fat+79*8);child=data[start:end]
assert len(child)==2141384 and h(child)=='1f68f8a95818ca23e359aa24ab21b7353b6e3515964957f0f519caaaa6ec4986'
layout=J/'decomp/matching-notes/other-cpus/arm7-checked-layouts.json';pins=J/'decomp/matching-notes/other-cpus/arm7-physical-baseline/native-pins.json'
output=P/'native-actual'
argv=[str(physical),str(rom),str(layout),h(layout.read_bytes()),str(pins),h(pins.read_bytes()),str(output)]
assert json.loads((P/'native-actual-report.json').read_text())['inputs_unchanged']
readback=[]
for i,program in enumerate((data,child)):
 offset,_,base,size=struct.unpack_from('<IIII',program,0x30);original=program[offset:offset+size];assert size==165552
 folder=output/f'program-{i}';image=(folder/'arm7.bin').read_bytes();assert image==original
 elf=(folder/'linked.elf').read_bytes();assert elf[:7]==b'\x7fELF\x01\x01\x01'
 header=struct.unpack_from('<16sHHIIIIIHHHHHH',elf);assert header[2]==40 and header[7]==0x05000200
 loads=[];bss=0;segments=0
 for j in range(header[10]):
  kind,off,vma,lma,fs,ms,flags,align=struct.unpack_from('<IIIIIIII',elf,header[5]+j*header[9])
  if kind!=1:continue
  segments+=1
  if fs:loads.append((lma-base,elf[off:off+fs]));assert fs==ms
  else:bss+=ms
 loads.sort();cursor=0;rebuilt=bytearray()
 for position,payload in loads:assert position==cursor;rebuilt.extend(payload);cursor+=len(payload)
 assert bytes(rebuilt)==original and segments==6 and bss==21424 and len(loads)==4
 readback.append({'program':i,'original_program_sha256':h(program),'stored_image_bytes':size,'image_sha256':h(image),'elf_sha256':h(elf),'ELF_only_exact_original':True,'load_segments':segments,'initialized_segments':len(loads),'BSS_bytes':bss})
 print('ARM7 program',i,'exact original ELF-only',size,'bytes',flush=True)
assert h(rom.read_bytes())==h(data)
assert h(cli.read_bytes())=='0e63e31cd3d3a6b7fc5e551c12ad31e7c86156a30c854497645b5106bb5a4ab0'
assert h(physical.read_bytes())=='e7843875fcf159eb680183d663a99e9338d2a76a1fb5dbebcd91ac3f332f1ba6'
(P/'native-readback.json').write_text(json.dumps({'status':'passed','command':argv,'programs':readback,'source_bytes':0,'T10_complete':False},indent=2)+'\n')
