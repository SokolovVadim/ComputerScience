#include <stdio.h>
#include <pthread.h>
#include <stdlib.h>
#include <sched.h>
#include <errno.h>
#include <unistd.h>


long getCPUsNumber()
{
	long nprocs = -1;
        # ifdef _SC_NPROCESSORS_ONLN
        nprocs = sysconf( _SC_NPROCESSORS_ONLN );
        if ( nprocs < 1 )
        {
                printf("Error!\n");
                return -1;
        }
        printf("nprocs = %ld\n", nprocs);

        long nprocs_max = sysconf( _SC_NPROCESSORS_CONF );

        if ( nprocs_max < 1 )
        {
                printf("Error!\n");
                return -1;
        }
        printf("nproc_max = %ld\n", nprocs_max);
        #else
        printf("can't determine number of CPU's\n");
        #endif

	return nprocs;
}

int main()
{
	getCPUsNumber();	
	return 0;
}




