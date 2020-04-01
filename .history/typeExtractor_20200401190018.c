/*
 * Group no. 50
 * Aniruddha Mahajan -------- 2017A7PS0145P
 * Ravindra Singh Shekhawat - 2017A7PS0146P
 * Shreyas Srikrishna ------- 2017A7PS0162P
 * Chetan Sharma ------------ 2017A7PS0182P
 */

#include "typeExtractor.h"
#include "lexer.h"
#include "parser.h"

#define sc startChild
#define rs rightSibling

//tells the type of the identifier being declared. might be int/real/boolean/array
//param : node : ASTNode of type declareNode
Typeof extractTypeOfId(ASTNode* node){
    
    
}

//tells the type of a function(input/output parameter types)
//note: function cannot return array
//param : node : ASTNode of type moduleNode
FunctionType* extractTypeOfFunction(ASTNode* node){
    ASTNode* inputs = node->sc->rs
}