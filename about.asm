	ORG 32768

	mov si, about
	call lib_print_string
	ret

    about  	   db 13, 10, "rudra	S 2018 is an x86 operating system built from scratch in Assembly. Licensed by Rudra Saraswat of BlueFire, Inc. This OS has a shell named tash. The OS has 1 command and one executable.", 0

	%include "lib.asm"
