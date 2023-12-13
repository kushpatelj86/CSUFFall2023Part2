; subtraction.asm
; signed short num1 = 20000;
; signed short num2 = 30000;
; signed int dif = 0;
; dif = int(num1 - num2)

section .data
	num1 	dw 	20000
	num2    dw      30000
	dif     dd      0

section .text
	global _start

_start:
	mov	ax, word[num1]
	sub	ax, word[num2]
	sbb	dx, 0
	mov     word[dif + 0], ax
	mov     word[dif + 2], dx
	
	mov	rax, 60
	mov	rdi, 0
	syscall
