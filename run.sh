nasm -f elf32 boot.asm -o boot.o
nasm -f elf32 io.asm -o io.o
gcc -m32 -ffreestanding -fno-pie -c kernal.c -o kernel.o
ld -m elf_i386 -T linker.ld io.o boot.o kernel.o -o os_image.bin
qemu-system-i386 -drive format=raw,file=os_image.bin
