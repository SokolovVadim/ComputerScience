#include <iostream>


int strcmp(const char* s1, const char* s2);

int main() {


    auto first  = (char*)calloc(1, sizeof(char));
    auto second = (char*)calloc(1, sizeof(char));

    first[0] = 'b';
    first[1] = '\0';
    second[0] = 'a';
    second[1] = '\0';

    size_t cmpflag(0);

    //.att_syntax noprefix
     asm(
        R"(
            .intel_syntax noprefix
    loop:
            cmpsb
            jne End

    ifzero:
            xor rax, rax
            mov al, byte [rsi-1]

            cmp al, 0
            jne loop

    End:    xor rax, rax
            xor rbx, rbx

            mov al, byte [rdi - 2]
            mov bl, byte [rsi - 2]
            sub al, bl

            mov %0, rax

            .att_syntax prefix

            )"
        : "=r"(cmpflag)
        : "D"(first), "S"(second)
        : "%rcx"


        );
//    strcmp(first, second);
    printf("%lu\n", cmpflag);

    if(!strcmp(first, second))
        printf("!\n");
}


int strcmp(const char* s1, const char* s2)
{
    while(*s1 && (*s1==*s2))
        s1++,s2++;
    return *(const unsigned char*)s1-*(const unsigned char*)s2;
}
