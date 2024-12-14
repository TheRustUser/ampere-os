ENTRY(_start)

SECTIONS {
    . = 0x40100000;

    .text : {
        *(.text._start)
        *(.text)
    }

    .bss : {
        *(.bss.stack)
    }
}
