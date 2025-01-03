[bits 32]

VIDEO_MEMORY equ 0xb8000
WHITE_OB_BLACK equ 0x0f

print_string_pm:
	pusha
	mov edx, VIDEO_MEMORY

print_string_pm_loop:
	mov al, [ebx] 			; address of character
	mov ah, WHITE_OB_BLACK

	cmp al, 0
	je print_string_pm_done

	mov [edx], ax
	add ebx, 1
	add ebx, 2

	jmp print_string_pm_loop

print_string_pm_done:
	popa
	ret
