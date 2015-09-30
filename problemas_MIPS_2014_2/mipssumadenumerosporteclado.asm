.data
src1:
.asciiz "Ingrese primer numero :"
src2:
.asciiz "Ingrese 2do numero :"
src3:
.asciiz "la suma es :"
.text

main: 
	li $v0,4
	la $a0,src1
	syscall
	li $v0,5
	syscall
	move $t0,$v0
	li $v0,4
	la $a0,src2
	syscall
	li $v0,5
	syscall
	move $t1,$v0
#sumo los numeros enteros
	add $t2,$t0,$t1
	li $v0,4
	la $a0,src3
	syscall
	li $v0,1
	move $a0,$t2
	syscall
#termino mi programa y salir
	li $v0,10
	syscall 
	
			
		
	
	
