#include "fifo.h"



int main(int argc, char ** argv)
{

	if(argc != 2)
	{
		printf("Error!\n");
		exit(EXIT_FAILURE);
	}
	int fd = Open			(argv[1], O_RDONLY);
	char* buff = CreateBuff(MAX_SIZE);

	ReadFromFifo		(fd, buff);

	printf("read complited!\n");
	
	Print			(buff);
	free(buff);
	
	return 0;
}


