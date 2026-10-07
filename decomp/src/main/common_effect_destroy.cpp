// Explicit destructor-entry ABI bridge. Other class methods remain unknown.
typedef unsigned int Word;
typedef unsigned short Halfword;
extern "C" void func_02015ed8(void*);

class CommonEffectAbi {
public:
    Word vptr;
    unsigned char unknown_04_7f[0x7c];
    Halfword member_80;
    unsigned char unknown_82_83[2];
    CommonEffectAbi* Destroy() {
        func_02015ed8(this);
        return this;
    }
};

typedef char PointerWidth[sizeof(void*) == 4 ? 1 : -1];
typedef char WordWidth[sizeof(Word) == 4 ? 1 : -1];
typedef char HalfwordWidth[sizeof(Halfword) == 2 ? 1 : -1];
typedef char ObjectExtent[sizeof(CommonEffectAbi) == 0x84 ? 1 : -1];
typedef char VptrOffset[(unsigned long)&((CommonEffectAbi*)0)->vptr == 0 ? 1 : -1];
typedef char MemberOffset[(unsigned long)&((CommonEffectAbi*)0)->member_80 == 0x80 ? 1 : -1];

extern "C" CommonEffectAbi* func_0206d010(CommonEffectAbi* self) {
    return self->Destroy();
}
