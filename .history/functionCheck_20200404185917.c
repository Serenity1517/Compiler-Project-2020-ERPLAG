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

#define sc startChild
#define rs rightSibling

// f4,f6        isDeclared : [F,F,F,T,F,F,T]
// [ false,  ]

// currModule;

// f1  f2  f3  f4  driver  f5 f6
// 0   1   2   3   4       5   6
bool* isDeclared;

void initializeDeclaredList(ASTNode* root, SymbolTable* rootSymbolTable){
    
    isDeclared = (bool *)malloc(sizeof(bool)*root->node.programNode.noOfModules);
    ASTNode *traverse = root->startChild;
    int i;
    for(i=0;i<root->node.programNode.noOfModules;i++)
    {
        isDeclared[i] = false;
    }
    while(traverse != NULL || traverse->type != nullNode)
    {
        SymbolTableEntry* sym = lookupString(traverse->node.idnode.lexeme,rootSymbolTable,functionEntry,false);
        if(sym != NULL)
        {
            isDeclared[sym->symbol.functionEntry.sequenceNumber] = true;
        } 
        else
            printf("\nSymbol Table not populated correctly ");
        traverse = traverse->next;
    }

}

void checkModules(ASTNode* root){
    ASTNode* otherMod = root->sc->rs;
    ASTNode* driverMod = root->sc->rs->rs;
    ASTNode* otherMod2 = root->sc->rs->rs->rs;
    int currModuleNo = 0;
    while(otherMod != NULL){
        processModule(otherMod, currModuleNo);
        otherMod = otherMod->next;
        currModuleNo++;
    }
    processModule(driverMod, currModuleNo);   
    currModuleNo++;
    while(otherMod2 != NULL){
        processModule(otherMod2, currModuleNo);
        otherMod2 = otherMod->next;
        currModuleNo++;
    }

}

void processModule(ASTNode* modNode, int currModNo){
    ASTNode* stmt = modNode->sc->rs->rs->rs;
    while(stmt != NULL){
        processStmt(stmt);
        stmt = stmt->next;
    }
}

void processStmt(ASTNode* stmtNode){
    switch(stmtNode->type){
        case conditionalNode:{
            ASTNode* switchCasetm
            break;   
        }
        case forLoopNode:{
            //traverse
            ASTNode *forloopStmt = stmtNode->sc->rs->rs;
            while(forloopStmt != NULL)
            {
                processStmt(forloopStmt);
                forloopStmt = forloopStmt->next; 
            }
            break;
        }
        case whileLoopNode:{
            ASTNode *whileloopStmt = stmtNode->sc->rs;
            while(whileloopStmt != NULL)
            {
                processStmt(whileloopStmt);
                whileloopStmt = whileloopStmt->next; 
            }
            break;
        }
        case functionCallNode:{
            //action
        }
        default:{
            break;
        }
    }
}