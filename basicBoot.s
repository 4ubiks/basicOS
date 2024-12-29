org 0x7C00
loop:
	mov si, string
	mov ah, 0eh

msgloop:
	mov al, [si]
	cmp al, 0
	je exit
	int 0x10
	inc si
	mov di, 0
	jmp msgloop

exit:
	int 0x80

string db 0x0D, 0x0A, 'hello', 0

times 510-($-$$) db 0
dw 0xaa55
