/*
 * Group no. 50
 * Aniruddha Mahajan -------- 2017A7PS0145P
 * Ravindra Singh Shekhawat - 2017A7PS0146P
 * Shreyas Srikrishna ------- 2017A7PS0162P
 * Chetan Sharma ------------ 2017A7PS0182P
 */


#include "ast.h"
#include "symboltable.h"
#include "semantic.h"
#include "codeGeneration.h"
#include <string.h>

#define sc startChild
#define rs rightSibling

void codeGen(ASTNode* node, SymbolTable* table, FILE* file){
    switch(node->type){
        case programNode:{
            ASTNode* mod1 = node->sc->rs;
            ASTNode* mod2 = node->sc->rs->rs->rs;
            ASTNode* driverMod = node->sc->rs->rs;
            //1. Process mod1's module list 
            if(mod1->type != nullNode){
                while(mod1 != NULL){
                    SymbolTableEntry* mod1_entry = lookupString(mod1->sc->node.idnode.lexeme, table, functionEntry, false, -1);
                    fprintf(file, "\nmodule%d:\n", mod1_entry->symbol.functionEntry.sequenceNumber);
                    codeGen(mod1, mod1_entry->table, file);
                }
            } 
            //2. Process mod2's module list 
            if(mod2->type != nullNode){
                while(mod2 != NULL){
                    SymbolTableEntry* mod2_entry = lookupString(mod2->sc->node.idnode.lexeme, table, functionEntry, false, -1);
                    fprintf(file, "\nmodule%d:\n", mod2_entry->symbol.functionEntry.sequenceNumber);
                    codeGen(mod2, mod2_entry->table, file);
                }
            }   
            //3. Process driver module
            SymbolTableEntry* driver_entry = lookupString("driverModule", table, driverEntry, false, -1);
            fprintf(file, "\n_start:\n");
            codeGen(driverMod, driver_entry->table, file);
            break;
        }
        case moduleNode:{

            break;
        }
        case opNode:{

            break;
        }
        case inputIONode:{
            SymbolTableEntry* sym = lookupString(node->sc, table, idEntry, true, -1);
            //sym->symbol.idEntry.offset -> isme offset he
            //assume base pointer is in rbp..
            //mov [rbp+offset]
            //fprintf(file, "%d",);
            break;
        }
        case outputIONode:{

            break;
        }
        case conditionalNode:{

            break;
        }
        case whileLoopNode:{
            break;

        }
            break;
        case forLoopNode:{

            break;
        }
        case nullNode:{
            //do nothing
            return;
        }
        default:{
            break;
        }
    }
}

void codeGenControl(ASTNode* root, SymbolTable* table, char* file){
    if(root == NULL){
        printf("\nAST not constructed!!");
        return;
    }
    if(table == NULL){
        printf("\nSymbolTable not populated");
        return;
    }
    if(file == NULL){
        printf("\nargv[3] should contain asm code output file name!!");
        return;
    }

    ListOfErrors* semanticErrors = getSemanticErrorObject();
    if(!(semanticErrors->numberOfErr == 0 && semanticErrors->head == NULL)){
        printf("\nCode has semantic errors, cannot generate asm code!!");
        return;
    }

    remove(file);
    FILE* fout = fopen(file, "a");
    if(file == NULL){
        printf("\nError opening asm output file(argv[3])");
        return;
    }

    //add initial lines of code
    fprintf(fout, "section .data\n\nsection .bss\n\nsection .text\n\tglobal _start\n\n");
    codeGen(root, table, fout);
    fclose(fout);
    return;
}