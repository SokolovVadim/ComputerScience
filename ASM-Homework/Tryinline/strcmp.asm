section .data

STRLEN equ 5d

str1    db 'ab', 0x0
str2    db 'a',  0x0
buff    db STRLEN

section .code
global _start

_start:
		mov rdi, str1
                mov rsi, str2
          
		xor rax, rax
                xor rbx, rbx
                xor rcx, rcx
                xor rdx, rdx

		mov rbx, 1

;loop:
           lodsb

		cmp al, 0
                je $+0xB

	        cmp al, byte[rdi]
                jne $+0x9

                inc rdi

                jmp $-0xC
               

;zero:   
        mov bl, byte [rdi]

;End:
                xor rax, rax
                xor rbx, rbx
                mov al, byte [rdi - 1]
		mov bl, byte [rsi - 1]
      
                sub al, bl    


    
	



		xor rax, rax
                xor rbx, rbx
                mov rax, 60
                xor rdi, rdi
                syscall
               






