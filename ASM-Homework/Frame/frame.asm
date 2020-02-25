; str 169
.model tiny                           
.code                                   

org 100h    



;Msg             db 'Meow$'
;Msglen          equ $ - Msg

VIDEOSEG        equ 0b800h
WFRAME          equ 35                      ; èšàš­  à ¬ªš
HFRAME          equ 6                       ; ¢ëá®â  à ¬ªš
COUNTSPACE1     equ 43                      ; ª®«-¢® ¯à®¡¥«®¢ ¯®á«¥ à ¬ªš
COUNTSPACE2     equ 35                      ; ª®«-¢® ¯à®¡¥«®¢ ¢­ãâàš à ¬ªš
                            

Start:
		mov ax, VIDEOSEG		       ; es = VIDEOSEG
		mov es, ax

		;mov bx, (y * 80 + x) * 2

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

		shl ax, 1			       ; ax <<= 1 == ax *= 2
		
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



                mov cx, Msglen              ; ¢ cx ª« €¥¬ €«š­ã Msg
                mov si, offset Msg          ; ¢ si ª« €¥¬  €à¥á Msg
                mov di, bx                  ;
                rep movsb                   ; ª®¯šàã¥¬ Msg ¢ ¢š€¥®¯ ¬ïâì
                
                
	

		mov ax, 4c00h			; DOS Fn 4ch == exit (0)
		int 21h


.data
Msg             db 'I', 4eh,  20h, 4eh, 'l',4eh, 'o',4eh,'v',4eh,'e',4eh, 20h, 4eh, 'a', 4eh, 's', 4eh, 'm', 4eh
Msglen          equ ($ - Msg)

x               db 80/2 - (WFRAME/2)
y               db 25/2 - (HFRAME /2)
Xpict           db (80/2) - 3
Ypict           db (25/2 )
end Start
