
ENTRY(start)
OUTPUT_FORMAT("binary")

SECTIONS
{
    . = 0x7C00;

    .text : {
        *(.boot)        /* Places boot assembly section first at 0x7C00 */
        *(.text*)       /* Standard executable code */
        *(.rodata*)     /* Read-only data / string literals */
    }

    .data : {
        *(.data*)
    }

    .bss : {
        *(.bss*)
    }
}
