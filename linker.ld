ENTRY(start)
OUTPUT_FORMAT("binary")

SECTIONS
{
    . = 0x7C00;

    .text : {
        boot.o(.text)
        *(.text)
        *(.rodata*)     /* MERGE STRINGS DIRECTLY INTO CODE BEFORE 512 BYTES! */
    }

    .data : {
        *(.data)
    }

    .bss : {
        *(.bss)
    }
}
