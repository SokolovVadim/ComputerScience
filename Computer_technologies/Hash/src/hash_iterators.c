#include "../include/hash.h"

// ---------------------------------------------------
//
//		 HASH TABLE ITERATOR FUNCTIONS
// 
// ---------------------------------------------------

HashTableIterator* hash_iterator_construct(HashTable* HT)
{
	if(HT == NULL)
		return NULL;
	HashTableIterator* iter = (HashTableIterator* )emalloc(sizeof(*iter));
	if(iter == NULL)
		return NULL;
	iter->hash_table_p = HT;
	iter->index = 0;

	return iter;
}


/*
* initialise iterator
* without memory allocation
*/


int hash_iterator_fetch(HashTableIterator* iter, HashTable* HT)
{
	// DEBUG_PRINT();
	if(iter == NULL)
		return -1;
	// DEBUG_PRINT();
	if(HT == NULL)
		return -1;
	// DEBUG_PRINT();
	iter->hash_table_p = HT;
	iter->index = 0;
	return 0;
}

// ---------------------------------------------------

int hash_iterator_is_end(HashTableIterator* iter)
{
	if(iter == NULL)
		return -1;
	if(iter->hash_table_p == NULL)
		return -1;
	if(iter->index >= iter->hash_table_p->size_)
		return 1;
	else
		return 0;
}


// ---------------------------------------------------

Nameval* hash_iterator_begin(HashTableIterator* iter)
{
	if(iter == NULL)
		return NULL;
	if(iter->hash_table_p == NULL)
		return NULL;
	if(iter->hash_table_p->symtab == NULL) // additions
		return NULL;
	return iter->hash_table_p->symtab[0];
}


// ---------------------------------------------------

int hash_iterator_set_next(HashTableIterator* iter)
{
	if(iter == NULL)
		return -1;
	iter->index = iter->index + 1; /// does this statement need a check?
	return 0;
}

// ---------------------------------------------------

int hash_iterator_get_size(HashTableIterator* iter)
{
	if(iter == NULL)
		return 0;
	if(iter->hash_table_p == NULL)
		return 0;
	return iter->hash_table_p->size_;
}


// ---------------------------------------------------

/*
* return data in str
*/

int hash_iterator_get_data(HashTableIterator* iter, char** str)
{
	if(str == NULL)
		return -1;
	if(iter == NULL)
		return -1;
	if(iter->hash_table_p == NULL)
		return -1;
	if(iter->hash_table_p->symtab == NULL)
		return -1;
	if(iter->index >= iter->hash_table_p->size_)
		return -1;
	if(iter->hash_table_p->symtab[iter->index] == NULL)
		return -1;
	*str = iter->hash_table_p->symtab[iter->index]->name;
	return 0;
}


// ---------------------------------------------------

/*! \brief calls free for the ptr
*	
*/

int hash_iterator_delete(HashTableIterator* iter)
{
	mfree(iter);
	iter = NULL;
	return 0;
}

// ---------------------------------------------------

int for_each_hash_table(HashTableIterator* iter, int (*func)(), void* call_back_params)
{
	// size_t ret_val = 0;
	for( hash_iterator_begin(iter); hash_iterator_is_end(iter) == 0; hash_iterator_set_next(iter) )
	{
		
		func(iter, call_back_params);
	}
	return 0;
}

// ---------------------------------------------------
//
//		      NAMEVAL ITERATOR FUNCTIONS
// 			THE SAME AS FUNCTIONS IN LIST
// 
// ---------------------------------------------------


// index of nameval in symtab array in HT 

NamevalIterator* nv_iterator_construct(HashTable* HT)
{
	if(HT == NULL)
		return NULL;
	NamevalIterator* iter = (NamevalIterator* )emalloc(sizeof(*iter));
	if(iter == NULL)
		return NULL;

	iter->head = NULL; // HT->symtab[index];
	iter->nameval_p = NULL; // HT->symtab[index];
	iter->index = START_INDEX; // !!!!

	return iter;
}


// ---------------------------------------------------

int nv_iterator_init_index(HashTable* HT, NamevalIterator* iter, size_t index)
{
	if(iter == NULL)
		return -1;
	if(HT == NULL)
		return -1;
	if(HT->symtab == NULL)
		return -1;
	if( index >= HT->size_)
		return -1;
	iter->head = HT->symtab[index];
	iter->nameval_p = HT->symtab[index];
	return 0;
}


// ---------------------------------------------------
/*
int nv_iterator_fetch(NamevalIterator* iter, char** str)
{
	if(iter == NULL)
		return -1;
	if(iter->nameval_p == NULL)
		return -1;
	if(str == NULL)
		return -1;
	*str = iter->nameval_p->name;
	return 0;
}*/

// ---------------------------------------------------

Nameval* nv_iterator_begin(NamevalIterator* iter)
{
	if(iter == NULL)
		return NULL;
	return iter->head;
}

// ---------------------------------------------------

int nv_iterator_is_end(NamevalIterator* iter)
{
	if(iter == NULL)
		return -1;
	if(iter->nameval_p == NULL)
		return -1;
	if(iter->nameval_p->next == NULL) // end
		return 1;
	else
		return 0;
}

// ---------------------------------------------------

/*
Nameval* nv_iterator_get_cur(NamevalIterator* iter)
{
	if(iter == NULL)
		return NULL;
	return iter->nameval_p;
}
*/

// ---------------------------------------------------

Nameval* nv_iterator_set_next(NamevalIterator* iter)
{
	if(iter == NULL)
		return NULL;
	if(iter->nameval_p == NULL)
		return NULL;
	Nameval* temp = iter->nameval_p;
	iter->nameval_p = iter->nameval_p->next;
	return temp;
}

// ---------------------------------------------------

/*
Nameval* nv_iterator_get_next(NamevalIterator* iter)
{
	if(iter == NULL)
		return NULL;
	if(iter->nameval_p == NULL)
		return NULL;
	return iter->nameval_p->next;
}
*/

// ---------------------------------------------------

int nv_iterator_delete(NamevalIterator * iter)
{
	mfree(iter);
	iter = NULL;
	return 0;
}

// ---------------------------------------------------

/*!
* \brief This function does not create a copy of str
* \ returns a pointer on str in HT
*/

int nv_iterator_get_data(NamevalIterator* iter, char** str)
{
	if(iter == NULL)
		return -1;
	if(iter->nameval_p == NULL)
		return -1;
	if(str == NULL)
		return -1;
	*str = iter->nameval_p->name;
	// printf("str = %s\n", str);
	return 0;
}


// ---------------------------------------------------
/*
int print_elem (NamevalIterator* iter)
{
	if(iter == NULL)
		return -1;
	if(iter->nameval_p == NULL)
		return -1;
	printf("print_elem: %ld\n", iter->index);
	return 0;
}
*/
/*
// ---------------------------------------------------

int for_each_hash_table(HashTableIterator* iter, int(*func)(void))
{
	for( iter->begin(); iter->this != iter->end(); iter = iter->next() )
	{
		for_each_nameval(iter->this, func);
	}
	return 0;
}
*/

// ---------------------------------------------------

int for_each_nameval(NamevalIterator* iter, int (*func)(), void* call_back_params)
{
	if(iter == NULL)
		return -1;
	// printf("%s\n", nv_iterator_begin(iter)->name);
	// printf("isEnd = %d\n", nv_iterator_is_end(iter)); // 0 means that it is not the end
	for( nv_iterator_begin(iter); nv_iterator_is_end(iter) == 0; nv_iterator_set_next(iter) )
	{
		// char* name = NULL;
		//char* name = (char*)call_back_params;
		nv_iterator_get_data(iter, call_back_params);
		func(call_back_params, iter);
	}
	return 0;
}


// ---------------------------------------------------

int traversal(HashTableIterator* iter_ht)
{
	if(iter_ht == NULL)
		return -1;

	NamevalIterator* iter_nv = nv_iterator_construct(iter_ht->hash_table_p);
	// HashTableIterator* iter_ht = hash_iterator_construct(iter_ht->hash_table_p)
	size_t sum = 0;

	for( hash_iterator_begin(iter_ht); hash_iterator_is_end(iter_ht) == 0; hash_iterator_set_next(iter_ht) )
	{
		// char* str = NULL;
		// hash_iterator_get_data(iter, &str);
		//iter->hash_table_p->symtab[iter->index] = 0;
		nv_iterator_init_index(iter_ht->hash_table_p, iter_nv, iter_ht->index);
		for_each_nameval(iter_nv, stupid_print, &sum);
	}



	mfree(iter_nv);
	return 0;
}

// ---------------------------------------------------

/*
int nv_iterator_get_size(NamevalIterator* iter)
{
	if(iter == NULL)
		return -1;
	if(iter->nameval_p == NULL)
		return -1;
	int i = 0;
	Nameval* node = iter->head;
	for(; node != NULL; node = node->next)
	{
		if(node == NULL)
			return -1;
		node->index = i;
		i++;
	}
	return i;
}
*/

// ---------------------------------------------------
/*

int erase_elem(HashTableIterator* iter, size_t h, char* name)
{
	if(iter == NULL)
		return -1;
	Nameval* node = lookup(name, 0, iter->hash_table_p);
	if(node == NULL)
		return -1;
	//Nameval* temp = NULL;
	if(node->prev == NULL)
	{
		if(node->next == NULL)
			node = NULL;
		else
		{
			node->next->prev = NULL;
			iter->hash_table_p->symtab[h] = node->next;
			mfree(node);
		}
	}
	else // node->prev != NULL
	{
		if(node->next == NULL)
			node = NULL;
		else
		{
			node->prev->next = node->next;
			node->next->prev = node->prev;
			mfree(node);
		}
	}


	return 0;
}

*/
// ---------------------------------------------------

int stupid_print(HashTableIterator* iter, void* params)
{
	if(iter == NULL)
		return -1;
	if(params == NULL)
		return -1;
	// printf("%s\n", (char*)params);
	return 0;
}

// ---------------------------------------------------

int nv_iterator_size(NamevalIterator* iter, void* args)
{
	if(iter == NULL)
		return -1;
	if(iter->nameval_p == NULL)
		return -1;
	if(iter->head == NULL)
		return 0;
	if(args == NULL)
		return -1;

	
	size_t i = 0;
	Nameval* node = iter->head;
	for(; node != NULL; node = node->next)
	{
		if(node == NULL)
			return -1;
		node->index = i;
		i++;
	}
	
	
	size_t sum = *(size_t*)args + i;
	*(size_t*)args = sum;
	return 0;
}


/*
int show_index(int index)
{
	printf("index = %d\n", index);
	return 0;
}

*/

// ---------------------------------------------------
