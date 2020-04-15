/*
 * Group no. 50
 * Aniruddha Mahajan -------- 2017A7PS0145P
 * Ravindra Singh Shekhawat - 2017A7PS0146P
 * Shreyas Srikrishna ------- 2017A7PS0162P
 * Chetan Sharma ------------ 2017A7PS0182P
 */
#ifndef codeGeneration
#define codeGeneration

#include "lexer.h"
#include "semanticDef.h"
#include "typeExtractorDef.h"
#include "astDef.h"
#include "symboltable.h"
#include "parser.h"

void codeGen(ASTNode* node, SymbolTable* table, FILE* file, PrimitiveType arithExprType, int* currTempNo);
void codeGenControl(ASTNode* root, SymbolTable* table, char* fileName);

#endif   