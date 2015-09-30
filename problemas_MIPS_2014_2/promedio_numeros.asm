## promedio_numeros.asm - imprime la suma y el promedio de los elementos de un arreglo.
		.data
datos:  	.word 10, 5, 12, 9, 3, 4, 55, 22, 17, 9, 15       # 11 enteros
n:		.word 11
adicion:	.asciiz "La suma es :"
promedio:	.asciiz "El promedio es :"
suma:		.word 0
prom:		.word 0
nlinea:		.asciiz "\n"

		.text
		la $t0, datos		# t0 apunta a datos[0]
		la $t1, n		# t1 apunta a n
		lw $t1, ($t1)		# t1 tiene el valor de n
		li $s0, 0		# suma = 0

		# Calcula la suma de los datos
ciclo:
		lw $t2, ($t0)		# t2 = datos[t0]
		add $s0, $s0, $t2	# suma = suma + datos[t0]
		addi $t0, $t0, 4	# t0 = t0 + 4 (siguiente elemento de datos)
		addi $t1, $t1, -1	# n = n - 1
		bgtz $t1, ciclo		# if (n > 0) goto ciclo

		# Guarda la suma en la variable suma
		la $t1, suma		# t1 apunta a suma
		sw $s0, ($t1)		# Memoria[t1] = s0

		# Calcula el promedio
		la $t1, n		# t1 apunta a n
		lw $t1, ($t1)		# t1 tiene el valor de n
		div $s0, $t1		# prom = suma / n
		mflo $s0		# s0 = suma / n
		mfhi $s1		# s1 = suma % n

		# Guarda el promedio en la variable prom
		la $t1, prom		# t1 apunta a prom
		sw $s0, ($t1)		# Memoria[t1] = s0
#Imprime mensaje "La suma es :" y el valor de la suma
		la $a0,adicion	# imprime
		li $v0,4	# mensaje
		syscall
		
		la $s0,suma
		lw $t1,($s0)
		move $a0,$t1
		li $v0,1	#
		syscall	
		
		la $a0,nlinea	# nueva linea
		li $v0,4	# 
		syscall
#Imprime el mensaje "El promedio es :" y el valor del promedio
		la $a0,promedio	# imprime
		li $v0,4	# mensaje
		syscall
				
		la $s0,prom
		lw $t1,($s0)
		move $a0,$t1
		li $v0,1	#
		syscall		
		

# El programa se ha terminado. Sale.
		li   $v0, 10
		syscall               	# Sale

##
## fin del archivo promedio_numeros.asm
