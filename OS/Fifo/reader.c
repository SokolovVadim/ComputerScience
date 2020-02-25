
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <string.h>
#include <unistd.h>
#include <errno.h>


#define DEBUG_DUMP(string)				\
do                          			\
{ 										\
	printf("reader: %s\n", #string);	\
}										\
while(0)


// reads data from fifo

int reader();
int write_pid(const int pid, const int fifo_fd);
char* read_pid(const int fifo_fd);


int main(int argc, char** argv)
{

	if(argc < 1)
	{
		printf("Too few arguments!\n");
		exit(EXIT_FAILURE);
	}

	int reader_status = reader();

	return reader_status;
}

// SIZE TO WRITE == PAGE SIZE
enum COMPONENTS
{
	BUFFER_SIZE = (0xFFF + 1),
	PID_SIZE    = 32,  			// 2^64 less then 21 symbols
	TIMEOUT     = 1000000000	// one billion
};

/*
struct flock
{
	short l_type;		// F_RFLCK,  F_WRLCK,  F_UNLCK
	short l_whence;     // SEEK_SET, SEEK_CUR, SEEK_END
	off_t l_start;	    // offset (byte)
	off_t l_len;		// number of bytes, 0 means before the EOF
	pid_t l_pid;		// PID returned by F_GETLK
}

*/


// block all

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


// open fifo -> read line from fifo -> convert pid into int -> return pid
// Should It open fifo?

char* read_pid(const int fifo_fd)
{
	char* line = (char*)calloc(BUFFER_SIZE + 1, sizeof(char));
	int read_size = read(fifo_fd, line, BUFFER_SIZE);
	if(read_size < 0)
	{
		perror("read");
		exit(EXIT_FAILURE);
	}
	line[read_size] = '\0';				//  ATTENTION!
	/*pid_t pid = 0;
	int scanf_size = sscanf(line, "%d", &pid);
	if(scanf_size <= 0)
	{
		perror("sscanf");
		exit(EXIT_FAILURE);
	}
	printf("PID = %d\n", pid);*/

	char* cat_ptr = strncat(line,".fifo", 6);
	if(cat_ptr == 0)
	{
		perror("strncat");
		exit(EXIT_FAILURE);
	}
	return line;
}

int my_wait()
{
	int res = 0;
	int i = 0;
	while(i < TIMEOUT)
	{
		// check is pipe empty, change res variable
		i++;
	}

	return res;
}


const char* create_name(const char* pid)
{
	//char* pid_str = NULL;
	char fifo_suffix[] = ".fifo";
	char *pid_str = (char*)calloc(sizeof(fifo_suffix) + PID_SIZE, sizeof(char));
	strncpy(pid_str, pid, PID_SIZE);
	strncat(pid_str, fifo_suffix, 5);
	return pid_str;
}


// open repo fifo 		+
// read pid       		+
// open pid_fifo  		+
// read from pid fifo:  +
// + loop
// + ioctl
// + wait
// close pid fifo
// unlink pid fifo

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


int open_pid_fifo(const char* fifo_name)
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


	DEBUG_DUMP(before openning pid_fifo);

	int fd = open(fifo_name, O_RDONLY);
	if(fd < 0)
	{
		perror("mkfifo");
		exit(EXIT_FAILURE);
	}
	return fd;
}


int reader()
{
	//int retVal = unlink(fifo);
	char fifo[] = "fifo";
	int    fd = open_repo_fifo(fifo);
	write_pid(getpid(), fd);
	
	char* pid_name = read_pid(fd);
	pid_t pid_fifo_fd = open_pid_fifo(pid_name);
	

	// open output.txt


	DEBUG_DUMP(after open fifo and before the buffer allocation);

	int out_fd = open("output.txt", 0666);
	if(out_fd < 0)
	{
		perror("open");
		exit(EXIT_FAILURE);
	}

	// in cycle:
	// read data from the pipe into buffer
	// and write the data from buffer into output.txt file

	// allocate a buffer:

	char* buffer = (char*)calloc(BUFFER_SIZE, sizeof(char));
	int read_size = 0;
	int i = 0;
	do
	{

		// ------- debug mode --------------
		printf("i = %d\n", i);
		i++;

		// ---------------------------------
		read_size = read(pid_fifo_fd, buffer, BUFFER_SIZE);
		if(read_size < 0)
		{
			perror("read");
			exit(EXIT_FAILURE);
		}
		
		/*if(i == 10)
		{
			my_lock(out_fd);
		}*/

		int written_size = write(out_fd, buffer, read_size);
		if(written_size < 0)
		{
			perror("write");
			exit(EXIT_FAILURE);
		}


	} while(read_size);

	
	// close file descriptors

	int retVal = close(fd);
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

	retVal = close(out_fd);
	if(retVal < 0)
	{
		perror("close");
		exit(EXIT_FAILURE);
	}


	// unlink file.fifo
	// extern int errno = 0;

	retVal = unlink(fifo);
	if((retVal < 0) && (errno != ENOENT))
	{
		perror("unlink");
		exit(EXIT_FAILURE);
	}

	free(pid_name);
	return 0;
}


