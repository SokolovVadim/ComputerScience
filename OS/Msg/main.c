#include "Msg.h"


int main(int argc, char ** argv)
{
// ------------------read args--------------------------
    //printf("argc = %d\n", argc);
    if(argc != 2)
    {
        printf("Not valid number of args\n");
        exit(EXIT_FAILURE);
    }
    pid_t parentID = getpid();
    printf("parentId = %d\n", parentID);
    long procNumber = ReadArg(argv[1]);

    //printf("Proc Number = %ld\n", procNumber);


// --------------------CONSTR_QUEUE--------------------------

    key_t key = GenerateKey("Msg.h");

    int msqid = CreateQueue(key);
   

// ------------------END_CONSTR_QUEUE--------------------------

// --------------------POOL_PROCS--------------------------
    CreatePool(procNumber, msqid, parentID);



// --------------------END_POOL_PROCS--------------------------




// ------------------RECEIVER--------------------------

    if((getpid()) == parentID)
    {
	msgBuf mBuf = {};

	int msqid = CreateQueue(key);

	ReceiveCycle(&mBuf, msqid);
    }

// ------------------END_RECEIVER--------------------------



// ------------------create queue--------------------------

   /* key_t key = GenerateKey(argv[0]);

    msgBuf mBuf = {};

    int msgQID = CreateQueue(key);*/

// ------------------multiproc work--------------------------

    //CreatePool(procNumber);




    /*WriteToMsg();
    ReadFromMsg();
    CloseMsg();
    KillAll();
    */

    printf("Hello, world!\n");

    return 0;
}

