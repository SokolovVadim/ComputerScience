section .data

msg db 'Rom4egg Th3 Fok$$', 0xa, 0xd
msglen equ $ - msg
mystr db 'Ya ronyau zapad UUUUUU', 0Ah
mystrlen equ $ - mystr

section .text
global _start
_start:
                mov eax, msg
                mov ebx, msglen
                push eax
                push ebx
                call MyProc
                pop ebx
                pop eax

                add esp, 8

                mov eax, mystr
                mov ebx, mystrlen           
 
                push eax
                push ebx
                call MyProc
                pop ebx
                pop eax
                add esp, 8


                mov eax, 1
                mov ebx, 0
                int 0x80




;            ---------------- 
;            |    ......    |             
;            |    [ebp]     |
;            |   ret addr   |
;            |   first arg  |
;            |    sec arg   |
;            |    ......    |
;            ----------------




MyProc:         
                push ebp
                mov ebp, esp
                
                xor eax, eax
                mov eax, 4
                mov ebx, 1
  
                mov ecx, [ebp+12]
                mov edx, [ebp+8]
                int 0x80
                pop ebp
                ret
