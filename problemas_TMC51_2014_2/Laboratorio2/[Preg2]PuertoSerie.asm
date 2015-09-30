;Encontrar el valor más grande 
;del siguiente listado de números: 3, 2, 9,
;5, 4, 7, 6, 8, 0, 1,4.
; Mostrar este valor en el display y enviarlo
; al terminal vía el puerto serie.
	org 8000h
prthex equ 13Fh
	mov R5,#0; R5 hace las veces de 
		 ; largest
	mov R6,#11
	mov R7,#0
	
continua:
	mov A,R7
	lcall obtiene_numero
	mov 50h,A
	subb A,R5;comparo con largest (A-R5)
		 ; si es positivo C=0 el Carry es cero
		 
	jnc intercambio
	
sigue:
	inc R7
	djnz R6,continua
	mov 40h,R5
	lcall envia_numero
	
	
intercambio:
	mov R5,50h; mi largest es el  current
	sjmp sigue

envia_numero:
	mov A,40h
	lcall prthex
	ljmp 2f0h; TERMINA
	
		 
obtiene_numero:
	inc A
	movc A,@A+PC
	ret
	db 3, 2, 0Fh,5, 4, 1Eh, 6, 8, 0, 1,4
	end
	