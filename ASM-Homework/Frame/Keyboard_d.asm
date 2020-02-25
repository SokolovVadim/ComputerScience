;|                           Tap into your keyboard -> you will get code of symbol in dec system

.model tiny
.code
org 100h

VIDEOSEG        equ 0b800h
WFRAME          equ 35                      ; 
HFRAME          equ 6                       ; 
COUNTSPACE1     equ 43                      ; 
COUNTSPACE2     equ 35                      ; 
Number          =   62300

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

                mov ah, 0ch                 ; clear buffer
                mov al, 7                   ; mov code of symbol into al
                int 21h
             
                std                         ; decrement
                mov di, bx                  ; addres of videoseg into di
                xor ah, ah
                mov cx, 10                  ; system of numbers
Translate:   
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
                jne Translate

                mov ax, 4c00h
                int 21h
             
.data

x               db 80/2 - (WFRAME/2)
y               db 25/2 - (HFRAME /2)
Xpict           db (80/2)+1
Ypict           db (25/2 )
end start
