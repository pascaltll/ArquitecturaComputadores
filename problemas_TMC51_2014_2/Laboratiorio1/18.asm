org 8000h
sdelay equ 142h
mov P1,#0h;apagatodos los leds
inicio:
		jnb P3.2,repite;jnp si el banderin es 1 salta a repite
		sjmp inicio

repite:
	setb P1.0;prende el led
	clr P1.1;limpia el led
	lcall sdelay
	lcall sdelay
	clr P1.0;paga el led
	setb P1.1
	lcall sdelay
	lcall sdelay
	sjmp repite
	



	end
