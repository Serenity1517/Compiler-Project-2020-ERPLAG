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
#include "offsetComputer.h"
#include <string.h>
#define sc startChild
#define rs rightSibling

int offset;

void computeOffsets(ASTNode* root, SymbolTable* rootSymbolTable){
    ASTNode* otherMod = root->sc->rs;  
    ASTNode* driverMod = root->sc->rs->rs;
    ASTNode* otherMod2 = root->sc->rs->rs->rs;
    while(otherMod != NULL){
        offset = 0;
        calcOffsets(otherMod, rootSymbolTable);
        otherMod = otherMod->next;
    }
    offset = 0;
    calcOffsets(driverMod, rootSymbolTable);   
    while(otherMod2 != NULL){
        offset = 0;
        calcOffsets(otherMod2, rootSymbolTable);
        otherMod2 = otherMod->next;
    }
}
    

void calcOffsets(ASTNode* currModule, SymbolTable* rootSymbolTable){
    // yeh mai likh deta hoon okk??
    // ek ar cheeze yeh function ek module ke andr offset set karra hai kya??
   //yesthis function is for current module only.. cu
   //just traverse it's statemments
   //ruk
   ASTNode* stmtNode = currModule->sc->rs->rs->rs;
   SymbolTableEntry* sym = lookupString(currModule->sc->node.idnode.lexeme,rootSymbolTable,functionEntry,false);
   SymbolTable* currTable = sym->table;//ye calcculate karke neeche function me pass karna he
   while(stmtNode != NULL){
       processStmt(stmtNode, currTable);
       stmtNode = stmtNode->next;
   } 
}

void processStmt(ASTNode* stmtNode, SymbolTable* currTable){
    switch(stmtNode->type){
        case declareNode:{
            break;
        }
        case forLoopNode:{
            ASTNode* forLoopStmt = stmtNod
            break;
        }
        case whileLoopNode:{
            break;
        }
        case conditionalNode:{
            break;
        }
        default:{
            break;
        }
    }
}
