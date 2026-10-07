void arm7_store_trial(unsigned int index, unsigned int value)
{
    *(volatile unsigned int *)(0x027ffdc4u + (index << 2)) = value;
}
