#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include <sys/sem.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <fcntl.h>

//
// client
//

int GetVal(const int semid, const int semnum)
{
	int semval = semctl(semid, semnum, GETVAL, 0);
	
	if(semval < 0)
	{
		perror("semop");
		exit(EXIT_FAILURE);
	}
	printf("[%d].semval = %d\n", semnum, semval);

	return semval;
}


void SetVal(const int semid, const int semnum, const int value)
{
	int semval = semctl(semid, semnum, SETVAL, value);
	
	if(semval < 0)
	{
		perror("semop");
		exit(EXIT_FAILURE);
	}
}


int main(int argc, char** argv)
{

	struct sembuf sembuf_[2] = {};
	
	key_t semkey = ftok(argv[1], 1);
	if(semkey == -1)
	{
		perror("ftok");
		exit(EXIT_FAILURE);
	}
	int semid = semget(semkey, 2, 0666 | IPC_CREAT);
	if(semid == -1)
	{
		perror("semget");
		exit(EXIT_FAILURE);
	}

	GetVal(semid, 0);

	//--------------------------------------------
	//	[0] - 1

	sembuf_[0].sem_num = 0;
	sembuf_[0].sem_flg = 0;
	sembuf_[0].sem_op  = -1;
	
	//semctl(semid, 1, SETVAL, 1);

	int opRet = semop(semid, (struct sembuf*)&sembuf_[0], 1);
	if(opRet < 0)
	{
		perror("semop");
		exit(EXIT_FAILURE);
	}
	GetVal(semid, 0);

	GetVal(semid, 1);

	//--------------------------------------------
	//	[1] + 1

	sembuf_[1].sem_num = 1;
	sembuf_[1].sem_flg = 0;
	sembuf_[1].sem_op  = 1;

	opRet = semop(semid, (struct sembuf*)&sembuf_[1], 1);
	if(opRet < 0)
	{	
		perror("semop");
		exit(EXIT_FAILURE);
	}

	GetVal(semid, 1);

	return EXIT_SUCCESS;
}



