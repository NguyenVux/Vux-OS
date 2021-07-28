print_string:
	push bp
	mov bp,sp
	pusha
	mov si,[bp+4]
	mov ah,0x0e
.print:
	mov al,[si]
	cmp al,0
 	int 0x10
	je .return
	add si,1
	jmp .print
.return: 
	popa
	mov sp,bp
	pop bp
	pop dx
	add sp,2
	push dx
	ret

