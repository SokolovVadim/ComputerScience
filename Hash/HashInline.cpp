#include "Hash.h"


int main() {



    FILE*               fin     =     fopen          ("Input.txt", "rb");
    FILE*               fout    =     fopen          ("Output.txt", "wb");
    FILE*               res     =     fopen          ("Result.csv", "wb");

    size_t              size    =     sizeof_file    (fin);

    size_t              count_words = 0;

    char*               buff    =     FileEdit       (fin, size, &count_words);

    std::vector<char*>  point_arr                    (SIZEVECTOR * (sizeof (std::vector<char*>)));
    PutInArray                                       (buff, size, point_arr, fout);


    for(size_t i(0); i < COUNTHASHES; ++i)
    {
        PrintData                                    (count_words, point_arr, res, fout, hashes[i], i + 1);
        FreeTab();
    }

    FreeData                                         (point_arr, fin, fout, res, buff);

    //free(hashes);
}


// объединить все, что происходит после заполнения вектора в одну функцию, фором передавать в нее одним из аргументов



void FreeData(std::vector<char*> &point_arr, FILE* fin, FILE* fout, FILE* res, char* buff)
{

// for (const auto &i: symtab)
    for(int i(0); i <TABLESIZE; ++i)
    {
        Node* cur_ptr;
        while(symtab[i])
        {
            cur_ptr = symtab[i]->next;
            free(symtab[i]);

            symtab[i] = cur_ptr;
        }
    }

    free(buff);
    point_arr.clear();
    fclose(fin);
    fclose(fout);
    fclose(res);
}


void FreeTab()
{
    for(int i(0); i <TABLESIZE; ++i)
    {
        Node* cur_ptr;
        while(symtab[i])
        {
            cur_ptr = symtab[i]->next;
            free(symtab[i]);

            symtab[i] = cur_ptr;
        }

    }

}


size_t Hash1(char* word, FILE* fout)
{
    return 1;
}


size_t Hash2(char* word, FILE* fout)
{
    auto code = (size_t)(*word);

    return code - 97;
}


size_t Hash3(char* word, FILE*  fout)
{
    size_t len(0);
    len = strlen(word);

    //fprintf(fout, "strlen of word \"%s\" = %lu\n", word, len);
    return len;
}




size_t Hash4(char* word, FILE* fout)
{
    size_t sum (0);
    short counter(0);
    while(word[counter]!='\0')
    {
        sum += (size_t)word[counter];
        counter++;
    }
    return sum % TABLESIZE;
}

size_t Hash5(char* word, FILE* fout)
{

    unsigned prime = 5381; // 8th prime number
    unsigned counter(1); // avoid div(0);

    for (auto c = (unsigned char)*word; c != '\0'; c = (unsigned char) *word++)
    {
        prime = ((prime << 5) + prime) + c;
        counter++;
    }
    prime %= counter;
    return prime;
}



// сумма хэшированных элементов - результат работы функции

static inline unsigned char rol (unsigned char c, unsigned int n)
{
    auto mask = (unsigned char)pow(2, CHAR_BIT - 1);  // assumes width is a power of 2.

    unsigned char temp(0);
    for(unsigned i(0); i <= n; ++i)
    {
        temp = c & (mask >> i);
        c <<= i;
        c |= temp;

    }
    return c;
}


unsigned char RecHash6(char * word, unsigned char letter, size_t number, int* sum)
{
    if(number == 0)
        return 0;

    else
    {
        unsigned char res = rol(RecHash6(word, word[number-1], number-1, sum), 1) ^ word[number];
        (*sum) += res;
        return res;
    }

}

size_t Hash6(char* word, FILE* fout)
{
    int sum(0);

    size_t n = strlen(word);
    if(n>0)
    {
        RecHash6(word, word[n-1], n-1, &sum);
        return sum % n;
    }
    else
        return 0;
}
// 1 1 0 1 0 1 1 1    rol 3 ->    1 0 1 1 1 1 1 0
// 1 2 3 4 5 6 7 8

Node* lookup(char *name, int create, FILE* fout, size_t(*hashes)( char*, FILE*))
{//.intel_syntax noprefix

    long cmpflag(0);

    size_t size(0);
    Node *sym = nullptr;
    size_t h = hashes(name, fout);
    for (sym = symtab [h] ; sym != nullptr; sym = sym->next)
    {
        cmpflag = 0;
        asm(
        R"(
            .intel_syntax noprefix
   loop:

            cmpsb
            jne End

            mov al, [rsi - 1]
            cmp al, 0
            jne loop

   End:
            xor rax, rax
            mov al, [rdi - 1]
            sub al, [rsi - 1]
            mov %0, rax
            .att_syntax prefix
            )"
        : "=r"(cmpflag)
        : "D"(name), "S"(sym->name)
        : "%rax"

        );

       /* if(!strcmp(name, sym->name))
        {
            return sym;
        }*/
        if(!cmpflag)
            return sym;

        size++;
    }
    if (create) {
        sym = AddElem(sym, name, h, size);
    }
    return sym;
}


Node* AddElem(Node* sym, char* name, size_t h, size_t size)
{
    sym = (Node *) calloc(1, sizeof(Node));
    sym->name =  name;
    sym->next =  symtab[h];
    symtab[h] =  sym;
    symtab[h]->size = size;
    return sym;
}


size_t sizeof_file(FILE* fin)
{
    fseek(fin, 0, SEEK_END);

    size_t size((size_t)ftell(fin));

    fseek(fin, 0, SEEK_SET);

    assert(size);

    return size;

}



char* FileEdit(FILE* fin, size_t size, size_t* count_words)
{
    auto* buff = (char*)calloc(size, sizeof(char));

    fread(buff, sizeof(char), size, fin);

    buff[size - 1] = '\0';

    //size_t count_words(0);
    for(size_t i(1); i < size; i++)
    {
        if(( (i > 0) && (buff[i-1]!='\0') && (!ispunct(buff[i-1])) && (isspace(buff[i]))) || ((i > 0) && (ispunct(buff[i])) && (buff[i-1] != '\0') && (!isspace(buff[i - 1]))))
        {
            buff[i] = '\0';
            (*count_words)++;
        }
        if((isspace(buff[i])) || (ispunct(buff[i])) || (buff[i] == '|') || (buff[i] == '\n'))
            buff[i] = '\0';
        if((i < size - 1) && (buff[i] == '\'') && (buff[i + 1] == 's'))
            buff[i+1] = '\0';
        buff[i] = (char)tolower(buff[i]);
    }

    return buff;
}
//     word, word
//     word ,word
//     word word
//     word's word
//     word,EOF


/*
size_t Count_words(char* buff, size_t size, FILE* fout)
{
    size_t count_words(0);
    for(int i(0); i < size; i++)
    {
        if(buff[i] == '\0') {
            count_words++;
        }
    }

   // count_words++;

    fprintf(fout, "Count of words = %ld\n", count_words);
    return count_words;
}
*/

void PrintData(size_t count_words, std::vector<char*> &point_arr, FILE* res, FILE* fout, size_t(*hashes)(char*, FILE*), size_t number)
{
    if(number != 0)
        fprintf(res, "\nH[%lu];", number);
    /*for(int i = 0; i < count_words; ++i)
    {

        fprintf(fout, "Vec[%d] = %s\n", i, point_arr[i]);
    }*/


    for(size_t i(0); i < count_words; i++)
    {
        lookup(point_arr[i], 1, fout, hashes);
    }


    size_t elem_numb(0);

    for(size_t i(0);i < TABLESIZE; i++)
    {
        if(symtab[i])
        {
            fprintf(fout, "SYMTAB[i]->size = %lu\n", symtab[i]->size);
            elem_numb = 0;
            elem_numb = search(symtab[i], i, elem_numb, fout, res);
            fprintf(res, "%lu; ", elem_numb);
        } else{
            fprintf(res, "%d; ", 0);
        }
    }
}

size_t search(Node* node, size_t number, size_t elem_numb, FILE* fout, FILE* res)
{
    if(node->name)
    {
        elem_numb ++;
        fprintf(fout, "in table [%lu] = %s, size = %lu\n", number, node->name, node->size);
        if(node->next)
        {
            search(node->next, number, elem_numb, fout, res);
        }
        else
            return elem_numb;
    }

}

//     word, word
//     word ,word
//     word word
//     word's word
//     word | word
//     word,EOF
//     word,--\n

std::vector<char*> & PutInArray(char* buff, size_t size, std::vector<char*> & point_arr ,FILE* fout)
{

    point_arr[0] = &buff[0];

    size_t count_words(1);
    for(size_t i(0); i < size - 1; ++i)
    {
        if((buff[i] == '\0') && (i < size - 2))
        {
            while((i < size - 2) && (buff[i] == '\0'))
            {
                i++;
            }
            point_arr[count_words] = &buff[i];
            count_words++;
        }
    }
    /*for(int i = 0; i < count_words; ++i)
    {

        fprintf(fout, "Vec[%d] = %s\n", i, point_arr[i]);
    }*/
    return point_arr;
}


void show_vector( std::vector<char*> & point_arr, FILE* fout)
{
    for (const auto &it: point_arr)
        fprintf(fout, "Point_arr = %s\n", it);
}
