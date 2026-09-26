
#include <stdint.h>

// defines
#define SCREEN_SIZE (80 * 25)
volatile char* vga = (volatile char*)0xB8000;

// external functions from asm
extern uint8_t inb(uint16_t port);
extern void outb(uint16_t port,uint8_t data);

char ascii_chars[256] = {
    [16] = 'Q',
    [17] = 'W',
    [18] = 'E',
    [19] = 'R',
    [20] = 'T',
    [21] = 'Y',
    [22] = 'U',
    [23] = 'I',
    [24] = 'O',
    [25] = 'P',
    [30] = 'A',
    [31] = 'S',
    [32] = 'D',
    [33] = 'F',
    [34] = 'G',
    [35] = 'H',
    [36] = 'J',
    [37] = 'K',
    [38] = 'L',
    [44] = 'Z',
    [45] = 'X',
    [46] = 'C',
    [47] = 'V',
    [48] = 'B',
    [49] = 'N',
    [50] = 'M'
};



int keyboard_handler(void) {
    // 1. Grab raw scancode from hardware buffer
    uint8_t scancode = inb(0x60);

    // 2. Acknowledge PIC hardware interrupt (EOI)
    outb(0x20, 0x20);

    // 3. Process keypress!
    if(!(scancode & 0x80))
    {
        vga[0] = ascii_chars[scancode];
        vga[1] = 0x0F;
    }
     return 0;
}





void kernal(void)
{
    volatile char* vga = (volatile char*)0xB8000;

    while(1)
    {
        int a = keyboard_handler();
    }
}
