
#ifndef H_HASH
#define H_HASH


#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <assert.h>
#include <stdint.h>
#include <string.h>
#include <ctype.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/stat.h>

// ---------------------------------------------------
//						Hash table
//  complexity		On the average			The worst
//  memory usage		O(n)					O(n)
//  search				O(1)					O(n)
//  insertion			O(1)					O(n)
//  disposal			O(1)					O(n)
//
// ---------------------------------------------------

/*
* RAND_MAX_SIZE -- maximum of rand value
* RAND_PROB -- probability of fail in emalloc
*
*/

enum COMPONENTS
{
	NHASH          = 113,
	RAND_MAX_SIZE  = 100,
	RAND_PROB      = 1	, // in percentage
	START_INDEX    = 0xFFFF
};

enum ERRORS
{
	ALLOC_E = -1,
	NULL_E  = -2
};

// ---------------------------------------------------

typedef struct Nameval
Nameval;
struct Nameval
{
	char*    name;
	size_t 	 index;
	Nameval* next;
	Nameval* prev;
};


typedef struct HashTable
HashTable;
struct HashTable
{
	// Nameval* symtab[NHASH];
	Nameval** 	symtab;
	size_t 		size_;
};

// ---------------------------------------------------


/*
// virtuals method table
typedef struct itr_ht_vmt_ {
    //void (*bind)     (struct itr_list_vmt_ *, list*);
    //int(*hash_iterator_get_data)(HashTableIterator* iter, char* str);
} itr_ht_vmt;

*/

typedef struct HashTableIterator
HashTableIterator;
struct HashTableIterator
{
	HashTable* hash_table_p;
	size_t index;
	// itr_ht_vmt vmt;
};

/*
typedef struct itr_nv_vmt_
{
	int (*print_elem) (Nameval*);
} itr_nv_vmt_;
*/
struct NamevalIterator;

/*
 * Methods of Nameval Iterator
*/

// ---------------------------------------------------

// int print_elem(struct NamevalIterator* iter);
int stupid_print(HashTableIterator* iter, void* params);
// int show_index(int index);


// ---------------------------------------------------

typedef struct NamevalIterator
NamevalIterator;
struct NamevalIterator
{
	// int (*print_elem) (NamevalIterator*);
	Nameval* nameval_p;
	Nameval* head;
	size_t index;
	// itr_nv_vmt_ vmt;
};

// ---------------------------------------------------

// int 		print_elem				(Nameval* node);

/*Nameval* 	get_node				(int key);*/

size_t 				get_size				(HashTable *HT);

Nameval* 			add_node				();

int 				remove					();

int 				is_empty				();

int 				hash 					();

void* 				emalloc					(size_t size);

int 				mfree					(void* ptr);

HashTable* 			init_hash_table			(size_t size);

int 				clear_hash_table		(HashTable* HT);

int 				clear_HT_loop			(Nameval** symtab, HashTable* HT);

int 				erase_elem				(HashTableIterator* iter, size_t h, char* name);

Nameval* 			add_elem				(Nameval** symtab, Nameval* sym, char* name, size_t h);

int 				hash_iterator_fetch 	(HashTableIterator* iter, HashTable* HT);

uint32_t 			stupid_hash				(const char* name);

uint32_t 			gnu_hash 				(const char *s);

Nameval*    		lookup              	(char* name, int create, HashTable* HT);

HashTableIterator* 	hash_iterator_construct	(HashTable* HT);

int         		hash_iterator_get_data	(HashTableIterator* iter, char** str);

int 				hash_iterator_delete	(HashTableIterator* iter);

Nameval*			hash_iterator_begin		(HashTableIterator* iter);

int 				hash_iterator_is_end	(HashTableIterator* iter);

int 				hash_iterator_set_next	(HashTableIterator* iter);

int 				hash_iterator_get_size	(HashTableIterator* iter);

int 				hash_iterator_get_data	(HashTableIterator* iter, char** str);

// int 				nv_iterator_fetch		(NamevalIterator* iter, char** str);
int 				nv_iterator_get_data	(NamevalIterator* iter, char** str);

Nameval* 			nv_iterator_begin		(NamevalIterator* iter);

int 				nv_iterator_is_end		(NamevalIterator* iter);

int 				nv_iterator_size    	(NamevalIterator* iter, void* args);

int 				nv_iterator_delete		(NamevalIterator * iter);
// int 				nv_iterator_get_size	(NamevalIterator* iter);

// for_each iterators

NamevalIterator* 	nv_iterator_construct	(HashTable* HT);

int 				nv_iterator_init_index	(HashTable* HT, NamevalIterator* iter, size_t index);
// Nameval* 			nv_iterator_get_cur		(NamevalIterator* iter);
Nameval* 			nv_iterator_set_next	(NamevalIterator* iter);

// int for_each(itr_nv_vmt_ vmt, HashTable* HT);
int for_each_hash_table	(HashTableIterator* iter, int (*func)(), void* call_back_params);

int for_each_nameval	(NamevalIterator* iter, int (*func)(), void* call_back_params);

int traversal			(HashTableIterator* iter_ht);


// ---------------------------------------------------


#define DEBUG_PRINT()													\
do 																		\
{																		\
	printf("----------------------------------\n" 						\
		   "****** %s: %d ******\n"										\
		   "----------------------------------\n", __func__, __LINE__);	\
} while(0)




// ---------------------------------------------------

#endif // H_HASH
