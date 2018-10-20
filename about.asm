	ORG 32768

	mov ah, 0Eh
	mov al, 'r'
	int 10h
	mov al, 'u'
	int 10h
	mov al, 'd'
	int 10h
	mov al, 'r'
	int 10h
	mov al, 'a'
	int 10h
	mov al, 'O'
	int 10h
	mov al, 'S'
	int 10h
	mov al, ' '
	int 10h
	mov al, '2'
	int 10h
	mov al, '0'
	int 10h
	mov al, '1'
	int 10h
	mov al, '8'
	int 10h
	ret
