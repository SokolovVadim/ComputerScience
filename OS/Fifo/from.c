#include "fifo.h"

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

void ReadFromFifo(const int fd, char* buff)
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

void Print(const char* buff)
{
	if(buff == NULL)
	{
		printf("NULL pointer!");
		exit(EXIT_FAILURE);
	}
	printf("%s", buff);
}


