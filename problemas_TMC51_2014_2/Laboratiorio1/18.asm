org 8000h
sdelay equ 142h
mov P1,#0h;apagatodos los leds
inicio:
		jnb P3.2,repite;jnp si el banderin es 1 salta a repite
		sjmp inicio

repite:
	setb P1.0
	clr P1.1
	lcall sdelay
	lcall sdelay
	clr P1.0
	setb P1.1
	lcall sdelay
	lcall sdelay
	sjmp repite
	



	end
