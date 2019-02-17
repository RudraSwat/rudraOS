	BITS 16

	jmp short start		; Jump past disk description section
	nop			; Pad out before disk description

	%include "bpb.asm"

start:
	mov ax, 07C0h		; Where we're loaded
	mov ds, ax			; Data segment

	mov ax, 9000h		; Set up stack
	mov ss, ax
	mov sp, 0FFFFh		; Stack grows downwards!

	cld			; Clear direction flag

	mov si, kern_filename
	call load_file

	jmp 2000h:0000h		; Jump to loaded kernel

	kern_filename	db "MYKERNELBIN"

	%include "disk.asm"

	times 510-($-$$) db 0	; Pad to 510 bytes with zeros
	dw 0AA55h		; Boot signature

buffer:				; Disk buffer begins
