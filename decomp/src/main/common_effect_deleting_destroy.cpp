// Observed deleting-destructor entry. The allocation's ownership model is unknown.
class CommonEffectAbi;
typedef char PointerWidth[sizeof(CommonEffectAbi*) == 4 ? 1 : -1];
extern "C" void func_02015ed8(void*);
extern "C" void func_0201b244(void*);

extern "C" CommonEffectAbi* func_0206cfa4(CommonEffectAbi* self) {
    func_02015ed8(self);
    func_0201b244(self);
    return self;
}
