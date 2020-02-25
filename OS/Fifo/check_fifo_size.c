// check fifo size

#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <string.h>
#include <unistd.h>
#include <errno.h>

#define BUFFER_SIZE (0xFF + 1)

#define DEBUG_DUMP(string)				\
do                          			\
{ 										\
	printf("reader: %s\n", #string);	\
}										\
while(0)

int write_pid(const int pid, const int fifo_fd)
{
	char* buffer = (char*)calloc(BUFFER_SIZE, sizeof(char));  // ATTENTION! MAYBE IT'LL BE BETTER TO USE A STACK ALLOCATION
	if(buffer == NULL)
	{
		perror("calloc");
		exit(EXIT_FAILURE);
	}

	// int read_size = 0;
	
	int ret_val = snprintf(buffer, BUFFER_SIZE, "%d%c", pid, ' ');
	// printf("retVal = %d\nsizeof(pid) = %ld\n", ret_val, sizeof(pid));
	if(ret_val < 0)
	{
		perror("printf");
		return EXIT_FAILURE;
	}
	printf("buffer: %s\n", buffer);


	// write buffer into fifo
	ret_val = write(fifo_fd, buffer, strlen(buffer));
	if(ret_val != strlen(buffer)) // double counting of str length
	{
		perror("write");
		exit(EXIT_FAILURE);
	}


	free(buffer);
	buffer = NULL;
	return 0;
}


// open fifo -> read line from fifo -> convert pid into int -> return pid
// Should It open fifo?

int read_pid(/*const char* fifo_name*/ const int fifo_fd)
{
	/*int fd = open(fifo_name, O_RDONLY | O_CREAT);
	if(fd < 0)
	{
		perror("open");
		exit(EXIT_FAILURE);
	}*/

	char line[BUFFER_SIZE + 1] = {};
	int read_size = read(fifo_fd, line, BUFFER_SIZE);
	if(read_size < 0)
	{
		perror("read");
		exit(EXIT_FAILURE);
	}
	line[read_size] = '\0';				//  ATTENTION!
	pid_t pid = 0;
	int scanf_size = sscanf(line, "%d", &pid);
	if(scanf_size <= 0)
	{
		perror("sscanf");
		exit(EXIT_FAILURE);
	}
	printf("PID = %d\n", pid);

	char* cat_ptr = strncat(line,".fifo", 6);
	if(cat_ptr == 0)
	{
		perror("strncat");
		exit(EXIT_FAILURE);
	}

	printf("line = %s\n", line);

	return 0;
}


int main()
{
	char fifo_name[] = "fifo";
	int retVal = mkfifo(fifo_name, 0666);
	if(retVal < 0)
	{
		if(errno == EEXIST)
		{
			DEBUG_DUMP(mknod: fifo already exists);
		}
		else
		{
			perror("mkfifo");
			exit(EXIT_FAILURE);
		}
	}
	
	int   fifo_fd = open(fifo_name, O_RDWR | O_CREAT);
	if(fifo_fd < 0)
	{
		perror("open");
		exit(EXIT_FAILURE);
	}

	int i = 0;
	for(i = 0; i < 10; i++)
	{
		write_pid(i, fifo_fd);
		read_pid(fifo_fd);
	}

	retVal = close(fifo_fd);
	if(retVal < 0)
	{
		perror("close");
		exit(EXIT_FAILURE);
	}

	unlink(fifo_name);

	return 0;
}