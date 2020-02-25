#include "stdio.h"
#include "stdlib.h"

extern int _MyProc(int a, int b, int c, int d, int e, int f, int g, int h, int i);


int main()
{

        int ret_value = 718;

        ret_value = _MyProc(2, 3, 4, 5, 6, 7, 8, 9, 10);
        if(ret_value == 54)                                      // summ of args
        {
             printf("UUURAAAAAA!\n");
        }
        else
        {
             printf("I still love asm!!!\n");
        }

        return 0;
}

