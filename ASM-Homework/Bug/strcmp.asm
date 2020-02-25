section .data

STRLEN equ 5d

str1    db 'b', 0xA, 0x0
str2    db 'a',  0xA, 0x0
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

loop:           cmpsb
                
		            jne End

ifzero:        
		            xor rax, rax
                mov al, byte [rsi - 1]

                cmp al, 0
                jne loop
               

End:
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
               





