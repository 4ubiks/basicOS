print_hex:
	pusha

	mov cx, 0

hex_loop:
	cmp cx, 4 			; loop 4 times
	je end

	mov ax, dx 			; 'ax' is working register
	and ax, 0x000f 		; 0x1234 -> 0x0004, masking first 3 digits
	add al, 0x30 		; add 0x30 to N
	cmp al, 0x39		; if al > 9, add 8
	jle step2
	add al, 7

step2:
	mov bx, HEX_OUT + 5
	sub bx, cx
	mov [bx], al
	ror dx, 4 			; 0x1234 -> 0x4123 -> 0x4312 etc

	add cx, 1
	jmp hex_loop

end:
	mov bx, HEX_OUT
	call print

	popa
	ret

HEX_OUT:
	db '0x0000', 0
