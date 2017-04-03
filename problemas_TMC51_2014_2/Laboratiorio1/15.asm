org 8000h;parpadea dos led 
mov P1,#0h;apagatodos los leds
repite:
	setb P1.0 
	clr P1.1
	lcall retardo
	clr P1.0
	setb P1.1
	lcall retardo
	sjmp repite
retardo:
	mov R5,#255
loop:	
	mov R6,#255
	djnz R6,$
	djnz R5,loop
	ret
	end
