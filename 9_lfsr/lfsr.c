#include <stdint.h>
#include <stdio.h>
unsigned lfsr_galois(void)
{
    uint16_t start_state = 0xACE1u; /* Any nonzero start state will work. */
    uint16_t lfsr = start_state;
    unsigned period = 0;

    do
    {
#ifndef LEFT
        unsigned lsb = lfsr & 1u; /* Get LSB (i.e., the output bit). */
        lfsr >>= 1;               /* Shift register */
        if (lsb)                  /* If the output bit is 1, */
            lfsr ^= 0xB400u;      /*  apply toggle mask. */
#else
        unsigned msb = (int16_t)lfsr < 0; /* Get MSB (i.e., the output bit). */
        lfsr <<= 1;                       /* Shift register */
        if (msb)                          /* If the output bit is 1, */
            lfsr ^= 0x002Du;              /*  apply toggle mask. */
#endif
        ++period;

        printf("%X\n", lfsr);
    } while (lfsr != start_state);

    return period;
}

int main()
{
    printf("%u", lfsr_galois());
    return 0;
}