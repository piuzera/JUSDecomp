// ARM physical storage view only; this does not redefine the recovered class.
class CommonEffectAbi;
typedef unsigned int Word;
typedef unsigned short Halfword;
struct CommonEffectStorage {
    Word vptr;
    unsigned char unknown_04_7f[0x7c];
    Halfword member_80;
    unsigned char unknown_82_83[2];
};
typedef char PointerWidth[sizeof(CommonEffectAbi*) == 4 ? 1 : -1];
typedef char WordWidth[sizeof(Word) == 4 ? 1 : -1];
typedef char HalfwordWidth[sizeof(Halfword) == 2 ? 1 : -1];
typedef char StorageExtent[sizeof(CommonEffectStorage) == 0x84 ? 1 : -1];
typedef char VptrOffset[(unsigned long)&((CommonEffectStorage*)0)->vptr == 0 ? 1 : -1];
typedef char MemberOffset[(unsigned long)&((CommonEffectStorage*)0)->member_80 == 0x80 ? 1 : -1];
extern "C" Word data_0209e114[];
extern "C" Word data_020afc40[];
extern "C" void func_02015d0c(CommonEffectAbi*, Word, Word);
extern "C" void func_0202f81c(CommonEffectAbi*, Word);

extern "C" CommonEffectAbi* func_0206ca4c(CommonEffectAbi* self, Word callback_token) {
    func_02015d0c(self, callback_token, 0);
    CommonEffectStorage* storage = reinterpret_cast<CommonEffectStorage*>(self);
    storage->vptr = reinterpret_cast<Word>(data_0209e114);
    storage->member_80 = 0;
    func_0202f81c(self, data_020afc40[2]);
    return self;
}
