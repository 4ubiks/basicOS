; `qemu-system-x86_64 -fda bootMain` boots from a floppy
; `qemu-system-x86_64 bootMain -boot c` boots from hard disk

[org 0x7c00]

	mov bp, 0x8000
	mov sp, bp

	mov bx, 0x9000
	mov dh, 2 			; read 2 sectors

	call disk_load

	mov dx, [0x9000]
	call print_hex

	call print_nl

	mov dx, [0x9000 + 512]
	call print_hex

	jmp $

%include "../strings5/print.s"
%include "../strings5/print_hex.s"
%include "boot.s"

times 510-($-$$) db 0
dw 0xaa55

; boot sector, sector 1 of cyl 0 of head 0 of hdd 0
; from now on = sector 2...
times 256 dw 0xdada
times 256 dw 0xface
