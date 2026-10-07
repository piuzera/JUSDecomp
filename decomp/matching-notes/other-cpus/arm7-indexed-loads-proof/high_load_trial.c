unsigned int arm7_high_load_trial(unsigned int index)
{
    return *(volatile unsigned int *)(0x027ffdc4u + (index << 2));
}
