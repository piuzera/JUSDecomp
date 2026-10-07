extern unsigned int hyp_arena_initialized;
extern void *arm7_high_getter_trial(unsigned int id);
extern void *arm7_low_getter_trial(unsigned int id);
extern void arm7_store_trial(unsigned int index, unsigned int value);
extern void arm7_low_store_trial(unsigned int index, unsigned int value);

void arm7_arena_init_trial(void)
{
    if (hyp_arena_initialized != 0u)
        return;
    hyp_arena_initialized = 1u;
    arm7_store_trial(1u, (unsigned int)arm7_high_getter_trial(1u));
    arm7_low_store_trial(1u, (unsigned int)arm7_low_getter_trial(1u));
    arm7_store_trial(7u, (unsigned int)arm7_high_getter_trial(7u));
    arm7_low_store_trial(7u, (unsigned int)arm7_low_getter_trial(7u));
    arm7_store_trial(8u, (unsigned int)arm7_high_getter_trial(8u));
    arm7_low_store_trial(8u, (unsigned int)arm7_low_getter_trial(8u));
}
