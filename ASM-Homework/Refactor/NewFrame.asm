.model tiny

.code
org 100h

VIDEOSEG        equ 0b800h
WFRAME          equ 35                      ; width
HFRAME          equ 6                       ; heigh
COUNTSPACE1     equ 43                      ; count of spaces after first string
COUNTSPACE2     equ 35                      ; count of spaces between ||


start:		
    mov ax, VIDEOSEG            ; es = VIDEOSEG
		mov es, ax

    call DrawFrame

		mov ax, 4c00h               ; DOS Fn 4ch == exit (0)
		int 21h

;--------------------------------------------------------------------------------------
; Draws a frame with parametres in DATA
; Entry: ( x, y ) - upper left corner of frame
;
; Exit:  SI -> ']'
;        [DI] == last simbol of frame
;
; Destr: AX, BX, CX, DL, SI, ES
;        flags: DF
;--------------------------------------------------------------------------------------


DrawFrame       proc

		            mov al, 80
		            mov bl, y
		            mul bl

		            add al, x
		            adc ah, 0
		
		            push ax
		            xor dx, dx
		            mov dl, x
		            add ax, dx
		            pop ax

		            shl ax, 1	            ; ax <<= 1 <==> ax *= 2

		            mov bx, ax


                cld

		            mov di, ax

                xor ax, ax
                mov al, 0c9h
                mov ah, 4eh
                stosw                       ; simbol begin frame [



                xor ax, ax
                mov cx, WFRAME
                mov al, 0cdh
                mov ah, 4eh
                cld

                rep stosw                   ; simbol --- X WFRAME

                xor ax, ax
                mov al, 0bbh
                mov ah, 4eh
                stosw                       ; simbol ] after first line


                mov si, 0

MainCicle:      mov cx, 0
                mov dl, 20h

                xor ax, ax                  ; spaces after closing first string
                mov cx, COUNTSPACE1
                mov al, dl
                mov ah, 07h
                cld
                rep stosw


                xor ax, ax                  ;  simbol || before spaces into frame
                mov al, 0bah
                mov ah, 4eh
                stosw   
                
                mov cx, 0
                mov dl, 20h

                xor ax, ax                  ; make spaces between ||                       
                mov cx, WFRAME
                mov al, dl
                mov ah, 4eh
                cld
                rep stosw 

                xor ax, ax                  ; simbol || after spaces into frame         
                mov al, 0bah
                mov ah, 4eh
                stosw   


                inc si
                cmp si, HFRAME
                jne MainCicle               ; return to the beginningo of Main Cicle


                mov cx, 0
                mov dl, 20h


                xor ax, ax                  ; make spaces before last line        
                mov cx, COUNTSPACE1
                mov al, dl
                mov ah, 07h
                cld
                rep stosw


                xor ax, ax                  ; open last line [
                mov al, 0c8h
                mov ah, 4eh
                stosw   


                mov ax, 0
                mov dl, 0cdh                ; print ------

                xor ax, ax                          
                mov cx, WFRAME
                mov al, dl
                mov ah, 4eh
                cld
                rep stosw

                xor ax, ax                  ; close last line ]
                mov al, 0bch
                mov ah, 4eh
                stosw   

                ret
                endp

.data
x               db 80/2 - (WFRAME/2)
y               db 25/2 - (HFRAME /2)
end Start
