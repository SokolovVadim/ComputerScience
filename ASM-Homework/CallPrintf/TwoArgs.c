#include "stdio.h"
#include "stdlib.h"

extern int _MyProc(int a, int b);


int main()
{

        int ret_value = 718;

        ret_value = _MyProc(2, 3);
        if(ret_value == 5)
        {
             printf("UUURAAAAAA!");
        }

        return 0;
}

