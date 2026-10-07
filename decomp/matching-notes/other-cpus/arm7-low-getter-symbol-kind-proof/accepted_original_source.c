extern unsigned char hyp_subpriv_arena_lo;
extern unsigned char hyp_wram_arena_lo;

void *arm7_low_getter_trial(unsigned int id)
{
    switch (id) {
    case 1:
        return &hyp_subpriv_arena_lo;
    case 7:
    {
        unsigned int low = (unsigned int)&hyp_wram_arena_lo;
        if (0x03800000u < low)
            low = 0x03800000u;
        return (void *)low;
    }
    case 8:
    {
        unsigned int low = 0x03800000u;
        if ((unsigned int)&hyp_wram_arena_lo > low)
            low = (unsigned int)&hyp_wram_arena_lo;
        return (void *)low;
    }
    default:
        return 0;
    }
}
