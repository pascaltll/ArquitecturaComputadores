;Programa3 opera U*V+W-X-Y-Z+2
;U=3, V=80,W=10,X=80,Y=20 y Z=145

	org 8000h
	
	inicio:
			clr C; limpiamos el carry
			mov R0,#3
			mov R1,#80
			mov B,R1
			mov A,R0
			mul AB
			mov R0,#10
			add A,R0
			mov R0,#80
			subb A,R0
			mov R0,#20
			subb A,R0
			mov R0,#145
			subb A,R0
			add A,#2
			
			mov R0,A;resultado en r1
			mov R5,#0
			
		Resultado:
			
			subb A,r5
			jz Imprime
			inc R5
			mov A,R0
			sjmp Resultado	
			
		Imprime:
			
			mov A,R5
		
			lcall display
			cpl A
			mov p1,A
			sjmp Imprime
			
										
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
			
				
			
			