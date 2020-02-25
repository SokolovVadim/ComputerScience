//
// Created by vadim on 31.10.18.
//

#include "ShMem.h"


long int ReadArg(char * str)
{
    char* endptr;
    errno = 0;

    long int number = strtol(str, &endptr, 10);


    if ((errno == ERANGE && (number == LONG_MAX || number == LONG_MIN)) || (errno != 0 && number == 0))
    {
        perror("strtol");
        exit(EXIT_FAILURE);
    }

    if (endptr == str)
    {
        fprintf(stderr, "Error!\n");
        exit(EXIT_FAILURE);
    }
    if (*endptr != '\0')
    {
        fprintf(stderr, "Error!\n");
        exit(EXIT_FAILURE);
    }

    return number;
}

const key_t GenerateKey(const char* pathname)
{
    key_t key = ftok(pathname, 0);
    if(key < 0)
    {
        printf("Can't generate key!\n");
        exit(-1);
    }
    printf("Key = %d\n", key);
    fflush(stdout);
    return key;
}

int Open(const char * fileName)
{
    int fd = 0;
    if((fd = open(fileName, O_WRONLY, 0666)) < 0)
    {
        printf("Can not open!\n");
        perror("open");
        exit(EXIT_FAILURE);
    }
    printf("fd = %d\n", fd);
    return fd;
}

void Write(const int fd, const char* data)
{
    size_t  strSize = strlen(data);
    ssize_t size    = write (fd, data, strlen(data));
    if(size < strSize)
    {
        printf("Can not write all data!\n");
        exit(EXIT_FAILURE);
    }
}

const int SemGet(const key_t key)
{
    int semid = 0;
    printf("Key in Semget = %d\n", key);
    if((semid = semget(key, 1, O_RDWR | IPC_CREAT)) < 0)  // array of one semaphore
    {
        printf("Can't get semid!\n");
        perror("semget");
        exit  (EXIT_FAILURE);
    }
    printf("SemID = %d\n", semid);
    return semid;
}

void SemRm(const int semid)   // rm sem array via semid
{
    if((semctl(semid, IPC_RMID, 0, 0)) < 0)  // delete semaphore array
    {
        printf("Can not remove semaphore!\n");
        perror("semctl");
        exit  (EXIT_FAILURE);
    }
}

const int ShmGet(const key_t key)
{
    int shmid = 0;
    if ((shmid = shmget (SHM_ID, sizeof (Msg_t), 0666 | IPC_CREAT)) < 0)
    {
        errPrint("Can not create shared memory segment\n", "shmget");
        /*printf("Can not create shared memory segment\n");
        perror("shmget");
        exit(EXIT_FAILURE);*/
    }
    return shmid;
}

void SemOp(const int semid, struct sembuf* semBuf)
{
    if(semop(semid, semBuf, 1) < 0)
    {
        printf("Can't wait for conditions!\n");
        perror("semop");
        exit(EXIT_FAILURE);
    }
    printf("After SemOp\n");
}

void errPrint(const char * msg, const char* funcName)
{
    printf("%s\n", msg);
    perror(funcName);
    exit(EXIT_FAILURE);
}

Msg_t * ShmAt(const int shmid)
{
    Msg_t* msgPointer = NULL;
    if ((msgPointer= (Msg_t *) shmat (shmid, 0, 0)) == NULL)
    {
        errPrint("shared memory attach error", "shmat");
    }
    return msgPointer;
}

void SendCycle(Msg_t * msgPtr, const int semid, const char* data)
{
    while (semctl (semid, 0, GETVAL, 0) || msgPtr->type != MSG_TYPE_EMPTY);
        /*
         *   если сообщение не обработано или сегмент блокирован - ждать
         *                                                             */
    semctl (semid, 0, SETVAL, 1);     /* блокировать */
    if (strlen (data) != 1)
    {
        /* записать сообщение "печать строки" */
        msgPtr->type = MSG_TYPE_STR;
        strncpy (msgPtr->data, data, SIZE_STR);
    }
    else
    {
        /* записать сообщение "завершение работы" */
        msgPtr->type = MSG_TYPE_FINISH;
    };
    semctl (semid, 0, SETVAL, 0);     /* отменить блокировку */
}

