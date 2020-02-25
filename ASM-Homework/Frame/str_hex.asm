;|     This programm translate string of numbers (msg) into hex type
;|----------------------------------------------------------------------------------------------




.model tiny
.code
.386
org 100h

VIDEOSEG        equ 0b800h
WFRAME          equ 35                      ; 
HFRAME          equ 6                       ; 
COUNTSPACE1     equ 43                      ; 
COUNTSPACE2     equ 35                      ; 

start:




                mov ax, 0b800h              ; | mov es, 0b800h
                mov es, ax                  ; | 
                xor ax, ax
              
                mov al, 80                  ; | al = 80y
                mov bl, y                   ; |
                mul bl                      ; |
           
                add al, x
                adc ah, 0
                push ax
                xor dx, dx
                mov dl, x
                add ax, dx
                pop ax
                shl ax, 1
                mov bx, ax


                mov es:[bx], 0c9h           ; print begin left
                mov byte ptr es:[bx+1], 4eh
                add bx, 2




                mov ax, 0
                mov dl, 0cdh                ; print ------
UpFr:           
                mov es:[bx], dl
                mov byte ptr es:[bx+1], 4eh
                add bx, 2
                inc ax              
                cmp ax, WFRAME
                jne UpFr


                mov es:[bx], 0bbh           ; print begin right
                mov byte ptr es:[bx+1], 4eh
                add bx, 2



                mov si, 0

MainCicle:      

		mov cx, 0
                mov dl, 20h

MakeSpace1:                 
               
                mov es:[bx], dl             ; ¯¥à¥å®€š¬ ­  ­®¢ãî áâà®ªã
                mov byte ptr es:[bx+1], 07h
                add bx, 2
                inc cx
                cmp cx, COUNTSPACE1
                jne MakeSpace1
        

                mov dl, 0bah                ;  § ªš€ë¢ ¥¬ || ¯¥à¥€ ¯à®¡¥« ¬š
                mov es:[bx], dl
                mov byte ptr es:[bx+1], 4eh
                add bx, 2
                
                mov cx, 0
                mov dl, 20h

MakeSpace2:     mov es:[bx], dl             ; ¯šè¥¬ ¯à®¡¥«ë ¬¥Š€ã ||    ||
                mov byte ptr es:[bx+1], 4eh
                add bx, 2
                inc cx
                cmp cx, WFRAME
                jne MakeSpace2
             
                mov dl, 0bah                ; § ªàë¢ ¥¬ áâà®ªã á ¯à®¡¥« ¬š ||
                mov es:[bx], dl
                mov byte ptr es:[bx+1], 4eh
                add bx, 2    

                inc si
                cmp si, HFRAME
                jne MainCicle

                mov cx, 0
                mov dl, 20h


MakeSpace3:                 
               
                mov es:[bx], dl             ; ¯¥à¥å®€š¬ ­  ­®¢ãî áâà®ªã
                mov byte ptr es:[bx+1], 07h
                add bx, 2
                inc cx
                cmp cx, COUNTSPACE1
                jne MakeSpace3


                mov es:[bx], 0c8h           ; print begin left
                mov byte ptr es:[bx+1], 4eh
                add bx, 2




                mov ax, 0
                mov dl, 0cdh                ; print ------
UndFr:           
                mov es:[bx], dl
                mov byte ptr es:[bx+1], 4eh
                add bx, 2
                inc ax              
                cmp ax, WFRAME
                jne UndFr


                mov es:[bx], 0bch           ; print begin right
                mov byte ptr es:[bx+1], 4eh
                add bx, 2


















;*****************************************************************************************
                xor ax, ax
                mov al, msglen              ; cx = strlen
                adc ah, 0

                mov cx, ax
                dec cx
                mov di, 0
                mov bx, 0
                mov si, offset msg          ; si = &msg
                
Remul:          mov al, [si]                ; ax = str[si]
                inc si                      ; si++
                inc di
                sub al, '0'                 ; al -= '0'
 
                
                
                push ax                     
                xor ax, ax
                mov ax, bx                  ; ax = bx
                mov bx, 10
                mul bx                      ; ax = ax * 10
                mov bx, ax                  ; 
                pop ax                   

                add bx, ax                  ; bx += al
                cmp di, cx
                jne Remul

                mov ax, bx
                push ax                     ; PPPPPUSSHSHHH
       





;*****************************************************************************************




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


;---------------------------------------------------------------------------------------------
                pop ax                      ; PPPPPPOOPPP
;---------------------------------------------------------------------------------------------

                std
                mov di, bx

                mov cx, 16                  ; system of numbers
HexTran:   
                xor dx, dx                  ; dx = 0
                div cx                      ; ax = ax / 16

                cmp dx, 10
                je Ten

                cmp dx, 11
                je Elev
          
                cmp dx, 12
                je Twel
 
                cmp dx, 13
                je Thir
               
                cmp dx, 14
                je Four
 
                cmp dx, 15
                je Fift

                xchg ax, dx                 ; swap( ax, dx )

   
                add ax, '0'                 ; al += byte code '0'
              ;  xor ah, ah
                stosb                       ; put al into videoseg 

                push ax                     ; put ax into stk
                xor al, al                  ; al = 0
                mov al, 4eh                 ; put param into al
                stosb                       ; put param into videoseg
                pop ax                      ; get ax from stk


                xchg ax, dx                 ; swap( ax, dx )
                or ax, ax                   ; cicle if ax
                jne HexTran
                je EndProg

Ten:            
                push ax
                mov al, 'A'
                stosb
                mov al, 4eh
                stosb
                pop ax
                cmp ax, 0
                jne HexTran
                je EndProg


Elev:            
                push ax
                mov al, 'B'
                stosb
                mov al, 4eh
                stosb
                pop ax
                cmp ax, 0
                jne HexTran
                je EndProg

Twel:            
                push ax
                mov al, 'C'
                stosb
                mov al, 4eh
                stosb
                pop ax
                cmp ax, 0
                jne HexTran
                je EndProg


Thir:            
                push ax
                mov al, 'D'
                stosb
                mov al, 4eh
                stosb
                pop ax
                cmp ax, 0
                jne HexTran
                je EndProg


Four:            
                push ax
                mov al, 'E'
                stosb
                mov al, 4eh
                stosb
                pop ax
                cmp ax, 0
                jne HexTran
                je EndProg

Fift:            
                push ax
                mov al, 'F'
                stosb
                mov al, 4eh
                stosb
                pop ax
                cmp ax, 0
                jne HexTran
                je EndProg


EndProg:        mov ax, 4c00h
                int 21h
             
.data

WX              db 160
x               db 80/2 - (WFRAME/2)
y               db 25/2 - (HFRAME /2)
Xpict           db (80/2)+1
Ypict           db (25/2 )
msg             db '75', '$'
msglen          db ($ - msg)
end start
