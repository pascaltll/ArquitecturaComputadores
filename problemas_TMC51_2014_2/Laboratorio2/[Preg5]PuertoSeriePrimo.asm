;5) Desarrolle un programa que averigua si un número es primo
;o no. Si es primo que muestre en el display “P” y
; si no lo es que muestre “0”. Que envie al terminal
; el mensaje “Es Primo” o “No es Primo” según sea el
; caso. Ingrese el número desde el teclado
;Averigua si es un numero primo o no
sndchr equ 148h
crlf equ 115h
print equ 136h
getbyt equ 11Eh
	org 8000h
otravez:
	lcall print
	db "Ingrese Numero a averiguar",0
	lcall getbyt ; Ingresa el numero por el teclado
	mov 30h,A
	cjne A,#2,otroN
	sjmp SiPrimo
otroN:
	mov R2,#2
continua:
	mov A,30h
	mov B,R2
	div AB
	mov A,B
	cjne A,#0,sigue
	sjmp NoPrimo
sigue:
	inc R2
	mov A,R2
	cjne A,30h,continua
	sjmp SiPrimo
NoPrimo:
	mov A,30h
	lcall numero
	lcall print
	db "no es Primo",0dh,0Ah,0
	lcall crlf
	ljmp otravez
SiPrimo:
	mov a,30h
	lcall numero
	lcall print
	db "Si es primo",0dh,0Ah,0
	lcall crlf
	ljmp otravez
numero:
	mov b,#100
	div AB
	mov 39h,A
	mov A,B
	mov B,#10
	div AB
	mov 40h,A
	mov 41h,B
	mov A,#0ah
	lcall sndchr
	mov a,#0dh
	lcall sndchr
	mov a,39h
	add a,#30h
	lcall sndchr
	mov A,39h
	add a,#30h
	lcall sndchr
	mov a,40h
	add a,#30h
	lcall sndchr
	mov a,41h
	add a,#30h
	lcall sndchr
	ret
	end
	
	
	
