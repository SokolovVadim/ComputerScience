;---------------------------------------------------------------------------------------------------------------------------
; printf code of simbol after you will tap to keyboard
; ENTRY: AX = FUNC TO READ, BX = SYSTEM
; EXIT:  NULL
; DESTR: AX, BX, CX, DI, ES
;---------------------------------------------------------------------------------------------------------------------------
.model tiny
.code
org 100h

start:

                mov ax, VIDEOSEG            ; es = VIDEOSEG
		mov es, ax
                
                call DrawFrame
                
                mov ah, 0ch                 ; clear buffer
                mov al, 7                   ; mov code of symbol into al
                push ax
                mov bx, 10                  ; system of counting
                push bx
                call translate
                add si, 4                   ; recovering ax and bx (2*2 bytes)

                mov ax, 4c00h
                int 21h
            
translate:      push bp
                mov bp, sp
               


;----------------------------------------------------------------------------------------------------------------------------
                mov ax, 0b800h              ; | mov es, 0b800h
                mov es, ax                  ; | 
                xor ax, ax
              
                mov al, 80                  ; | al = 80y
                mov bl, Ypict               ; |
                mul bl                      ; |
           
                add al, Xpict
                adc ah, 0
                push ax
                xor dx, dx
                mov dl, Xpict
                add ax, dx
                pop ax
                shl ax, 1
                mov bx, ax

;----------------------------------------------------------------------------------------------------------------------------

                xor ax, ax
                mov ax, [bp+6]

                int 21h
             
                std                         ; flag for decrement
                
                mov di, bx                  ; addres of videoseg into di
                xor ah, ah
                mov cx, [bp+4]              ; system of numbers
Translater:   
                xor dx, dx                  ; dx = 0
                div cx                      ; ax = ax / 10
                xchg ax, dx                 ; swap( ax, dx )
                add al, '0'                 ; al += byte code '0'
                xor ah, ah
                stosb                       ; put al into videoseg 

                push ax                     ; put ax into stk
                xor al, al                  ; al = 0
                mov al, 4eh                 ; put param into al
                stosb                       ; put param into videoseg
                pop ax                      ; get ax from stk


                xchg ax, dx                 ; swap( ax, dx )
                or ax, ax                   ; cicle if ax
                jne Translater

                mov ax, 4c00h
                int 21h

    
                pop bp
                ret

;----------------------------------------------------------------------------------------------------------------------------

include DrawFRM.asm

end start
