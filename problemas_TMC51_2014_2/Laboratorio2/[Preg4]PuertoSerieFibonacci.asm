;Hacer un programa que encuentre la serie de Fibonacci
; para n=6. Los números de esta 
;serie enviarlo al terminal. Considerar la serie desde n=1.
sndchr equ 148h
crlf equ 115h
print equ 136h
	org 8000h
	mov R3,#1	;hace las veces de a
	mov R4,#1
	lcall print
	db "Serie de Fibonacci:",0
	mov A,R3
	add A,#30h
	lcall sndchr
	MOV a,#20H ; es el codigo ascii del espacio en blanco
	lcall sndchr ; envia un caracter contenido en el acumulador A
	mov A,R4
	add A,#30h
	lcall sndchr
	MOV a,#20H; es el codigo ascii del espacio en blanco
	lcall sndchr; envia un caracter contenido en el acumulador A
	mov R1,#4;hace las veces de b
loop:
	mov A,R3
	add A,R4	;Suma de R3 y R4
	mov R5,A	;R5 hace las veces de c
	mov A,R4
	mov R3,A
	mov A,R5
	mov R4,A
	mov A,R5
	add A,#30h
	lcall sndchr
	mov A,#20h; es el codigo ascii del espacio en blanco
	lcall sndchr; envia un caracter contenido en el acumulador A
	djnz R1,loop
	lcall crlf
	ljmp 2f0h	
	ret
	END