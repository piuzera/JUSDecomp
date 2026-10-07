// Factory-entry ABI only. The original class and callback C++ types are unknown.
class CommonEffectAbi;
typedef unsigned int Word;
typedef char PointerWidth[sizeof(CommonEffectAbi*) == 4 ? 1 : -1];
typedef char WordWidth[sizeof(Word) == 4 ? 1 : -1];
extern "C" char data_0209e000[];
extern "C" char data_0209dfd0[];
extern "C" CommonEffectAbi* func_0201a21c(Word, const void*, const void*, Word);
extern "C" CommonEffectAbi* func_0206ca4c(CommonEffectAbi*, Word);
extern "C" void* func_02024a30(void*);

extern "C" CommonEffectAbi* func_0206c57c() {
    CommonEffectAbi* storage = func_0201a21c(0x84, data_0209e000, data_0209dfd0, 0x95);
    if (!storage)
        return storage;
    return func_0206ca4c(storage, reinterpret_cast<Word>(&func_02024a30));
}
