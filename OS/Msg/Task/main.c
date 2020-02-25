#include "Msg.h"


int main(int argc, char ** argv) {
    // ------------------read args-----------------------------
    //printf("argc = %d\n", argc);

    if (argc != 2) {
        printf("Not valid number of args\n");
        exit(EXIT_FAILURE);
    }

    long procNumber = ReadArg(argv[1]);
    if(procNumber < 0)
    {
        printf("ERROR! Process number must be positive!\n");
        exit(EXIT_FAILURE);
    }
    //key_t key = GenerateKey("Msg.h");
    //msgBuf mBuf = {};

    //mBuf.m_text = (char*)calloc(100, sizeof(char));

    int qid = CreateQueue(IPC_PRIVATE);

    //printf("Before Send\n");
    //Send(&mBuf, qid);
    //printf("After Send\n");

    pid_t pid = -1;



    int i = ConstructPool(procNumber, &pid);

    if(pid == 0) //child
    {
        //printf("I am child! My pid = %d counter = %d\n", getpid(), i);

        msgBuf mBuf = {};
        mBuf.m_type = i;
        Receive(&mBuf, qid, i);

        printf("*************\t cur_proc_number = %d \t*************\n", i);

        mBuf.m_type = i + 1;
        Send(&mBuf, qid); //msgsnd(qid, (struct msgbuf*)&mBuf, 0, 0);


    } else { // parent
        if(i == procNumber + 1){ // all children are waiting
            //printf("I am parent!\n");
            msgBuf mBuf = {};
            mBuf.m_type = 1;

            //printf("MSQID = %d\n", qid);

            Send(&mBuf, qid);

            KillChildren(procNumber);


            RmQueue(qid);
        }
    }


    return 0;
}


void KillChildren(const long procNumber)
{
    for(long i = 0; i < procNumber; ++i)
    {
        wait(NULL);
    }
}


int ConstructPool(const long numberOfP, pid_t * pid)
{
    if(pid == NULL)
    {
        printf("Null pointer in function Construct Pool!\n");
        exit(EXIT_FAILURE);
    }
    int i = 1;
    for(i = 1; i < numberOfP + 1; i++)
    {
        //*pid = CreateProc();

        int forkResult = 0;
        if((forkResult = fork()) < 0)
        {
            printf("Can not fork child!\n");
            exit(EXIT_FAILURE);
        }
        *pid = forkResult;

        if(*pid == 0) // child proc
        {
            //printf("I'm child!\n");
            break;
        }
    }
    return i;
}

int CreateQueue(key_t key)
{
    int qid = msgget(key, IPC_CREAT | 0666);
    if(qid < 0)
    {
        printf("Creating queue failed!\n");
        return EXIT_FAILURE;
    }
    return qid;
}

void Send(msgBuf * mBuf, const int msqid)
{
    if(mBuf == NULL)
    {
        printf("MBuf is empty!\n");
        exit(EXIT_FAILURE);
    }

    size_t len = 0;
    int retVal = msgsnd(msqid, (struct msgbuf*)mBuf, len, 0);
    if(retVal < 0)
    {
        printf("Can not send msg to queue\n");
        msgctl(msqid, IPC_RMID, (struct msqid_ds*)NULL);
        exit(EXIT_FAILURE);
    }
}

void Receive(msgBuf * mBuf, const int msqid, const int type)
{
    if(mBuf == NULL)
    {
        printf("MBuf is empty!\n");
        exit(EXIT_FAILURE);
    }
    ssize_t len = msgrcv(msqid, (struct msgbuf*)&mBuf, 0, type, 0);
    if(len < 0)
    {
        printf("Can't receive msg!\n");
        exit(EXIT_FAILURE);
    }
}
