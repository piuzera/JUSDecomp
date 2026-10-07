unsigned int arm7_low_load_trial(unsigned int index)
{
    return *(volatile unsigned int *)(0x027ffda0u + (index << 2));
}
