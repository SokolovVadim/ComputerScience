section .data

msg             db 'I want %d cups of tea with %d cookies', 0xa, 0xd
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




;----------------------------------------------------------------------------------------------------------------------------------------------------------      
;  CALL PRINTF
;----------------------------------------------------------------------------------------------------------------------------------------------------------
                mov ecx, 123d
                push ecx                    ; first arg
                push eax                    ; &msg
                push ebx                    ; strlen(msg)

                call Printf
                pop ebx
                pop eax
                pop ecx
                add esp, 12
;----------------------------------------------------------------------------------------------------------------------------------------------------------      
;  CALL DEC
;----------------------------------------------------------------------------------------------------------------------------------------------------------

DecCall:        mov ebx, buffer
               ; mov eax, ecx                ; !!!!!!!!!!

              ;  push eax
                push ebx
               

                call Dec

                pop ebx
                pop eax
                add esp, 8
                jmp RetDec

;----------------------------------------------------------------------------------------------------------------------------------------------------------      
;  CALL MyProc
;----------------------------------------------------------------------------------------------------------------------------------------------------------
                mov eax, mystr
                mov ebx, mystrlen 
                push eax
                push ebx
                call MyProc
                pop ebx
                pop eax

                add esp, 8

;----------------------------------------------------------------------------------------------------------------------------------------------------------      
;  CALL MyProc
;----------------------------------------------------------------------------------------------------------------------------------------------------------

                mov eax, msg
                mov ebx, msglen          
 
                push eax
                push ebx
                call MyProc
                pop ebx
                pop eax
                add esp, 8


;----------------------------------------------------------------------------------------------------------------------------------------------------------      
;  END PROG
;----------------------------------------------------------------------------------------------------------------------------------------------------------
                mov eax, 1
                mov ebx, 0
                int 0x80




;            ---------------- 
;            |    ......    |             
;            |    [ebp]     |
;            |   ret addr   |
;            |   last arg   |
;            |   prev arg   |
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
;----------------------------------------------------------------------------------------------------------------------------------------------------------      
;  PRINTF
;  PRINT NUMBERS FROM REGS
;  ENTRY: EAX    = [bp+8]     = &STR
;         EBX    = [bp+12]    = STRLEN    
;         ECX... = [bp+12+..] = digits
;  EXIT: 
;  DESTR: EAX, EBX, ECX, EDX, EDI, ESI, ESP
;----------------------------------------------------------------------------------------------------------------------------------------------------------

Printf:         push ebp
                mov ebp, esp
                xor ecx, ecx
                mov edi, [ebp + 8]          ; STRLEN
                mov esi, [ebp + 12]         ; addres of STRING
                xor ebx, ebx                ; counter of args
                cld                         ; clear direct flag
Read:                           
                xor eax, eax
                lodsb                       ; al = symbol
                inc ecx                     ; cx ++


                cmp al, '%'                 ; if (al == '%') {jmp JMPCALL}
                je Switch


                 
                cmp ecx, edi                ; if(ecx == strlen){End}
                jne Read                    ; else{Read}
                je EndProg 



Switch:         

                ;mov eax, esi                ; push esi <=> offset from the beginning of str 

                push ecx                    ; PPPPUUUUSHHHHH


                xor ecx, ecx
 
                mov ecx, [ebp + 16 + ebx]   ; bp + 16 = first arg 
                add ebx, 4                  ; count of args

                push ebx                    ; PPPPUUUUSHHHHH
               
                push ecx

                xor eax, eax
                lodsb
                cmp al, 'd'
                je DecCall
RetDec:
                
                pop ecx                     ; first arg has already been in stk
                pop ebx
                pop ecx





EndProg:        


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
