// Summ of two args returns in rax
section .text

global _MyProc                               ; global name of my function


_MyProc:                 
                push rbp
                mov rbp, rsp

                xor rax, rax

                mov rax, rdi
                add rax, '0'
                add rax, rsi

                push rax
                

                xor rdi, rdi
                mov rdi, buffer              ;
                stosb

                xor rax, rax
                mov rax, 0xA
                stosb

                mov rsi, buffer              ; addr of buffer
                mov rdx, 10                  ; strlen(buffer)
                mov rdi, 1                   ; number of func
                mov rax, 1                   ;
                syscall                      ; system call                
               

                mov rsi, msg                 ; addr of msg
                mov rdx, msglen              ; strlen(msg)
                mov rdi, 1                   ; number of func
                mov rax, 1                   ;
                syscall                      ; system call

                pop rax                      ; returned value

                pop rbp

                ret

section .data

msg             db       'Hello', 0xA
msglen          equ      $ - msg 

section .bss

buffer          resb 10h
