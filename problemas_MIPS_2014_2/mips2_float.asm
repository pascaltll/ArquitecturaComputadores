.data
numero: .float 34.5897
.text
li $v0,2
lwc1 $f12, numero
syscall

li $v0,10
syscall