;---------------------------------------------------------------------------------------------------------------------------
; printf code of simbol after you will tap to keyboard
; ENTRY: AL = SYMBOL, BX = SYSTEM, CX = ADDR FOR PRINTF
; EXIT:  NULL
; DESTR: AX, BX, CX, DI, ES, SI
;---------------------------------------------------------------------------------------------------------------------------
.model tiny
.code
org 100h

start:

                mov ax, VIDEOSEG            ; es = VIDEOSEG
		mov es, ax
                                 
                
                call DrawFrame
                
;----------------------------------------------------------------------------------------------------------------------------
                mov ax, 0b800h              ; | mov es, 0b800h
                mov es, ax                  ; | 
                xor ax, ax
              
                mov al, 80d                 ; | al = 80y
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
                mov cx, ax

;----------------------------------------------------------------------------------------------------------------------------
; call DEC Translator
;---------------------------------------------------------------------------------------------------------------------------


                push cx                     ; push begin of data in VIDEO



                mov ah, 0ch                 ; clear buffer
                mov al, 7                   ; mov code of symbol into al
                int 21h
                push ax                     ; code of symbol is in al
                mov bx, 10d                 ; system of counting
                push bx
                call Tran
                ;add si, 6                   ; recovering ax, bx and cx (2*3 bytes)

                


                pop bx                      ; recovering
                pop ax
                pop cx

;----------------------------------------------------------------------------------------------------------------------------
; \n in VIDEOSEG
;----------------------------------------------------------------------------------------------------------------------------

                xor di, di
                mov di, cx                  ; di = cx (addres of video)
                
                push cx                     
                push ax
               
                mov bx, di                  ; bx = cx

                xor ax, ax
                mov al, WIDTH               ; bx+=WFRAME              
                adc ah, 0
                shl ax, 1
                add bx, ax


                mov di, bx                  ; di = bx (addres + WFRAME)              
                
                pop ax
                pop cx
                mov cx, di                  ; cx = NewAddr

;----------------------------------------------------------------------------------------------------------------------------
; Call BIN Translator
;----------------------------------------------------------------------------------------------------------------------------
                
                push cx
                push ax                     ; use previous code
                mov bx, 2d                  ; bin system
                push bx
                call Tran
               
                pop bx
                pop ax
                pop cx


;----------------------------------------------------------------------------------------------------------------------------
; CALL HEX Translator
;----------------------------------------------------------------------------------------------------------------------------


                xor di, di
                mov di, cx                  ; di = cx (addres of video)
                
                push cx                     ; addres
                push ax                     ; code of symbol
               
                mov bx, di                  ; bx = cx

                xor ax, ax
                mov al, WIDTH               ; bx+=WFRAME              
                adc ah, 0
                shl ax, 1
                add bx, ax


                mov di, bx                  ; di = bx (addres + WFRAME)              
                
                pop ax
                pop cx
                mov bx, di                  ; cx = NewAddr

                push ax                     ; code of symbol
                push bx                     ; offset in VIDEOSEG



                call HexTran


                pop bx
                pop ax


;----------------------------------------------------------------------------------------------------------------------------
; CALL BIN Translator
;----------------------------------------------------------------------------------------------------------------------------
                xor di, di
                mov di, bx                  ; di = bx (addres of video)
                
                push bx                     ; addres
                push ax                     ; code of symbol
               
                mov cx, di                  ; cx = bx = addres

                xor ax, ax
                mov al, WIDTH               ; bx+=WFRAME              
                adc ah, 0
                shl ax, 1
                add cx, ax


                mov di, cx                  ; di = bx (addres + WFRAME)              
                
                pop ax
                pop bx
                mov bx, di                  ; bx = NewAddr

                push ax                     ; code of symbol
                push bx                     ; offset in VIDEOSEG

                call BinTran
                pop bx
                pop ax



;----------------------------------------------------------------------------------------------------------------------------
; CALL OCT Translator
;----------------------------------------------------------------------------------------------------------------------------
                xor di, di
                mov di, bx                  ; di = bx (addres of video)
                
                push ax                     ; code of symbol
                push bx                     ; addres
               
                mov cx, di                  ; cx = bx

                xor ax, ax
                mov al, WIDTH               ; cx+=WFRAME              
                adc ah, 0
                shl ax, 1
                add cx, ax


                mov di, cx                  ; di = bx (addres + WFRAME)
              
                
                pop bx
                pop ax
                mov bx, di                  ; cx = NewAddr

                push ax                     ; code of symbol
                push bx                     ; offset in VIDEOSEG

                call OctTran
                pop bx
                pop ax

;----------------------------------------------------------------------------------------------------------------------------
; END PROG
;----------------------------------------------------------------------------------------------------------------------------

                mov ax, 4c00h
                int 21h


;----------------------------------------------------------------------------------------------------------------------------
            
Tran:           push bp
                mov bp, sp
               

                xor ax, ax
                mov ax, [bp+6]              ; code of symbol
             
                std                         ; flag for decrement
                
                mov di, [bp+8]              ; addres of videoseg into di
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

               

    
                pop bp
                ret

;----------------------------------------------------------------------------------------------------------------------------

HexTran:        push bp
                mov bp, sp

                xor ax, ax
                mov ax, [bp+6]              ; code of symbol

               
                mov di, [bp+4]              ; videoseg
                xor ah, ah

                std           
                mov cx, 16d                  ; system of numbers  (BAD IDEA)
                mov bx, offset STR
HexTranslator:



;++++++++++++++
                
                mov dl, 1111b               ; dl = mask
                xor cl, cl                  ; cl = counter
                mov bx, offset STR
                ;stosb

HexLp:
                mov dh, al

               
                and dh, dl
                shl dl, 4d                  ; cx*=8        00111000 <------- 00000111

                push ax                     ; !!!!!

                xor ax, ax


                shr dh, cl                  ; result ------> cl bytes  (tetrad convert)
                mov al, dh

                xlat
                stosb

                xor al, al
                mov al, 4eh
                stosb


                pop ax                      ; !!!!!

                add cl, 4
                cmp cl, 16                  ; FOOOOOOOOOOO   MAGIC CONSTANT (MAX NUMBER OF TETRADES)
                je EndHex
                jne HexLp

;++++++++++++++



EndHex:         pop bp
                ret

;----------------------------------------------------------------------------------------------------------------------------
; BINARY TRAN
;----------------------------------------------------------------------------------------------------------------------------

BinTran:        push bp
                mov bp, sp

                xor ax, ax
                mov ax, [bp+6]              ; code of symbol

               
                mov di, [bp+4]              ; videoseg
                xor ah, ah

                std
                  


;----------------------------------------------------------------------------------------------------------------------------
                
                mov cx, 1h                  ; cx = mask

Lp:             
                mov bx, ax
                and bx, cx
                shl cx, 1                   ; cx*=2        00000010 <------- 00000001

                push ax
                xor al, al
                mov al, '0'                 
                cmp bx, 0                   ; if (bx & cx == 0){print(0)}

                je PrintBit
                add al, 1

                jmp PrintBit                ; else print(0+1) <==> print(1)

PrintBit:       stosb
                xor al, al
                mov al, 4eh
                stosb
                pop ax
                cmp cx, 80h               ; MaxSize of AL
                jl Lp
                jge EndProg
;----------------------------------------------------------------------------------------------------------------------------
        
EndProg:        pop bp
                ret


;----------------------------------------------------------------------------------------------------------------------------
; OCT TRAN
;----------------------------------------------------------------------------------------------------------------------------

OctTran:        push bp
                mov bp, sp

                xor ax, ax
                mov ax, [bp+6]              ; code of symbol

               
                mov di, [bp+4]              ; videoseg
                xor ah, ah

                std
                  

                ;stosb
;----------------------------------------------------------------------------------------------------------------------------
                
                mov dl, 111b                ; dl = mask
                xor cl, cl                  ; cl = counter
                ;stosb

NewLp:          mov bl, al
                and bl, dl
                shl dl, 3                   ; cx*=8        00111000 <------- 00000111
                
                push ax                     ; !!!!!

                xor ax, ax
                mov al, '0'

                shr bl, cl                  ; result ------> cl bytes  (triad convert)
                add al, bl      
                stosb

                xor al, al
                mov al, 4eh
                stosb


                pop ax                      ; !!!!!

                add cl, 3
                cmp cl, 15                  ; FOOOOOOOOOOO   MAGIC CONSTANT (MAX NUMBER OF TRIADES)
                je EndOct
                jne NewLp


;----------------------------------------------------------------------------------------------------------------------------
EndOct:         pop bp
                ret

;----------------------------------------------------------------------------------------------------------------------------
STR             db   '0123456789ABCDEF', '$'
include DrawFRM.asm


end start
