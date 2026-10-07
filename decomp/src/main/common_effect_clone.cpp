// ARM physical storage view only; this does not redefine the recovered class.
class CommonEffectAbi;
typedef unsigned int Word;
typedef unsigned short Halfword;
struct CommonEffectCloneStorage {
    Word vptr;
    unsigned char unknown_04_7f[0x7c];
    Halfword member_80;
    unsigned char unknown_82_83[2];
};
typedef char PointerWidth[sizeof(CommonEffectAbi*) == 4 ? 1 : -1];
typedef char WordWidth[sizeof(Word) == 4 ? 1 : -1];
typedef char HalfwordWidth[sizeof(Halfword) == 2 ? 1 : -1];
typedef char StorageExtent[sizeof(CommonEffectCloneStorage) == 0x84 ? 1 : -1];
typedef char VptrOffset[(unsigned long)&((CommonEffectCloneStorage*)0)->vptr == 0 ? 1 : -1];
typedef char MemberOffset[(unsigned long)&((CommonEffectCloneStorage*)0)->member_80 == 0x80 ? 1 : -1];
extern "C" char data_0209e040[];
extern "C" char data_0209dfc4[];
extern "C" Word data_0209e114[];
extern "C" CommonEffectAbi* func_0201a21c(Word, const void*, const void*, Word);
extern "C" void func_02015dd4(CommonEffectAbi*, CommonEffectAbi*);

extern "C" CommonEffectAbi* func_0206cfc0(CommonEffectAbi* original) {
    CommonEffectAbi* copy = func_0201a21c(0x84, data_0209e040, data_0209dfc4, 0xa2);
    if (copy) {
        func_02015dd4(copy, original);
        CommonEffectCloneStorage* destination = reinterpret_cast<CommonEffectCloneStorage*>(copy);
        CommonEffectCloneStorage* source = reinterpret_cast<CommonEffectCloneStorage*>(original);
        destination->vptr = reinterpret_cast<Word>(data_0209e114);
        destination->member_80 = source->member_80;
    }
    return copy;
}
