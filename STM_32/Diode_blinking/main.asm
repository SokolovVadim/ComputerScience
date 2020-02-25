; ----------------------------------------------------------------------------------------
; Writes "Hello, World" to the console using only system calls. Runs on 64-bit Linux only.
; To assemble and run:
;
;     nasm -felf64 hello.asm && ld hello.o && ./a.out
; ----------------------------------------------------------------------------------------

          global    _start

          section   .text
_start: 
          mov rbx, 0x4
          mov rax, 0x1
loop1:     sub rbx, rax
          cmp rbx, 0
          jne loop1



          mov       rax, 1                  ; system call for write
          mov       rdi, stdout             ; file handle 1 is stdout
          mov       rsi, message            ; address of string to output
         

          
          mov       rdx, msglen             ; number of bytes
          syscall                           ; invoke operating system to do the write

	  xor rax, rax
	  xor rdi, rdi
          xor rsi, rsi
          xor rdx, rdi

	  cld
          mov rax, 4d
loop:     xor rbx, rbx
          sub rax, 1d
          cmp rax, 0
          jne loop





          mov       rax, 0x3C               ; system call for exit == 60d
          xor       rdi, rdi                ; exit code 0
          syscall                           ; invoke operating system to exit

          section   .data
message:  db        "Hello, World", 0xA, 0x00      ; note the newline at the end
msglen equ $ - message
stdout equ 1
