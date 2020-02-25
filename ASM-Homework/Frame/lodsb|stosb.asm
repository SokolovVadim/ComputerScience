.code
org 100h
start:
                 		
                mov ax, 0b800h              ; | mov es, 0b800h
                mov es, ax                  ; | 
                xor ax, ax
              
                mov al, 80                  ; | al = 80y
                mov bl, Y                   ; |
                mul bl                      ; |
           
                add al, X
                adc ah, 0
                push ax
                xor dx, dx
                mov dl, X
                add ax, dx
                pop ax
                shl ax, 1
                mov bx, ax

                cld
                mov ax, offset msg
                mov cx, msglen
                mov si, ax
                xor ax, ax
                mov di, bx
                mov bx, 0
                        
OutAtr:         lodsb                       ; load byte into al
                                            ; si++
                mov ah, al                  ; ah = al
                stosb                       ; load from al into videoseg
                                            ; di++
                mov al,   4eh               ; al = param
                stosb                       ; load from al into videoseg
                dec cx                      ; cx--
                cmp bx, cx                  
                jne OutAtr                  ; jmp if not equal

                mov ax, 4c00h               ; | exit(EXIT_SUCCESS)
                int 21h                     ; |

.data
msg            db       'Gucci gang$'
msglen         equ       ($-msg)

Y               db 25/2
X               db 80/2

end start
