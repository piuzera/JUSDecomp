void arm7_low_store_trial(unsigned int index, unsigned int value)
{
    *(volatile unsigned int *)(0x027ffda0u + (index << 2)) = value;
}
