//
// Created by vadim on 07.11.18.
//

#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/stat.h>
#include <sys/shm.h>
#include <sys/sem.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <fcntl.h>
#include <errno.h>

enum COMPONENTS
{
    BUF_SIZE = 4096
};

struct msg
{
    char buf[BUF_SIZE];
    int amount; //byte number
    int snd_cond; //server is write
};

#define SHM_SIZE sizeof(struct msg)





/*-----about semaphores-----
0: server (if exist 1)
1: client (if exist 1)
2: indicates if shared memory is empty
3: indicates if shared memory is full
*/

void Server(struct msg* shm_adr, char** argv, struct sembuf* sem_ops, const int semid, const int shmid);
void Client(struct msg* shm_adr, char** argv, struct sembuf* sem_ops, const int semid, const int shmid);

int main( int argc, char **argv)
{

    struct sembuf sem_ops[3];
    //create a key
    key_t key;
    key = ftok( argv[0], 0 );
    if( key == -1 )
    {
        printf("can't create a key\n");
        perror("ftok");
        exit(-1);
    }

    // create shared memory
    int shm_id;
    shm_id = shmget( key, SHM_SIZE, IPC_CREAT | IPC_EXCL | 0777 );

    if( shm_id == -1 )
    {
        if( errno != EEXIST )
        {
            printf("can't create shared memory\n");
            exit(EXIT_FAILURE);
        }
        else
        {
            shm_id = shmget( key, SHM_SIZE, 0 );
            if( shm_id == -1 )
            {
                printf("%s; can't get shared memory\n");
                exit(EXIT_FAILURE);
            }
        }
    }

    //attach shared memory
    //--------------------------------------------------------------------
    struct msg * shm_adr;
    shm_adr = (struct msg *) shmat( shm_id, NULL, 0 );
    if( shm_adr == (void *) -1 )
    {
        printf( "%s; can't attach  shared memory\n", argv[0] );
        exit(EXIT_FAILURE);
    }
    //--------------------------------------------------------------------

    //   add semaphores

    //--------------------------------------------------------------------

    int sem_id;
    sem_id = semget( key, 4, IPC_CREAT | IPC_EXCL | 0777 );

    if( sem_id == -1 )
    {
        if( errno != EEXIST )
        {
            printf( "can't create semaphores\n");
            exit(EXIT_FAILURE);
        }
        else
        {
            sem_id = semget( key, 4, 0 );
            if( sem_id == -1 )
            {
                printf( "can't open semaphores\n");
                exit(EXIT_FAILURE);
            }
        }
    }


    if( argc == 2 )
    {
        Server(shm_adr, argv, sem_ops, sem_id, shm_id);
    }
    //------------------------------------------------------------
    if( argc == 1 )
    {
        Client(shm_adr, argv, sem_ops, sem_id, shm_id);
    }
}

void Client(struct msg* shm_adr, char** argv, struct sembuf* sem_ops, const int semid, const int shmid)
{
    int write_amount, ret_val;

    //if client is already exist
    //rcv 0
    sem_ops[0].sem_num = 1;
    sem_ops[0].sem_op = 0;
    sem_ops[0].sem_flg = IPC_NOWAIT;
    //rcv +1
    sem_ops[1].sem_num = 1;
    sem_ops[1].sem_op = 1;
    sem_ops[1].sem_flg = SEM_UNDO;
    //operations
    ret_val = semop( semid, &sem_ops[0], 2);
    if( ( ret_val != 0) && ( errno == EAGAIN ) )
    {
        printf("%s: client is already exist\n", argv[0] );
        exit(-1);
    }

    //wait for sender
    //snd -1
    sem_ops[0].sem_num = 0;
    sem_ops[0].sem_op = -1;
    sem_ops[0].sem_flg = 0;
    //snd +1
    sem_ops[1].sem_num = 0;
    sem_ops[1].sem_op = 1;
    sem_ops[1].sem_flg = 0;
    //operations
    ret_val = semop( semid, &sem_ops[0], 2);

    //just for SEM_UNDO
    //full +1
    sem_ops[0].sem_num = 3;
    sem_ops[0].sem_op = 1;
    sem_ops[0].sem_flg = SEM_UNDO;
    //full -1
    sem_ops[1].sem_num = 3;
    sem_ops[1].sem_op = -1;
    sem_ops[1].sem_flg = 0;
    //operations
    ret_val = semop( semid, &sem_ops[0], 2);

    //empty +1
    sem_ops[0].sem_num = 2;
    sem_ops[0].sem_op = 1;
    sem_ops[0].sem_flg = SEM_UNDO;
    //empty -1
    sem_ops[1].sem_num = 2;
    sem_ops[1].sem_op = -1;
    sem_ops[1].sem_flg = 0;
    //operations
    ret_val = semop( semid, &sem_ops[0], 2);




    do
    {
        //empty +1
        sem_ops[0].sem_num = 2;
        sem_ops[0].sem_op = 1;
        sem_ops[0].sem_flg = 0;
        //operations
        ret_val = semop( semid, &sem_ops[0], 1);

        //start cr secion
        //snd -1
        sem_ops[0].sem_num = 0;
        sem_ops[0].sem_op = -1;
        sem_ops[0].sem_flg = IPC_NOWAIT;
        //snd +1
        sem_ops[1].sem_num = 0;
        sem_ops[1].sem_op = 1;
        sem_ops[1].sem_flg = 0;
        //full -1
        sem_ops[2].sem_num = 3;
        sem_ops[2].sem_op = -1;
        sem_ops[2].sem_flg = 0;
        //operations
        ret_val = semop( semid, &sem_ops[0], 3);
        if( ( ret_val != 0) && ( errno == EAGAIN ) )
        {
            printf("Server has fallen\n");
            shmctl( shmid, IPC_RMID, NULL );
            semctl( semid, 0, IPC_RMID, NULL );
            exit(-1);
        }

        write_amount = write( 1, shm_adr -> buf, shm_adr -> amount);
        //if input finished
        if(shm_adr -> amount == 0) break;

    } while (1);

    //wait for snd
    while(shm_adr -> snd_cond);

    //ending
    shmdt( shm_adr );
    shmctl( shmid, IPC_RMID, NULL );
    semctl( semid, 0, IPC_RMID, NULL );
    exit(0);
}

void Server(struct msg* shm_adr, char** argv, struct sembuf* sem_ops, const int semid, const int shmid)
{
    shm_adr -> snd_cond = 1;

    //open file
    int fd;
    fd = open( argv[1], O_RDONLY );
    if( fd == -1 )
    {
        printf( "%s: can't open %s\n", argv[0], argv[1] );
        exit(-1);
    }

    //copy from file for shared memory
    int read_amount, ret_val;

    //if server is already exist
    //snd 0
    sem_ops[0].sem_num = 0;
    sem_ops[0].sem_op = 0;
    sem_ops[0].sem_flg = IPC_NOWAIT;
    //snd +1
    sem_ops[1].sem_num = 0;
    sem_ops[1].sem_op = 1;
    sem_ops[1].sem_flg = SEM_UNDO;
    //operations
    ret_val = semop( semid, &sem_ops[0], 2 );
    if( ( ret_val != 0 ) && ( errno == EAGAIN ) )
    {
        printf("%s: server is already exist\n", argv[0] );
        exit(-1);
    }

    //wait for client
    //rcv -1
    sem_ops[0].sem_num = 1;
    sem_ops[0].sem_op = -1;
    sem_ops[0].sem_flg = 0;
    //rcv +1
    sem_ops[1].sem_num = 1;
    sem_ops[1].sem_op = 1;
    sem_ops[1].sem_flg = 0;
    //operations
    ret_val = semop( semid, &sem_ops[0], 2 );

    //just for SEM_UNDO
    //full +1
    sem_ops[0].sem_num = 3;
    sem_ops[0].sem_op = 1;
    sem_ops[0].sem_flg = SEM_UNDO;
    //full -1
    sem_ops[1].sem_num = 3;
    sem_ops[1].sem_op = -1;
    sem_ops[1].sem_flg = 0;
    //operations
    ret_val = semop( semid, &sem_ops[0], 2);

    //empty +1
    sem_ops[0].sem_num = 2;
    sem_ops[0].sem_op = 1;
    sem_ops[0].sem_flg = SEM_UNDO;
    //empty -1
    sem_ops[1].sem_num = 2;
    sem_ops[1].sem_op = -1;
    sem_ops[1].sem_flg = 0;
    //operations
    ret_val = semop( semid, &sem_ops[0], 2);

    do
    {
        //rcv -1
        sem_ops[0].sem_num = 1;
        sem_ops[0].sem_op = -1;
        sem_ops[0].sem_flg = IPC_NOWAIT;
        //rcv +1
        sem_ops[1].sem_num = 1;
        sem_ops[1].sem_op = 1;
        sem_ops[1].sem_flg = 0;
        //empty -1
        sem_ops[2].sem_num = 2;
        sem_ops[2].sem_op = -1;
        sem_ops[2].sem_flg = 0;
        //operations
        ret_val = semop( semid, &sem_ops[0], 3);
        if( ( ret_val != 0) && ( errno == EAGAIN ) )
        {
            printf("\n%s: client crashed\n", argv[0] );
            shmctl( shmid, IPC_RMID, NULL );            // delete semaphores
            semctl( semid, 0, IPC_RMID, NULL );
            exit(-1);
        }

        read_amount = read( fd, shm_adr -> buf, BUF_SIZE );
        shm_adr -> amount = read_amount;

        //full +1
        sem_ops[0].sem_num = 3;
        sem_ops[0].sem_op = 1;
        sem_ops[0].sem_flg = 0;
        //operations
        ret_val = semop( semid, &sem_ops[0], 1);

    } while ( read_amount > 0 );
    shm_adr -> amount = 0;

    //ending
    shm_adr -> snd_cond = 0;
    close( fd );
    shmdt( shm_adr );
    exit(0);

};
