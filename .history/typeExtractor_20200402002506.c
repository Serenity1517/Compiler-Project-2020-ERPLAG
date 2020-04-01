/*
 * Group no. 50
 * Aniruddha Mahajan -------- 2017A7PS0145P
 * Ravindra Singh Shekhawat - 2017A7PS0146P
 * Shreyas Srikrishna ------- 2017A7PS0162P
 * Chetan Sharma ------------ 2017A7PS0182P
 */

#include "typeExtractor.h"
#include "semanticDef.h"
#include "astDef.h"
#include <string.h>

#define sc startChild
#define rs rightSibling

//returns pointer to object of type Typeof
//NOTE: pass l and h as -1,-1 in case you need a primitive object
Typeof* createTypeof(VariableTypeTag tag1, PrimitiveType tag2, int l, int h, Typeof* arr, int index){
    if(tag1 == primitive){
        if(arr != NULL){
            arr[index].tag = primitive;
            arr[index].type.primitiveType = tag2;
            return arr;
        }
        else{
            Typeof* t = (Typeof*)malloc(sizeof(Typeof));
            t->tag = primitive;
            t->type.primitiveType = tag2;
            return t;
        }
    }
    else if(tag1 == array){
        if(arr != NULL){
            arr[index].tag = array;
            arr[index].type.arrayType.high = h;
            arr[index].type.arrayType.low = l;
            arr[index].type.arrayType.t = tag2;
            return arr;
        }
        else{
            Typeof* t = (Typeof*)malloc(sizeof(Typeof));
            t->tag = array;
            t->type.arrayType.high = h;
            t->type.arrayType.low = l;
            t->type.arrayType.t = tag2;
            return t;
        }
    }
    else{
        return NULL;
    }
    
}

//tells the type of the identifier being declared. might be int/real/boolean/array
//param : node : ASTNode of type declareNode
Typeof* extractTypeOfId(ASTNode* node){
    
    ASTNode *temp = node->sc->rs;   
    if(temp->type == arrayIdNode)
    {
        if(temp->sc->sc->type == idNode) // low id
        {
            temp = temp->sc;
            int high = temp->sc->rs->node.numNode.value;
            temp = temp->rs;
            if(strcmp(temp->node.typeNode.token,"INTEGER")==0)
            {
                Typeof* typeofnode = createTypeof(array,integer,high,-1,NULL,-1);
                node->node.declareNode.typeOfId = *typeofnode; 
                return typeofnode;
            }
            else if(strcmp(temp->node.typeNode.token,"REAL")==0)
            {
                Typeof* typeofnode = createTypeof(array,real,high,-1,NULL,-1);
                node->node.declareNode.typeOfId = *typeofnode;
                return typeofnode;
            }
            else if(strcmp(temp->node.typeNode.token,"BOOLEAN")==0)
            {
                Typeof* typeofnode = createTypeof(array,boolean,high,-1,NULL,-1);
                node->node.declareNode.typeOfId = *typeofnode;
                return typeofnode;
            }
            else
            {
                return -1;        
            }
        }
        else if(temp->sc->sc->rs->type == idNode) // high id
        {
            temp = temp->sc;
            int low = temp->sc->node.numNode.value;
            temp = temp->rs;
            if(strcmp(temp->node.typeNode.token,"INTEGER")==0)
            {
                Typeof* typeofnode = createTypeof(array,integer,-1,low,NULL,-1);
                node->node.declareNode.typeOfId = *typeofnode;
                return typeofnode;
            }
            else if(strcmp(temp->node.typeNode.token,"REAL")==0)
            {
                Typeof* typeofnode = createTypeof(array,real,-1,low,NULL,-1);
                node->node.declareNode.typeOfId = *typeofnode;
                return typeofnode;
            }
            else if(strcmp(temp->node.typeNode.token,"BOOLEAN")==0)
            {
                Typeof* typeofnode = createTypeof(array,boolean,-1,low,NULL,-1);
                node->node.declareNode.typeOfId = *typeofnode;
                return typeofnode;
            }
            else
            {
                return -1;        
            }
        }           
        else
        {
            temp = temp->sc;
            int high = temp->sc->node.numNode.value;
            int low = temp->sc->rs->node.numNode.value;
            temp =temp->rs;
            if(strcmp(temp->node.typeNode.token,"INTEGER")==0)
            {
                Typeof* typeofnode = createTypeof(array,integer,high,low,NULL,-1);
                node->node.declareNode.typeOfId = *typeofnode;
                return typeofnode;
            }
            else if(strcmp(temp->node.typeNode.token,"REAL")==0)
            {
                Typeof* typeofnode = createTypeof(array,real,high,low,NULL,-1);
                node->node.declareNode.typeOfId = *typeofnode;
                return typeofnode;
            }
            else if(strcmp(temp->node.typeNode.token,"BOOLEAN")==0)
            {
                Typeof* typeofnode = createTypeof(array,boolean,high,low,NULL,-1);
                node->node.declareNode.typeOfId = *typeofnode;
                return typeofnode;
            }
            else
            {
                return -1;        
            }
        }
       
    }
    else if(temp->type == typeNode)
    {
        if(strcmp(temp->node.typeNode.token,"INTEGER")==0)
        {
            Typeof* typeofnode = createTypeof(primitive,integer,-1,-1,NULL,-1);
            node->node.declareNode.typeOfId = *typeofnode;
            return typeofnode;
        }
        else if(strcmp(temp->node.typeNode.token,"REAL")==0)
        {
            Typeof* typeofnode = createTypeof(primitive,real,-1,-1,NULL,-1);
            node->node.declareNode.typeOfId = *typeofnode;
            return typeofnode;
        }
        else if(strcmp(temp->node.typeNode.token,"BOOLEAN")==0)
        {
            Typeof* typeofnode = createTypeof(primitive,boolean,-1,-1,NULL,-1);
            node->node.declareNode.typeOfId = *typeofnode;
            return typeofnode;
        }
        else
        {
            return -1;
        }
    }
    else
    {
        return -1;            
    }
    return -1;
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
        if(inputs->sc->rs->type == typeNode){
            if(strcmp(inputs->sc->rs->node.typeNode.token, "BOOLEAN")==0)
                inputType = createTypeof(primitive, boolean, -1, -1, inputType, i);
            else if(strcmp(outputs->sc->rs->node.typeNode.token, "REAL")==0)
                inputType = createTypeof(primitive, real, -1, -1, inputType, i);
            else if(strcmp(outputs->sc->rs->node.typeNode.token, "INTEGER")==0)
                inputType = createTypeof(primitive, integer, -1, -1, inputType, i);
            else
                return NULL;
        }
        else if(inputs->sc->rs->type == arrayTypeNode){
            int lower = inputs->sc->rs->sc->sc->node.numNode.value;
            int higher = inputs->sc->rs->sc->sc->rs->node.numNode.value;
            if(strcmp(inputs->sc->rs->sc->rs->node.typeNode.token, "BOOLEAN")==0){
                if(inputs->sc->rs->sc->sc->type == numNode && inputs->sc->rs->sc->sc->rs->type == numNode)
                    inputType = createTypeof(array, boolean, lower, higher, inputType, i);
                else if(inputs->sc->rs->sc->sc->type == numNode && inputs->sc->rs->sc->sc->rs->type == idNode)
                    inputType = createTypeof(array, boolean, lower, -1, inputType, i);
                else if(inputs->sc->rs->sc->sc->type == idNode && inputs->sc->rs->sc->sc->rs->type == numNode)
                    inputType = createTypeof(array, boolean, -1, higher, inputType, i);
                else if(inputs->sc->rs->sc->sc->type == idNode && inputs->sc->rs->sc->sc->rs->type == idNode)
                    inputType = createTypeof(array, boolean, -1, -1, inputType, i);
                else
                    return NULL;
            }   
            else if(strcmp(inputs->sc->rs->sc->rs->node.typeNode.token, "REAL")==0){
                if(inputs->sc->rs->sc->sc->type == numNode && inputs->sc->rs->sc->sc->rs->type == numNode)
                    inputType = createTypeof(array, real, lower, higher, inputType, i);
                else if(inputs->sc->rs->sc->sc->type == numNode && inputs->sc->rs->sc->sc->rs->type == idNode)
                    inputType = createTypeof(array, real, lower, -1, inputType, i);
                else if(inputs->sc->rs->sc->sc->type == idNode && inputs->sc->rs->sc->sc->rs->type == numNode)
                    inputType = createTypeof(array, real, -1, higher, inputType, i);
                else if(inputs->sc->rs->sc->sc->type == idNode && inputs->sc->rs->sc->sc->rs->type == idNode)
                    inputType = createTypeof(array, real, -1, -1, inputType, i);
                else
                    return NULL;
            } 
            else if(strcmp(inputs->sc->rs->sc->rs->node.typeNode.token, "INTEGER")==0){
                if(inputs->sc->rs->sc->sc->type == numNode && inputs->sc->rs->sc->sc->rs->type == numNode)
                    inputType = createTypeof(array, integer, lower, higher, inputType, i);
                else if(inputs->sc->rs->sc->sc->type == numNode && inputs->sc->rs->sc->sc->rs->type == idNode)
                    inputType = createTypeof(array, integer, lower, -1, inputType, i);
                else if(inputs->sc->rs->sc->sc->type == idNode && inputs->sc->rs->sc->sc->rs->type == numNode)
                    inputType = createTypeof(array, integer, -1, higher, inputType, i);
                else if(inputs->sc->rs->sc->sc->type == idNode && inputs->sc->rs->sc->sc->rs->type == idNode)
                    inputType = createTypeof(array, integer, -1, -1, inputType, i);
                else
                    return NULL;
            }
            else
                return NULL;  
        }
        else
            return NULL;
        inputs = inputs->next;
    }

    //populate outputType array. NOTE: outputParameters cannot be Arrays
    for(i=0; i<no_of_outputs; i++){
        if(strcmp(outputs->sc->rs->node.typeNode.token, "BOOLEAN")==0)
            outputType = createTypeof(primitive, boolean, -1, -1, outputType, i);
        else if(strcmp(outputs->sc->rs->node.typeNode.token, "REAL")==0)
            outputType = createTypeof(primitive, real, -1, -1, outputType, i);
        else if(strcmp(outputs->sc->rs->node.typeNode.token, "INTEGER")==0)
            outputType = createTypeof(primitive, integer, -1, -1, outputType, i);
        else
            return NULL;
        outputs = outputs->next;
    }
    
    functionType->inputList = inputType;
    functionType->outputList = outputType;
    node->node.moduleNode.typeOfFunc = functionType;
    return functionType;
}

//extracts type of an expression, and also sets appropriate field in the AST's opNode
//param : node: ASTNode of type opNode
PrimitiveType extractTypeOfExpression(ASTNode *node)
{
    if(strcmp(node->node.opNode.token,"PLUS")==0){
        //if left child and right child are opnode
            //call extract type of expr on left and right
            //now check their types and assign appropriate type to node
        //else if left child is opnode and right child is nullnode 
            //call extract type of expr on left, assign this type to node
        //else if left 
    }
    else if(strcmp(node->node.opNode.token,"MINUS")==0){

    }
    else if(strcmp(node->node.opNode.token,"MUL")==0){ 

    }
    else if(strcmp(node->node.opNode.token,"DIV")==0){

    }
    else if(strcmp(node->node.opNode.token, "LT")==0){  

    }
    else if(strcmp(node->node.opNode.token, "LE")==0){

    }
    else if(strcmp(node->node.opNode.token, "GT")==0){

    }
    else if(strcmp(node->node.opNode.token, "GE")==0){

    }
    else if(strcmp(node->node.opNode.token, "EQ")==0){

    }
    else if(strcmp(node->node.opNode.token, "NE")==0){

    }
    else if(strcmp(node->node.opNode.token,"AND")==0){

    }
    else if(strcmp(node->node.opNode.token, "OR")==0){

    }
    else{
        //node is not opnode
    }
}