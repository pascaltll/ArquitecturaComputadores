## minmax.asm - imprime el minimo y maximo de los elementos de un arreglo.
##
## Asume que el arreglo tiene al menos dos elementos (a[0] 
## and a[1]). Inicializa el min y max a a[0]
## y luego se repite el lazo (count-1) veces.  
## Este programa usará punteros.
##
##	t0 - apunta a los elementos del arreglo
##	t1 - contiene la cantidad de elementos
##	t2 - contiene el min
##	t3 - contiene el max
##	t4 - cada palabra del arreglo
##

#################################################
#					 	#
#     	 	segmento de datos		#
#						#
#################################################

	.data
array:	.word 53,9,77,66,192,15,18,26,44,14,19,78,15,12,13
count:	.word 15
endl:	.asciiz "\n"
ans1:	.asciiz "min = "
ans2:	.asciiz "\nmax = "

##
## fin del archivo minmax.asm

#################################################
#					 	#
#		segmento de texto		#
#						#
#################################################

	.text
	.globl __start
__start:	
	la $t0,array	# $t0 apuntará a los elementos
	lw $t1,count	# exit loop when $t1 is 0
	lw $t2,($t0)	# inicializa el minimo ($t2) 
	lw $t3,($t0)	# y maximo ($t3) a a[0]
	add $t0,$t0,4	# puntero va empezar en a[1]
	add $t1,$t1,-1	# y se repite count-1 veces

loop:	lw $t4,($t0)	# carga siguiente palabra desde el arreglo
	bge $t4,$t2,notMin
			# salta si a[i] >= min
	move $t2,$t4	# se mueve a[i] a minimo(es un nuevo minimo)
notMin:	ble $t4,$t3,notMax
			# salta si a[i] <= max
	move $t3,$t4	# se mueve a[i] a maximo(es un nuevo maximo)
notMax:	add $t1,$t1,-1	# decrementa contador
	add $t0,$t0,4	# incrementa puntero por palabra
	bnez $t1,loop	# y continua si contador>0

	la $a0,ans1
	li $v0,4
	syscall		# imprime "min = "

	move $a0,$t2
	li $v0,1
	syscall		# imprime el valor minimo
	
	la $a0,ans2
	li $v0,4
	syscall		# imprime "max = "

	move $a0,$t3
	li $v0,1
	syscall		# imprime el valor maximo

	la $a0,endl	# llama al sistema para imprimir
	li $v0,4	# una nueva línea
	syscall

	li $v0,10
	syscall		# termina la ejecución del programa

