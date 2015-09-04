;Programa2 
;Al presionar P3.2 desplaza un led encendido de izquierda a derecha y luego de 
;derecha a izquierda

  	org 8000h
  	mov R5,#8
  	mov R0,#80h
  	mov P1,#0
  	inicio:
  		jnb p3.2,Encendido
  		sjmp inicio
  	
  	Encendido: 
  	
  	mov R5,#8;Contador =8	
  	mov a,R0;A<--1000 0000
  	aqui:
  		jnb p3.3,Apagado
  		mov P1,a
  		lcall retardo
  	ida:
  		rr a
  		djnz R5,aqui
  	mov R5,#8
  	vuelta:
  		rl a
  		jnb p3.3,Apagado
  		mov P1,a
  		lcall retardo
  		djnz R5,vuelta
  		;djnz R5,aqui
  		sjmp Encendido
  		
	Apagado:
		mov a,#0
		mov p1,a
		sjmp inicio
	
	retardo:
		mov r1,#255
		loop1:
		mov r2,#255
		loop2:
		djnz r2,loop2
		djnz r1,loop1
		ret
	END
		
  		
  		
  		
  		
  		
  		
  		
  		
  	
  		
	