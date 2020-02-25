#include "fifo.h"

char* CreateName(const char* fileName)
{
	char * str = (char*)calloc(STR_LEN, sizeof(char));
	if(str == NULL)
	{
		perror("calloc");
		exit(EXIT_FAILURE);
	}
	strncpy(str, fileName, STR_LEN);
	if(str == NULL)
	{
		perror("strcpy");
	}
	int printNumber = printf("fileName = %s\n", str);	
	if(printNumber <= 0)
	{
		printf("Printed number is NULL!\n");
	}
	return str;
}

void MakeFifo(const char* name)
{
	(void)umask(0);
	if(mknod(name, S_IFIFO | 0666, 0))
	{
		printf("Can not create FIFO!\n");
		exit(EXIT_FAILURE);
	}
}

void ReadFromFile (const int fd, char* buff)
{
	size_t sizeBuff = read(fd, buff, MAX_SIZE);// close fd  (get a pointer)

	if(sizeBuff < 0)
	{
		perror("read");
		exit(EXIT_FAILURE);
	}

	printf("Read from file!\n");
	printf("buff = %s", buff);


	/*if(close(fd) < 0)
	{
		printf("close has failed!\n");
	}*/
	

}

const int Open(const char * fileName, const int flag)
{
	int openFlag = open(fileName, flag);	// read & write

	if(openFlag == -1)
	{
		printf("Open failure!\n");
	}

	printf("Opened!\n");
	return openFlag;
}


int WriteToFifo(const int fd, const char* buff)
{
	size_t size = write(fd, buff, MAX_SIZE);
	//printf("written size = %ld\n", size);
	if(size < 0)
	{
		printf("Write to Fifo failured!\n");
		exit(EXIT_FAILURE);
	}
	return 0;	
}



int CreateProc(const char* name)
{
	int forkResult = 0;
	if((forkResult = fork()) < 0)
	{
		printf("Can not fork child!\n");
		exit(EXIT_FAILURE);
	}
	return forkResult;
}

void LookupParentProc(const int forkRes, const char* name)
{
	int fd = 0;
	if(forkRes > 0) // parent
	{
		if((fd = open(name, O_WRONLY)) < 0)
		{
			printf("Fifo has not opened!\n");
			exit(EXIT_FAILURE);
		}
		size_t size = write(fd, "Hello, work!\n", STR_LEN);
		if(size != STR_LEN)
		{
			printf("Can not write all data in FIFO!\n");
			exit(EXIT_FAILURE);		
		}
		if((close(fd)) < 0)
		{
			printf("Close has failed!\n");
			exit(EXIT_FAILURE);
		}
		
	}
}

void LookupChildProc(const int forkRes, const char* name, char* str)
{
	int fd = 0;
	if(forkRes == 0) // child
	{
		if((fd = open(name, O_RDONLY)) < 0)
		{
			printf("Fifo has not opened!\n");
			exit(EXIT_FAILURE);
		}
		if(str != NULL)
		{
			size_t size = read(fd, str, STR_LEN);
			if(size < 0)
			{
				printf("Can not read all data from FIFO!\n");
				exit(EXIT_FAILURE);		
			}
			//printf("strlen = %ld", strlen(str));
			str[strlen(str)-1] = '\0';
			printf("Result = %s\n", str);
			if((close(fd)) < 0)
			{
				printf("Close has failed!\n");
				exit(EXIT_FAILURE);
			}
		}
	}
}

char* CreateBuff(const size_t size)
{
	if(size < 0)
	{
		printf("Can not allocate mem!\n");
	}
	char* buff = (char*)calloc(size, sizeof(char));
	if(buff == NULL)
	{
		perror("calloc");
		exit(EXIT_FAILURE);
	}
	return buff;
}


