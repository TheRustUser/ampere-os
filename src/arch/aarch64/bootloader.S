.section .text._start
.globl _start

_start:
    ldr x30, =stack_top
    mov sp, x30
    bl kernel_start
    b .

.section .bss.stack
.align 8
stack_bottom:
    .space 4096
stack_top:
