#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <string.h>
#include <unistd.h>
#include <errno.h>


// -------------------------
// writes data into fifo
// shared-exclusive lock
// -------------------------

// ulimit -a | grep pipe


#define DEBUG_DUMP(string)				\
do                          			\
{ 										\
	printf("reader: %s\n", #string);	\
}										\
while(0)


// open   repo_fifo +
// write  pid       +
// open   pid_fifo
// write  data
// close  pid_fifo
// unlink pid_fifo

int writer(char** argv);
int write_pid(const int pid, const int fifo_fd);


int main(int argc, char** argv)
{

	if(argc < 2)
	{
		printf("Too few arguments!\n");
		exit(EXIT_FAILURE);
	}

	writer(argv);

	return 0;
}

// SIZE TO WRITE == PAGE SIZE
#define BUFFER_SIZE (0xFFF + 1)


int my_lock(const int fd)
{
	struct flock lock = {};

	lock.l_type = F_WRLCK;
	lock.l_whence = SEEK_SET;
	lock.l_start = 0;
	lock.l_len = 0;

	int fcntl_ret = fcntl(fd, F_SETLKW, &lock);
	if(fcntl_ret < 0)
	{
		perror("fcntl");
		exit(EXIT_FAILURE);
	}
	printf("in my_lock\n");

	return 0;
}

// unblock all

int my_unlock(const int fd)
{
	struct flock lock = {};

	lock.l_type = F_UNLCK;
	lock.l_whence = SEEK_SET;
	lock.l_start = 0;
	lock.l_len = 0;

	int fcntl_ret = fcntl(fd, F_SETLK, &lock);
	if(fcntl_ret < 0)
	{
		perror("fcntl");
		exit(EXIT_FAILURE);
	}


	return 0;

}

int open_repo_fifo(const char* fifo_name)
{
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


	DEBUG_DUMP(after mkfifo and before openning repo_fifo);

	int fd = open(fifo_name, O_RDONLY);
	if(fd < 0)
	{
		perror("mkfifo");
		exit(EXIT_FAILURE);
	}
	return fd;
}

char* create_pid_fifo_name(const pid_t pid)
{
	char* pid_fifo_name = (char*)calloc(BUFFER_SIZE, sizeof(char));  // ATTENTION! MAYBE IT'LL BE BETTER TO USE A STACK ALLOCATION
	if(pid_fifo_name == NULL)
	{
		perror("calloc");
		exit(EXIT_FAILURE);
	}

	// int read_size = 0;
	
	int ret_val = snprintf(pid_fifo_name, BUFFER_SIZE, "%d", pid);
	// printf("retVal = %d\nsizeof(pid) = %ld\n", ret_val, sizeof(pid));
	if(ret_val < 0)
	{
		perror("printf");
		return NULL;
	}
	printf("pid_fifo_name: %s\n", pid_fifo_name);
	return pid_fifo_name;
}

int open_pid_fifo(const char* pid_fifo_name)
{
	int retVal = mkfifo(pid_fifo_name, 0666);
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


	DEBUG_DUMP(before openning pid_fifo);

	int fd = open(pid_fifo_name, O_RDONLY);
	if(fd < 0)
	{
		perror("mkfifo");
		exit(EXIT_FAILURE);
	}
	return fd;
}

int write_pid(const int pid, const int fifo_fd)
{
	char* buffer = (char*)calloc(BUFFER_SIZE, sizeof(char));  // ATTENTION! MAYBE IT'LL BE BETTER TO USE A STACK ALLOCATION
	if(buffer == NULL)
	{
		perror("calloc");
		exit(EXIT_FAILURE);
	}

	// int read_size = 0;
	
	int ret_val = snprintf(buffer, BUFFER_SIZE, "%d", pid);
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


int writer(char** argv)
{
	char repo_fifo[] = "fifo";
	//int retVal = unlink(fifo);

	int retVal = mkfifo(repo_fifo, 0666);
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

	int repo_fifo_fd = open(repo_fifo, O_WRONLY, 0666); // = 3
	if(repo_fifo_fd < 0)
	{
		perror("open");
		exit(EXIT_FAILURE);
	}
	pid_t pid       = getpid();
	char* pid_fifo_name = create_pid_fifo_name(pid);
	int pid_fifo_fd = open_pid_fifo(pid_fifo_name);

	// my_unlock(fifo_fd);
	
	// turn off O_NONBLOCK mode
	// fcntl(fifo_fd, F_SETFL, fcntl(fifo_fd, F_GETFL) & ~O_NONBLOCK);

	// turn O_NONBLOCK mode
	// fcntl(fifo_fd, F_SETFL, fcntl(fifo_fd, F_GETFL) | O_NONBLOCK);

	// open data.txt

	int data_fd = open(argv[1], 0666);	// = 4
	if(data_fd < 0)
	{
		perror("open");
		exit(EXIT_FAILURE);
	}

	// in cycle:
	// read data from the repository into buffer
	// and write the data from buffer into pipe

	// allocate a buffer:

	char* buffer = (char*)calloc(BUFFER_SIZE, sizeof(char));
	int read_size = 0;
	int i = 0;
	do
	{
		// printf("i = %d", i);
		i++;
		read_size = read(data_fd, buffer, BUFFER_SIZE);
		if(read_size < 0)
		{
			perror("read");
			exit(EXIT_FAILURE);
		}

		// printf("\tread size = %d", read_size);
		int written_size = write(pid_fifo_fd, buffer, read_size);

		// printf("\twritten size = %d\n", written_size);

		if(written_size < 0)
		{
			perror("write");
			exit(EXIT_FAILURE);
		}


	} while(read_size);

	
	// close file descriptors

	retVal = close(repo_fifo_fd);
	if(retVal < 0)
	{
		perror("close");
		exit(EXIT_FAILURE);
	}

	retVal = close(pid_fifo_fd);
	if(retVal < 0)
	{
		perror("close");
		exit(EXIT_FAILURE);
	}

	retVal = close(data_fd);
	if(retVal < 0)
	{
		perror("close");
		exit(EXIT_FAILURE);
	}


	// unlink file.fifo

	retVal = unlink(repo_fifo);
	if(retVal < 0)
	{
		perror("unlink");
		exit(EXIT_FAILURE);
	}

	retVal = unlink(pid_fifo_name);
	if(retVal < 0)
	{
		perror("unlink");
		exit(EXIT_FAILURE);
	}


	return 0;
}


