mov ah, 0x0e 		; tty mode

mov bp, 0x8000 		; starting stack at 0x8000
mov sp, bp

push 'R'
push 'B'
push 'X'

mov al, [0x7ffe] 	; 0x8000 - 2
int 0x10

mov al, [0x8000]
int 0x10


pop bx
mov al, bl
int 0x10


pop bx
mov al, bl
int 0x10


pop bx
mov al, bl
int 0x10


mov al, [0x8000]
int 0x10


jmp $
times 510-($-$$) db 0
dw 0xaa55
