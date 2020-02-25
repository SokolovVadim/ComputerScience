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


		mov ax, VIDEOSEG		       ; es = VIDEOSEG
		mov es, ax

		mov al, 80
		mov bl, Ypict
		mul bl

		add al, Xpict
		adc ah, 0
		
		push ax
		xor dx, dx
		mov dl, Xpict
		add ax, dx
	 	pop ax


                shl ax, 1
                mov bx, ax                  ; ¢ bx «¥Ššâ  €à¥á ¬¥áâ ,
                                            ; á ª®â®à®£® ­ çš­ ¥âáï ¯¥ç âì
                                            ; ¢ ¢š€¥®¯ ¬ïâì



                std
                mov di, bx
                mov ax, Number
                mov cx, 10
Translate:   
                xor dx, dx
                div cx
                xchg ax, dx
                add al, '0'
                stosb

                push ax
                xor al, al
                mov al, 4eh
                stosb
                pop ax


                xchg ax, dx
                or ax, ax
                jne Translate






                mov ax, 4c00h               ; | exit(EXIT_SUCCESS)
                int 21h                     ; |

.data

x               db 80/2 - (WFRAME/2)
y               db 25/2 - (HFRAME /2)
Xpict           db (80/2) + 3
Ypict           db (25/2 )
end start
