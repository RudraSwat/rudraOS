sudo apt install nasm qemu-system-i386 mtools -y
nasm -f bin -o boot.bin boot.asm
rm floppy.img
mkdosfs -C floppy.img 1440
dd conv=notrunc if=boot.bin of=floppy.img
nasm -f bin -o mykernel.bin mykernel.asm
mcopy -i floppy.img mykernel.bin ::/
nasm -f bin -o about.bin about.asm
mcopy -i floppy.img about.bin ::/
qemu-system-i386 -fda floppy.img
