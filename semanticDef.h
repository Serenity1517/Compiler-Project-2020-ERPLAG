/*
 * Group no. 50
 * Aniruddha Mahajan -------- 2017A7PS0145P
 * Ravindra Singh Shekhawat - 2017A7PS0146P
 * Shreyas Srikrishna ------- 2017A7PS0162P
 * Chetan Sharma ------------ 2017A7PS0182P
 */

#ifndef semanticDef
#define semanticDef

//structure for semantic error
typedef struct Error{
    struct Error* next;     //next error object in linkedlist
    char error[50];
    int lineNo;
}Error;

//structure for linkedlist of semantic errors
typedef struct ListOfErrors{
    struct Error* head;
    int numberOfErr;
}ListOfErrors;

#endif