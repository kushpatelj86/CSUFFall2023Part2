

section .data
        num1     dq      50000000000                                    ;num1 = 25 = 19h
        num2     dd      3333333;                                     ;num2 = 35 = 23h
        quotient  dd      0                                     ;quotient = 0000h
	remainder dd      0                                     ;remainder = 0000h

section .text
        global _start

_start:
        mov edx, dword[num1 + 4] ;al = num1 = 19h
         mov eax, dword[num1 + 0] ;al = num1 = 19h 
	div dword[num2]
	mov dword[quotient], eax ;mult = ax = 036Bh
	mov dword[remainder], edx
	
	
	

        mov     rax, 60                                         ;terminate excuting process
        mov     rdi, 0                                          ;exit status
        syscall                                                 ;calling system services
                                            ;calling system services

