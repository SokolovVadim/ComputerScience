#include "ShMem.h"
//SHmem Implementation

int main(const int argc, char** argv) {

    printf("argv[1] = %s\n", argv[1]);

    int fd = 0;
    //Open(&fd, argv[1]);
   /* char *pathname = (char*)calloc(strlen(argv[1]), sizeof(char));
    strcpy(pathname, argv[1]);

    printf("strlen(argv[1]) = %lu\n", strlen(argv[1]));
    printf("pathname = %s\n", pathname);
*/
    char pathname[] = "main.c";
    key_t key = 0;
    struct sembuf mybuf;
    if((key = ftok(pathname, 0)) < 0)
    {
        printf("Can't generate key!\n");
        exit(-1);
    }
    printf("Key = %d\n", key);
    int semid = 0;
    if((semid = semget(key, 1, O_RDWR | IPC_CREAT)) < 0)
    {
        printf("Can't get semid!\n");
        perror("semget");
        exit(-1);
    }


    if((semctl(semid, IPC_RMID, 0, 0)) < 0)
    {
        printf("Can not remove semaphore!\n");
        perror("semctl");
        exit(EXIT_FAILURE);
    }


    return 0;
}