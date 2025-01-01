# $@ = target
# $< = first dependency
# $^ all dependencies

# 
all: run

# dependencies are built as needed
kernel.bin: kernel_entry.o kernel.o
	i386-elf-ld -o $@ -Ttext 0x1000 $^ --oformat binary

kernel_entry.o: kernel_entry.s
	nasm $< -felf -o $@

kernel.o: kernel.c
	i386-elf-gcc -ffreestanding -c $< -o $@

# disassemble kernel, for debugging
kernel.dis: kernel.bin
	ndisasm -b 32 $< > $@

bootsect: bootsect.s
	nasm $< -f bin -o $@

os: bootsect kernel
	cat $^ > $@

run: os
	qemu-system-i386 -fda $< 

clean:
	rm *.bin *.o *.dis
