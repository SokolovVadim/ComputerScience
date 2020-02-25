; First 6 args in rdi, rsi, rdx, rcx, r8, r8, last 3 args into stack from [rbp + 16]
section .text

global _MyProc                               ; global name of my function

_MyProc:                 
                push rbp
                mov rbp, rsp




                add rdi, rsi                ; rdi = 2 + 3 = 5
                add rdi, rdx                ; rdi += 4
                add rdi, rcx                ; rdi += 5
                add rdi, r8                 ; rdi += 6
                add rdi, r9                 ; rdi += 7

                mov rax, [rbp + 16]         ; rdi += 8
                add rdi, rax

                add rdi, [rbp + 24]         ; rdi += 9
                add rdi, [rbp + 32]         ; rdi += 10
                 

                push rdi
                


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
