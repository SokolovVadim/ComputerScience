//
// Created by vadim on 19.11.18.
//
#include "ShMem.h"
//SHmem Implementation


int main(int argc, char** argv)
{

    int  semid = 0;
    //char pathname[] = "main.c";
    //key_t key = GenerateKey(argv[1]);

    //printf("Key = %d\n", key);

    if ((semid = semget(SEM_ID/*key*/, 1, O_RDWR | IPC_CREAT)) < 0) {
        printf("Can't get semid!\n");
        exit(-1);
    }
    printf("semid = %d\n", semid);

    struct sembuf mybuf = {};

    mybuf.sem_op  = 2;
    mybuf.sem_flg = 0;
    mybuf.sem_num = 0;

    if (semop(semid, &mybuf, 1) < 0) {
        printf("Can't wait for conditions!\n");
        exit(-1);
    }
    printf("Condition is set!\n");






    return 0;
}



