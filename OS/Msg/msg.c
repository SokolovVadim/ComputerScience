//
// Created by vadim on 17.10.18.
//

#include "Msg.h"

void SendMsg(msgBuf * mBuf, const int msqid)
{
    if(mBuf == NULL)
    {
        printf("MBuf is empty!\n");
        exit(EXIT_FAILURE);
    }

    
        mBuf->m_type = 1;
	mBuf->m_info.m_pid = getpid();

        size_t len = sizeof(mBuf->m_info);
	printf("len = %ld\n", len);
        int retVal = msgsnd(msqid, (struct msgbuf*)mBuf, len, 0);
        if(retVal < 0)
        {
            printf("Can not send msg to queue\n");
            msgctl(msqid, IPC_RMID, (struct msqid_ds*)NULL);
            exit(EXIT_FAILURE);
        }
    
}
/*
void Send(msgBuf * mBuf, const int msqid)
{
    if(mBuf == NULL)
    {
        printf("MBuf is empty!\n");
        exit(EXIT_FAILURE);
    }

    for(int i = 0; i < QSIZE; ++i)
    {
        mBuf->m_type = 1;
        //strcpy(mBuf->m_text, "Text message");

	//printf("mBuf->m_text = %s\t", mBuf->m_text);
	mBuf->m_info.m_pid = i;

        size_t len = sizeof(mBuf->m_info);
	printf("len = %ld\n", len);
        int retVal = msgsnd(msqid, (struct msgbuf*)mBuf, len, 0);
        if(retVal < 0)
        {
            printf("Can not send msg to queue\n");
            msgctl(msqid, IPC_RMID, (struct msqid_ds*)NULL);
            exit(EXIT_FAILURE);
        }
    }
}*/

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

int CreateQueue(key_t key)
{
    int qid = msgget(key, IPC_CREAT | 0660);
    if(qid < 0)
    {
        printf("Creating queue failed!\n");
        return EXIT_FAILURE;
    }
    return qid;
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

long int ReadArgs(char * str)
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

void CreatePool(const long numberOfP, const int msqid, const pid_t parentID)
{
    
    for(int i = 0; i < numberOfP; ++i)
    {
	if((getpid()) == parentID)
	{
            pid_t pid = CreateProc();
	    if(pid == 0) // child
	    {
		printf("I'm child!\n");
	        msgBuf mBuf = {};
    	        SendMsg(&mBuf, msqid);
		
	    	    
	        //do smth!!!!!!!!!!!!!!!!!!!!!!
	        //exit(0);
	    }
	    else // parent
            {
		if(i == (numberOfP - 1))
		{
		    msgBuf mBuf = {};
		    SendLast(&mBuf, msqid);
		}
	    }
	
	}
    }
    //wait(NULL);
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
    size_t maxLen = sizeof(mBuf->m_info);
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
        printf("m_type = %ld, \tinfo = %d\n", mBuf->m_type, mBuf->m_info.m_pid);
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

/*void LookupParentProc(const int forkRes, const char* name)
{
    int fd = 0;
    if(forkRes > 0) // parent
    {
        if((fd = open(name, O_WRONLY)) < 0)
        {
            printf("Fifo has not opened!\n");
            exit(EXIT_FAILURE);
        }
        ssize_t size = write(fd, "Hello, work!\n", STR_LEN);
        if(size != STR_LEN)
        {
            printf("Can not write all data in FIFO!\n");
            exit(EXIT_FAILURE);
        }
        if((close(fd)) < 0)
        {
            printf("Close has failed!\n");
            exit(EXIT_FAILURE);
        }

    }
}*/

/*void LookupChildProc(const int forkRes, const char* name, char* str)
{
    int fd = 0;
    if(forkRes == 0) // child
    {
        if((fd = open(name, O_RDONLY)) < 0)
        {
            printf("Fifo has not opened!\n");
            exit(EXIT_FAILURE);
        }
        if(str != NULL)
        {
            ssize_t size = read(fd, str, STR_LEN);
            if(size < 0)
            {
                printf("Can not read all data from FIFO!\n");
                exit(EXIT_FAILURE);
            }
            //printf("strlen = %ld", strlen(str));
            str[strlen(str)-1] = '\0';
            printf("Result = %s\n", str);
            if((close(fd)) < 0)
            {
                printf("Close has failed!\n");
                exit(EXIT_FAILURE);
            }
        }
    }
}*/

/*int WriteToFifo(const int fd, const char* buff)
{
    ssize_t size = write(fd, buff, MAX_SIZE);
    //printf("written size = %ld\n", size);
    if(size < 0)
    {
        printf("Write to Fifo failured!\n");
        exit(EXIT_FAILURE);
    }
    return 0;
}*/

/*void MakeFifo(const char* name)
{
    (void)umask(0);
    if(mknod(name, S_IFIFO | 0666, 0))
    {
        printf("Can not create FIFO!\n");
        exit(EXIT_FAILURE);
    }
}*/

/*void ReadFromFile (const int fd, char* buff)
{
    ssize_t sizeBuff = read(fd, buff, MAX_SIZE);// close fd  (get a pointer)

    if(sizeBuff < 0)
    {
        perror("read");
        exit(EXIT_FAILURE);
    }

    printf("Read from file!\n");
    printf("buff = %s", buff);
}*/

/*char* CreateBuff(const size_t size)
{
    if(size < 0)
    {
        printf("Can not allocate mem!\n");
    }
    char* buff = (char*)calloc(size, sizeof(char));
    if(buff == NULL)
    {
        perror("calloc");
        exit(EXIT_FAILURE);
    }
    return buff;
}*/

/*char* CreateName(const char* fileName)
{
    char * str = (char*)calloc(STR_LEN, sizeof(char));
    if(str == NULL)
    {
        perror("calloc");
        exit(EXIT_FAILURE);
    }
    strncpy(str, fileName, STR_LEN);

    int printNumber = printf("fileName = %s\n", str);
    if(printNumber <= 0)
    {
        printf("Printed number is NULL!\n");
    }
    return str;
}*/

/*const int Open(const char * fileName, const int flag)
{
    int openFlag = open(fileName, flag);	// read & write

    if(openFlag == -1)
    {
        printf("Open failure!\n");
    }

    printf("Opened!\n");
    return openFlag;
}*/
