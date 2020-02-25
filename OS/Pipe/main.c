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

