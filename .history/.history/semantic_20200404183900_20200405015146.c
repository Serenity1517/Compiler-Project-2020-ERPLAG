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
#include "semantic.h"
#include "functionCheck.h"
#include <string.h>
#define sc startChild
#define rs rightSibling

ListOfErrors* semanticErrors;

ListOfErrors* getSemanticErrorObject()
{
    return semanticErrors;
}

//then call the typechecking functions from here
//for the same, we will pass error object to every function
void initializeErrorObject(){
    semanticErrors = (ListOfErrors*)malloc(sizeof(ListOfErrors));
    semanticErrors->numberOfErr = 0;
}

Error* createErrorObject()
{
    Error *error = (Error *)malloc(sizeof(Error));
    error->next = NULL;
    return error;
}

/*Control function for semantic analysis. 
This function calls for construction of symbol table, type checking of expressions
type checking for function calls etc*/
void semanticAnalyzer(){
    initializeErrorObject();
    ASTNode* astRoot = getAST();
    
    //construct symboltable
    processAST(astRoot,NULL,semanticErrors);
    /*NOTE:In above function, following semantic checks have been performed arleady*/
    /**
     * Output parameter overloading inside module definition
     * Duplicate module Declarations
     * Duplicate variable declarations inside a block (doubt--is a variable visible inside inner scopes? can't we overshadow it? if we can, then change code in processAST where deep lookup is performed for checking duplicate declaration)
     * */

    SymbolTable* rootSymbolTable = getsymbolTable();
    //now perform semantic analysis
    analyzeAST(astRoot, rootSymbolTable, semanticErrors);
    initializeDeclaredList(astRoot, rootSymbolTable);
    int currSequence = 0;
    checkModule(astRoot->sc->rs, &currSequence);
    checkModule(astRoot->sc->rs->rs, &currSequence);
    checkModule(astRoot->sc->rs->rs, &currSequence);
}

/*This recursive function traverses AST and performs various semantic checks*/
void analyzeAST(ASTNode* node, SymbolTable* table, ListOfErrors* semanticErrors){
    switch(node->type){
        case programNode:{
            ASTNode *t1 = node->sc->rs;
            while(t1->next !=NULL)
            {
                analyzeAST(t1, table, semanticErrors);
                t1 = t1->next;
            }
            analyzeAST(node->sc->rs->rs, table, semanticErrors);
            t1 = node->sc->rs->rs->rs;
            while(t1->next !=NULL)
            {
                analyzeAST(t1, table, semanticErrors);
                t1 = t1->next;
            }
            break;
        }
        case moduleNode:{
            //check if driverModule
            if(node->sc->type == nullNode){
                SymbolTableEntry* curr = lookupString("driverModule", table, functionEntry, false);
                if(curr==NULL)       //not possible
                    printf("\nSymbotable populated wrongly\n");
                
                //now process its statements
                //curr->table gives us the table for this scope
                ASTNode* traverse = node->sc->rs->rs->rs;
                while(traverse != NULL){
                    analyzeAST(traverse, curr->table, semanticErrors);
                    traverse = traverse->next;
                }                    
            }

            //if it's not a driver module
            else{   
                //first obtain the symboltable corresponding to this module
                SymbolTableEntry* curr = lookupString(node->sc->node.idnode.lexeme, table, functionEntry, false);
                if(curr == NULL){
                    printf("\nRoot Symboltable not populated with this function");
                    //not possible. check code
                }
                
                //now process its statements
                //curr->table gives us the table for this scope
                ASTNode* traverse = node->sc->rs->rs->rs;
                while(traverse != NULL){
                    analyzeAST(traverse, curr->table, semanticErrors);
                    traverse = traverse->next;
                }
                //now staetmetnts have been processed. check if all the output parameters have been assigned a value or not
                ASTNode* travOutputParam = node->sc->rs->rs;
                while(travOutputParam != NULL){
                    if(travOutputParam->node.outputParamNode.isAssigned == false){
                        //semantic error :
                        Error *err = createErrorObject();   err->lineNo = travOutputParam->sc->node.idnode.line_no;  strcpy(err->error,"\nNo value was assigned for output param: ");
                        strcat(err->error, travOutputParam->sc->node.idnode.lexeme); 
                        printf("\n%s",err->error);
                        Error *temporary = semanticErrors->head;
                        while(temporary->next != NULL)
                            temporary = temporary->next;
                        temporary->next = err; semanticErrors->numberOfErr += 1;
                    }
                }
            }
            break;
        }

        case declareNode:{
            break;
        }

        case opNode:{
            extractTypeOfExpression(node, table, semanticErrors);
            break;
        }

        case assignmentNode:{
            //first check if lhs variable has been declared

            //1. check if 'for-loop' iterating variable has been assigned 
            ASTNode *temp = node->parent;
            while(temp->parent != NULL){
                if(temp->type == forLoopNode && strcmp(temp->sc->node.idnode.lexeme,node->sc->node.idnode.lexeme)==0){
                    //semantic error
                    Error *err = createErrorObject();   err->lineNo = node->sc->node.idnode.line_no;  strcpy(err->error,"\nAssigning a value to for loop iterating variable is not allowed:"); 
                    printf("\n%s",err->error);
                    Error *temporary = semanticErrors->head;
                    while(temporary->next != NULL)
                        temporary = temporary->next;
                    temporary->next = err; semanticErrors->numberOfErr += 1;
                    break;
                }
                else
                    temp = temp->parent;
            }
            
            //2. check if assignment is done for output parameter. if yes, set outputParamNode->isAssigned = true;
            ASTNode* trav = node->parent;
            while(trav->type != moduleNode)
                trav = trav->parent;
            if(trav->sc != nullNode){   //only if we are not iside drvire module
                ASTNode* travOutputParam = trav->sc->rs->rs;
                while(travOutputParam != NULL){
                    if(travOutputParam->type == nullNode)
                        break;
                    if(strcmp(travOutputParam->sc->node.idnode.lexeme, node->sc->node.idnode.lexeme) == 0){
                        travOutputParam->node.outputParamNode.isAssigned = true;
                        travOutputParam = travOutputParam->next;
                    }
                }
            }
            
            break; 
        } 
        case functionCallNode:{
            SymbolTableEntry* func = lookupString(node->sc->rs->node.idnode.lexeme, table, functionEntry, true);
            //1.void functions handling
            if(func->symbol.functionEntry.outputListHead == NULL){  //actually a void function
                if(node->sc->type != nullNode){
                    //semantic error: void function should not return anything
                    Error *err = createErrorObject();   err->lineNo = node->sc->sc->node.idnode.line_no;  strcpy(err->error,"\nVoid function must not return anything"); 
                    printf("\n%s",err->error);
                    Error *temporary = semanticErrors->head;
                    while(temporary->next != NULL)
                        temporary = temporary->next;
                    temporary->next = err; semanticErrors->numberOfErr += 1;
                    break;
                }
            }
            else{   //check output parameters
                FunctionType* f = &func->symbol.functionEntry.inOutType; ///Typeof* in o/p param types linkedlist
                int i = 0;
                ASTNode* travCallOut = node->sc;    //idNode in output paramters linkedlist
                while(travCallOut != NULL && i < f->noOfOutputs){
                    if(travCallOut->type == nullNode){
                        //semantic error : function must return something
                        Error *err = createErrorObject();   err->lineNo = node->sc->rs->node.idnode.line_no;  strcpy(err->error,"\nVoid function must not return anything"); 
                        printf("\n%s",err->error);
                        Error *temporary = semanticErrors->head;
                        while(temporary->next != NULL)
                            temporary = temporary->next;
                        temporary->next = err; semanticErrors->numberOfErr += 1;
                        break;
                    }
                    SymbolTableEntry* travCallOutput = lookupString(travCallOut->node.idnode.lexeme, table, idEntry, true);
                    if(travCallOutput->symbol.idEntry.type.tag == array){
                        //semantic error : function cannot return array
                        Error *err = createErrorObject();   err->lineNo = travCallOut->node.idnode.line_no;  strcpy(err->error,"\nFunction cannot return array"); 
                        Error *temporary = semanticErrors->head;
                        while(temporary->next != NULL)
                            temporary = temporary->next;
                        temporary->next = err; semanticErrors->numberOfErr += 1;
                        travCallOut = travCallOut->next;
                        i++;
                        continue;
                    }
                    if(travCallOutput->symbol.idEntry.type != f->outputList[i]){
                        //semantic error : output type mismatch
                        Error *err = createErrorObject();   err->lineNo = travCallOut->node.idnode.line_no;  strcpy(err->error,"\nOutput types mismatch"); 
                        printf("\n%s",err->error);
                        Error *temporary = semanticErrors->head;
                        while(temporary->next != NULL)
                            temporary = temporary->next;
                        temporary->next = err; semanticErrors->numberOfErr += 1;
                        travCallOut = travCallOut->next;
                        i++;
                        continue;
                    }
                }

                if(!(travCallOut == NULL && i == f->noOfOutputs)){
                    //semantic error : output parameter  count mismatch
                    Error *err = createErrorObject();   err->lineNo = node->sc->rs->node.idnode.line_no;  strcpy(err->error,"\nOutput parameter count mismatch"); 
                    printf("\n%s",err->error);
                    Error *temporary = semanticErrors->head;
                    while(temporary->next != NULL)
                        temporary = temporary->next;
                    temporary->next = err; semanticErrors->numberOfErr += 1;
                }
            }

            
            //2. types and no of input parameters of function must be same as declaration
            FunctionType* inp = &func->symbol.functionEntry.inOutType;
            struct Typeof* travDefIn = inp->inputList;
            int i=0; 
            ASTNode *travCallIn = node->sc->rs->rs;
            while(travCallIn != NULL && i < inp->noOfInputs)
            {
                SymbolTableEntry* sym = lookupString(travCallIn->node.idnode.lexeme, table, idEntry, true);
                if(sym == NULL)
                {
                    //input parameter must be declared
                    Error *err = createErrorObject();   err->lineNo = travCallIn->node.idnode.line_no;  strcpy(err->error,"\nInput parameter must be used before declaration"); 
                    printf("\n%s",err->error);
                    Error *temporary = semanticErrors->head;
                    while(temporary->next != NULL)
                        temporary = temporary->next;
                    temporary->next = err; semanticErrors->numberOfErr += 1;
                    travCallIn = travCallIn->next;
                    i++;
                    continue;
                }
                else
                {
                    if(sym->symbol.idEntry.type.type.primitiveType != travDefIn[i].type.primitiveType && sym->symbol.idEntry.type.tag == primitive && travDefIn[i].tag == primitive)
                    {
                        // semantic error
                        Error *err = createErrorObject();   err->lineNo = travCallIn->node.idnode.line_no;  strcpy(err->error,"\nInput parameter type mismatch"); 
                        printf("\n%s",err->error);
                        Error *temporary = semanticErrors->head;
                        while(temporary->next != NULL)
                            temporary = temporary->next;
                        temporary->next = err; semanticErrors->numberOfErr += 1;
                        travCallIn = travCallIn->next;
                        i++;
                        continue;                        
                    }
                    else if(sym->symbol.idEntry.type.type.arrayType.t != travDefIn[i].type.arrayType.t && sym->symbol.idEntry.type.tag == array && travDefIn[i].tag == array)
                    {
                        Error *err = createErrorObject();   err->lineNo = travCallIn->node.idnode.line_no;  strcpy(err->error,"\nInput parameter type mismatch "); 
                        Error *temporary = semanticErrors->head;
                        while(temporary->next != NULL)
                            temporary = temporary->next;
                        temporary->next = err; semanticErrors->numberOfErr += 1;
                        travCallIn = travCallIn->next;
                        i++;
                        continue;
                    }
                    else if(sym->symbol.idEntry.type.tag != travDefIn[i].tag){ 
                        //semantic error:input parameter type mismatch
                        Error *err = createErrorObject();   err->lineNo = travCallIn->node.idnode.line_no;  strcpy(err->error,"\nInput parameter type mismatch "); 
                        printf("\n%s",err->error);
                        Error *temporary = semanticErrors->head;
                        while(temporary->next != NULL)
                            temporary = temporary->next;
                        temporary->next = err; semanticErrors->numberOfErr += 1;
                        travCallIn = travCallIn->next;
                        i++;
                        continue;
                    }   
                    i++;
                    travCallIn = travCallIn->next;
                }
                
            }
            
            
            break;
        }

        case conditionalNode:{  //switch-case. assumes swtiching variable is declared and is not of type array
            SymbolTableEntry* sym = lookupString(node->sc->node.idnode.lexeme, table, idEntry, true);
            switch(sym->symbol.idEntry.type.type.primitiveType){
                case integer:{
                    if(node->sc->rs->rs->type == nullNode)
                    {
                        // semantic error default node missing  
                        Error *err = createErrorObject();   err->lineNo = node->node.conditionalNode.block.end;  strcpy(err->error,"\nDefault Statement missing line "); 
                        Error *temporary = semanticErrors->head;
                        while(temporary->next != NULL)
                            temporary = temporary->next;
                        temporary->next = err; semanticErrors->numberOfErr += 1;
                    }
                    ASTNode *temp = node->sc->rs;
                    while(temp != NULL)
                    {
                        if(temp->sc->rs->type == numNode && strcmp(node->sc->rs->node.numNode.token,"INTEGER")==0)
                            temp = temp->next;
                        else
                        {
                            //semantic error case node is not an integer
                            Error *err = createErrorObject();   err->lineNo = node->sc->rs->node.caseNode.line;  strcpy(err->error,"\nCase Node is not an integer "); 
                            printf("\n%s",err->error);
                            Error *temporary = semanticErrors->head;
                            while(temporary->next != NULL)
                                temporary = temporary->next;
                            temporary->next = err; semanticErrors->numberOfErr += 1;
                            //break;
                        }
                    }
                    break;
                }
                case real:{
                        Error *err = createErrorObject();   err->lineNo = node->sc->node.idnode.line_no;  strcpy(err->error,"\nSwitching variable cannot be of real type :"); 
                        printf("\n%s",err->error);
                        Error *temporary = semanticErrors->head;
                        while(temporary->next != NULL)
                            temporary = temporary->next;
                        temporary->next = err; semanticErrors->numberOfErr += 1;
                    break;
                }
                case boolean:{
                    if(node->sc->rs->rs->type != nullNode){
                        Error *err = createErrorObject();   err->lineNo = node->sc->rs->rs->node.caseNode.line;  strcpy(err->error,"\nSwitch case on boolean variable cannot have default case"); 
                        printf("\n%s",err->error);
                        Error *temporary = semanticErrors->head;
                        while(temporary->next != NULL)
                            temporary = temporary->next;
                        temporary->next = err; semanticErrors->numberOfErr += 1;
                    }
                    if(!(node->sc->rs->sc->rs->type == boolNode && node->sc->rs->next->sc->rs->type == boolNode && node->sc->rs->next->next == NULL)){
                        Error *err = createErrorObject();   err->lineNo = node->sc->rs->node.caseNode.line;  strcpy(err->error,"\nSwitch case on boolean variable must have exactly 2 cases, true and false"); 
                        printf("\n%s",err->error);
                        Error *temporary = semanticErrors->head;
                        while(temporary->next != NULL)
                            temporary = temporary->next;
                        temporary->next = err; semanticErrors->numberOfErr += 1;
                    } 
                }
            }
            break;
        }            
    }
}