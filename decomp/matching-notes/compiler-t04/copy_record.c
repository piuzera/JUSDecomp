/* Instruction-derived two-pointer comparison followed by conditional copy. */
extern unsigned char data_020b0dbc[];
extern unsigned char data_020b02ac;
extern int func_02078ad0(const void *, const void *);
extern void func_02051890(void *, const void *, unsigned int);
extern void func_02073114(unsigned int, unsigned int);
void func_02071f60(unsigned char index, void *destination) {
    unsigned char *source = data_020b0dbc + index * 92;
    if (func_02078ad0(source, destination)) {
        func_02051890(destination, source, 92);
        data_020b02ac = 1;
    }
    func_02073114(0xb04, 0x11f8);
}
