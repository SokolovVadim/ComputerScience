#define _GNU_SOURCE  
#include <stdio.h>
#include <stdlib.h>
#include <sched.h>          
#include <pthread.h>
#include <sys/wait.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <errno.h>
#include <sys/types.h>
#include <sys/sysinfo.h>
#include <limits.h>
#include <unistd.h>
#include <ctype.h>


int pthread_create(pthread_t *thread, const pthread_attr_t *attr,
                          void *(*start_routine) (void *), void *arg);
void* empty_routine (void* arg);

// 39916800

#define CHECK                               \
do 											\
{											\
 	printf("I'm here!\n");					\
} while (0)

enum COMPONENTS
{	
	COMPUTE_SIZE 		= 900000000,
	A_SEGMENT    		= -880,
	B_SEGMENT    		= 880,
	BUF_SIZE 			= 10
	// THREADS_AVAILABLE   = 2
};

typedef struct{
	double sum;
	size_t token_size;
	int token_number;
} Elem;


typedef struct{
	long cpu_id;
	long core_id;
} cpu_info;


// f(x) = x
double function(double var)
{
	return var * var;
}

double compute_integral(const size_t token_size, const int token_number)
{
	size_t i = 0;
	double sum = 0.0;
	double height = (double)(B_SEGMENT - A_SEGMENT) / COMPUTE_SIZE;
	double integral = 0.0;
	// printf("Height = %lf\n", height);
	double offset = token_number * ((B_SEGMENT - A_SEGMENT) / token_size);
	// printf("offset = %lf, token_number = %d\n", offset, token_number);
	// printf("COMPUTE_SIZE / token_size = %ld\n", COMPUTE_SIZE / token_size);
	for(i = 0; i < COMPUTE_SIZE / token_size; i++)
	{
		integral = (height / 2.0) *
		 (function(A_SEGMENT + offset + i * height) +
		  function(A_SEGMENT + offset + (i + 1) * height));
		sum += integral;
	}
	// printf("The sum is: %f\n", sum);
	// sleep(1);
	return sum;
}



void * thread_func(void* args)
{
	//printf("In thread\n");
	if(args == NULL)
		return NULL;
	Elem* elem = (Elem*)args;

	// printf("In thread function: token_size = %ld, token->number = %d\n", elem->token_size, elem->token_number);
	elem->sum = compute_integral(elem->token_size, elem->token_number);
	return NULL;
}

long int read_args(char * str)
{
    char* endptr;
    errno = 0;

    long int number = strtol(str, &endptr, 10);


    if ((errno == ERANGE && (number == LONG_MAX || number == LONG_MIN)) || (errno != 0 && number == 0))
    {
        perror("strtol");
        exit(EXIT_FAILURE);
    }

    if (endptr == str)
    {
        fprintf(stderr, "Error!\n");
        exit(EXIT_FAILURE);
    }
    if (*endptr != '\0')
    {
        fprintf(stderr, "Error!\n");
        exit(EXIT_FAILURE);
    }
    return number;
}

int pthread_getaffinity_np(pthread_t thread, size_t cpusetsize,
                                  cpu_set_t *cpuset);

// nthreads > real_n_threads

int pthread_scheduler_calculation(const long n_threads/*, int* thread_arr*/)
{
	
	printf("Scheduler calculation\n");
	double sum = 0.0;
	Elem* elem_arr = (Elem*)calloc(n_threads, sizeof(*elem_arr));// {0, (((B_SEGMENT - A_SEGMENT)) / max_thread_num), 0};
	int i = 0;
	for(i = 0; i < n_threads; ++i)
	{
		elem_arr[i].sum = 0.0;
		elem_arr[i].token_size = n_threads;
		elem_arr[i].token_number = i;
	}

	pthread_attr_t attr;
    int ret_attr_init = pthread_attr_init(&attr);
    if(ret_attr_init != 0)
    {
    	perror("pthread_attr_init");
    	exit(EXIT_FAILURE);
    }

	pthread_t *pthread = calloc(n_threads, sizeof(*pthread));
    if (pthread == NULL)
    {
        perror("calloc");
        exit(EXIT_FAILURE);
    }
    // int i = 0;
    	
    for(i = 0; i < n_threads; ++i) // !!!!!!!!!!!!!!!!!!!!
	{
    	// printf("i = %d\n", i);
    	int thread_ret = pthread_create(&pthread[i], &attr, &thread_func, (void*)(&elem_arr[i]));
    	if(thread_ret < 0)
   		{
   			perror("pthread_create");
   			exit(EXIT_FAILURE);
   		}

   		// check cpu affinity

	   	
   	}
/*
   	int attr_destroy_ret = pthread_attr_destroy(&attr);
   	if(attr_destroy_ret != 0)
   	{
   		perror("pthread_attr_destroy");
   		exit(EXIT_FAILURE);
   	}
    */
   	for(i = 0; i < n_threads; ++i) // !!!!!!!!!!!!!!!!!!!!
	{
    	pthread_join(pthread[i], NULL);
    	sum += elem_arr[i].sum;
    }
	free(pthread);
	free(elem_arr);
	printf("Final sum = %lf\n", sum);
	

	return 0;
}




int process_switch(const long n_threads, const long real_n_threads, cpu_info* thread_arr)
{
	// cpu_set_t cpuset;

	if(n_threads < 0)
		return EDOM; 
	if(n_threads == 0)
		return 0;
	long max_thread_num = n_threads;
	
	if(n_threads > real_n_threads) 
	{
		// printf("n_threads >= %ld\n", real_n_threads);
		pthread_scheduler_calculation(n_threads/*, thread_arr*/);
		return 0;
		printf("n_threads >= %ld\n", real_n_threads);
		max_thread_num = real_n_threads;
	}
	else
	{

		// affinity_calculation(n_threads, real_n_threads);
	}
	
	max_thread_num = n_threads;
	double sum = 0.0;
	
	Elem* elem_arr = (Elem*)calloc(real_n_threads, sizeof(*elem_arr));// {0, (((B_SEGMENT - A_SEGMENT)) / max_thread_num), 0};
	if(elem_arr == NULL)
	{
		perror("calloc");
        exit(EXIT_FAILURE);
	}

	int i = 0;
	
	for(i = 0; i < real_n_threads; ++i)
	{
		elem_arr[i].sum = 0.0;
		elem_arr[i].token_size = max_thread_num;
		elem_arr[i].token_number = i;
	}

	cpu_set_t cpuset;
    
    pthread_attr_t attr;
    int ret_attr_init = pthread_attr_init(&attr);
    if(ret_attr_init != 0)
    {
    	perror("pthread_attr_init");
    	exit(EXIT_FAILURE);
    }

    
    pthread_t *pthread;
    pthread = calloc(real_n_threads, sizeof(*pthread));
    if (pthread == NULL)
    {
        perror("calloc");
        exit(EXIT_FAILURE);
    }
    
    for(i = 0; i < real_n_threads; ++i) // !!!!!!!!!!!!!!!!!!!!
	{

	    CPU_ZERO(&cpuset);
	   	CPU_SET(thread_arr[i].cpu_id, &cpuset); // 0 cpu_s
	    int j = 0;
	   	for(j = 0; j < max_thread_num; j++) /// !!!!!!!!!!!!!!!!!!!!
		{
	   		if(CPU_ISSET(j, &cpuset))
		   		printf("Isset CPU: %d\n", j);
	   	}
    

	    pthread_attr_setaffinity_np(&attr, sizeof(cpu_set_t), &cpuset);

	    	// elem.token_number = i;
	    	// printf("i = %d\n", i);
	    if(i < n_threads)
	    {
	    	int thread_ret = pthread_create(&pthread[i], &attr, &thread_func, (void*)(&elem_arr[i]));
			if(thread_ret < 0)
		  	{
		   		perror("pthread_create");
		   		exit(EXIT_FAILURE);
		   	}
	    }
	    else
	    {
	    	int thread_ret = pthread_create(&pthread[i], &attr, &thread_func, (void*)(&elem_arr[i]));
			if(thread_ret < 0)
		  	{
		   		perror("pthread_create");
		   		exit(EXIT_FAILURE);
		   	}
	    }
		
	}

	
   	int attr_destroy_ret = pthread_attr_destroy(&attr);
   	if(attr_destroy_ret != 0)
   	{
   		perror("pthread_attr_destroy");
   		exit(EXIT_FAILURE);
   	}
    
   	for(i = 0; i < real_n_threads; ++i) // !!!!!!!!!!!!!!!!!!!!
	{
    	pthread_join(pthread[i], NULL);
    	sum += elem_arr[i].sum;
    }

	free(pthread);
	free(elem_arr);
	free(thread_arr);
	
	printf("Final sum = %lf\n", sum);
	
	return 0;
}

#define SHELLSCRYPT "\
grep ^cpu\\\\scores /proc/cpuinfo | uniq | awk '{print $4}' > cpus.txt\
"

long real_thread_number()
{
	int sys_ret = system(SHELLSCRYPT);
	if(sys_ret != 0)
	{
		perror("error while getting process number");
		exit(EXIT_FAILURE);
	}
	

	int fd = open("cpus.txt", 0666);
	if(fd < 0)
	{
		perror("open");
		exit(EXIT_FAILURE);
	}
	char* buff = (char*)calloc(BUF_SIZE, sizeof(char));

	int read_ret = read(fd, buff, BUF_SIZE);
	if(read_ret < 0)
	{
		perror("read");
		exit(EXIT_FAILURE);
	}
	buff[BUF_SIZE - 1] = '\0';

	long n = 0;
	sscanf(buff, "%ld", &n);

	printf("n = %ld\n", n);
	// system(SHELLSCRYPT);

	close(fd);
	free(buff);

	return n;
}

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

// return value contains number of procs


int set_real_cores(int** realProcs)
{	
	int i = 0;
	int nProcs = getCPUsNumber();
	*realProcs = (int*) malloc (nProcs * sizeof(**realProcs));
	if (*realProcs == NULL)
	{
		perror ("problem with malloc\n");
	}
	for (i = 0; i < nProcs; i++)
	{
		(*realProcs)[i] = -1;
	}

	unsigned int nRealProcs = 0;
	int procId = 0;
	i = 0;
	FILE* cpuIdFile = NULL;
	char fileLocation [] = "/sys/bus/cpu/devices/cpu0/topology/core_id";

	while ((cpuIdFile = fopen(fileLocation, "r")) != NULL)
	{
		fscanf (cpuIdFile, "%d", &procId);
		// printf("procId: %d\n", procId);
		i = 0;
		while (((*realProcs)[i] != procId) && ((*realProcs)[i] != -1))
			i++;
		if ((*realProcs)[i] == -1)
		{
			nRealProcs++;
			(*realProcs)[i] = procId;

		}
		printf("ProcID: %d\n", procId);
		// printf("(*realProcs)[i] = %d\n", (*realProcs)[i]);
		fileLocation[24]++;
	}
	// printf("nRealProcs = %d\n", nRealProcs);
	
	int j = 0;
	for(j = 0; j < nProcs; j++)
	{
		printf("*realProcs[i] = %d\n", (*realProcs)[i]);
	}


	return nRealProcs;

	// return 0;
}

/*
typedef struct{
	long cpu_id;
	long core_id;
} cpu_info;

*/

int set_real_cores1(cpu_info** realProcs)
{	
	int i = 0;
	int nProcs = getCPUsNumber();
	*realProcs = (cpu_info*) malloc (nProcs * sizeof(**realProcs));
	if (*realProcs == NULL)
	{
		perror ("calloc");
	}
	for (i = 0; i < nProcs; i++)
	{
		(*realProcs)[i].cpu_id = -1;
		(*realProcs)[i].core_id = -1;
	}

	

	unsigned int nRealProcs = 0;
	int procId = 0;
	i = 0;
	FILE* cpuIdFile = NULL;
	char fileLocation [] = "/sys/bus/cpu/devices/cpu0/topology/core_id";

	while ((cpuIdFile = fopen(fileLocation, "r")) != NULL)
	{
		fscanf (cpuIdFile, "%d", &procId);
		// printf("procId: %d\n", procId);
		i = 0;
		
		if ((*realProcs)[nRealProcs].core_id == -1)
		{
			printf("ProcID: %d\n", procId);
			printf("nRealProcs: %d\n", nRealProcs);
			(*realProcs)[nRealProcs].core_id = procId;
			(*realProcs)[nRealProcs].cpu_id = nRealProcs;
			nRealProcs++;
		}
		
		// printf("(*realProcs)[i] = %d\n", (*realProcs)[i]);
		fileLocation[24]++;
	}
	// printf("nRealProcs = %d\n", nRealProcs);
	
	int j = 0;
	for(j = 0; j < nProcs; j++)
	{
		printf("*realProcs[i] = %ld\n", (*realProcs)[j].core_id);
	}


	return nRealProcs;
	
	return 0;
}

int main(int argc, char** argv)
{
	if(argc != 2)
    {
        printf("invalid number of args\n");
        exit(EXIT_FAILURE);
    }
	
	// thread_example();
	long n_threads    = read_args(argv[1]);
	printf("n_threads = %ld\n", n_threads);
	long real_n_threads = real_thread_number();

	
	// int* realProcs = NULL;
	// set_real_cores(&realProcs);
	
	cpu_info* CI;
	set_real_cores1(&CI);
	process_switch(n_threads, real_n_threads, CI);

	
	// printf("The process is running on CPU %d\n", sched_getcpu());
	return 0;
}


void* empty_routine (void* arg)
{
	// printf ("I am empty\n");
	while (1);
	printf("exit!\n");
	pthread_exit (0);
}


#undef SHELLSCRYPT
#undef CHECK
