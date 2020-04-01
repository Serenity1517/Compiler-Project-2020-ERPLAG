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
#include "ast.h"

#define sc startChild
#define rs rightSibling

//tells the type of the identifier being declared. might be int/real/boolean/array
//param : node : ASTNode of type declareNode
Typeof extractTypeOfId(ASTNode* node){
    
    ASTNode *temp = node->sc;   
    if(node->sc->rs->type == arrayIdNode)
    {
        
    }
    else if(node->sc->rs->type == typeNode)
    {
        
    }
    else
    {
            
    }
    
    
}

//tells the type of a function(input/output parameter types)
//note: function cannot return array
//param : node : ASTNode of type moduleNode
FunctionType* extractTypeOfFunction(ASTNode* node){
    ASTNode* inputs = node->sc->rs;         //head of inputParamNodes list
    ASTNode* outputs = node->sc->rs->rs;    //head of outputParamNodes list. might be nullNode
    FunctionType* functionType = (FunctionType*)malloc(sizeof(FunctionType));
    
    //compute number of input parameters
    int no_of_inputs=0;
    while(inputs != NULL){
        no_of_inputs++;
        inputs = inputs->next;
    }
    inputs = node->sc->rs;
    
    //compute number of output parameters
    int no_of_outputs=0;
    if(outputs->type != nullNode){
        while(outputs != NULL){
            no_of_outputs++;
            outputs = outputs->next;
        }
    }
    outputs = node->sc->rs->rs;

    Typeof* inputType = (Typeof*)malloc(sizeof(Typeof)*no_of_inputs);
    Typeof* outputType = (Typeof*)malloc(sizeof(Typeof)*no_of_outputs);

    int i;
    //populate inputType array
    for(i=0; i<no_of_inputs; i++){

    }

    //populate outputType array
    for(i=0; i<no_of_outputs; i++){
        if(strcmp(outputs->sc->rs->node.typeNode.lexeme, "BOOLEAN"))
            outputType[i] = boolean;
        else if(strcmp(outputs->sc->rs->node.typeNode.lexeme, "BOOLEAN"))
    }
}