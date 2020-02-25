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

void PrintFile		(const char * fileName);
char * Read		(int fd);
int Open		(const char * fileName);
void CreateProc		(const char * fileName);
int* CreatePipe		();
void WriteToPipe(char * buffToWrite, int fd);
void PrintData();
char* ReadFromPipe( int fd);

enum COMPONENTS
{
	MAX_SIZE = 1000
};

