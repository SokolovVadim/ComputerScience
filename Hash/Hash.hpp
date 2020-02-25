#pragma once
#include <iostream>
#include <fstream>
#include <cstdio>
#include <cassert>
#include <string>
#include <vector>
#include <cstring>
#include <climits>
#include <cmath>
#include <cstdlib>

enum NAMES
{
    NHASH        = 2000,
    SIZEFORPRINT = 26,
    COUNTHASHES  = 6
};

enum NUMBERS
{
    TABLESIZE = 101,
    SIZEVECTOR = 2000
};


struct Node {
    char *name;
    size_t size;
    Node *next; /* следующий в цепочке */
};
Node *symtab[NHASH]; /* таблица символов */


size_t                  sizeof_file       (FILE* fin);
char*                   FileEdit          (FILE* fin, size_t size, size_t* count_words);
//size_t                  Count_words       (char* buff, size_t size, FILE* fout);
size_t                  search            (Node* node, size_t number, size_t elem_numb, FILE* fout, FILE* res);
std::vector<char*> &    PutInArray        (char* buff, size_t size, std::vector<char*> & point_arr, FILE* fout);
Node*                   lookup            (char *name, int create, FILE*  fout, size_t(*hashes)(char*, FILE*));
void                    show_vector       ( std::vector<char*> & point_arr, FILE* fout);
void                    FreeData          (std::vector<char*> &point_arr, FILE* fin, FILE* fout, FILE* res, char* buff);
Node*                   search            (Node* node, size_t number, FILE* fout);
void                    PrintData         (size_t count_words, std::vector<char*> &point_arr, FILE* res, FILE* fout, size_t(*hashes)(char*, FILE*), size_t number);
size_t                  Hash1             (char* word, FILE* fout);
size_t                  Hash2             (char* word, FILE* fout);
size_t                  Hash3             (char* word, FILE* fout);
size_t                  Hash4             (char* word, FILE* fout);
size_t                  Hash5             (char* word, FILE* fout);
size_t                  Hash6             (char* word, FILE* fout);
static inline unsigned char rol (unsigned char c, unsigned int n);
void                    FreeTab           ();
