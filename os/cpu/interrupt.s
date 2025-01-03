; defined in isr.c
[extern isr_handler]

isr_common_stub:
	;save cpu state
	pusha
	mov ax, ds
	push eax
	mov ax, 0x10
	mov ds, ax
	mov es, ax
	mov fs, ax
	mov gs, ax


	; call C handler
	call isr_handler

	; restore state
	pop eax
	mov ds, ax
	mov es, ax
	mov fs, ax
	mov gs, ax
	popa
	add esp, 8
	sti
	iret


; make all isrs global
global isr0
global isr1
global isr2
global isr3
global isr4
global isr5
global isr6
global isr7
global isr8
global isr9
global isr10
global isr11
global isr12
global isr13
global isr14
global isr15
global isr16
global isr17
global isr18
global isr19
global isr20
global isr21
global isr22
global isr23
global isr24
global isr25
global isr26
global isr27
global isr28
global isr29
global isr30
global isr31

; create exceptions

; 0: divide by 0
isr0:
	cli
	push byte 0
	push byte 0
	jmp isr_common_stub

; 1: debug
isr1:
	cli
	push byte 0
	push byte 1
	jmp isr_common_stub

; 2: non-maskable interrupt
isr2:
	cli
	push byte 0
	push byte 2
	jmp isr_common_stub

; int 3
isr3:
	cli
	push byte 0
	push byte 3
	jmp isr_common_stub

; INTO
isr4:
	cli
	push byte 0
	push byte 4
	jmp isr_common_stub

; out of bounds
isr5:
	cli
	push byte 0
	push byte 5
	jmp isr_common_stub

; invalid opcode
isr6:
	cli
	push byte 0
	push byte 6
	jmp isr_common_stub

; coprocessor not available
isr7:
	cli
	push byte 0
	push byte 7
	jmp isr_common_stub

; double fault
isr8:
	cli 
	push byte 0
	push byte 8
	jmp isr_common_stub

; coprocessor segment overrun
isr9:
	cli
	push byte 0
	push byte 9
	jmp isr_common_stub

; bad TSS (task state segment)
isr10:
	cli
	push byte 10
	jmp isr_common_stub

; segment not present
isr11:
	cli
	push byte 11
	jmp isr_common_stub

; stack fault
isr12:
	cli
	push byte 12
	jmp isr_common_stub

; general protection fault
isr13:
	cli
	push byte 13
	jmp isr_common_stub

; page fault
isr14:
	cli
	push byte 14
	jmp isr_common_stub

; reserved exception
isr15:
	cli
	push byte 0
	push byte 15
	jmp isr_common_stub

; floating point
isr16:
	cli
	push byte 0
	push byte 16
	jmp isr_common_stub

; alignment check
isr17:
	cli
	push byte 0
	push byte 17
	jmp isr_common_stub

; machine check exception
isr18:
	cli
	push byte 0
	push byte 18
	jmp isr_common_stub

; reserved
isr19:
	cli
	push byte 0
	push byte 19
	jmp isr_common_stub

; reserved 
isr20:
	cli
	push byte 0
	push byte 20
	jmp isr_common_stub

; reserved
isr21:
	cli
	push byte 0
	push byte 21
	jmp isr_common_stub

; reserved
isr22:
	cli 
	push byte 0
	push byte 22
	jmp isr_common_stub

; reserved
isr23:
	cli
	push byte 0
	push byte 23
	jmp isr_common_stub

; reserved
isr24:
	cli
	push byte 0
	push byte 24
	jmp isr_common_stub

; reserved
isr25:
	cli
	push byte 0
	push byte 25
	jmp isr_common_stub

;reserved
isr26:
	cli
	push byte 0
	push byte 26
	jmp isr_common_stub

; reserved
isr27:
	cli
	push byte 0
	push byte 27
	jmp isr_common_stub

;reserved
isr28:
	cli
	push byte 0
	push byte 28
	jmp isr_common_stub

; reserved
isr29:
	cli
	push byte 0
	push byte 29
	jmp isr_common_stub

; resreved 
isr30:
	cli
	push byte 0
	push byte 30
	jmp isr_common_stub

; reserved 
isr31:
	cli
	push byte 0
	push byte 31
	jmp isr_common_stub
