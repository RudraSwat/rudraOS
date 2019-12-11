	mov ah, 09h
	mov cx, 1000h
	mov al, 20h
	mov bl, 70
	mov ax, 2000h
	mov ds, ax
	mov es, ax
	mov si, start
	call lib_print_string
	mov si, os_name
	call lib_print_string
	mov si, os_kernelversion
	call lib_print_string

loop:
	mov si, prompt
	call lib_print_string
	mov si, user_input
	call lib_input_string

	cmp byte [si], 0
	je loop
	cmp word [si], "ls"
	je list_files

	mov ax, si
	mov cx, 32768
	call lib_load_file
	jc load_fail

	call 32768
	jmp loop

load_fail:
	mov si, load_fail_msg
	call lib_print_string
	jmp loop

list_files:
	mov si, file_list
	call lib_get_file_list
	call lib_print_string
	jmp loop

	start 		db 13, 10, "rudraOS 2018", 0
	prompt 		db 13, 10, "rudraOS2.0 $ ", 0
	name 		db 13, 10, "What is your full name? ", 0
	load_fail_msg	db 13, 10, "404 - No such executable or command", 0
	user_input	times 256 db 0
	file_list	times 1024 db 0

	%include "rosasm-std.inc"
	%include "disinf.inc"
