.data
src1:
.asciiz "Ingrese 1er numero :"
src2:
.asciiz "Ingrese 2do numero :"
src3:
.asciiz "el menor es el segundo"
src4:
.asciiz "el menor es el primero"
.text

main: 	li $t3,1#Elemento a comparar para saber si el resultado fue 1 o 0
#http://www.arcos.inf.uc3m.es/~ec/dokuwiki/doku.php?id=ejemplos
#imprime primera cadena
	li $v0,4#syscall para ingreso de cadenas
	la $a0,src1
	syscall
#ingreso primer numero	
	li $v0,5
	syscall
	move $t0,$v0
#imprime segunda cadena	
	li $v0,4
	la $a0,src2
	syscall
#ingreso segundo numero		
	li $v0,5
	syscall
	move $t1,$v0
#comparo numeros enteros
	slt $t2,$t0,$t1#slt si $t0 es menor que $t1 entonces $t2=1 caso contrario $t2=0
	
	beq $t3,$t2,else #SAlta(Branch) a else si $t3 y $t2 son iguales
	li $v0,4#Syscall para ingreso de cadena
	la $a0,src3
	syscall
	j end
else:	
	li $v0,4
	la $a0,src4
	syscall
	j end
	
#termino mi programa y salir
end:
	li $v0,10
	syscall 
