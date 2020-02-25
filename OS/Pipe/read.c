#include "stdio.h"
#include "ctype.h"
#include "string.h"
#include "stdlib.h"
#include "limits.h"
#include "assert.h"
#include "errno.h"
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <fcntl.h>

// do not forget to kill all processes
const int MAX_SIZE = 20;
int* CreatePipe		();

int main()
{
	
	char* buffToRead = (char*)calloc(MAX_SIZE, sizeof(char));


	size_t sizeBuff = 1;
	int openFlag = 0;
	int isRead = 1;
	int * fd = CreatePipe();
	pid_t pid = fork();
	//if(pid == 0)	
	//{
	//	printf("I am child!\n");
	//	openFlag = open("data.txt", O_RDONLY);
	//}

	/*while(isRead)
	{	
		if(pid == 0)
		{		
			sizeBuff = read(openFlag, buffToRead, MAX_SIZE);
			if(sizeBuff)
				printf("%s\n", buffToRead);
			else
			{
				printf("Nikita predumal\n");
				isRead = 0;
				break;
			}
		}
		else
		{
			printf("I am parent!\n");
			break;
		}
		//printf("isRead = %d\n", isRead);
	}*/
	for(int i = 0; i < 10; i++)
	{
		if(pid == 0)
		{
			printf("I am child, i = %d\n", i);
		}
		else
		{
			printf("I am parent, i = %d\n", i);
		}
	}
	return 0;
}


int* CreatePipe()
{

	int * fd = (int *)calloc(MAX_SIZE, sizeof(int));

	if(pipe(fd) == -1)
	{
		perror("pipe");
		exit(EXIT_FAILURE);
	}	
	return fd;
}


