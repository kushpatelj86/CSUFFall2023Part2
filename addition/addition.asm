; addition.asm
; unsigned short num1 = 50000;
; unsigned short num2 = 40000;
; unsigned int sum = 0;
; sum = int(num1 + num2);
section .data
	num1 dw 50000
	num2 dw 40000
	sum  dd 0
section .text
	global _start
_start:
	mov	dx, 0
	mov	ax, word[num1]			;al = num1 = 64h
	add	ax, word[num2]			;al = al + num2 = 2Ch
	adc	dx, 0				;ah = ah + 0 + CF = 01h
	mov	word[sum+0], ax			;sum = al = 9ch
	mov	word[sum+2], dx			;sum = ah = 0ffh
						;mov word[sum], ax
	mov	rax, 60				;terminate excuting process
	mov	rdi, 0				;exit status
	syscall	


