/*
 * Group no. 50
 * Aniruddha Mahajan -------- 2017A7PS0145P
 * Ravindra Singh Shekhawat - 2017A7PS0146P
 * Shreyas Srikrishna ------- 2017A7PS0162P
 * Chetan Sharma ------------ 2017A7PS0182P
 */

#ifndef symboltable
#define symboltable

#define NO_OF_AST_NODE_TYPES 21

#include "symboltableDef.h"
#include "semantic.h"
#include "semanticDef.h"

int computeStringHash(char* s);
int computeBlockHash(Block* b);
SymbolTable* createSymbolTable(SymbolTableType type);
SymbolTableEntry* createSymbolTableEntry(Symbol* s, SymbolForm f);
SymbolTableEntry* lookupString(char* s, SymbolTable* table, SymbolForm f, bool deepSearch, int lineNo);
SymbolTableEntry* lookupBlock(Block* b, SymbolTable* table, SymbolForm f, bool deepSearch);
SymbolTableEntry* checkForOutputParamOverloading(char* s, SymbolTable* table);
void recursiveCheckOverload(ASTNode *node, SymbolTable *table,ListOfErrors *sematicErrors);
void processAST(ASTNode* node, SymbolTable* curr, ListOfErrors* semanticErrors);

void checkSymbolTable(ListOfErrors* semanticErrors);
SymbolTable* getsymbolTable();

#endif
