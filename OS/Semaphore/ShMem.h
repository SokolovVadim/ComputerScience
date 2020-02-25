//
// Created by vadim on 31.10.18.
//

#ifndef SHAREDMEM_SHMEM_H
#define SHAREDMEM_SHMEM_H

#include <stdio.h>
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include <sys/stat.h>
#include <errno.h>
#include <stdlib.h>
#include <fcntl.h>
#include <limits.h>
#include <string.h>
#include <unistd.h>
#include <sys/sem.h>

enum COMPONENTS
{
    SIZE_STR   = 3,
    SEM_ID = 101010,
    SHM_ID = 111111
};

enum MSGTYPES
{
    MSG_TYPE_EMPTY  = 0,
    MSG_TYPE_STR    = 1,
    MSG_TYPE_FINISH = 2
};

typedef struct
{
    int   type;
    char* data;
}Msg_t;

//void          Open            (int * fd, const char * fileName);
int             Open            (const char* fileName);
const key_t     GenerateKey     (const char* pathname);
const int       SemGet          (key_t key);
void            SemRm           (int semid);
const int       ShmGet          (key_t key);
void            SemOp           (int semid,  struct sembuf* semBuf);
void            errPrint        (const char * msg, const char* funcName);
Msg_t *         ShmAt           (int shmid);
void            SendCycle       (Msg_t * msgPtr, int semid, const char* data);

#define ALL_RIGHTS 0666u

#endif //SHAREDMEM_SHMEM_H
