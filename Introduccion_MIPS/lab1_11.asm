#Programando MIPS con MARS
#
	.data
str:
 	.asciiz "hola mundo\n"
str1:
	.asciiz "Bienvenidos a MIPS\n"
str2:
	.asciiz "Un procesador de 32 bits"
 	.globl main 		#especifica a main como un simbolo global
	.text
main: 
				#llamada al sistema para imprimir cadena
	li $v0, 4 		# cargo servicio "4" en el registro %v0
	la $a0, str 		# direcci�n del cadena a imprimir
 	syscall 		# imprime la cadena
	li $v0, 4 		# cargo servicio "4" en el registro %v0
	la $a0, str1 		# direcci�n del cadena a imprimir
 	syscall 		# imprime la cadena
 	li $v0, 4 		# cargo servicio "4" en el registro %v0
	la $a0, str2		# direcci�n del cadena a imprimir
 	syscall 		# imprime la cadena
  #llama alsistema para terminar y salir
 	li $v0, 10 		# cargo servicio "10" en el registro $v0
 	syscall 		#realiza la accion