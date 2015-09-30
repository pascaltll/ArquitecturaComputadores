; Hacer un programa que calcule el factorial 
;de “5”. Mostrar este resultado en las 
;posiciones de memoria 31h, 32h y 33h 
;como dígitos decimales. Este resultado enviarlo 
;al terminal.
sndchr equ 148h
crlf equ 115h


	org 8000h
	
	mov R6,#1; Hace las veces de F del algoritmo Factorial(n)
	mov R7,#1; Hace las veces de i del algoritmo Factorial(n)
continua:
	mov A,R6
	mov B,R7
	mul AB 	; BA = R6 * R7
	mov R6,A
	inc R7;i++
	mov A,R7
	cjne A,#6,continua
	mov 40h,R6
	lcall numero
	ljmp 2f0h
	
numero:
	mov A,40h
	mov B,#100; porque quiero dividir A entre B
	div AB ; Divido A entre B
	mov 31h,A
	mov A,B
	mov B,#10
	div AB
	mov 32h,A
	mov 33h,B
	
	lcall crlf
	
	mov A,31h
	add A,#30h
	lcall sndchr
	
	mov A,32h
	add A,#30h
	
	lcall sndchr;LO ENVIE AL PUERTO TERMINAL
		    ;APARECE EN HYPERTERMINAL
	
	mov A,33h
	add A,#30h
	lcall sndchr
	lcall crlf
	
	ret
	
	END
	