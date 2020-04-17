/*
 * Group no. 50
 * Aniruddha Mahajan -------- 2017A7PS0145P
 * Ravindra Singh Shekhawat - 2017A7PS0146P
 * Shreyas Srikrishna ------- 2017A7PS0162P
 * Chetan Sharma ------------ 2017A7PS0182P
 */

#ifndef semantic
#define semantic

#include "semanticDef.h"

Error* createErrorObject();
ListOfErrors* getSemanticErrorObject();
void initializeErrorObject();
void semanticAnalyzer();
int countLeaves(ASTNode* node);
void analyzeAST(ASTNode* node, SymbolTable* table, ListOfErrors* semanticErrors);
Error* removeDuplicates(Error* head);
void printErrors(ListOfErrors *errors);
#endif