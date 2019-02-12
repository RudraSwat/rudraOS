        ORG 32768

        mov si, about
        call lib_print_string
        ret

    about          db 13, 10, "Test", 0

        %include "lib.asm"
