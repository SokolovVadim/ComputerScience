#include "fifo.h"



int main(int argc, char ** argv)
{

	// read args
	if(argc != 3)
	{
		printf("Error!\n");
		exit(EXIT_FAILURE);
	}
	
	
	//size_t size = 0;

	char* fileName 	= argv[1];//CreateName		(argv[1]);
	char* fifoName  = argv[2];
	char* buff 	= CreateBuff		(STR_LEN);

	MakeFifo				(fifoName);

	int fd = Open	(fileName, O_RDONLY);
	ReadFromFile	(fd, buff);
	
	if((close(fd)) < 0)
	{
		printf("Close has failed!\n");
	}

	int fdFifo = Open(fifoName, O_WRONLY); //WriteToFifo	();
	WriteToFifo(fdFifo, buff);
	

	// Destr
	//free(fileName);
	free(buff);
	
	return 0;
}


