;Programa 1 del lab2 dirigido
;Hacer un programa que dado un número hexadecimal 
;por ejemplo “0F5” lo convierta a un número de
; 3 dígitos decimales almacenados en 40h, 41h
; 42h y los envíe al terminal 
;serial.
sndchr equ 148h
crlf equ 115h
print equ 136h
getbyt equ 11Eh
	org 8000h
	;mov A,#80h
	repite:
	lcall print
	
	db "Ingrese Numero :",0 ; todo mensaje para lcall print siempre termina en 0
			;porque sino continuaria a la sgte linea de codigo
	lcall getbyt; El numero ingresado se coloca en A
	
	mov B,#100; porque quiero dividir A entre B
	div AB ; Divido A entre B
	mov 40h,A
	mov A,B
	mov B,#10
	div AB
	mov 41h,A
	mov 42h,B
	
	lcall crlf
	
	mov A,40h
	add A,#30h
	lcall sndchr
	
	mov A,41h
	add A,#30h
	
	lcall sndchr;LO ENVIE AL PUERTO TERMINAL
		    ;APARECE EN HYPERTERMINAL
	
	mov A,42h
	add A,#30h
	lcall sndchr
	lcall crlf
	ljmp repite;2f0h
	END
	;Solo funciona para 8 bits de 0-255
	; tarea hacer que funcione para 16 bits
	
		
	