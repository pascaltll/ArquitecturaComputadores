#suma dos numeros 8 y 9
.data
str:
.asciiz "El resultado es: "
.text
.globl main
main:#Se empieza la ejecucion en main
li $t1,8#carga 8 en $t1
add $t0,$t1,9 #calcula la suma de $st1 y 9 ,y lo guarda en $t0
#codigo 4 en syscall es para imprimir cadena
li $v0,4
la $a0,str
syscall
#codigo 1 en syscall es para imprimir entero
li $v0,1
move $a0,$t0
syscall
#codigo 10 en syscall es para terminar y salir
li $v0,10
syscall
