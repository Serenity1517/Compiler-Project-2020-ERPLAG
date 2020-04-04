/*
 * Group no. 50
 * Aniruddha Mahajan -------- 2017A7PS0145P
 * Ravindra Singh Shekhawat - 2017A7PS0146P
 * Shreyas Srikrishna ------- 2017A7PS0162P
 * Chetan Sharma ------------ 2017A7PS0182P
 */

#include "ast.h"
#include "symboltable.h"
#include "parser.h"
#include "lexer.h"
#include "functionCheck.h"

// f4,f6        isDeclared : [F,F,F,T,F,F,T]
// [ false,  ]

// currModule;

// f1  f2  f3  f4  driver  f5 f6
// 0   1   2   3   4       5   6
bool* isDeclared;

void initializeDeclaredList(ASTNode* root){
    
    isDeclared = (bool *)malloc(sizeof(bool)*root->node.programNode.noOfModules);
    ASTNode *traverse = root->

}

void checkModule(ASTNode* currModule, int* currSequenceNumber){

}