[bits 16]
switch_to_pm:
	cli 					; (1) disable interrupts
	lgdt [gdt_descriptor] 	; (2) load gdt descriptor
	mov eax, cr0
	or eax, 0x1 			; (3) set 32-bit mode bit in cr0
	mov cr0, eax
	jmp CODE_SEG:init_pm	; (4) jump by different segment

[bits 32]
init_pm:
	mov ax, DATA_SEG		; (5) update segment registers
	mov ds, ax
	mov ss, ax
	mov es, ax
	mov fs, ax
	mov gs, ax

	mov ebp, 0x90000		; (6) update the stack
	mov esp, ebp

	call BEGIN_PM			; (7) call a well-known label
