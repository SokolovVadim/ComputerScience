;----------------------------------------------------------------------
; printf AX
; ENTRY: AX
; EXIT:  NULL
; DESTR: AX
;----------------------------------------------------------------------
.model tiny
.code
org 100h

start:
                mov ax, 41h
                push ax
                call translate
                add si, 2
                

                mov ax, 4c00h
                int 21h
            
translate:      push bp
                mov bp, sp
               
                xor ax, ax
                mov ah, [bp+4]

                mov dl, ah
                xor ax, ax
                mov ah, 2
                int 21h

             
                pop bp
                ret

end start
