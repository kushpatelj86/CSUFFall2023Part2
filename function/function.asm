%macro print 2
	mov rax, 1 
	mov rdi, 1 
	mov rsi, %1 
	mov rdx, %2 
	syscall 
%endmacro

%macro scan 2
	mov rax, 0 
	mov rdi, 0 
	mov rsi, %1 
	mov rdx, %2 
	syscall 
%endmacro

section .bss
buffer resb 4
n resd 1
sumN resd 1
ascii resb 10

section .data
msg1 db "Input a number (004~999): "
msg2 db "1 + 2 + 3 +...+ "
msg3 db " = "

section .text
global _start
_start:
	print msg1, 26 
	scan buffer, 4 
	print msg2, 16 
	print buffer, 3
	print msg3, 3 
	mov rbx, buffer 
	call toInteger

	mov rcx, 0 
	mov edi, dword[n] 
	call calculate 

	mov rcx, 3
	mov edi, dword[sumN] 
	call toString

	print ascii, 7 

	mov rax, 60 
	mov rdi, 0 
	syscall 

toInteger:
	mov rax, 0 
	mov rdi, 10 
	mov rsi, 0 
next0:
	and byte[rbx+rsi], 0fh
	add al, byte[rbx+rsi] 
	adc ah, 0 
	cmp rsi, 2 
	je skip0 
	mul di
skip0:
	inc rsi 
	cmp rsi, 3 
	jl next0 
	mov dword[n], eax 
	ret

calculate:
next1:
	add dword[sumN], ecx 
	inc ecx 
	cmp ecx, edi 
	jbe next1 
	ret

toString:
	mov eax, dword[sumN] 
	mov rcx, 0 
	mov ebx, 10 
	divideLoop:
	mov edx, 0
	div ebx 
	push rdx 
	inc rcx 
	cmp eax, 0 
	jne divideLoop 

	mov rbx, ascii 
	mov rdi, 0 
popLoop:
	pop rax 
	add al, "0" 
	mov byte [rbx+rdi], al 
	inc rdi 
	loop popLoop 
	mov byte [rbx+rdi], 10 
ret