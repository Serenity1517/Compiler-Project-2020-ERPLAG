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
#ifndef lexer
#define lexer

#include "lexerDef.h"

//char keywords[33][15]={"integer","real","boolean","of","array","start","end","declare","module","driver","program","record","tagged","union","get_value","print","use","with","parameters","true","false","takes","input","returns","AND","OR","for","in","switch","case","break","default","while"};
//char tokens[33][15]={"INTEGER","REAL","BOOLEAN","OF","ARRAY","START","END","DECLARE","MODULE","DRIVER","PROGRAM","RECORD","TAGGED","UNION","GET_VALUE","PRINT","USE","WITH","PARAMETERS","TRUE","FALSE","TAKES","INPUT","RETURNS","AND","OR","FOR","IN","SWITCH","CASE","BREAK","DEFAULT","WHILE", "DRIVERDEF", "DRIVERENDDEF"};

FILE* getStream(FILE* fp, char *buffer, int buff_size);
TokenDetails* getNextToken(FILE *fileptr);

void refreshBuffer(char *buff, int buff_len);
float findValue(char *arr);
int hashFunction(char *arr);
void fillKeywordsHashTable();
int lookup(char *identifier, HashTableEntry **hash_table);
void removeComments(char *testcaseFile);
void testLexer(char *filename);
void printOnConsole();

#endif

