section .data

msg             db '%c want to eat %x and drink %s coffee in %d cups with %x and do task with %b classmates for %o days, and %c %s %x %d %%', 0xA, 0x0
msglen          equ $ - msg

mystr           db 'very-very hot', 0
mystrlen        equ $ - mystr


strlove         db 'LOVE', 0

STRLEN          equ 22
STRHEX          db '0123456789ABCDEF', 0

section .bss
buffer          resb STRLEN

section .text
global _start
_start:


;----------------------------------------------------------------------------------------------------------------------------------------------------------      
;  CALL PRINTF
;----------------------------------------------------------------------------------------------------------------------------------------------------------


                push 100d

                push 3802d

                push strlove


                push 'I'

                mov ecx, 65d
                push rcx

           
                mov ecx, 511d               ; 
                push rcx               

                mov ecx, 3565d
                push rcx                    ; fifth arg

                mov ecx, 2d
                push rcx                    ; fouth arg

                mov ecx, mystr
                push rcx                    ; third

                mov ecx, 3802d              ; sec
                push rcx

                mov ecx, 'I'
                push rcx                    ; first arg


                mov eax, msg

                push rax                    ; &msg

               ; jmp EndProg
 
                call Printf

               

                pop rax
                pop rcx

                jmp EndProg

;----------------------------------------------------------------------------------------------------------------------------------------------------------      
;  CALL DEC
;----------------------------------------------------------------------------------------------------------------------------------------------------------

DecCall:
                mov ebx, buffer
                push rbx
               

                call Dec

                pop rbx                     ; buffer
                pop rax                     ; digit

                
                
                jmp RetForCicle

;----------------------------------------------------------------------------------------------------------------------------------------------------------      
;  CALL HEX
;----------------------------------------------------------------------------------------------------------------------------------------------------------

HexCall:        mov ebx, buffer
                push rbx
                 
                call Hex
 
                pop rbx
                pop rax


                jmp RetForCicle


;----------------------------------------------------------------------------------------------------------------------------------------------------------      
;  CALL OCT
;----------------------------------------------------------------------------------------------------------------------------------------------------------

OctCall:        
                mov ebx, buffer
                push rbx
               

                call Oct

                pop rbx
                pop rax

                     
                jmp RetForCicle


;----------------------------------------------------------------------------------------------------------------------------------------------------------      
;  CALL OCT
;----------------------------------------------------------------------------------------------------------------------------------------------------------

BinCall:        mov ebx, buffer
                push rbx
               

                call Bin

                pop rbx
                pop rax

                
                
                jmp RetForCicle

;----------------------------------------------------------------------------------------------------------------------------------------------------------      
;  CALL CHAR
;----------------------------------------------------------------------------------------------------------------------------------------------------------

CharCall:       mov ebx, buffer
                push rbx
                 
                call Char
 
                pop rbx                     ; buffer
                pop rax                     ; symbol


                jmp RetForCicle




;----------------------------------------------------------------------------------------------------------------------------------------------------------      
;  StrCall
;----------------------------------------------------------------------------------------------------------------------------------------------------------

StrCall:      
                mov ebx, buffer             ; &buffer
                push rbx

                call Str

                pop rbx                     ; &buffer
                pop rax                     ; arg

                jmp RetForCicle

;----------------------------------------------------------------------------------------------------------------------------------------------------------      
;  END PROG
;----------------------------------------------------------------------------------------------------------------------------------------------------------

EndProg:        xor eax, eax
                xor ebx, ebx
                mov rax, 60
                mov rdi, 0
                syscall


;            ---------------- 
;            |    ......    |             
;            |    [rbp]     |
;            |   ret addr   |
;            |  first arg   |
;            |    sec arg   |
;            |    ......    |
;            ----------------



;----------------------------------------------------------------------------------------------------------------------------------------------------------      
;  DEC
;  PRINT NUMBER IN DEC FORMAT
;
;  ATTENTION!!!
;  THE FIRST ARG MOVES INTO STACK BY PRINT FUNCTION!!!
;
;  ENTRY: EAX    = [bp+24]    = NUMBER
;         EBX    = [bp+16]    = &BUFFER    
;
;  EXIT: 
;  DESTR: EAX, EBX, ECX, EDX, EDI, ESI
;----------------------------------------------------------------------------------------------------------------------------------------------------------


Dec:            push rbp
                mov rbp, rsp

                xor eax, eax
                
                mov rax, [rbp + 24]         ; eax = number
                mov rdi, [rbp + 16]         ; edi = adress of buffer
                
                mov esi, edi                ; esi = addr buff

                push rax                    ; clear buffer

                cld
                mov eax, 0
                mov ecx, STRLEN
                repne stosb

                pop rax                     ; end clear buffer
                mov edi, esi                ; edi -= STRLEN


                add edi, STRLEN - 1         ; size of buffer           ATTENTION! u can write only sub edi, 1 or 0
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

                push rdi                    ; save rdi from writing

                xor eax, eax
                xor ebx, ebx
                mov rax, 1
                mov rdi, 1
                xor ecx, ecx
            
                mov ecx, esi
                mov rdx, STRLEN             ; simbols to write from buffer
                syscall

                pop rdi                     ; use rdi

                push rax                    ; clear buffer
                cld
                mov eax, 0
                mov ecx, STRLEN
                repne stosb

                pop rax                     ; end clear buffer
                mov edi, esi                ; edi -= STRLEN

                pop rbp
                ret

;----------------------------------------------------------------------------------------------------------------------------------------------------------      
;  HEX
;  PRINT NUMBER IN HEX FORMAT
;
;  ATTENTION!!!
;  THE FIRST ARG MOVES INTO STACK BY PRINT FUNCTION!!!
;
;  ENTRY: EAX    = [bp+24]    = NUMBER
;         EBX    = [bp+16]    = &BUFFER    
;
;  EXIT: 
;  DESTR: EAX, EBX, ECX, EDX, EDI, ESI
;----------------------------------------------------------------------------------------------------------------------------------------------------------



Hex:            push rbp
                mov rbp, rsp
                xor eax, eax
                mov eax, [rbp + 24]         ; eax = number
                mov rdi, [rbp + 16]         ; edi = adress of buffer

                mov esi, edi                ; save edi
 
                push rax                    ; clear buffer
                cld
                mov eax, 0
                mov ecx, STRLEN
                repne stosb

                pop rax                     ; end clear buffer
                mov edi, esi                ; edi -= STRLEN    use edi

                
               

                add edi, STRLEN - 1         ; size of buffer
                
                std


                mov edx, 1111b              ; edx = mask
                xor cl, cl                  ; counter
                mov ebx, STRHEX             ; for xlat
                
                push rsi                    ; save edi in esi
                xor esi, esi

HexTran:        
                mov esi, eax
                and esi, edx
                shl edx, 4d

                push rax

                xor eax, eax
                
                shr esi, cl
                mov eax, esi                

                xlat
                stosb
                  
                pop rax

                
                add cl, 4d
                cmp cl, 32
                jne HexTran

                pop rsi                     ; esi = buffer(edi)


                xor eax, eax
                xor ebx, ebx
                mov rax, 1
                mov rdi, 1
                xor ecx, ecx
                mov ecx, esi                ; addr buff            use edi
                mov rdx, STRLEN             ; simbols to write from buffer
                syscall

                mov edi, esi                ; edi -= STRLEN
                                            ; clear buffer                
                cld                         ; clear dir. flag
                mov eax, 0
                mov ecx, STRLEN
                repne stosb
                                            ; end clear buffer


                mov edi, esi                ; edi -= STRLEN

                pop rbp
                ret

;----------------------------------------------------------------------------------------------------------------------------------------------------------      
;  OCT
;  PRINT NUMBER IN OCT FORMAT
;
;  ATTENTION!!!
;  THE FIRST ARG MOVES INTO STACK BY PRINT FUNCTION!!!
;
;  ENTRY: EAX    = [bp+24]    = NUMBER
;         EBX    = [bp+16]     = &BUFFER    
;
;  EXIT: 
;  DESTR: EAX, EBX, ECX, EDX, EDI, ESI
;----------------------------------------------------------------------------------------------------------------------------------------------------------


Oct:            push rbp
                mov rbp, rsp
                xor eax, eax
                mov rax, [rbp + 24]         ; eax = number
                mov rdi, [rbp + 16]         ; edi = adress of buffer

                mov esi, edi

                push rax                    ; clear buffer
                cld
                mov eax, 0
                mov ecx, STRLEN
                repne stosb

                pop rax                     ; end clear buffer
                mov edi, esi                ; edi -= STRLEN

                
               

                add edi, STRLEN - 1         ; size of buffer
                
                std


                mov edx, 111b               ; edx = mask
                xor cl, cl                  ; counter
                
                push rsi                    ; save rsi
                xor esi, esi

OctTran:        
                mov esi, eax
                and esi, edx
                shl edx, 3d

                push rax

                xor eax, eax
                
                mov eax, '0'
 
                shr esi, cl
                add eax, esi
                stosb
                  
                pop rax

                
                add cl, 3d
                cmp cl, 45
                jne OctTran

                pop rsi                     ; use rsi
  
                push rdi                    ; save rdi from writing

                xor eax, eax
                xor ebx, ebx
                mov rax, 1
                mov rdi, 1

                mov rdx, STRLEN             ; simbols to write from buffer
                syscall


                pop rdi                     ; use rdi


                push rax                    ; clear buffer
                cld
                mov eax, 0
                mov ecx, STRLEN
                repne stosb

                pop rax
                mov edi, esi                ; edi -= STRLEN



                pop rbp
                ret


;----------------------------------------------------------------------------------------------------------------------------------------------------------      
;  BIN
;  PRINT NUMBER IN BIN FORMAT
;
;  ATTENTION!!!
;  THE FIRST ARG MOVES INTO STACK BY PRINT FUNCTION!!!
;
;  ENTRY: EAX    = [bp+24]    = NUMBER
;         EBX    = [bp+16]     = &BUFFER    
;
;  EXIT: 
;  DESTR: EAX, EBX, ECX, EDX, EDI, ESI
;----------------------------------------------------------------------------------------------------------------------------------------------------------

Bin:            push rbp
                mov rbp, rsp

                xor eax, eax

                mov rax, [rbp + 24]         ; eax = number
                mov rdi, [rbp + 16]         ; edi = adress of buffer
                
               
                mov esi, edi
                add edi, STRLEN - 1         ; size of buffer
                

                std


                mov ecx, 1b               ; edx = mask


BinTran:        
                mov ebx, eax
                and ebx, ecx
                shl ecx, 1d

                push rax

                xor eax, eax
                mov eax, '0'
                cmp ebx, 0
    
                je PrintBit
                add eax, 1

PrintBit:       stosb
                pop rax
                cmp ecx, 0FFFFFh
                
                jl BinTran

                push rdi                    ; save rdi

                xor eax, eax
                xor ebx, ebx
                mov rax, 1
                mov rdi, 1

                xor rdx, rdx
                mov rdx, STRLEN             ; simbols to write from buffer

                syscall


                pop rdi                     ; use rdi

                push rax                    ; clear buffer
                cld
                mov eax, 0
                mov ecx, STRLEN
                repne stosb

                pop rax
                mov edi, esi                ; edi -= STRLEN

                pop rbp
                ret


;----------------------------------------------------------------------------------------------------------------------------------------------------------      
;  CHAR
;  PRINT SYMBOL
;
;  ATTENTION!!!
;  THE FIRST ARG MOVES INTO STACK BY PRINT FUNCTION!!!
;
;  ENTRY: EAX    = [bp+24]    = NUMBER
;         EBX    = [bp+16]     = &BUFFER    
;
;  EXIT: 
;  DESTR: EAX, EBX, ECX, EDX, EDI, ESI
;----------------------------------------------------------------------------------------------------------------------------------------------------------


Char:           push rbp
                mov rbp, rsp
                
                xor ecx, ecx
                mov rdi, [rbp+16]            ; &buffer
                mov rax, [rbp+24]           ; symbol
                
                mov esi, edi                ; save addr of buffer
                add edi, 2

                std

                stosw                       ; write symbol into buffer
 
                xor eax, eax
                xor ebx, ebx
                xor rdx, rdx
             
                push rdi                    ; save rdi from writing

                mov rax, 1
                mov rdi, 1

                xor ecx, ecx

                mov ecx, esi                ; addr buff
                mov rdx, STRLEN             ; simbols to write from buffer
                syscall

                pop rdi                     ; use rdi

                cld                         ; clear buffer
                mov eax, 0
                mov ecx, STRLEN
                repne stosb

          
                mov edi, esi                ; edi -= STRLEN

                pop rbp
                ret    


;----------------------------------------------------------------------------------------------------------------------------------------------------------      
;  STR
;  PRINT STRING
;  ENTRY: EAX    = [bp+24]    = &STR
;         EBX    = [bp+16]     = STRLEN    
;         
;  EXIT: EAX = NUMBER OF WRITE FUNC, EBX = NUMBER OF EXIT FUNCTION, ECX = ADDR, EDX = LEN
;  DESTR: EAX, EBX, ECX, EDX
;----------------------------------------------------------------------------------------------------------------------------------------------------------
Str:         
                push rbp
                mov rbp, rsp
                
                xor eax, eax

                mov rsi, [rbp + 24]         ; arg
                mov rdi, [rbp + 16]          ; &buffer

                xor edx, edx
                mov edx, edi                ; edx = &buffer


                cld                         ; clear dir. flag
                xor ecx, ecx                ; counter of symb
                

PrintStr:       
                cmp cx, STRLEN              ; if(SIZEBUFF < cx) {break}
                jge EndStr

                lodsb                       ; al = [si], si++
                stosb                       ; mov es:[di], al; di++
                inc ecx

                cmp al, 0
                jne PrintStr
                je EndStr


                

EndStr:         

                push rdx                    ; save buffer

                xor rax, rax                ; print buffer
                xor rbx, rbx
                mov rax, 1
                mov rdi, 1

                mov rsi, rdx                ; edi = &buffer
                
                
                xor rdx, rdx
                mov rdx, STRLEN

                syscall
                
                pop rdi
                push rdi


                cld                         ; clear buffer
                mov eax, 0
                mov ecx, STRLEN
                repne stosb


                pop rdi                     ; use buffer


         
 
                pop rbp
                ret



;----------------------------------------------------------------------------------------------------------------------------------------------------------      
;  PRINTF
;  PRINT NUMBERS FROM REGS
;  ENTRY: EAX    = [bp+24]    = &STR
;         EBX    = [bp+16]     = STRLEN    
;         ECX... = [bp+16+..] = digits
;  EXIT: 
;  DESTR: EAX, EBX, ECX, EDX, EDI, ESI, ESP
;----------------------------------------------------------------------------------------------------------------------------------------------------------

Printf:         push rbp
                mov rbp, rsp

                xor ecx, ecx
                mov rsi, [rbp + 16]          ; addres of STRING
                xor rbx, rbx                ; counter of args
           

                ;jmp EndProg

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



                cmp al, 0                   ; if (str[i] == 0){ break }
                jne Read                    ; else{Read}
                je EndProc 

;---------------------------------------------------------------------------------------------------------------------------------------------------------- 


PrintLetter:    
                push rbx                    ; counter of args
                push rcx                    ; position in str
                push rdx                    ; 

;                push rdi                    ; 
                push rsi                    ; addr of last symbol in str

                push rax                    ; symbol
                 
                xor edi, edi
                xor esi, esi
 
                mov edi, buffer             ; edi = buffer
                mov esi, edi                ; esi = buffer

                add edi, 2                  ; buffer is clear. it prints only that is not null. add for std


                pop rax                     ; eax = symbol

                std                         ; ATTENTION: u can use it without std & add

                stosb                       ; buffer[2] = symbol, di--

                push rax

                xor eax, eax
                xor ebx, ebx

                mov rax, 1                  ; stdout
                mov rdi, 1
                mov ecx, esi
                mov rdx, 4
                syscall
               
                cld                         ; clear buffer to putting new symbols
                mov eax, 0
                mov edi, buffer
                stosb

                pop rax                     ; symbol
                pop rsi                     ; addr in str
;                pop rdi
 
                pop rdx                     ;
                pop rcx                     ; position
                pop rbx                     ; counter of args
                jmp RetRead


Switch:         
                push rsi                    ; &str + posit

                push rcx                    ; position


                xor ecx, ecx
 
                mov rcx, [rbp + 24 + rbx]   ; bp + 24 = first arg 
                add ebx, 8                  ; count of args
                push rbx                    ; counter of % *4


                xor eax, eax                ; al = symbol from si after '%'
                lodsb


                push rax                    ; symbol after '%'
                push rcx                    ; push arg



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

                cmp al, '%'
                je Procent

                cmp al, 0
                je EndProc


                jne RetWrong

;---------------------------------------------------------------------------------------------------------------------------------------------------------- 

Procent:        pop rcx                     ; arg
                pop rax                     ; symbol after '%'
                pop rbx                     ; count of args
                pop rcx                     ; position
                pop rsi                     ; esi = str + posit

                jmp PrintLetter






;---------------------------------------------------------------------------------------------------------------------------------------------------------- 
RetWrong:

                pop rcx                     ; arg
                pop rax                     ; symbol after '%'
                pop rbx                     ; count of args
                pop rcx                     ; posit
                pop rsi                     ; &str
                
                cmp al, 0
                je EndProc
                jne RetRead
;---------------------------------------------------------------------------------------------------------------------------------------------------------- 


RetForCicle:
                ;pop rcx                     ; argument
                pop rax                     ; symbol after '%'
                     
                pop rbx                     ; counter of % *4
                pop rcx                     ; position on %

                inc ecx                     ; str[ecx] = 'd'



                pop rsi                     ; addres of STRING

                inc esi                     ; *esi = d               

                cmp al, 0
                jne Read
                je EndProc
;----------------------------------------------------------------------------------------------------------------------------------------------------------                  
                                 
EndProc:        
                pop rbp
                ret
