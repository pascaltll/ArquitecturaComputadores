;Programa 4 
	org 8000h
	
	mov P1,#0
	
	
	inicio:
		jnb P3.2,Conteo
		mov R3,#0
		mov R0,#10
		sjmp inicio
	Conteo:
		mov A,R3
		jnb P3.3,Detener
		lcall display
		cpl A
		mov p1,A
		inc R3
		lcall retardo
		djnz R0,Conteo
		sjmp inicio
	
	Detener:
		sjmp inicio

	retardo:
		mov r1,#255
		loop1:
		mov r2,#255
		loop2:
		djnz r2,loop2
		djnz r1,loop1
		ret


	display:
		inc a		;incremento el valor de A
		movc a,@a+pc	;muevo a A el valor del contenido de la dirección de memoria (pc+a)
		ret		;Retorno de la subrutina al programa principal
		db	0C0h	;Con este código se muestra "0" en el display
		db	0F9h	;Con este código se muestra "1" en el display
		db	0A4h	;"2"
		db	0B0h	;"3"
		db	99h	;"4"
		db	92h	;"5"
		db	82h	;"6"
		db	0F8h	;"7"
		db	80h	;"8"
		db	90h	;"9"
		
        	
  END