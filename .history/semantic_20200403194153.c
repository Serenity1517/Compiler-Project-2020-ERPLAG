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
#include <string.h>
#define sc startChild
#define rs rightSibling

ListOfErrors* semanticErrors;
// kya likh rha hai??
//this is semantic.c
//we will initiate symboltable construction from this file only. yahan se processAST() call karenge??

//
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
}

/*This recursive function traverses AST and performs various semantic checks*/
void analyzeAST(ASTNode* node, SymbolTable* table, ListOfErrors* semanticErrors){
    switch(node->type){
        case programNode:{
            analyzeAST(node->sc->rs, table, semanticErrors);
            analyzeAST(node->sc->rs->rs, table, semanticErrors);
            analyzeAST(node->sc->rs->rs->rs, table, semanticErrors);
        }
        case moduleNode:{
            //check if driverModule
            if(node->rs->rs == NULL && node->rs->type == moduleNode && node->parent->type == programNode){
                SymbolTableEntry* curr = lookupString("driverModule", table, functionEntry, false);
                if(curr==NULL){
                    printf("\nSymbotable populated wrongly\n");
                    //not possible
                }
                
                //now process its statements
                //curr->table gives us the table for this scope
                ASTNode* traverse = node->sc->rs->rs->rs;
                while(traverse != NULL)
                    analyzeAST(traverse, curr->table, semanticErrors);
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
                while(traverse != NULL)
                    analyzeAST(traverse, curr->table, semanticErrors);
            }
        }

        case declareNode:{
            //do nothing
        }

        case opNode:{
            extractTypeOfExpression(node, table, semanticErrors);
        }

        case functionCallNode:{

        }
    }
}
// a = b*c

//declare b;