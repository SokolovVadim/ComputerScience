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
#include <sys/stat.h>


char*		 CreateName		(const char* fileName);
void 		 MakeFifo		(const char* name);
int	 	 CreateProc		(const char* name);
void 		 LookupParentProc	(const int forkRes, const char* name);
void 		 LookupChildProc	(const int forkRes, const char* name, char* str);
char* 		 CreateBuff		(const size_t size);
void 		 ReadFromFile		(const int fd, char* buff);
void 		 ReadFromFifo		(const int fd, char* buff);
int 	 	 Open			(const char * fileName, const int flag);
int 		 WriteToFifo		(const int fd, const char* buff);
void 		 Print			(const char* buff);

enum COMPONENTS
{
	MAX_SIZE = 1000,
	STR_LEN = 10
};

