/*
 * Group no. 50
 * Aniruddha Mahajan -------- 2017A7PS0145P
 * Ravindra Singh Shekhawat - 2017A7PS0146P
 * Shreyas Srikrishna ------- 2017A7PS0162P
 * Chetan Sharma ------------ 2017A7PS0182P
 */

#include "lexer.h"
#include "typeExtractor.h"
#include "semanticDef.h"
#include "symboltable.h"
#include "astDef.h"
#include "semanticDef.h"
#include <string.h>

#define sc startChild
#define rs rightSibling


//returns pointer to object of type Typeof
//NOTE: pass l, h, left, right as -1,-1, NULL, NULL in case you need a primitive object
//NOTE: pass l OR h as -1, whichever is represented dynamically
//NOTE: pass the name of the identifier in left,right in case of dynamic arrays
Typeof* createTypeof(VariableTypeTag tag1, PrimitiveType tag2, int l, int h, char* left, char* right, Typeof* arr, int index){
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
            if(left == NULL)
                refreshBuffer(arr[index].type.arrayType.left, 21);
            else
                strcpy(arr[index].type.arrayType.left, left);
            if(right == NULL)
                refreshBuffer(arr[index].type.arrayType.right, 21);
            else
                strcpy(arr[index].type.arrayType.right, right);
                
            return arr;
        }
        else{
            Typeof* t = (Typeof*)malloc(sizeof(Typeof));
            t->tag = array;
            t->type.arrayType.high = h;
            t->type.arrayType.low = l;
            t->type.arrayType.t = tag2;
            if(left == NULL)
                refreshBuffer(t->type.arrayType.left, 21);
            else
                strcpy(t->type.arrayType.left, left);
            if(right == NULL)
                refreshBuffer(t->type.arrayType.right, 21);
            else
                strcpy(t->type.arrayType.right, right);
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
    if(temp->type == arrayTypeNode)
    {
        if(temp->sc->sc->type == idNode && temp->sc->sc->rs->type == numNode) // low id
        {
            temp = temp->sc;
            int high = temp->sc->rs->node.numNode.value;
            temp = temp->rs;
            if(strcmp(temp->node.typeNode.token,"INTEGER")==0)
            {
                Typeof* typeofnode = createTypeof(array,integer,high,-1,NULL,node->sc->rs->sc->sc->node.idnode.lexeme,NULL,-1);
                node->node.declareNode.typeOfId = *typeofnode; 
                return typeofnode;
            }
            else if(strcmp(temp->node.typeNode.token,"REAL")==0)
            {
                Typeof* typeofnode = createTypeof(array,real,high,-1,NULL,node->sc->rs->sc->sc->node.idnode.lexeme,NULL,-1);
                node->node.declareNode.typeOfId = *typeofnode;
                return typeofnode;
            }
            else if(strcmp(temp->node.typeNode.token,"BOOLEAN")==0)
            {
                Typeof* typeofnode = createTypeof(array,boolean,high,-1,NULL,node->sc->rs->sc->sc->node.idnode.lexeme,NULL,-1);
                node->node.declareNode.typeOfId = *typeofnode;
                return typeofnode;
            }
            else
            {
                return NULL;        
            }
        }
        else if(temp->sc->sc->rs->type == idNode && temp->sc->sc->type == numNode) // high id
        {
            temp = temp->sc;
            int low = temp->sc->node.numNode.value;
            temp = temp->rs;
            if(strcmp(temp->node.typeNode.token,"INTEGER")==0)
            {
                Typeof* typeofnode = createTypeof(array,integer,-1,low,node->sc->rs->sc->sc->node.idnode.lexeme,NULL,NULL,-1);
                node->node.declareNode.typeOfId = *typeofnode;
                return typeofnode;
            }
            else if(strcmp(temp->node.typeNode.token,"REAL")==0)
            {
                Typeof* typeofnode = createTypeof(array,real,-1,low,node->sc->rs->sc->sc->node.idnode.lexeme,NULL,NULL,-1);
                node->node.declareNode.typeOfId = *typeofnode;
                return typeofnode;
            }
            else if(strcmp(temp->node.typeNode.token,"BOOLEAN")==0)
            {
                Typeof* typeofnode = createTypeof(array,boolean,-1,low,node->sc->rs->sc->sc->node.idnode.lexeme,NULL,NULL,-1);
                node->node.declareNode.typeOfId = *typeofnode;
                return typeofnode;
            }
            else
            {
                return NULL;        
            }
        }           
        else if(temp->sc->sc->rs->type == idNode && temp->sc->sc->type == idNode){  //if both are id
            /*int high = temp->sc->node.numNode.value;
            int low = temp->sc->rs->node.numNode.value;*/
            //temp =temp->rs;
            if(strcmp(temp->rs->node.typeNode.token,"INTEGER")==0)
            {
                Typeof* typeofnode = createTypeof(array,integer,-1,-1,temp->sc->node.idnode.lexeme,temp->sc->rs->node.idnode.lexeme,NULL,-1);
                node->node.declareNode.typeOfId = *typeofnode;
                return typeofnode;
            }
            else if(strcmp(temp->rs->node.typeNode.token,"REAL")==0)
            {
                Typeof* typeofnode = createTypeof(array,real,-1,-1,temp->sc->node.idnode.lexeme,temp->sc->rs->node.idnode.lexeme,NULL,-1);
                node->node.declareNode.typeOfId = *typeofnode;
                return typeofnode;
            }
            else if(strcmp(temp->rs->node.typeNode.token,"BOOLEAN")==0)
            {
                Typeof* typeofnode = createTypeof(array,boolean,-1,-1,temp->sc->node.idnode.lexeme,temp->sc->rs->node.idnode.lexeme,NULL,-1);
                node->node.declareNode.typeOfId = *typeofnode;
                return typeofnode;
            }
            else
            {
                return NULL;        
            }
        }
        else    //if both are num
        {
            temp = temp->sc;
            int high = temp->sc->node.numNode.value;
            int low = temp->sc->rs->node.numNode.value;
            temp =temp->rs;
            if(strcmp(temp->node.typeNode.token,"INTEGER")==0)
            {
                Typeof* typeofnode = createTypeof(array,integer,high,low,NULL,NULL,NULL,-1);
                node->node.declareNode.typeOfId = *typeofnode;
                return typeofnode;
            }
            else if(strcmp(temp->node.typeNode.token,"REAL")==0)
            {
                Typeof* typeofnode = createTypeof(array,real,high,low,NULL,NULL,NULL,-1);
                node->node.declareNode.typeOfId = *typeofnode;
                return typeofnode;
            }
            else if(strcmp(temp->node.typeNode.token,"BOOLEAN")==0)
            {
                Typeof* typeofnode = createTypeof(array,boolean,high,low,NULL,NULL,NULL,-1);
                node->node.declareNode.typeOfId = *typeofnode;
                return typeofnode;
            }
            else
            {
                return NULL;        
            }
        }
       
    }
    else if(temp->type == typeNode)
    {
        if(strcmp(temp->node.typeNode.token,"INTEGER")==0)
        {
            Typeof* typeofnode = createTypeof(primitive,integer,-1,-1,NULL, NULL, NULL,-1);
            node->node.declareNode.typeOfId = *typeofnode;
            return typeofnode;
        }
        else if(strcmp(temp->node.typeNode.token,"REAL")==0)
        {
            Typeof* typeofnode = createTypeof(primitive,real,-1,-1,NULL, NULL, NULL,-1);
            node->node.declareNode.typeOfId = *typeofnode;
            return typeofnode;
        }
        else if(strcmp(temp->node.typeNode.token,"BOOLEAN")==0)
        {
            Typeof* typeofnode = createTypeof(primitive,boolean,-1,-1,NULL, NULL, NULL,-1);
            node->node.declareNode.typeOfId = *typeofnode;
            return typeofnode;
        }
        else
        {
            return NULL;
        }
    }
    else
    {
        return NULL;            
    }
    return NULL;
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
    functionType->noOfInputs = no_of_inputs;

    //compute number of output parameters
    int no_of_outputs=0;
    if(outputs->type != nullNode){
        while(outputs != NULL){
            no_of_outputs++;
            outputs = outputs->next;
        }
    }
    outputs = node->sc->rs->rs;
    functionType->noOfOutputs = no_of_outputs;

    Typeof* inputType = (Typeof*)malloc(sizeof(Typeof)*no_of_inputs);
    Typeof* outputType = (Typeof*)malloc(sizeof(Typeof)*no_of_outputs);

    int i;
    //populate inputType array
    for(i=0; i<no_of_inputs; i++){
        if(inputs->sc->rs->type == typeNode){
            if(strcmp(inputs->sc->rs->node.typeNode.token, "BOOLEAN")==0)
                inputType = createTypeof(primitive, boolean, -1, -1, NULL, NULL, inputType, i);
            else if(strcmp(outputs->sc->rs->node.typeNode.token, "REAL")==0)
                inputType = createTypeof(primitive, real, -1, -1, NULL, NULL, inputType, i);
            else if(strcmp(outputs->sc->rs->node.typeNode.token, "INTEGER")==0)
                inputType = createTypeof(primitive, integer, -1, -1, NULL, NULL, inputType, i);
            else
                return NULL;
        }
        else if(inputs->sc->rs->type == arrayTypeNode){
            int lower = inputs->sc->rs->sc->sc->node.numNode.value;
            int higher = inputs->sc->rs->sc->sc->rs->node.numNode.value;
            if(strcmp(inputs->sc->rs->sc->rs->node.typeNode.token, "BOOLEAN")==0){
                if(inputs->sc->rs->sc->sc->type == numNode && inputs->sc->rs->sc->sc->rs->type == numNode)
                    inputType = createTypeof(array, boolean, lower, higher, NULL, NULL, inputType, i);
                else if(inputs->sc->rs->sc->sc->type == numNode && inputs->sc->rs->sc->sc->rs->type == idNode)
                    inputType = createTypeof(array, boolean, lower, -1, NULL, inputs->sc->rs->sc->sc->rs->node.idnode.lexeme, inputType, i);
                else if(inputs->sc->rs->sc->sc->type == idNode && inputs->sc->rs->sc->sc->rs->type == numNode)
                    inputType = createTypeof(array, boolean, -1, higher, inputs->sc->rs->sc->sc->node.idnode.lexeme, NULL, inputType, i);
                else if(inputs->sc->rs->sc->sc->type == idNode && inputs->sc->rs->sc->sc->rs->type == idNode)
                    inputType = createTypeof(array, boolean, -1, -1, inputs->sc->rs->sc->sc->node.idnode.lexeme, inputs->sc->rs->sc->sc->rs->node.idnode.lexeme, inputType, i);
                else
                    return NULL;
            }   
            else if(strcmp(inputs->sc->rs->sc->rs->node.typeNode.token, "REAL")==0){
                if(inputs->sc->rs->sc->sc->type == numNode && inputs->sc->rs->sc->sc->rs->type == numNode)
                    inputType = createTypeof(array, real, lower, higher, NULL, NULL, inputType, i);
                else if(inputs->sc->rs->sc->sc->type == numNode && inputs->sc->rs->sc->sc->rs->type == idNode)
                    inputType = createTypeof(array, real, lower, -1, NULL, inputs->sc->rs->sc->sc->rs->node.idnode.lexeme, inputType, i);
                else if(inputs->sc->rs->sc->sc->type == idNode && inputs->sc->rs->sc->sc->rs->type == numNode)
                    inputType = createTypeof(array, real, -1, higher, inputs->sc->rs->sc->sc->node.idnode.lexeme, NULL, inputType, i);
                else if(inputs->sc->rs->sc->sc->type == idNode && inputs->sc->rs->sc->sc->rs->type == idNode)
                    inputType = createTypeof(array, real, -1, -1, inputs->sc->rs->sc->sc->node.idnode.lexeme, inputs->sc->rs->sc->sc->rs->node.idnode.lexeme, inputType, i);
                else
                    return NULL;
            } 
            else if(strcmp(inputs->sc->rs->sc->rs->node.typeNode.token, "INTEGER")==0){
                if(inputs->sc->rs->sc->sc->type == numNode && inputs->sc->rs->sc->sc->rs->type == numNode)
                    inputType = createTypeof(array, integer, lower, higher, NULL, NULL, inputType, i);
                else if(inputs->sc->rs->sc->sc->type == numNode && inputs->sc->rs->sc->sc->rs->type == idNode)
                    inputType = createTypeof(array, integer, lower, -1, NULL, inputs->sc->rs->sc->sc->rs->node.idnode.lexeme, inputType, i);
                else if(inputs->sc->rs->sc->sc->type == idNode && inputs->sc->rs->sc->sc->rs->type == numNode)
                    inputType = createTypeof(array, integer, -1, higher, inputs->sc->rs->sc->sc->node.idnode.lexeme, NULL, inputType, i);
                else if(inputs->sc->rs->sc->sc->type == idNode && inputs->sc->rs->sc->sc->rs->type == idNode)
                    inputType = createTypeof(array, integer, -1, -1, inputs->sc->rs->sc->sc->node.idnode.lexeme, inputs->sc->rs->sc->sc->rs->node.idnode.lexeme, inputType, i);
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
            outputType = createTypeof(primitive, boolean, -1, -1, NULL, NULL, outputType, i);
        else if(strcmp(outputs->sc->rs->node.typeNode.token, "REAL")==0)
            outputType = createTypeof(primitive, real, -1, -1, NULL, NULL, outputType, i);
        else if(strcmp(outputs->sc->rs->node.typeNode.token, "INTEGER")==0)
            outputType = createTypeof(primitive, integer, -1, -1, NULL, NULL, outputType, i);
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
//it also performs a semantic check whether the variables used in expression 
//param : node: ASTNode of type opNode or ASTNode of type idNode/numNode/boolNode
//it returns -1 in case of a semantic error
PrimitiveType extractTypeOfExpression(ASTNode* node, SymbolTable* currTable, ListOfErrors* semanticErrors)
{
    
    if(node->sc == NULL){   //leaf node case
        switch(node->type){
            case boolNode:{
                return boolean;
                break;
            }
            case numNode:{
                if(strcmp(node->node.numNode.token, "NUM")==0)
                    return integer;
                else
                    return real;                
                break;
            }
            case idNode:{
                //lookup type(obtain Typeof object)
                SymbolTableEntry *sym = lookupString(node->node.idnode.lexeme,currTable,idEntry,true);
                    if(sym == NULL) 
                    { 
                        // semantic error
                        Error *err = (Error *)malloc(sizeof(Error));
                        err->next = NULL;
                        err->lineNo = node->node.idnode.line_no;
                        strcpy(err->error,"\nVariable used in this expression has not been declared. line no");
                        printf("\n%s",err->error);
                        Error *temporary = semanticErrors->head;
                        while(temporary->next != NULL)
                        {
                            temporary = temporary->next;
                        }  
                        temporary->next = err;
                        semanticErrors->numberOfErr += 1;
                        return -1;
                    }
                    else if(sym->symbol.idEntry.node->node.idnode.line_no >= node->node.idnode.line_no)
                    {
                        //sematic error
                        Error *err = (Error *)malloc(sizeof(Error));
                        err->next = NULL;
                        err->lineNo = node->node.idnode.line_no;
                        strcpy(err->error,"\nVariable used in this expression has been declared later. line no");
                        printf("\n%s",err->error);
                        Error *temporary = semanticErrors->head;
                        while(temporary->next != NULL)
                        {
                            temporary = temporary->next;
                        }  
                        temporary->next = err;
                        semanticErrors->numberOfErr += 1;
                        return -1;
                    } 
                    else
                    { 
                        //else
                        if(sym->symbol.idEntry.type.tag == primitive){//if Typeof.tag is primitive, no problem
                            return sym->symbol.idEntry.type.type.primitiveType;    
                        }
                        else    //type.tag == array
                        {
                            //else if Typeof.tag is array, semantic error(mam's  rule 6.6)    
                            Error* err = (Error*)malloc(sizeof(Error));
                            err->next = NULL;
                            err->lineNo = node->node.idnode.line_no;
                            strcpy(err->error,"\nCannot use Array variable in expression");
                            printf("\n%s",err->error);
                            Error *temporary = semanticErrors->head;
                            while(temporary->next != NULL)
                            {
                                temporary = temporary->next;
                            }  
                            temporary->next = err;
                            semanticErrors->numberOfErr += 1;
                            return -1;
                        }
                    }
                break;
            }
        }
    }

    if(node->type == arrayIdNode){
        //2 cases: a[b] OR a[3]
        if(node->sc->rs->type == idNode){   //a[b] case
            SymbolTableEntry* sym = lookupString(node->sc->node.idnode.lexeme,currTable, idEntry, true);
            //1.check if a is declared or not
            if(sym == NULL){
                Error *err = (Error*)malloc(sizeof(Error));
                err->next = NULL; err->lineNo = node->node.idnode.line_no; strcpy(err->error,"\nVariable used in this expression has not been declared. line no");
                printf("\n%s",err->error);
                Error *temporary = semanticErrors->head;
                while(temporary->next != NULL)
                    temporary = temporary->next;
                temporary->next = err; semanticErrors->numberOfErr += 1;
                return -1;
            }
            //2.check type
            if(sym->symbol.idEntry.type.tag == primitive){
                Error* err = (Error*)malloc(sizeof(Error));
                err->next = NULL; err->lineNo = node->node.idnode.line_no; strcpy(err->error,"\nCannot use primitive variable as array in expression");
                printf("\n%s",err->error);
                Error *temporary = semanticErrors->head;
                while(temporary->next != NULL)
                    temporary = temporary->next;
                temporary->next = err;  semanticErrors->numberOfErr += 1;
                return -1;
            }
            //3.check line number
            if(sym->symbol.idEntry.node->node.idnode.line_no >= node->sc->node.idnode.line_no){
                Error *err = (Error*)malloc(sizeof(Error));
                err->next = NULL; err->lineNo = node->node.idnode.line_no; strcpy(err->error,"\nVariable used in this expression has been declared later. line no");
                printf("\n%s",err->error);
                Error *temporary = semanticErrors->head;
                while(temporary->next != NULL)
                    temporary = temporary->next;
                temporary->next = err; semanticErrors->numberOfErr += 1;
                return -1;
            }
            //now we need to check b and check bounds
            SymbolTableEntry *sym2 = lookupString(node->sc->rs->node.idnode.lexeme,currTable,idEntry, true);
            //4.check if b is declared or not
            if(sym2 == NULL){
                Error *err = (Error*)malloc(sizeof(Error));
                err->next = NULL; err->lineNo = node->node.idnode.line_no; strcpy(err->error,"\nArray index variable has not been declared. line no");
                printf("\n%s",err->error);
                Error *temporary = semanticErrors->head;
                while(temporary->next != NULL)
                    temporary = temporary->next;
                temporary->next = err; semanticErrors->numberOfErr += 1;
                return -1;
            }
            //5. check type
            if(!(sym2->symbol.idEntry.type.tag == primitive && sym2->symbol.idEntry.type.type.primitiveType == integer)){
                Error* err = (Error*)malloc(sizeof(Error));
                err->next = NULL; err->lineNo = node->node.idnode.line_no; strcpy(err->error,"\nCannot use non-integer variable as array index");
                Error *temporary = semanticErrors->head;
                while(temporary->next != NULL)
                    temporary = temporary->next;
                temporary->next = err;  semanticErrors->numberOfErr += 1;
                return -1;
            }
            //6. check line no
            if(sym2->symbol.idEntry.node->node.idnode.line_no >= node->sc->rs->node.idnode.line_no){
                Error *err = (Error*)malloc(sizeof(Error));
                err->next = NULL; err->lineNo = node->node.idnode.line_no; strcpy(err->error,"\nArray index variable has been declared later. line no");
                printf("\n%s",err->error);
                Error *temporary = semanticErrors->head;
                while(temporary->next != NULL)
                    temporary = temporary->next;
                temporary->next = err; semanticErrors->numberOfErr += 1;
                return -1;
            }
            // 7. bound checking at run-time
            return sym->symbol.idEntry.type.type.arrayType.t;
        }
        else{   //a[3] case
            SymbolTableEntry* sym = lookupString(node->sc->node.idnode.lexeme,currTable, idEntry, true);
            //1.check if a is declared or not
            if(sym == NULL){
                Error *err = (Error *)malloc(sizeof(Error));
                err->next = NULL; err->lineNo = node->node.idnode.line_no; strcpy(err->error,"\nVariable used in this expression has not been declared. line no");
                printf("\n%s",err->error);
                Error *temporary = semanticErrors->head;
                while(temporary->next != NULL)
                    temporary = temporary->next;
                temporary->next = err; semanticErrors->numberOfErr += 1;
                return -1;
            }
            //2.check type
            if(sym->symbol.idEntry.type.tag == primitive){
                Error* err = (Error*)malloc(sizeof(Error));
                err->next = NULL; err->lineNo = node->node.idnode.line_no; strcpy(err->error,"\nCannot use primitive variable as array in expression");
                printf("\n%s",err->error);
                Error *temporary = semanticErrors->head;
                while(temporary->next != NULL)
                    temporary = temporary->next;
                temporary->next = err;  semanticErrors->numberOfErr += 1;
                return -1;
            }
            //3.check line number
            if(sym->symbol.idEntry.node->node.idnode.line_no >= node->sc->node.idnode.line_no){
                Error *err = (Error*)malloc(sizeof(Error));
                err->next = NULL; err->lineNo = node->node.idnode.line_no; strcpy(err->error,"\nVariable used in this expression has been declared later. line no");
                printf("\n%s",err->error);
                Error *temporary = semanticErrors->head;
                while(temporary->next != NULL)
                    temporary = temporary->next;
                temporary->next = err; semanticErrors->numberOfErr += 1;
                return -1;
            }
            //4.if static, check for bounds
            if(sym->symbol.idEntry.type.type.arrayType.low != -1 && sym->symbol.idEntry.type.type.arrayType.high != -1){
                if(strcmp(node->sc->rs->node.numNode.token,"INTEGER")==0 &&
                    node->sc->rs->node.numNode.value >= sym->symbol.idEntry.type.type.arrayType.low &&
                    node->sc->rs->node.numNode.value <= sym->symbol.idEntry.type.type.arrayType.high){
                    //bound check satisfied
                    return sym->symbol.idEntry.type.type.arrayType.t;
                }
                else{   //bound check not satisified
                    Error *err = (Error*)malloc(sizeof(Error));
                    err->next = NULL; err->lineNo = node->node.idnode.line_no; strcpy(err->error,"\nArray index is not valid.");
                    printf("\n%s",err->error);
                    Error *temporary = semanticErrors->head;
                    while(temporary->next != NULL)
                        temporary = temporary->next;
                    temporary->next = err; semanticErrors->numberOfErr += 1;
                    return -1;
                }
            }
            //5.if dynamic, check if index is integer or not
            if(strcmp(node->sc->rs->node.numNode.token,"INTEGER")==0){  //index is integer, assume it is in bounds because 
                //bound checking will be done at runtime
                return sym->symbol.idEntry.type.type.arrayType.t;
            }
            else{
                Error *err = (Error*)malloc(sizeof(Error));
                err->next = NULL; err->lineNo = node->node.idnode.line_no; strcpy(err->error,"\nUnknown error");
                printf("\n%s",err->error);
                Error *temporary = semanticErrors->head;
                while(temporary->next != NULL)
                    temporary = temporary->next;
                temporary->next = err; semanticErrors->numberOfErr += 1;
                return -1;
            } 
        }
    }

    ASTNode* left = node->sc;
    ASTNode* right = node->sc->rs;

    //arithmetic op case(mam's rule 6.1,6.2)
    if((strcmp(node->node.opNode.token,"PLUS")==0) || (strcmp(node->node.opNode.token,"MINUS")==0) || (strcmp(node->node.opNode.token,"MUL")==0) || (strcmp(node->node.opNode.token,"DIV")==0)){
        PrimitiveType t1 = extractTypeOfExpression(left, currTable,semanticErrors);
        PrimitiveType t2 = extractTypeOfExpression(right, currTable,semanticErrors);
        if((t1 == integer && t2 == integer) || (t1 == real && t2 == real)){
            node->node.opNode.typeOfExpr = t1;
            return t1;
        }
        else{
            if(t1 == -1 || t2 == -1)
                return -1;
            //semantic error
            Error *err = (Error *)malloc(sizeof(Error));
            err->next = NULL;
            err->lineNo = node->node.opNode.line_no;
            strcpy(err->error," Semantic Error: Type Mismatch in line no ");
            printf("\n%s",err->error);
            Error *temporary = semanticErrors->head;
            while(temporary->next != NULL)
            {
                temporary = temporary->next;
            }  
            temporary->next = err;
            semanticErrors->numberOfErr += 1;
        }
    }

    //logical op case(mam's rule 6.5)
    else if(strcmp(node->node.opNode.token, "OR")==0 || strcmp(node->node.opNode.token,"AND")==0){
        PrimitiveType t1 = extractTypeOfExpression(left, currTable,semanticErrors);
        PrimitiveType t2 = extractTypeOfExpression(right, currTable,semanticErrors);
        if(t1 == boolean && t2 == boolean){
            node->node.opNode.typeOfExpr = boolean;
            return boolean;
        }
        else{
            if(t1==-1 || t2==-1)
                return -1;
            //semantic error
            Error *err = (Error *)malloc(sizeof(Error));
            err->next = NULL;
            err->lineNo = node->node.opNode.line_no;
            strcpy(err->error," Semantic Error: Type Mismatch in line no ");
            printf("\n%s",err->error);
            Error *temporary = semanticErrors->head;
            while(temporary->next != NULL)
            {
                temporary = temporary->next;
            }  
            temporary->next = err;
            semanticErrors->numberOfErr += 1;
        }
    }

    //relational op case(mam's rule 6.3,6.4)
    else if(strcmp(node->node.opNode.token, "NE")==0 || strcmp(node->node.opNode.token, "EQ")==0 || strcmp(node->node.opNode.token, "LT")==0 || strcmp(node->node.opNode.token, "LE")==0 || strcmp(node->node.opNode.token, "GT")==0 || strcmp(node->node.opNode.token, "GE")==0){
        PrimitiveType t1 = extractTypeOfExpression(left, currTable,semanticErrors);
        PrimitiveType t2 = extractTypeOfExpression(right, currTable,semanticErrors);
        if((t1 == integer && t2 == integer) || (t1 == real && t2 == real)){
            node->node.opNode.typeOfExpr = boolean;
            return boolean;
        }
        else{
            
            if(t1 == -1 || t2 == -1)
                return -1;
            //semantic error
            Error *err = (Error *)malloc(sizeof(Error));
            err->next = NULL;
            err->lineNo = node->node.opNode.line_no;
            strcpy(err->error," Semantic Error: Type Mismatch in line no ");
            printf("\n%s",err->error);
            Error *temporary = semanticErrors->head;
            while(temporary->next != NULL)
            {
                temporary = temporary->next;
            }  
            temporary->next = err;
            semanticErrors->numberOfErr += 1;
        }
    }
}
//need to implement mam's rules 6.7 onwards








/*Old version of extractTypeOfExpression*/

/********
 * -------------------------------------
 * -------------------------------------
 * */
//extracts type of an expression, and also sets appropriate field in the AST's opNode
//param : node: ASTNode of type opNode
// PrimitiveType extractTypeOfExpression(ASTNode *node)
// {
//     ASTNode* left = node->sc;
//     ASTNode* right = node->sc->rs;

//     //node is an arithmetic opNode
//     if((strcmp(node->node.opNode.token,"PLUS")==0) || (strcmp(node->node.opNode.token,"MINUS")==0) || (strcmp(node->node.opNode.token,"MUL")==0) || (strcmp(node->node.opNode.token,"DIV")==0)){
//         //if left child and right child are opnode
//         if(left->type == opNode && right->type == opNode){
//             //call extract type of expr on left and right
//             PrimitiveType t1 = extractTypeOfExpression(left);
//             PrimitiveType t2 = extractTypeOfExpression(right);
//             //now check their types and assign appropriate type to node
//             if(checkExpressionType(t1,t2,true)){
                
//             }
//             else{
//                 //semantic error
//             }
//         }
        
//         //else if left child is opnode and right child is idnode/numnode
//         else if(left->type == opNode && (right->type == idNode || right->type == numNode)){
//             //callextract type of expr on left, hash right into table and obtain type
//             PrimitiveType t1 = extractTypeOfExpression(left);
//             PrimitiveType t2;
//             if(right->type == idNode){   //need to extract type from symboltable
//                 //find from symboltable
//             }
//             else{       //right child is numNode, no need to extract
//                 if(strcmp(right->node.numNode.token, "NUM")==0)
//                     t2 = integer;
//                 else
//                     t2 = real;
//             }
//             //now check types and assign appropriately
//         }
        
//         //else if left child is idnode/numnode and right child is opnode
//         else if((left->type == idNode || left->type == numNode) && left->type == opNode){
//             //callextract type of expr on right, hash left into table and obtain type
//             PrimitiveType t1;
//             PrimitiveType t2 = extractTypeOfExpression(right);
//             if(left->type == idNode)
//             {
//                 // find from symboltable
//             }
//             else
//             {
//                 if(strcmp(left->node.numNode.token,"NUM")==0)
//                     t1 = integer;
//                 else
//                     t1 = real;
                
//             }
//             //now check types and assign appropriately
//         }
        
//         //else if left child and right child are idnodes/numnodes
//         else if((left->type == idNode && right->type == idNode) || (left->type == numNode && right->type == numNode)){
//             //hash both into table and obtain type
//             PrimitiveType t1;
//             PrimitiveType t2;
//             if(left->type == idNode)
//             {
//                 // find from symboltable    
//             }
//             else
//             {
//                 if(strcmp(left->node.numNode.token,"NUM")==0)
//                     t1 = integer;
//                 else
//                     t1 = real;
                
//                 if(strcmp(right->node.numNode.token,"NUM")==0)
//                     t1 = integer;
//                 else
//                     t1 = real;
//             }   
//             //set node's type accordingly
//         }

//         //else if left child is opnode and right child is nullnode 
//         else if(left->type == opNode && right->type == nullNode){
//             //call extract type of expr on left, assign this type to node
//             PrimitiveType t1 = extractTypeOfExpression(left);
//             node->node.opNode.typeOfExpr = t1;
//             return t1;
//         }
        
//         //else if left child is idnode/numnode and right child is nullnode
//         else if((left->type == idNode || left->type == numNode) && right->type == nullNode){
//             //hash into symboltable and find idnodes type,
//             PrimitiveType t1;
//             PrimitiveType t2;
//             if(left->type == idNode)
//             {
                
//             }
//             else
//             {
//                 if(strcmp(left->node.numNode.token,"NUM")==0)
//                     t1 = integer;
//                 else
//                     t1 = real;
//             }
            
//             // and assign this type to node
//         }
//     }

//     //node is logical opNode
//     else if(strcmp(node->node.opNode.token, "OR")==0 || strcmp(node->node.opNode.token,"AND")==0){  
//         //here both the operands must be either boolean constants/expressions
//         //if left and right childs are opnodes
//             // call extract type on both left and right
//             // check types and assign type to node accordingly
//         //else if left child is opnode, right is boolnode
//             //call extract type on left
//             // check types and assign type to node accordingly
//         //else if left child is boolnode, right child is opnode
//             //call extract type on right
//             // check types and assign type to node accordingly
//         //else if left child and right are boolnodes
//             //no need to check, just assign boolean to node
//         //else
//             //semantic error
//     }

//     //node is relationalopNode
//     else if(strcmp(node->node.opNode.token, "NE")==0 || strcmp(node->node.opNode.token, "EQ")==0 || strcmp(node->node.opNode.token, "LT")==0 || strcmp(node->node.opNode.token, "LE")==0 || strcmp(node->node.opNode.token, "GT")==0 || strcmp(node->node.opNode.token, "GE")==0){
//         //here both the operands must be integer/real constants/expressions
//         //if
//     }
// }
