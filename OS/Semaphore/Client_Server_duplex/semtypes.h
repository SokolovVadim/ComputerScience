/*
  Shared memory & semaphores demo by Andrei Borovsky
  <borovsky@tochka.ru>
  You may do with this code whateer you like
*/

#ifndef SHMEM_TYPES
#define SHMEM_TYPES

#define FTOK_FILE "./semserv"

#define MAXLEN 512

struct memory_block
{
   char string[MAXLEN];
};


#endif
