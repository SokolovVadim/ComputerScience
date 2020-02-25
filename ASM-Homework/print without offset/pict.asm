.model tiny
.code

org 100h

VIDEOSEG        equ 0b800h                  ; ®¡à é¥­š¥ ª ¢š€¥®¯ ¬ïâš
LINE            equ 80                      ; €«š­  áâà®ªš (§­ ª®¬¥áâ)
                                            ; á¬¥é¥­š¥ ­  80 §­ ª®¬¥áâ
                                            ; ¯¥à¥¢®€šâ "ªãàá®à"
 		      		            ; ­  1 áâà®ªã ¢­š§
WFRAME          equ 35                      ; èšàš­  à ¬ªš
HFRAME          equ 2                       ; ¢ëá®â  à ¬ªš
COUNTSPACE1     equ 43                      ; ª®«-¢® ¯à®¡¥«®¢ ¯®á«¥ à ¬ªš
COUNTSPACE2     equ 35                      ; ª®«-¢® ¯à®¡¥«®¢ ¢­ãâàš à ¬ªš
COUNTLINES      equ 6                       ; ª®«-¢® ¯ãáâëå áâà®ª

Start:  
                
                mov ax, VIDEOSEG            ; ax = 0b800h
                mov es, ax        
                mov al, LINE
                mov bl, y
                mul bl
                add al, x
                adc ah, 0

                push ax
                xor dx, dx
                mov dl, x;
                add ax, dx
                pop ax
                
                shl ax, 1
                mov bx, ax

                mov cl, 0c9h                ; ¯®¬¥é ¥¬ ¢ cl áš¬¢®« ­ ç «  à ¬ªš     
                
                mov es:[bx], cl         
                mov byte ptr es:[bx+1], 3eh ; ªà áš¬ ä®­ áš¬¢®« 
                add bx, 2
                push ax
                xor ah, ah
         ;      int 16h
                pop ax   
               
                mov dl, 0cdh                ; ¯®¬¥é¢¥¬ ¢ dl áš¬¢®« =
                mov cx, 0                   ; áç¥âçšª ª®«-¢  áš¬¢®«®¢ =
                
MakeUp:         
                mov es:[bx], dl
                mov byte ptr es:[bx+1], 4eh
                add bx, 2
                push ax
                xor ah, ah
                pop ax
                inc cx
                cmp cx, WFRAME
                jne MakeUp

                mov cl, 0bbh                ; ¯®¬¥é ¥¬ ¢ cl áš¬¢®« ª®­æ  à ¬ªš
                mov es:[bx], cl
                mov byte ptr es:[bx+1], 4ah
                add bx, 2
                push ax
                xor ah, ah
         ;      int 16h
                pop ax

                mov si, 0
MakeSpaceLine:

                cmp si, (COUNTLINES/2)
                je PrintStr                 ; ¯®áà¥€š à ¬ªš ¯àë£ ¥¬ ­ 
                                            ; ¢ë¢®€ â¥ªáâ 
                int 16h
               
Repeat:
                int 16h
         
                mov cx, 0
                mov dl, 20h
MakeSpace1:                 
               
Avoid:          mov es:[bx], dl             ; ¯¥à¥å®€š¬ ­  ­®¢ãî áâà®ªã
                mov byte ptr es:[bx+1], 07h
                add bx, 2
        ;        push ax
         ;       xor ah, ah
         ;     int 16h
                inc cx
                cmp cx, COUNTSPACE1
                jne MakeSpace1
        

                mov dl, 0bah                ;  § ªš€ë¢ ¥¬ || ¯¥à¥€ ¯à®¡¥« ¬š
                mov es:[bx], dl
                mov byte ptr es:[bx+1], 4eh
                add bx, 2
         ;       push ax
         ;       xor ah, ah
         ;      int 16h
         ;       pop ax
                
                mov cx, 0
                mov dl, 20h

MakeSpace2:     mov es:[bx], dl             ; ¯šè¥¬ ¯à®¡¥«ë ¬¥Š€ã ||    ||
                mov byte ptr es:[bx+1], 4eh
                add bx, 2
                push ax
         ;       xor ah, ah
         ;      int 16h
         ;       pop ax
                inc cx
                cmp cx, WFRAME
                jne MakeSpace2
             
                mov dl, 0bah                ; § ªàë¢ ¥¬ áâà®ªã á ¯à®¡¥« ¬š ||
                mov es:[bx], dl
                mov byte ptr es:[bx+1], 4eh
                add bx, 2    


                inc si
                cmp si, COUNTLINES       
                jna MakeSpaceLine

                cmp si, COUNTLINES          ; ¥á«š ¢ë¢®€ ¢á¥å áâà®ª § ¢¥àèš«áï
                jnl EndProg                 ; â® ¯¥à¥€ ¥¬ ã¯à ¢«¥­š¥ Dos-ã

PrintStr:                                   ; ¯¥ç â ¥¬ áâà®ªã
                                            ; ¯¥à¥å®€š¬ ­  ­®¢ãî áâà®ªã
                mov dh, 0
                mov dl, 20h
                inc si

AvoidLine:      mov es:[bx], dl
                add bx, 2
                inc dh
                cmp dh, CountSpace1
                jne AvoidLine
                                

                mov di, offset Text
Next:           mov al, [di]                ; ¢ë¢®€š¬ áš¬¢®«ë áâà®ªš
                inc di
                mov es:[bx], al
                mov byte ptr es:[bx+1], 4eh
                add bx, 2
                cmp al, '$'
                jne Next 

                cmp si, COUNTLINES
                jl Repeat                   ;


        
EndProg:        mov ax, 4c00h               ; ¢ëå®€ š§ ¯à®£à ¬¬ë
                int 21h                     ; š ¯¥à¥€ ç  ã¯à ¢«¥­šï Dos-ã

Text            db 'Ya ronyau zapaddjva$'
x               db 34/2
y               db 12/2


end Start
