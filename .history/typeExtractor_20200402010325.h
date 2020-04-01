/*
 * Group no. 50
 * Aniruddha Mahajan -------- 2017A7PS0145P
 * Ravindra Singh Shekhawat - 2017A7PS0146P
 * Shreyas Srikrishna ------- 2017A7PS0162P
 * Chetan Sharma ------------ 2017A7PS0182P
 */

#ifndef typeExtractor
#define typeExtractor

#include "typeExtractorDef.h"
#include "ast.h"

Typeof* extractTypeOfId(ASTNode* node);
FunctionType* extractTypeOfFunction(ASTNode* node);
PrimitiveType extractTypeOfExpression(ASTNode *node);
bool checkArithExpressionType(PrimitiveType t1, PrimitiveType t2);
bool checkLogicalExpressionType(PrimitiveType t1, PrimitiveType t2);

#endif