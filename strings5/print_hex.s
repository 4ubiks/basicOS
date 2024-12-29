print_hex:
	pusha

	mov cx, 0

message:
	mov si, proof
	mov ah, 0eh

msgloop:
	mov al, [si]
	cmp al, 0
	je hex_loop
	int 0x10
	inc si
	mov di, 0
	jmp msgloop


; gets last char of dx, converts to ascii
hex_loop:
	cmp cx, 4
	je end

	mov ax, dx
	and ax, 0x000f		; 0x1234 -> 0x0004
	add al, 0x30		; add 0x30 to N, converting to ascii 'N'
	cmp al, 0x39		; if > 9, add 8 to represent 'A' to 'F'
	jle step2
	add al, 7			; 'A' is 65, not 58, so 65-58 =7

step2:
	; get correct position of ascii char
	; bx <- base address + string length - index of char
	mov bx, HEX_OUT + 5
	sub bx, cx
	mov [bx], al
	ror dx, 4

	add cx, 1
	jmp hex_loop

end:
	mov bx, HEX_OUT
	call print

	popa
	ret

HEX_OUT db '0x0000', 0
proof db 'here is print_hex', 0x0D, 0x0A, 0
