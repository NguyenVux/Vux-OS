; A boot sector that enters 32 - bit protected mode.
	[ org 0x7c00 ]
	bits 16
	mov bp,0x7e00 ; Set the stack.
	mov sp,bp
	push MSG_REAL_MODE
	call print_string
	call switch_to_pm ; Note that we never return from here.
%include "print_string.asm"
%include "print_pm.asm"
%include "gdt.asm"
%include "pm.asm"
[bits 32]
BEGIN_PM:
	mov bx,MSG_PROT_MODE
	call print_string_pm
	jmp $ 
MSG_REAL_MODE: db "Started in 16 - bit Real Mode",0
MSG_PROT_MODE: db "Successfully landed in 32 - bit Protected Mode",0
times 510 -( $ - $$ ) db 0
dw 0xaa55