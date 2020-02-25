#include "../include/hash.h"


//! returns FD of file_name
//! fd must be closed after calling this function

/*

int open_file(const char* file_name)
{
	int fd = open(file_name, O_RDONLY);
	if(fd < 0)
	{
		perror("open");
		return -1;
	}

	return fd;
}

size_t sizeof_file(char* filename)
{
	struct stat sb;
	if( stat(filename, &sb) < 0)
	{
		perror("stat");
		return -1;
	}
	// printf("stat res: size = %ld\n", sb.st_size);
	return sb.st_size;
}

int read_file(const int fd, const size_t file_size, char* buffer)
{
	int read_number = read(fd, buffer, file_size);
	if(read_number < 0)
	{
		perror("read");
		return -1;
	}
	// buffer[file_size-1] = '\0';
	// printf("read_number = %d\n", read_number);
	return read_number;
}

size_t count_words(char* buffer, const size_t file_size)
{
	size_t i = 0;
	size_t count_words = 0;
	for(i = 0; i < file_size; ++i)
	{
		char c = buffer[i];
		if(ispunct(c) || isspace(c) || (c == '\n'))
		{
			buffer[i] = '\0';
			count_words++;
		}
	}

	return count_words - 1; // except '\0' at the end of file
}

int put_in_array(char* buffer, char** ptr_buffer, size_t file_size)
{
	// printf("%s\n", buffer);
	size_t count_words = 1; // first symbol is the beginning of data
	size_t i = 0;
	if(ptr_buffer == NULL)
		return -1;
	ptr_buffer[0] = buffer;
	for(i = 0; i < file_size - 10; ++i) // \r\0
	{
		char c = buffer[i];
		if(c == '\0')
		{
			ptr_buffer[count_words] = &buffer[i + 1];
			// printf("ptr_buffer[%ld] = %s\n", count_words, ptr_buffer[count_words]);
			count_words++;
		}
	}

	
	return 0;
}

// do not change ptr_buffer,
// insert data into HT

#define CREATE 1
int insert_elems(char** ptr_buffer, const size_t n_words, HashTable* HT)
{
	
	size_t i = 0;
	if(ptr_buffer == NULL)
		return -1;

	if(*ptr_buffer == NULL)
		return -1;
	
	if(HT == NULL)
		return -1;
	for(i = 0; i < n_words; ++i)
	{
		// srand(time(NULL));
		lookup(ptr_buffer[i], CREATE, HT);
	}
	return 0;
}

#undef CREATE


int tests()
{
	mfree(NULL);




	srand(time(NULL));

	//---------------------------------------------

	char   filename[] = "docs/data.txt";
	int    fd 		  = open_file(filename);
	size_t file_size  = sizeof_file(filename);

	// printf("file_size = %ld\n", file_size);


	char* buffer     = (char*)emalloc(file_size);
	if(buffer == NULL)
	{
		return -1;
	}

	read_file(fd, file_size, buffer);



	size_t n_words = count_words(buffer, file_size);
	// printf("n_words = %ld\n", n_words);
	char** ptr_buffer = (char**)emalloc(n_words * sizeof(char*));
	put_in_array(buffer, ptr_buffer, file_size);
	

	// DEBUG_PRINT();
	HashTable* HT = NULL;
	HT = init_hash_table(NHASH);

	if(HT == NULL)
	{
		if((close(fd)) < 0)
		{
			perror("close");
			return -1;
		}
		mfree(buffer);
		mfree(ptr_buffer);
		return -1;
	}	
	
	// printf("HT = %p\n", (void*)HT);

	
	insert_elems(ptr_buffer, n_words, HT);

	

	// start work with iterators
	// DEBUG_PRINT();
	HashTableIterator * iter = (HashTableIterator *)emalloc(sizeof(*iter));
	// DEBUG_PRINT();
	hash_iterator_fetch(iter, HT);

	traversal(iter);

	hash_iterator_delete(iter);

	
	// NamevalIterator * iter_nv = (NamevalIterator *)emalloc(sizeof(*iter_nv));
	NamevalIterator* iter_nv = nv_iterator_construct(HT);
	nv_iterator_init_index(HT, iter_nv, 4);
	
	for_each_nameval(iter_nv, stupid_print);

	nv_iterator_get_size(iter_nv);

	// printf("\n\n\nn = %d\n\n\n", n);
	nv_iterator_delete(iter_nv);

	


	// end work with iterators
	
	
	clear_hash_table(HT);

	if((close(fd)) < 0)
	{
		perror("close");
		return -1;
	}
	mfree(buffer);
	mfree(ptr_buffer);
	return 0;
}
*/

#define TEST_NUMBER 64

int unit_tests()
{
	mfree(NULL);


	//----------------------------
	// test 2
	// clear_hash_table

	size_t i = 0;
	clear_hash_table(NULL);
	clear_HT_loop(NULL, NULL);

	for( i = 0; i < 100; i++)
	{
		// printf("i = %ld\n", i);
		Nameval** symtab = (Nameval**)emalloc(sizeof(*symtab));
		clear_HT_loop(symtab, NULL);
		// clear_hash_table(HT);
		mfree(symtab);
	}


	//------------------------
	// test 3

	
	
	for( i = 0; i < 100; i++)
	{
		HashTable* HT = (HashTable*)emalloc(sizeof(*HT));
		mfree(HT);
	}
	

	//------------------------
	// test 4

	
	// size_t i = 0;
	for( i = 0; i < 100; i++)
	{
		// printf("i = %ld\n", i);
		HashTable* HT = init_hash_table(i);
		clear_hash_table(HT);
		//mfree(HT);
	}
	
	//------------------------
	// test 5
	// emalloc size
	
	emalloc(0);

	//------------------------
	// test 6 lookup

	lookup(NULL, 0, NULL);


	for( i = 0; i < 100; i++)
	{
		char* name = (char*)emalloc(10);
		if(name == NULL)
		{
			return 0; /// !!!!!
		}
		strncpy(name, "example", 7);
		name[7] = '\0';

		HashTable* HT = init_hash_table(100);
		if(HT == NULL)
		{
			mfree(name);
			clear_hash_table(HT);
			continue;
		}
	
		lookup(name, 1, HT);
		lookup(name, 1, NULL);
		mfree(name);
		clear_hash_table(HT);
	}

	//------------------------
	// test 7 gnu_hash
	gnu_hash(NULL);
	
	//------------------------
	// test 8 HT iterator construct
	for( i = 0; i < 10000; i++)
	{
		HashTable* HT = init_hash_table(2);

		HashTableIterator* iter = hash_iterator_construct(HT);

		hash_iterator_delete(iter);
		clear_hash_table(HT);
	}

	//------------------------
	// test 9 HT iterator delete
	for( i = 0; i < 100; i++)
	{
		HashTable* HT = init_hash_table(100);
		HashTableIterator * iter = (HashTableIterator *)emalloc(sizeof(*iter));

		hash_iterator_delete(iter);

		clear_hash_table(HT);
	}

	//------------------------
	// test 10 HT iterator fetch
	for( i = 0; i < 100; i++)
	{
		HashTable* HT = init_hash_table(100);
		HashTableIterator * iter = (HashTableIterator *)emalloc(sizeof(*iter));

		hash_iterator_fetch(iter, HT);
		hash_iterator_fetch(NULL, HT);

		hash_iterator_delete(iter);
		clear_hash_table(HT);
	}

	//------------------------
	// test 11 HT iterator is_end
	for( i = 0; i < 100; i++)
	{
		HashTable* HT = init_hash_table(100);
		HashTableIterator* iter = hash_iterator_construct(HT);

		hash_iterator_is_end(iter);
		
		clear_hash_table(HT);
		if(iter != NULL)
			iter->hash_table_p = NULL;
		hash_iterator_is_end(iter);

		hash_iterator_delete(iter);
		// clear_hash_table(HT);
	}

	//------------------------
	// test 12 HT iterator begin
	for( i = 0; i < 100; i++)
	{
		HashTable* HT = init_hash_table(100);
		HashTableIterator* iter = hash_iterator_construct(HT);

		hash_iterator_begin(iter); 
		hash_iterator_begin(NULL); 
		
		if((iter != NULL) && (iter->hash_table_p != NULL) && (HT != NULL) && (HT->symtab != NULL))
		{
			clear_HT_loop(HT->symtab, HT);
			mfree(iter->hash_table_p->symtab);
			iter->hash_table_p->symtab = NULL;
			hash_iterator_begin(iter);
			mfree(iter->hash_table_p);
			iter->hash_table_p = NULL;
		}
		hash_iterator_begin(iter);
		
		
		
		/*
		if( iter != NULL )
		{
			clear_HT_loop(HT->symtab, HT);
			mfree(iter->hash_table_p->symtab);
			mfree(HT);
			iter->hash_table_p = NULL;
			hash_iterator_delete(iter);
			break;
		}*/
		// hash_iterator_begin(iter);
		

		hash_iterator_delete(iter);
		// clear_hash_table(HT);
	}

	//------------------------
	// test 13 HT iterator set next
	for( i = 0; i < 100; i++)
	{
		HashTable* HT = init_hash_table(100);
		HashTableIterator* iter = hash_iterator_construct(HT);

		hash_iterator_set_next(iter);

		hash_iterator_delete(iter);
		clear_hash_table(HT);
	}

	//------------------------
	// test 14 HT iterator get size
	for( i = 0; i < 100; i++)
	{
		HashTable* HT = init_hash_table(100);
		HashTableIterator* iter = hash_iterator_construct(HT);

		hash_iterator_get_size(iter);

		if(iter != NULL)
		{
			clear_hash_table(iter->hash_table_p);
			iter->hash_table_p = NULL;
			hash_iterator_get_size(iter);

		}

		hash_iterator_delete(iter);
		// clear_hash_table(HT);
	}

	
	//------------------------
	// test 15 HT iterator get data
	for( i = 0; i < 100; i++)
	{
		HashTable* HT = init_hash_table(100);
		HashTableIterator* iter = hash_iterator_construct(HT);

		char * str = NULL;
		hash_iterator_get_data(iter, &str);
		hash_iterator_get_data(iter, NULL);

		if(iter != NULL)
			if(iter->hash_table_p != NULL)
			{
				iter->index = 1000;
			}
		hash_iterator_get_data(iter, &str);
		

		if((iter != NULL) && (iter->hash_table_p != NULL) && (iter->hash_table_p->symtab != NULL))
		{
			iter->index = 0;
			mfree(iter->hash_table_p->symtab[iter->index]);
			iter->hash_table_p->symtab[iter->index] = NULL;
		}
		hash_iterator_get_data(iter, &str);
		
		/*
		clear_hash_table(HT);
		if((iter != NULL) && (iter->hash_table_p != NULL) )
				iter->hash_table_p->symtab = NULL;
		hash_iterator_get_data(iter, &str);
		*/

		hash_iterator_delete(iter);
		clear_hash_table(HT);
	}



	//------------------------
	// test 16 stupid print
	for( i = 0; i < 100; i++)
	{
		// char name[] = "example";
		HashTableIterator* iter1 = NULL;

		stupid_print(iter1, &i);
		stupid_print(iter1, NULL);

		HashTable* HT = init_hash_table(100);
		HashTableIterator* iter = hash_iterator_construct(HT);

		stupid_print(iter, &i);
		stupid_print(iter, NULL);

		hash_iterator_delete(iter);
		clear_hash_table(HT);
	}



	//------------------------
	// test 17 HT iterator fort_each_hash_table
	for( i = 0; i < 100; i++)
	{
		HashTable* HT = init_hash_table(100);
		HashTableIterator* iter = hash_iterator_construct(HT);

		int sum = 0;
		for_each_hash_table(iter, stupid_print, &sum);

		hash_iterator_delete(iter);
		clear_hash_table(HT);
	}
	
	
	//------------------------
	// test 18 nv iterator construct-delete
	for( i = 0; i < 10000; i++)
	{
		HashTable* HT = init_hash_table(2);
		
		NamevalIterator* iter = nv_iterator_construct(HT);
		nv_iterator_delete(iter);

		clear_hash_table(HT);
	}

	//------------------------
	// test 19 nv iterator get data
	for( i = 0; i < 100; i++)
	{
		HashTable* HT = init_hash_table(100);
		NamevalIterator* iter = nv_iterator_construct(HT);
		char* str = NULL;
		nv_iterator_get_data(iter, &str);
		// iter->nameval_p->name = (char*)emalloc(10);

		// mfree(iter->nameval_p->name);

		if(iter != NULL)
		{
			iter->nameval_p = (Nameval*)emalloc(sizeof(Nameval));
			nv_iterator_get_data(iter, NULL);
			nv_iterator_get_data(iter, &str);
			mfree(iter->nameval_p);
			iter->nameval_p = NULL;
		}


		nv_iterator_delete(iter);

		clear_hash_table(HT);
	}

	//------------------------
	// test 20 nv iterator set next
	for( i = 0; i < 100; i++)
	{
		HashTable* HT = init_hash_table(100);
		NamevalIterator* iter = nv_iterator_construct(HT);
		
		nv_iterator_set_next(iter);

		if(iter != NULL)
		{
			iter->nameval_p = (Nameval*)emalloc(sizeof(Nameval));
			Nameval* temp = NULL;
			if(iter->nameval_p != NULL)
			{
				iter->nameval_p->next = (Nameval*)emalloc(sizeof(Nameval));
				temp = nv_iterator_set_next(iter);
				mfree(temp);
				// mfree(iter->nameval_p->next);
			}
			mfree(iter->nameval_p);
		}

		nv_iterator_delete(iter);
		clear_hash_table(HT);
	}

	//------------------------
	// test 21 nv iterator is end
	for( i = 0; i < 100; i++)
	{
		HashTable* HT = init_hash_table(100);
		NamevalIterator* iter = nv_iterator_construct(HT);
		
		nv_iterator_is_end(iter);
		//iter->nameval_p->next 
		if(iter != NULL)
		{
			iter->nameval_p = (Nameval*)emalloc(sizeof(Nameval));
			if(iter->nameval_p != NULL)
			{
				iter->nameval_p->next = (Nameval*)emalloc(sizeof(Nameval));
				nv_iterator_is_end(iter);
				mfree(iter->nameval_p->next);
			}
			mfree(iter->nameval_p);
		}
		/*
		if((iter != NULL) && (iter->nameval_p != NULL))
		{
			iter->nameval_p->next = (Nameval*)emalloc(sizeof(Nameval));
			printf("here!\n");
			nv_iterator_is_end(iter);
			mfree(iter->nameval_p->next);
		}*/

		nv_iterator_delete(iter);
		clear_hash_table(HT);
	}

	//------------------------
	// test 22 nv iterator begin
	for( i = 0; i < 100; i++)
	{
		HashTable* HT = init_hash_table(100);
		NamevalIterator* iter = nv_iterator_construct(HT);
		
		nv_iterator_begin(iter);

		nv_iterator_delete(iter);
		clear_hash_table(HT);
	}

	//------------------------
	// test 23 nv iterator init index
	for( i = 0; i < 100; i++)
	{
		HashTable* HT = init_hash_table(100);
		NamevalIterator* iter = nv_iterator_construct(HT);
		nv_iterator_init_index(NULL, iter, 1);
		nv_iterator_init_index(HT, iter, 1);
		nv_iterator_init_index(HT, iter, 1000);
		nv_iterator_init_index(HT, iter, -1);

		if((iter != NULL) && (HT != NULL))
		{
			clear_HT_loop(HT->symtab, HT);
			mfree(HT->symtab);
			HT->symtab = NULL;
			nv_iterator_init_index(HT, iter, -1);
			mfree(HT);
			HT = NULL;
		}

		nv_iterator_delete(iter);
		clear_hash_table(HT);
	}

	//------------------------
	// test 24 nv iterator for each
	for( i = 0; i < 100; i++)
	{
		HashTable* HT = init_hash_table(100);
		NamevalIterator* iter = nv_iterator_construct(HT);
		
		char* name = NULL;
		nv_iterator_init_index(HT, iter, 0);
		for_each_nameval(iter, stupid_print, name);


		nv_iterator_delete(iter);
		clear_hash_table(HT);
	}

	//------------------------
	// test 25 hash iter traversal
	for( i = 0; i < 100; i++)
	{
		HashTable* HT = init_hash_table(100);
		HashTableIterator* iter = hash_iterator_construct(HT);
		// HashTableIterator* iter1 = hash_iterator_construct(NULL);
		
		traversal(iter);

		hash_iterator_delete(iter);
		clear_hash_table(HT);
	}

	//------------------------
	// test 26 hash iter erase elem
	/*
	for( i = 0; i < 100; i++)
	{
		HashTable* HT = init_hash_table(100);
		HashTableIterator* iter = hash_iterator_construct(HT);
		
		erase_elem(iter, 1, "example");

		hash_iterator_delete(iter);
		clear_hash_table(HT);
	}*/

	//------------------------
	// test 27 add elem

	for( i = 0; i < 10000; i++)
	{
		
		char* name = (char*)emalloc(10);
		if(name == NULL)
		{
			return 0; /// !!!!!
		}
		strncpy(name, "example", 7);
		name[7] = '\0';
		HashTable* HT = init_hash_table(10);
		if(HT != NULL)
			add_elem(HT->symtab, NULL, name, 0);
		mfree(name);

		clear_hash_table(HT);
	}

	//------------------------
	// test 28 nv iterator size
	for( i = 0; i < 10000; i++)
	{
		HashTable* HT = init_hash_table(100);
		NamevalIterator* iter = nv_iterator_construct(HT);
		size_t size = 0;
		nv_iterator_size(iter, &size);

		if(iter != NULL)
		{
			iter->nameval_p = (Nameval*)emalloc(sizeof(Nameval));
			iter->head = (Nameval*)emalloc(sizeof(Nameval));
			nv_iterator_size(iter, NULL);
			nv_iterator_size(iter, &size);
			mfree(iter->nameval_p);
			iter->nameval_p = NULL;
			mfree(iter->head);
			iter->head = NULL;
		}


		nv_iterator_delete(iter);
		clear_hash_table(HT);
		
	}




	return 0;
}
// 26 functions at all
// 
//+ erase elem
//+ traversal
//+ for each nv
//+ nv iter init index
//+ nv iter begin
//+ nv iter is end
//+ nv iter set next
//+ nv iter get data
//+ nv iter construct
//+ nv iter delete

int main()
{
	int i = 0;
	for(; i < TEST_NUMBER; i++)
	{
		unit_tests();
	}

	return 0;
}

#undef TEST_NUMBER
