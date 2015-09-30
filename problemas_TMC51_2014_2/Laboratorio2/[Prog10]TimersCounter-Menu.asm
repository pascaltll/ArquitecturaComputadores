;Menu que selecciona frecuencias de 10hz , 15 hz, y 30hz
	org 8000h
	print equ 136h
	getbyt equ 11Eh
		lcall print;Print s una subrutina grabado en el flash rom
			;se usa para imprimir mensajes en el terminal
			
		db 0dh,0ah,"M E N U  D E  P R O G R A M A S"
		db 0dh,0ah,"==============================",0dh,0ah
		db 0dh,0ah,"HECHO POR: Renzo Cerron Tome",0dh,0ah
		db 0dh,0ah,"01) 10 hertz"
		db 0dh,0ah,"02) 15 hertz"
		db 0dh,0ah,"03) 20 hertz"
		db 0dh,0ah,"Seleccione: ",0
		lcall getbyt
		cjne A,#1,otraOpcion
		sjmp DiezHertz
	DiezHertz:
		
	mov TMOD ,#81h;Modo 1 del timer 0 (16bits).
	mov TH0,#87h;Inicializa el timer 1 con "87FE"
	mov TL0,#0FEh
	
	repite:
	
	setb TR0;arranca el timer 0

	no_overflow:
	
	jnb TF0,no_overflow
	clr TR0
	cpl P1.0; se genera 15 Hz
	clr TF0
	mov Th0,#87h
	mov TL0,#0FEh
	sjmp repite
	
	
otraOpcion:
cjne A,#02,VeinteHertz
sjmp QuinceHertz
QuinceHertz:
;....
sjmp QuinceHertz
VeinteHertz:
sjmp VeinteHertz
end