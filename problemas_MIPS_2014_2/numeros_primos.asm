#Imprime primos menores
#Y la cantidad de primos que existen
#Hecho por : César Martín Cruz S.

	.data
Ingrese_n:
	.asciiz "Ingresar Numero para calcular los primos menores a este :"
titulo:
	.asciiz "Numeros Primos menores de "

coma:
	.asciiz ", "
cantidad:
	.asciiz "\nCantidad de primos es :"
dos_puntos:
	.asciiz " :\n"
otraLinea:
	.asciiz "\n"
	.text
	li $v0,4
	la $a0,Ingrese_n
	syscall
	li $v0,5
	syscall
	move $t0,$v0
	li $v0,4
	la $a0,titulo
	syscall
	li $v0,1
	move $a0,$t0
	syscall
	li $v0,4
	la $a0,dos_puntos
	syscall
	li $v0,1
	li $a0,2
	syscall
	li $v0,4
	la $a0,coma
	syscall
	li $t2,2
	
	li $t5,0	    #Número de valores primos -> Contador		
	li $t1,3        #$t1 contiene número que se prueba si es primo(X)
			#$t0 es N 
divide:
	div   $t1,$t2
	mfhi $t4
	beqz $t4,otro_numero
	add $t2,$t2,1
	blt $t2,$t1,divide
	j sies_primo
otro_numero:
	li $t2,2
	add $t1,$t1,1
	blt $t1,$t0,divide
	j termina
sies_primo:
	li $v0,1
	move $a0,$t1
	syscall 
	li $v0,4
	la $a0,coma
	syscall
	add $t5,$t5,1
	beq $t5,20,saltaLinea
	beq $t5,40,saltaLinea
	beq $t5,60,saltaLinea
	beq $t5,80,saltaLinea
	beq $t5,100,saltaLinea
	j otro_numero
saltaLinea:
	li $v0,4
	la $a0,otraLinea
	syscall 
	j otro_numero
termina:
	li $v0,4
	la $a0,cantidad
	syscall 
	li $v0,1
	li $a0,1
	add $a0,$a0,$t5
	syscall

#Termina y sale
	li $v0,10
	syscall