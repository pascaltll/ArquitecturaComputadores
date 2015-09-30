;Generar 15Hz.
;Ejercicio hacerlo de 20 Hz y 25 Hz

snd equ 148h
	org 8000h
	mov TMOD ,#81h;Modo 1 del timer 0 (16bits).
	mov TH0,#87h;Inicializa el timer 1 con "87FE"
	mov TL0,#0FEh ;6553-33333
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
	end