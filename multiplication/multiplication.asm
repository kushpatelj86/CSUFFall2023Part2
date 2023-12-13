; ex3_multiplication1.asm
;unsigned int num1 = 300,000;
;unsigned int num2 = 400,000;
;unsigned long product = 0;
;product = long(num1 * num2);

section .data
        num1     dd      300000                                     ;num1 = 25 = 19h
        num2     dd      400000                                     ;num2 = 35 = 23h
        mult     dq      0                                      ;mult = 0000h

section .text
        global _start

_start:
        mov eax, dword[num1] ;al = num1 = 19h
	mul dword[num2]
	mov dword[mult + 0], eax ;mult = ax = 036Bh
	mov dword[mult+4], edx

        mov     rax, 60                                         ;terminate excuting process
        mov     rdi, 0                                          ;exit status
        syscall                                                 ;calling system services
                                            ;calling system services
