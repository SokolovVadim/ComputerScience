section .data

msg             db 'Rom4egg Th3 Fok$$', 0xa, 0xd
msglen          equ $ - msg
mystr           db 'Ya ronyau zapad UUUUUU', 0Ah
mystrlen        equ $ - mystr
STRLEN          equ 22

section .bss
buffer          resb STRLEN

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

                
                mov ebx, buffer
             
                mov eax, 123456789d

                push eax
                push ebx
               

                call Dec

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


Dec:            push ebp
                mov ebp, esp

                xor eax, eax
                mov eax, [ebp + 12]         ; eax = number
                mov edi, [ebp + 8]          ; edi = adress of buffer
                
               
                mov esi, edi
                add edi, STRLEN - 1         ; size of buffer
                mov ecx, 10d

;                cld;!!!!!!!!!!!!!!!!!!!!!!!!!
                std
                push eax
                xor eax, eax
                mov al, 0Ah
                stosb
                pop eax
               

DecTran:      
                xor edx, edx
                div ecx
                xchg eax, edx
                add eax, '0'
               
                stosb
                xchg eax, edx
                or eax, eax
                jne DecTran

               ; mov al, 0Ah
               ; stosb


                xor eax, eax
                xor ebx, ebx
                mov eax, 4
                mov ebx, 1
                xor ecx, ecx
            
                mov ecx, esi
                mov edx, STRLEN           ; simbols to write from buffer
                int 80h
                pop ebp
                ret


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
