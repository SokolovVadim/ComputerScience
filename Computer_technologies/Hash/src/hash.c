#include "../include/hash.h"


/* \brief only for DEBUG
* calls free if ptr is not NULL
* returns -1 if ptr is NULL
*/

int mfree(void* ptr)
{
	if(ptr == NULL)
	{
		// printf("m_free: NULL ptr\n");
		return -1;
	}
	// printf("free: %p\n", ptr);
	free(ptr);
	ptr = NULL;
	return 0;
}


/*
* return value:
* NULL if fail, ptr if success
* has a random generated probability of fail ()
* before call this function you must call srand()
*/


void* emalloc(size_t size)
{
	if(size <= 0)
	{
		return NULL;
	}
	//srand(time(NULL));
	int rand_key = rand() % RAND_MAX_SIZE;
	// printf("rand_key = %d\n", rand_key);
	if(rand_key < RAND_PROB)
	{
		// printf("Can not allocate memory!\n");
		return NULL;
	}

	void *p = calloc(1, size);
	// printf("allocation: %p[%ld]\n", p, size);
	
	/*
	if(p == NULL)
	{
		perror("calloc");
		printf("Memory allocation failed!\n");
		return NULL;
	}
	*/
	
	return p;
}

// ---------------------------------------------------

HashTable* init_hash_table(size_t size)
{
	srand(time(NULL));
	// printf("sizeof(*HT) = %ld", sizeof(HashTable));
	HashTable *HT = (HashTable*)emalloc(sizeof(*HT));
	if(HT == NULL)
	{
		// DEBUG_PRINT();
		return NULL;
	}
	
	// printf("%ld\n", sizeof(Nameval));
	HT->symtab = (Nameval**)emalloc(size * sizeof(Nameval*));
	if(HT->symtab == NULL)
	{
		// DEBUG_PRINT();
		
		mfree(HT->symtab);
		mfree(HT);
		return NULL;
	}
	HT->size_  = size;
	//Nameval* node = NULL;

	
	size_t i = 0;
	for(i = 0; i < HT->size_; ++i)
	{
		HT->symtab[i] = (Nameval*)emalloc(sizeof(Nameval)); // 
		if(HT->symtab[i] == NULL)
		{
			// DEBUG_PRINT();
			clear_hash_table(HT);
			return NULL;
		}
		
		HT->symtab[i]->next = NULL;
	}
	
	return HT;
}


// ---------------------------------------------------

//! do not use this function with NULL ptrs
//! call function in clear_hash_table

int clear_list(Nameval* sym)
{
	assert(sym);

	while(sym != NULL)
	{
		Nameval* next = sym->next;
		mfree(sym);
		sym = next;
	}
	return 0;
}

// ---------------------------------------------------

/*
* calls free for HT
* return value: 0 if success
* 
*/

// ---------------------------------------------------

int clear_hash_table(HashTable* HT)
{
	if(HT == NULL)
	{
		return NULL_E;
	}
	Nameval** symtab = HT->symtab;
	if(symtab == NULL)
		goto free_HT;
	
	clear_HT_loop(symtab, HT);
	mfree(HT->symtab);
free_HT:
	mfree(HT);
	return 0;
}

// ---------------------------------------------------

int clear_HT_loop(Nameval** symtab, HashTable* HT)
{
	if(symtab == NULL)
		return -1;
	if(HT == NULL)
		return -1;
	size_t i = 0;
	for(i = 0; i < HT->size_; ++i)
	{
		if(symtab[i] == NULL)
		{
			// printf("Null ptr!\n");
			//return NULL_E;
		}
		else
		{
			clear_list(symtab[i]);
		}
	}
	return 0;
}

// ---------------------------------------------------

uint32_t gnu_hash(const char *s)
{
	if(s == NULL)
		return -1;
    uint32_t h = 5381;

    for (unsigned char c = *s; c != '\0'; c = *++s)
        h = ((h << 5) + h) + c;

    return h % NHASH;
}

// ---------------------------------------------------
/*
* return elem with specified name if create == 1
* return NULL if error
*/

Nameval* add_elem(Nameval** symtab, Nameval* sym, char* name, size_t h)
{
	sym = (Nameval*)emalloc(sizeof(*sym));
	if(sym == NULL)
		return NULL;
	
	sym->name = name;
	sym->next = symtab[h];
	sym->prev = NULL; /// !!!!!!!!!!!!!!!!!!
	symtab[h] = sym;
	
	return sym;
}


/*! \brief find elem and return the ptr
* This function can insert elems into HT,
* If there are no collisions
*
*/

Nameval * lookup(char* name, int create, HashTable* HT)
{
	// DEBUG_PRINT();
	if(name == NULL)
		return NULL;
	// DEBUG_PRINT();
	if(HT == NULL)
		return NULL;

	size_t h = (size_t)gnu_hash(name);
	if(h >= HT->size_)
		return NULL;

	Nameval* sym = NULL;
	Nameval** symtab = HT->symtab;
	if(symtab == NULL) // addition 4.04
		return NULL;
	
	for(sym = symtab[h]; sym != NULL; sym = sym->next)
	{
		
		// printf("sym = %p\nsym->name = %p\nsym->next = %p\n", sym, sym->name, sym->next);
		if( (sym->name) && (strcmp(name, sym->name) == 0) )
		{
			return sym;
		}
		// DEBUG_PRINT();
		if(create)
		{
			sym = add_elem(symtab, sym, name, h);
		}
	}
	return sym;
}






	