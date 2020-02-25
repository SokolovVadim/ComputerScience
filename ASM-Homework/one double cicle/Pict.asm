
.model tiny
.code


org 100h



VIDEOSEG                equ  0b800h                     ; define | VIDEOSEG equ 0b800h
; X                     equ  80/2
; Y                     equ  25/2


start:                  mov ax, VIDEOSEG                ; es = VIDEOSEG
                        mov es, ax
                      
                       ; mov bx, (Yigggrekk * 80 + 80/2 * 2)   
                      
                      xor al, 80
                      mov bl, Ygrek
                      mul bl
                      
 ;                    add al, Eeks
 ;                    adc ah, 0

;                     push ax
                      xor dx, dx
                      mov dl, Eeks
                      add ax, dx
 ;                    pop ax


                      shl ax, 1                       ; ax <<= 1   ==  ax *= 2
                      mov bx, ax
                       

                      mov si, offset Meow     ; si = &Meow
Next:                 mov al, [si]           ; al = *si  |   lodsb  error 38
                      inc si                 ; si++      |   


 
                      mov          es:[bx], al        ; console[0][0] = 'A'
                      mov byte ptr es:[bx+1], 4eh     ; Y on R                      
                      add bx, 2

                      push ax
                      xor ah, ah
                      int 16h
                      pop ax

                      cmp al, '$'
                      jne Next

       
                      xor ah, ah                      ; _getch()
                      int 16h 
                      mov ax, 4c00h                   ;
                      int 21h                         ;

Eeks                  db 80/2
Ygrek                 db 25/2

Meow                  db, 'I', 03H, 'asm$'     ;db 16 dup (0)         ; db, 'I', 03h, 'cats!$'

end                   start
