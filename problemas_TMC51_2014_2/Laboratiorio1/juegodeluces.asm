org 8000h;una barra de progreso
sdelay equ 142h
repite:
	mov R3,#8
	mov R2,#0
lazo:
	mov A,R2
	lcall codigo
	mov P1,A
	lcall sdelay
	inc R2
	djnz R3,lazo
	sjmp repite
codigo:
	inc A
	movc A,@A+PC
	ret
	db 1,2,,4,8,16,32,64
	
END

    Contact GitHub API Training Shop Blog About 

