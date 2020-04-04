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


void computeOffsets(ASTNode* root, SymbolTable* rootSymbolTable){
    // ASTNode* otherMod = root->sc->rs;
    // ASTNode* driverMod = root->sc->rs->rs;
    // ASTNode* otherMod2 = root->sc->rs->rs->rs;
    // while(otherMod != NULL){
    //     calcOffsets(otherMod, rootSymbolTable);
    //     otherMod = otherMod->next;
    // }
    // calcOffsets(driverMod, rootSymbolTable);   
    // while(otherMod2 != NULL){
    //     calcOffsets(otherMod2, rootSymbolTable);
    //     otherMod2 = otherMod->next;
    // }
    int offset = 0;
    int i,j;
    for(i=0; i<20; i++){
        SymbolTableEntry* funcEntry = rootSymbolTable->listHeads[i];
        while(funcEntry != NULL){
            offset = 0;
            //funcEntry is a functionEntry. 
            SymbolTable* funcTable = funcEntry->table;
            for(j=0; j<20; j++){
                SymbolTableEntry* varEntry = funcTable->listHeads[j];
                while(varEntry != NULL){
                    //compute its offset
                    if(varEntry->tag == driverEntry || varEntry->tag == functionEntry || varEntry->tag == forLoopEntry || varEntry->tag == whileLoopEntry|| varEntry->tag == switchCaseEntry){
                        varEntry = varEntry->next;
                        continue;
                    }
                    if(varEntry->symbol.idEntry.type.tag == array){ //array type

                    }
                    else{       //primitive variable
                        switch(varEntry->symbol.idEntry.type.type.primitiveType){
                            case integer:{
                                
                            }
                            case boolean:{

                            }
                            case real:{
                                
                            }
                        }
                    }
                    varEntry = varEntry->next;
                }
            }
            funcEntry = funcEntry->next;
        }
    }
}

void calcOffsets(ASTNode* currModule, SymbolTable* rootSymbolTable){
    
}