//
// Created by vadim on 19.11.18.
//
#include "ShMem.h"

int main(const int argc, char** argv) {

    printf("argv[1] = %s\n", argv[1]);



    int fd    = Open         (argv[1]);

    key_t key = GenerateKey  (argv[1]);
    int semid = SemGet       (key);
    int shmid = ShmGet       (key);

    Msg_t * msgPtr = ShmAt(shmid);

    //semctl (semid, 0, SETVAL, 0); /* determine the semaphore */
    //msgPtr->type = MSG_TYPE_EMPTY;  // declare sem type (not read, not


    SendCycle(msgPtr, semid, argv[1]);


    /*struct sembuf semBuf;
    semBuf.sem_op = -4;
    semBuf.sem_flg = 0;
    semBuf.sem_num = 0;

    SemOp(semid, &semBuf);*/
    printf("Condition is present!\n");

    //SemRm(semid);
    shmdt (msgPtr);                /* отсоединить сегмент разделяемой памяти */
    //exit (0);

    return 0;
}

