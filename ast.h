/*
 * Group no. 50
 * Aniruddha Mahajan -------- 2017A7PS0145P
 * Ravindra Singh Shekhawat - 2017A7PS0146P
 * Shreyas Srikrishna ------- 2017A7PS0162P
 * Chetan Sharma ------------ 2017A7PS0182P
 */
#ifndef ast
#define ast

#include "astDef.h"
#include "parser.h"

//Main Required Functions 
struct ASTNode* createASTNode(NodeType type);
void createAST(ParseTreeNode *node);
int getCompressionRatio();
ASTNode* getAST();
//For debugging
void printAST(ASTNode *root);

#endif     

