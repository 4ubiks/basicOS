; load 'dh' from drive 'dl' into es:bx
disk_load:
	pusha

	push dx

	mov ah, 0x02 		; 0x02 = 'read'
	mov al, dh			; al = num of sectors to read
	mov cl, 0x02 		; 0x01 is boot, 0x02 is first available

	mov ch, 0x00		; cylinder, upper 2 bits in 'cl'

	mov dh, 0x00 		; head number

	int 0x13			; bios interrupt
	jc disk_error 		; if error

	pop dx
	cmp al, dh
	jne sectors_error
	popa
	ret

disk_error:
	mov bx, DISK_ERROR
	call print
	call print_nl
	mov dh, ah 			; ah = error code, dl is drive that dropped error
	call print_hex
	jmp disk_loop

sectors_error:
	mov bx, SECTORS_ERROR
	call print

disk_loop:
	jmp $

DISK_ERROR db "Disk read error", 0
SECTORS_ERROR db "Incorrect number of sectors read", 0
