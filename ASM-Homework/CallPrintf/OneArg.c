// Checking work _MyProc function and Fastcall Declaration

#include "stdio.h"
#include "stdlib.h"

extern int _MyProc(int a);


int main()
{

        int ret_value = 718;

        ret_value = _MyProc(2);
        if(ret_value == 12)
        {
             printf("UUURAAAAAA!");
        }

        return 0;
}
