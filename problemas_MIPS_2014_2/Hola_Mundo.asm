.data
hola1:
	.asciiz "Hola Mundo1\n"
hola2:
	.asciiz "Hola Mundo2\n"
	.globl main
	.text
main:
	li $v0,4
	la $a0,hola1
	syscall
	la $a0,hola2
	syscall
	
	li $v0,10
	syscall
	