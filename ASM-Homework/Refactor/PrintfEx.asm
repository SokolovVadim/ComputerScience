; Printf with an example
section .data

msg             db '%c want to eat %x and drink %s coffee in %d cups with %x and do task with %b classmates for %o days', 0xA
msglen          equ $ - msg

mystr           db 'very-very hot'
mystrlen        equ $ - mystr

STRLEN          equ 22
STRHEX          db '0123456789ABCDEF'

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

                mov ecx, 65d
                push ecx

           
                mov ecx, 511d                ; 
                push ecx               

                mov ecx, 3565d
                push ecx                    ; fif arg

                mov ecx, 2d
                push ecx                    ; fouth arg

                mov ecx, mystr
                push ecx                    ; third

                mov ecx, 3802d              ; sec
                push ecx

                mov ecx, 'I'
                push ecx                    ; first arg

                push eax                    ; &msg
                push ebx                    ; strlen(msg)

                call Printf

                

                pop ebx
                pop eax
                pop ecx

                jmp EndProg

;----------------------------------------------------------------------------------------------------------------------------------------------------------      
;  CALL DEC
;----------------------------------------------------------------------------------------------------------------------------------------------------------

DecCall:
                mov ebx, buffer
                push ebx
               

                call Dec

                pop ebx
                pop eax

                
                
                jmp RetForCicle

;----------------------------------------------------------------------------------------------------------------------------------------------------------      
;  CALL HEX
;----------------------------------------------------------------------------------------------------------------------------------------------------------

HexCall:        mov ebx, buffer
                push ebx
                 
                call Hex
 
                pop ebx
                pop eax


                jmp RetForCicle


;----------------------------------------------------------------------------------------------------------------------------------------------------------      
;  CALL OCT
;----------------------------------------------------------------------------------------------------------------------------------------------------------

OctCall:        
                mov ebx, buffer
                push ebx
               

                call Oct

                pop ebx
                pop eax

                     
                jmp RetForCicle


;----------------------------------------------------------------------------------------------------------------------------------------------------------      
;  CALL OCT
;----------------------------------------------------------------------------------------------------------------------------------------------------------

BinCall:        mov ebx, buffer
                push ebx
               

                call Bin

                pop ebx
                pop eax

                
                
                jmp RetForCicle

;----------------------------------------------------------------------------------------------------------------------------------------------------------      
;  CALL CHAR
;----------------------------------------------------------------------------------------------------------------------------------------------------------

CharCall:       mov ebx, buffer
                push ebx
                 
                call Char
 
                pop ebx
                pop eax


                jmp RetForCicle




;----------------------------------------------------------------------------------------------------------------------------------------------------------      
;  StrCall
;----------------------------------------------------------------------------------------------------------------------------------------------------------

StrCall:      
                mov ebx, mystrlen           ; strlen
                push ebx

                call Str

                pop ebx
                pop eax

                jmp RetForCicle

;----------------------------------------------------------------------------------------------------------------------------------------------------------      
;  END PROG
;----------------------------------------------------------------------------------------------------------------------------------------------------------

EndProg:        xor eax, eax
                xor ebx, ebx
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



;----------------------------------------------------------------------------------------------------------------------------------------------------------      
;  DEC
;  PRINT NUMBER IN DEC FORMAT
;
;  ATTENTION!!!
;  THE FIRST ARG MOVES INTO STACK BY PRINT FUNCTION!!!
;
;  ENTRY: EAX    = [bp+12]    = NUMBER
;         EBX    = [bp+8]     = &BUFFER    
;
;  EXIT: 
;  DESTR: EAX, EBX, ECX, EDX, EDI, ESI
;----------------------------------------------------------------------------------------------------------------------------------------------------------


Dec:            push ebp
                mov ebp, esp

                xor eax, eax
                mov eax, [ebp + 12]         ; eax = number
                mov edi, [ebp + 8]          ; edi = adress of buffer
                
                mov esi, edi

                push eax                    ; clear buffer
                cld
                mov eax, 0
                mov ecx, STRLEN
                repne stosb

                pop eax
                mov edi, esi                ; edi -= STRLEN


                add edi, STRLEN - 1         ; size of buffer
                mov ecx, 10d

                std
               

DecTran:      
                xor edx, edx
                div ecx
                xchg eax, edx
                add eax, '0'
               
                stosb
                xchg eax, edx
                or eax, eax
                jne DecTran

                xor eax, eax
                xor ebx, ebx
                mov eax, 4
                mov ebx, 1
                xor ecx, ecx
            
                mov ecx, esi
                mov edx, STRLEN           ; simbols to write from buffer
                int 80h

                push eax                    ; clear buffer
                cld
                mov eax, 0
                mov ecx, STRLEN
                repne stosb

                pop eax
                mov edi, esi                ; edi -= STRLEN

                pop ebp
                ret

;----------------------------------------------------------------------------------------------------------------------------------------------------------      
;  HEX
;  PRINT NUMBER IN HEX FORMAT
;
;  ATTENTION!!!
;  THE FIRST ARG MOVES INTO STACK BY PRINT FUNCTION!!!
;
;  ENTRY: EAX    = [bp+12]    = NUMBER
;         EBX    = [bp+8]     = &BUFFER    
;
;  EXIT: 
;  DESTR: EAX, EBX, ECX, EDX, EDI, ESI
;----------------------------------------------------------------------------------------------------------------------------------------------------------



Hex:            push ebp
                mov ebp, esp
                xor eax, eax
                mov eax, [ebp + 12]         ; eax = number
                mov edi, [ebp + 8]          ; edi = adress of buffer

                mov esi, edi

                push eax                    ; clear buffer
                cld
                mov eax, 0
                mov ecx, STRLEN
                repne stosb

                pop eax
                mov edi, esi                ; edi -= STRLEN

                
               
               ; mov esi, edi
                add edi, STRLEN - 1         ; size of buffer
                
                std


                mov edx, 1111b              ; edx = mask
                xor cl, cl                  ; counter
                mov ebx, STRHEX             ; for xlat
                
                push esi
                xor esi, esi

HexTran:        
                mov esi, eax
                and esi, edx
                shl edx, 4d

                push eax

                xor eax, eax
                
                shr esi, cl
                mov eax, esi                

                xlat
                stosb
                  
                pop eax

                
                add cl, 4d
                cmp cl, 32
                jne HexTran

                pop esi


                xor eax, eax
                xor ebx, ebx
                mov eax, 4
                mov ebx, 1
                xor ecx, ecx
                mov ecx, esi              ; addr buff 
                mov edx, STRLEN           ; simbols to write from buffer
                int 80h

                push eax                    ; clear buffer
                cld
                mov eax, 0
                mov ecx, STRLEN
                repne stosb

                pop eax
                mov edi, esi                ; edi -= STRLEN

                pop ebp
                ret

;----------------------------------------------------------------------------------------------------------------------------------------------------------      
;  OCT
;  PRINT NUMBER IN OCT FORMAT
;
;  ATTENTION!!!
;  THE FIRST ARG MOVES INTO STACK BY PRINT FUNCTION!!!
;
;  ENTRY: EAX    = [bp+12]    = NUMBER
;         EBX    = [bp+8]     = &BUFFER    
;
;  EXIT: 
;  DESTR: EAX, EBX, ECX, EDX, EDI, ESI
;----------------------------------------------------------------------------------------------------------------------------------------------------------


Oct:            push ebp
                mov ebp, esp
                xor eax, eax
                mov eax, [ebp + 12]         ; eax = number
                mov edi, [ebp + 8]          ; edi = adress of buffer

                mov esi, edi

                push eax                    ; clear buffer
                cld
                mov eax, 0
                mov ecx, STRLEN
                repne stosb

                pop eax
                mov edi, esi                ; edi -= STRLEN

                
               
;                mov esi, edi
                add edi, STRLEN - 1         ; size of buffer
                
                std


                mov edx, 111b               ; edx = mask
                xor cl, cl                  ; counter
                
                push esi
                xor esi, esi

OctTran:        
                mov esi, eax
                and esi, edx
                shl edx, 3d

                push eax

                xor eax, eax
                
                mov eax, '0'
 
                shr esi, cl
                add eax, esi
                stosb
                  
                pop eax

                
                add cl, 3d
                cmp cl, 24
                jne OctTran

                pop esi


                xor eax, eax
                xor ebx, ebx
                mov eax, 4
                mov ebx, 1
                xor ecx, ecx
                mov ecx, esi              ; addr buff + strlen buff
                mov edx, STRLEN           ; simbols to write from buffer
                int 80h


                push eax                    ; clear buffer
                cld
                mov eax, 0
                mov ecx, STRLEN
                repne stosb

                pop eax
                mov edi, esi                ; edi -= STRLEN



                pop ebp
                ret


;----------------------------------------------------------------------------------------------------------------------------------------------------------      
;  BIN
;  PRINT NUMBER IN BIN FORMAT
;
;  ATTENTION!!!
;  THE FIRST ARG MOVES INTO STACK BY PRINT FUNCTION!!!
;
;  ENTRY: EAX    = [bp+12]    = NUMBER
;         EBX    = [bp+8]     = &BUFFER    
;
;  EXIT: 
;  DESTR: EAX, EBX, ECX, EDX, EDI, ESI
;----------------------------------------------------------------------------------------------------------------------------------------------------------

Bin:            push ebp
                mov ebp, esp

                xor eax, eax

                mov eax, [ebp + 12]         ; eax = number
                mov edi, [ebp + 8]          ; edi = adress of buffer
                
               
                mov esi, edi
                add edi, STRLEN - 1         ; size of buffer
                

                std


                mov ecx, 1b               ; edx = mask


BinTran:        
                mov ebx, eax
                and ebx, ecx
                shl ecx, 1d

                push eax

                xor eax, eax
                mov eax, '0'
                cmp ebx, 0
    
                je PrintBit
                add eax, 1

PrintBit:       stosb
                pop eax
                cmp ecx, 0FFFFFFFh
                
                jl BinTran


                xor eax, eax
                xor ebx, ebx
                mov eax, 4
                mov ebx, 1
                xor ecx, ecx
                xor edx, edx
                mov ecx, esi              ; addr buff + strlen buff
                mov edx, STRLEN           ; simbols to write from buffer
                int 80h

                push eax                    ; clear buffer
                cld
                mov eax, 0
                mov ecx, STRLEN
                repne stosb

                pop eax
                mov edi, esi                ; edi -= STRLEN

                pop ebp
                ret


;----------------------------------------------------------------------------------------------------------------------------------------------------------      
;  CHAR
;  PRINT SYMBOL
;
;  ATTENTION!!!
;  THE FIRST ARG MOVES INTO STACK BY PRINT FUNCTION!!!
;
;  ENTRY: EAX    = [bp+12]    = NUMBER
;         EBX    = [bp+8]     = &BUFFER    
;
;  EXIT: 
;  DESTR: EAX, EBX, ECX, EDX, EDI, ESI
;----------------------------------------------------------------------------------------------------------------------------------------------------------


Char:           push ebp
                mov ebp, esp
                
                xor ecx, ecx
                mov edi, [ebp+8]            ; &buffer
                mov eax, [ebp+12]           ; symbol
                
                mov esi, edi
                add edi, 2

                std


          
                stosw
 
                xor eax, eax
                xor ebx, ebx

                mov eax, 4
                mov ebx, 1

                xor ecx, ecx

                mov ecx, esi              ; addr buff + strlen buff
                mov edx, STRLEN           ; simbols to write from buffer
                int 080x

                push eax                    ; clear buffer
                cld
                mov eax, 0
                mov ecx, STRLEN
                repne stosb

                pop eax
                mov edi, esi                ; edi -= STRLEN

                pop ebp
                ret    


;----------------------------------------------------------------------------------------------------------------------------------------------------------      
;  STR
;  PRINT STRING
;  ENTRY: EAX    = [bp+12]    = &STR
;         EBX    = [bp+8]     = STRLEN    
;         
;  EXIT: EAX = NUMBER OF WRITE FUNC, EBX = NUMBER OF EXIT FUNCTION, ECX = ADDR, EDX = LEN
;  DESTR: EAX, EBX, ECX, EDX
;----------------------------------------------------------------------------------------------------------------------------------------------------------
Str:         
                push ebp
                mov ebp, esp
                
                xor eax, eax
                mov eax, 4
                mov ebx, 1
  
                mov ecx, [ebp+12]           ; ADDR
                mov edx, [ebp+8]            ; STRLEN
                int 0x80
                pop ebp
                ret



;----------------------------------------------------------------------------------------------------------------------------------------------------------      
;  PRINTF
;  PRINT NUMBERS FROM REGS
;  ENTRY: EAX    = [bp+12]    = &STR
;         EBX    = [bp+8]     = STRLEN    
;         ECX... = [bp+16+..] = digits
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

;---------------------------------------------------------------------------------------------------------------------------------------------------------- 
Read:                           
                xor eax, eax
                lodsb                       ; al = symbol
                inc ecx                     ; cx ++


                cmp al, '%'                 ; if (al == '%') {jmp JMPCALL}
                je Switch
                jne PrintLetter
;---------------------------------------------------------------------------------------------------------------------------------------------------------- 

RetRead:


                cmp ecx, edi                ; if(ecx >= strlen){End}
                jl Read                     ; else{Read}
                jge EndProc 

;---------------------------------------------------------------------------------------------------------------------------------------------------------- 


PrintLetter:    
                push ebx
                push ecx
                push edx

                push edi
                push esi

                push eax
                 
                xor edi, edi
                xor esi, esi
 
                mov edi, buffer
                mov esi, edi

                add edi, 2


                pop eax

                std

                stosb

                push eax

                xor eax, eax
                xor ebx, ebx

                mov eax, 4
                mov ebx, 1
                mov ecx, esi
                mov edx, 4
                int 0x80
               
                cld                         ; clear buffer to putting new symbols
                mov eax, 0
                mov edi, buffer
                stosb

                pop eax
                pop esi
                pop edi
 
                pop edx
                pop ecx
                pop ebx
                jmp RetRead


Switch:         

                push edi                    ; str <==> &str[ecx]
                push esi                    ; &buffer + sizebuff

                push ecx                    ; position


                xor ecx, ecx
 
                mov ecx, [ebp + 16 + ebx]   ; bp + 16 = first arg 
                add ebx, 4                  ; count of args

                push ebx                    ; counter of % *4
               
                push ecx                    ; push arg

                xor eax, eax
                lodsb

                cmp al, 'd'
                je DecCall

                cmp al, 'x'
                je HexCall

                cmp al, 'o'
                je OctCall


                cmp al, 'b'
                je BinCall

                cmp al, 'c'
                je CharCall

                cmp al, 's'
                je StrCall


                jne RetWrong

;---------------------------------------------------------------------------------------------------------------------------------------------------------- 

RetWrong:

                pop ecx
                pop ebx
                pop ecx
                pop esi
                pop edi
                jmp RetRead
;---------------------------------------------------------------------------------------------------------------------------------------------------------- 


RetForCicle:
                     
                pop ebx                     ; counter of % *4
                pop ecx                     ; position on %

                inc ecx                     ; str[ecx] = 'd'



                pop esi                     ; addres of STRING
                pop edi                     ; !!!!!!!!!!!!!

       ;         inc esi                     ; *esi = d
                inc esi                     ; *esi = d               

                cmp ecx, edi
                jl RetRead
                jge EndProc
;----------------------------------------------------------------------------------------------------------------------------------------------------------                  
                                 
EndProc:        
                pop ebp
                ret
