section .text

global _MyProc                               ; global name of my function


_MyProc:                 


                mov rsi, msg
                mov rdx, msglen
                mov rdi, 1
                mov rax, 1
                syscall

                ret

section .data

msg             db       'Hello', 0xA
msglen          equ      $ - msg 
