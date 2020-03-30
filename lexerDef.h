//Jai Mata Di
//Jai Shree Ram
//Jai Bhole

/*
 * Group no. 50
 * Aniruddha Mahajan -------- 2017A7PS0145P
 * Ravindra Singh Shekhawat - 2017A7PS0146P
 * Shreyas Srikrishna ------- 2017A7PS0162P
 * Chetan Sharma ------------ 2017A7PS0182P
 */
#ifndef lexerdef
#define lexerdef

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

typedef struct TokenDetails{        //Structure of a Token
    bool is_num;    //true if token is NUM, false if token is RNUM
    bool is_err;    //true if lexical error, false if not. Default value is false
    char token[20]; //stores the token of the corresponding lexeme
    char *lexeme;  // stores the lexeme
    int line_no;        //stores the line number in which the token is found
    float value;  // stores the value of RNUM and NUM tokens 
    char *error;    //stores error message  in case of lexical error. NULL if no error
}TokenDetails;      

typedef struct HashTableEntry{      //Structure of a Hash Table Entry (in the keywords hashtable, NOT symboltable)
    char keyword_lex[30];       // name of the keyword
    int keyword_id;
    struct HashTableEntry *next;
}HashTableEntry;

#endif
