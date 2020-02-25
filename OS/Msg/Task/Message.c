//
// Created by vadim on 17.10.18.
//

#include "Msg.h"

void SendMsg(msgBuf * mBuf, const int msqid, const int i)
{
    if(mBuf == NULL)
    {
        printf("MBuf is empty!\n");
        exit(EXIT_FAILURE);
    }

    pid_t pid    = getpid();
    mBuf->m_type = pid;
    //mBuf->m_pid  = pid;

    //size_t len = sizeof(mBuf->m_pid);
    //printf("len = %ld\n", len);
    //int retVal = msgsnd(msqid, (struct msgbuf*)mBuf, len, 0);
    //if(retVal < 0)
    {
        printf("Can not send msg to queue\n");
        msgctl(msqid, IPC_RMID, (struct msqid_ds*)NULL);
        exit(EXIT_FAILURE);
    }
}

void SendLast(msgBuf * mBuf, const int msqid)
{
    mBuf->m_type = LAST_MSG;
    size_t len = 0;
    int retVal = msgsnd(msqid, (struct msgbuf*)mBuf, len, 0);
    if(retVal < 0)
    {
        printf("Can not send msg to queue\n");
        msgctl(msqid, IPC_RMID, (struct msqid_ds*)NULL);
        exit(EXIT_FAILURE);
    }

}



key_t GenerateKey(const char* pathName)
{
    key_t key = ftok(pathName, 0);
    if(key < 0)
    {
        printf("Can not generate key!\n");
        exit(EXIT_FAILURE);
    }
    return key;
}



int RmQueue(const int qid)
{
    int retVal = msgctl(qid, IPC_RMID, NULL);
    if(retVal < 0)
    {
        printf("Can not remove queue!\n");
        return EXIT_FAILURE;
    }
    return retVal;
}






void CreatePool(const long numberOfP, const int msqid, const pid_t parentID)
{
    pid_t pid = 0;
    size_t i  = 0;
    msgBuf mBuf = {};

    // add parent sending!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    for(i = 0; i < numberOfP; ++i) {
        pid = CreateProc();

        if (pid == 0) // child proc
        {
            printf("I'm child!\n");

//            size_t maxLen = sizeof(mBuf.m_pid);
            //  msgrcv(msqid, (struct msgbuf *) &mBuf, maxLen, i, 0);
            printf("Mbuf.m_type = %ld\n", mBuf.m_type);
            break;
        } else {
            printf("Pid = %d\n", pid);
        }
    }
}

int CreateProc()
{
    int forkResult = 0;
    if((forkResult = fork()) < 0)
    {
        printf("Can not fork child!\n");
        exit(EXIT_FAILURE);
    }
    return forkResult;
}

int ReceiveCycle(msgBuf * mBuf, const int msqid)
{
    size_t maxLen = sizeof(char/*mBuf->m_pid*/);
    ssize_t len = 0;
    while(1)
    {
        len = msgrcv(msqid, (struct msgbuf*)mBuf, maxLen, 0, 0);
        printf("after msgrcv\n");
        if(len < 0)
        {
            printf("Can not receive msg!\n");
            exit(EXIT_FAILURE);
        }
        if(mBuf->m_type == LAST_MSG)
        {
            printf("lastMsg!\n");
            msgctl(msqid, IPC_RMID, (struct msqid_ds *)NULL);
            return 0;
        }
        //printf("m_type = %ld, \tinfo = %d\n", mBuf->m_type, mBuf->m_pid);
    }
}


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
