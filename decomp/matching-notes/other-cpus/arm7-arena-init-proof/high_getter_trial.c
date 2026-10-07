extern unsigned char hyp_wram_arena_lo;
extern unsigned char hyp_irq_stack_size;
extern unsigned char hyp_system_stack_size;

void *arm7_high_getter_trial(unsigned int id)
{
    switch (id) {
    case 1:
        return (void *)0x027ff000u;
    case 7:
        return (void *)0x03800000u;
    case 8:
    {
        int irq_size = (int)&hyp_irq_stack_size;
        unsigned int irq_low = 0x0380ff80u - (unsigned int)irq_size;
        unsigned int low = 0x03800000u;
        int system_size;
        if ((unsigned int)&hyp_wram_arena_lo > low)
            low = (unsigned int)&hyp_wram_arena_lo;
        system_size = (int)&hyp_system_stack_size;
        if (system_size == 0)
            return (void *)low;
        if (system_size < 0)
            return (void *)(low - (unsigned int)system_size);
        return (void *)(irq_low - (unsigned int)system_size);
    }
    default:
        return 0;
    }
}
