typedef unsigned long Word32;
typedef unsigned short Half16;
typedef struct Storage20 {
    void *dispatch;
    Word32 zero;
    const char *key;
    const char *label;
    Half16 key_code;
    Half16 label_code;
} Storage20;
typedef struct CounterPrefix {
    unsigned char prefix[0x30c];
    Word32 count;
} CounterPrefix;
typedef char word_width[(sizeof(Word32) == 4) ? 1 : -1];
typedef char half_width[(sizeof(Half16) == 2) ? 1 : -1];
typedef char pointer_width[(sizeof(void *) == 4) ? 1 : -1];
typedef char storage_width[(sizeof(Storage20) == 20) ? 1 : -1];
typedef char zero_offset[((Word32)&((Storage20 *)0)->zero == 4) ? 1 : -1];
typedef char key_offset[((Word32)&((Storage20 *)0)->key == 8) ? 1 : -1];
typedef char label_offset[((Word32)&((Storage20 *)0)->label == 12) ? 1 : -1];
typedef char key_code_offset[((Word32)&((Storage20 *)0)->key_code == 16) ? 1 : -1];
typedef char label_code_offset[((Word32)&((Storage20 *)0)->label_code == 18) ? 1 : -1];
typedef char count_offset[((Word32)&((CounterPrefix *)0)->count == 0x30c) ? 1 : -1];
extern unsigned char data_02098708;
extern CounterPrefix data_020a0c34;
extern Word32 func_020326b0(const char *text);
Storage20 *func_0202c4ac(Storage20 *storage, const char *key, const char *label)
{
    storage->dispatch = &data_02098708;
    storage->zero = 0;
    storage->key = key;
    storage->label = label ? label : key;
    storage->key_code = (Half16)func_020326b0(storage->key);
    storage->label_code = (Half16)func_020326b0(storage->label);
    data_020a0c34.count++;
    return storage;
}
