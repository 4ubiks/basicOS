#include "isr.h"
#include "idt.h"
#include "../drivers/screen.h"
#include "../kernel/util.h"

#include <stdint.h>

void isr_install(){
	set_idt_gate(0, (u32)(uintptr_t)isr0);
	set_idt_gate(1, (u32)(uintptr_t)isr1);
	set_idt_gate(2, (u32)(uintptr_t)isr2);
	set_idt_gate(3, (u32)(uintptr_t)isr3);
	set_idt_gate(4, (u32)(uintptr_t)isr4);
	set_idt_gate(5, (u32)(uintptr_t)isr5);
	set_idt_gate(6, (u32)(uintptr_t)isr6);
	set_idt_gate(7, (u32)(uintptr_t)isr7);
	set_idt_gate(8, (u32)(uintptr_t)isr8);
	set_idt_gate(9, (u32)(uintptr_t)isr9);
	set_idt_gate(10, (u32)(uintptr_t)isr10);
	set_idt_gate(11, (u32)(uintptr_t)isr11);
	set_idt_gate(12, (u32)(uintptr_t)isr12);
	set_idt_gate(13, (u32)(uintptr_t)isr13);
	set_idt_gate(14, (u32)(uintptr_t)isr14);
	set_idt_gate(15, (u32)(uintptr_t)isr15);
	set_idt_gate(16, (u32)(uintptr_t)isr16);
	set_idt_gate(17, (u32)(uintptr_t)isr17);
	set_idt_gate(18, (u32)(uintptr_t)isr18);
	set_idt_gate(19, (u32)(uintptr_t)isr19);
	set_idt_gate(20, (u32)(uintptr_t)isr20);
	set_idt_gate(21, (u32)(uintptr_t)isr21);
	set_idt_gate(22, (u32)(uintptr_t)isr22);
	set_idt_gate(23, (u32)(uintptr_t)isr23);
	set_idt_gate(24, (u32)(uintptr_t)isr24);
	set_idt_gate(25, (u32)(uintptr_t)isr25);
	set_idt_gate(26, (u32)(uintptr_t)isr26);
	set_idt_gate(27, (u32)(uintptr_t)isr27);
	set_idt_gate(28, (u32)(uintptr_t)isr28);
	set_idt_gate(29, (u32)(uintptr_t)isr29);
	set_idt_gate(30, (u32)(uintptr_t)isr30);
	set_idt_gate(31, (u32)(uintptr_t)isr31);

	set_idt();
}

char *exception_messages[] = {
	"Division by Zero",
	"Debug",
	"Non Maskable Interrupt",
	"Breakpoint", 
	"Into Detected Overflow", 
	"Out of Bounds", 
	"Invalid Opcode",
	"No coprocessor",

	"Double Fault",
	"Coprocessor Segment Overrun",
	"Bad TSS",
	"Segment Not Present",
	"Stack Fault", 
	"General Protection Fault",
	"Page Fault",
	"Unknown Interrupt",

	"Coprocessor Fault",
	"Alignment Check",
	"Machine Check",
	"Reserved",
	"Reserved",
	"Reserved",
	"Reserved",
	"Reserved",

	"Reserved",
	"Reserved",
	"Reserved",
	"Reserved",
	"Reserved",
	"Reserved",
	"Reserved",
	"Reserved"
};

void isr_handler(registers_t r){
	kprint("received interrupt: ");
	char s[3];
	int_to_ascii(r.int_no, s);
	kprint(s);
	kprint("\n");
	kprint(exception_messages[r.int_no]);
	kprint("\n");
}
