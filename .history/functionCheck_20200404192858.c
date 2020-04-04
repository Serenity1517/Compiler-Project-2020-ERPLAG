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
char** modules;
int n;

int currModuleNo = 0;
int moduleSequenceMap(char* moduleName){
    int i;
    for(i=0; i<n; i++){
        if(strcmp(moduleName, modules[i]) == 0)
            return i;
    }
    return -1;
}

void populateModuleSequenceMap(ASTNode* root, SymbolTable* rootSymbolTable){
    modules = (char**)malloc(sizeof(char*));
    int i;
    n=root->node.programNode.noOfModules;
    for(i=0; i<n; i++){
        modules[i] = (char*)malloc(sizeof(char)*21);
    }
    ASTNode *trav = root->sc->rs;
    while(trav->type != nullNode)
    {
        SymbolTableEntry* sym = lookupString(trav->sc->node.idnode.lexeme,rootSymbolTable,functionEntry,false); 
        strcpy(modules[sym->symbol.functionEntry.sequenceNumber],trav->sc->node.idnode.lexeme);
        trav = trav->next;
    }

}

void initializeDeclaredList(ASTNode* root, SymbolTable* rootSymbolTable){
    
    isDeclared = (bool *)malloc(sizeof(bool)*root->node.programNode.noOfModules);
    ASTNode *traverse = root->startChild;
    int i;
    for(i = 0; i < root->node.programNode.noOfModules; i++)
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
    while(otherMod != NULL){
        processModule(otherMod);
        otherMod = otherMod->next;
        currModuleNo++;
    }
    processModule(driverMod);   
    currModuleNo++;
    while(otherMod2 != NULL){
        processModule(otherMod2);
        otherMod2 = otherMod->next;
        currModuleNo++;
    }

}

void processModule(ASTNode* modNode){
    ASTNode* stmt = modNode->sc->rs->rs->rs;
    while(stmt != NULL){
        processStmt(stmt);
        stmt = stmt->next;
    }
}

void processStmt(ASTNode* stmtNode){
    switch(stmtNode->type){
        case conditionalNode:{
            ASTNode* switchCaseStmt = stmtNode->sc->rs;
            while(switchCaseStmt != NULL)
            {
                ASTNode* caseStmt = switchCaseStmt->sc;
                while(caseStmt != NULL || caseStmt->type != nullNode)
                {
                    processStmt(caseStmt);
                    caseStmt = caseStmt->next;
                }
                switchCaseStmt = switchCaseStmt->next;
            }
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
            int calledSequenceNo = moduleSequenceMap(stmtNode->sc->rs->node.idnode.lexeme);
            if(calledSequenceNo == -1){
                
            }
        }
        default:{
            break;
        }
    }
}