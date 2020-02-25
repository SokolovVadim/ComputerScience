//
// Created by vadim on 17.10.18.
//

#ifndef MESSAGE_MSG_H
#define MESSAGE_MSG_H



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
#define __USE_GNU
#include <sys/msg.h>
#include <sys/ipc.h>
#include <fcntl.h>
#include <sys/stat.h>


typedef struct
{
    long    m_type;
    struct 
    {
	pid_t m_pid;
    } m_info;        
} msgBuf;

void 		 CreatePool	    (long numberOfP, const int msqid, const pid_t parentID);
void 		 SendMsg            (msgBuf * mBuf, const int msqid);
void             Send               (msgBuf * mBuf, int msqid);
void             SendLast           (msgBuf * mBuf, int msqid);

int 		 CreateQueue  	    (key_t key);
int 		 RmQueue	    (int qid);
int	         CreateProc	    ();
int              ReceiveCycle       (msgBuf * mBuf, int msqid);

long int 	 ReadArg		    (char* str);
key_t            GenerateKey        (const char* pathName);


//void 		 LookupParentProc	(int forkRes, const char* name);
//void 		 LookupChildProc	(int forkRes, const char* name, char* str);
//void 		 MakeFifo		    (const char* name);
//void 		 ReadFromFifo	    (int fd, char* buff);
//void 		 ReadFromFile	    (int fd, char* buff);
//void 		 Print			    (const char* buff);


//int 		 WriteToFifo	    (int fd, const char* buff);
//char* 	 CreateBuff	    	(size_t size);
//char*		 CreateName 		(const char* fileName);
//const int 	 Open			    (const char * fileName, int flag);

enum COMPONENTS
{
    MAX_SIZE = 1000,
    STR_LEN  = 10,
    QSIZE    = 5
};


#define LAST_MSG 255

#endif //MESSAGE_MSG_H



