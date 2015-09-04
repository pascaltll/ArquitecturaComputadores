;Programa numero 1 si P3.2 es presionado 
; se activa una barra de progresos en P1 indefinidamente

	
	org 8000h
	
	mov a,#0
	mov p1,a
	inicio:
		jnb P3.2,BarraDeProgreso
		sjmp inicio
	
	
	
	BarraDeProgreso:
		mov r0,#80h
		mov a,#0
		mov p1,a
		lcall retardo
		mov r5,#8
	ida:
		add a,r0
		mov p1,a
		lcall retardo
		rr a
		djnz r5,ida
		
	mov r5,#8
	mov r0,#1
	vuelta:	
		subb a,r0
		mov p1,a
		lcall retardo
		rl a
		
		djnz r5,vuelta
		sjmp BarraDeProgreso
		
	retardo:
		mov r1,#255
		loop1:
		mov r2,#255
		loop2:
		djnz r2,loop2
		djnz r1,loop1
		ret
	END
		