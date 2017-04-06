org 8000h;apaga y prende todos los leds
sdelay equ 142h
mov P1,#0h
repite:
	mov P1,#255 ;prende todos los leds
	lcall sdelay
	lcall sdelay
	mov P1,#0h
	lcall sdelay
	lcall sdelay
	mov P1,#255
	
	sjmp repite
	END
