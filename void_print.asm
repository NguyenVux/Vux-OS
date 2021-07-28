;;void print_string(output_format,data)
;;
;;

void_print:
	push bp
	mov bp,sp
	pusha
	mov al,[bp+4]
	mov dl,[bp+6]
	cmp dl,1
	je .print_char
.print_hex:
	mov dl,al
	shr al,4
	and ax ,0x000f
	mov si,TABLE
	add si,ax
	mov al,[si]
	mov ah, 0x0e
	int 10h

	mov al,dl
	and ax,0x000f
	mov si,TABLE
	add si,ax
	mov al,[si]
	mov ah, 0x0e
	int 10h

	jmp .return
.print_char:
	mov ah, 0x0e
	int 10h
	jmp .return
.return: 
	popa
	mov sp,bp
	pop bp
	ret

TABLE: db "0123456789ABCDEF"