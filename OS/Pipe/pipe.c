#include "pipe.h"

int main(int argc, char ** argv)
{

	if(argc != 2)
	{
		printf("Error!\n");
		exit(EXIT_FAILURE);
	}
	PrintFile(argv[1]);
	
	
	return 0;
}

void PrintFile(const char * fileName)
{
	CreateProc(fileName);
}

void CreateProc(const char * fileName)
{
	int * fd = CreatePipe();

	pid_t pid = fork();
	if(pid < 0)
	{
		printf("Fork has failed!\n");
		exit(EXIT_FAILURE);
	}
	int openFlag = 0;

	
	if(pid == 0)//child
	{
		openFlag = Open(fileName);
		if(close(fd[0]) < 0)// close reading from pipe
		{
			printf("close has failed!\n");
		}
	}
	else//parent
	{
		if(close(fd[1]) < 0)// close writing from pipe
		{
			printf("close has failed!\n");
		}
	}
	
	while(1)
	{
		if(pid == 0) // child
		{
			// start read
			//printf("I am child!\n");
			char* buffToRead = (char*)calloc(MAX_SIZE, sizeof(char));
		
			if(buffToRead == NULL)
			{
				perror("calloc");
				exit(EXIT_FAILURE);
			}
	
			size_t sizeBuff = read(openFlag, buffToRead, MAX_SIZE);// close fd  (get a pointer)
			//printf("sizeBuff = %ld\n", sizeBuff);
			if(sizeBuff == 0)
			{
				//printf("buffer is empty!\n");
				if(close(fd[1]) < 0)
				{
					printf("close has failed!\n");
				}
				break;
				//exit(0);
			}//end read
			else
			{
				if(sizeBuff < 0)
				{
					perror("read");
					printf("Read has failed!\n");
					exit(EXIT_FAILURE);
				}
				else
				{
					char* buffToWrite = buffToRead;
					WriteToPipe(buffToWrite, fd[1]);
				}
			}
			
			

			//char * buffToWrite = Read(openFlag);
	
		}
		else // parent
		{
			//wait(NULL);
			char* data = ReadFromPipe(fd[0]);
			//printf("Read From Pipe!\n");
			if((data != NULL) && (strlen(data) != 0))
				PrintData(data);
			else
			{
				//printf("data == NULL!\n");
				break;
			}
				
		}
	}
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

int Open(const char * fileName)
{
	int openFlag = open(fileName, O_RDONLY);	// read & write

	if(openFlag == -1)
	{
		printf("Open failure!\n");
	}

	printf("Opened!\n");
	return openFlag;
	
}

char * Read(int fd)//openflag
{
	char* buffToRead = (char*)calloc(MAX_SIZE, sizeof(char));
	//printf("SSIZE_MAX = %ld", SSIZE_MAX);
	if(buffToRead == NULL)
	{
		perror("calloc");
		exit(EXIT_FAILURE);
	}
	//printf("Before Read\n");
	size_t sizeBuff = read(fd, buffToRead, MAX_SIZE);// close fd  (get a pointer)

	if(sizeBuff < 0)
	{
		perror("read");
		exit(EXIT_FAILURE);
	}
	/*if(close(fd) < 0)
	{
		printf("close has failed!\n");
	}*/
	//printf("buffToRead: %s", buffToRead);
	return buffToRead;
}


void WriteToPipe(char * buffToWrite, int fd)//fd[1]
{
	//printf("BuffToWrite: %s\n", buffToWrite);
	int size = write(fd, buffToWrite, MAX_SIZE);// STRLEN!!! -> MAX_SIZE
	//printf("After write\n");
	//printf("size = %d\n", size);
	if(size < 0)
	{
		printf("Write has not been succeed\n");
	}
	
	//return fd
}

char* ReadFromPipe(int fd)
{

	char *buffToWrite = (char*)calloc(MAX_SIZE, sizeof(char));

	if(buffToWrite == NULL)
	{
		perror("calloc");
		exit(EXIT_FAILURE);
	}
	//printf("Before reading from pipe\n");
	size_t size = read(fd, buffToWrite, MAX_SIZE);// MAX_SIZE!!!

	//printf("After reading from pipe\n");

	if(size < 0)
	{
		printf("Read from buffer has failed!\n");
		exit(EXIT_FAILURE);
	}
	if(size == 0)
	{
		//printf("ReadFromPipe: size == 0\n");
	}

	return buffToWrite;
}

void PrintData(char * buffToPrint)
{
	size_t size = printf("%s", buffToPrint);
	if(size < 0)
	{
		perror("printf");
		exit(EXIT_FAILURE);
	}
	if(size == 0)
	{
		//printf("printed size == 0\n");
	}
}


long int ReadArg(char * str)
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



