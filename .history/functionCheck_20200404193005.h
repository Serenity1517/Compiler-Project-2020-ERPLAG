/*
 * Group no. 50
 * Aniruddha Mahajan -------- 2017A7PS0145P
 * Ravindra Singh Shekhawat - 2017A7PS0146P
 * Shreyas Srikrishna ------- 2017A7PS0162P
 * Chetan Sharma ------------ 2017A7PS0182P
 */
#include "lexer.h"
#include "parser.h"
#include "ast.h"
#include "symboltable.h"
#include "typeExtractor.h"

#ifndef functionCheck
#define functionCheck

int moduleSequenceMap(char* moduleName);
void populateModuleSequenceMap(ASTNode* root, SymbolTable* rootSymbolTable);
void initializeDeclaredList(ASTNode* root, SymbolTable* rootSymbolTable);
void checkModules(ASTNode* root, ListOfErrors* semanticErrors);
void processModule(ASTNode* modNode);
void processStmt(ASTNode* stmtNode);

#endif