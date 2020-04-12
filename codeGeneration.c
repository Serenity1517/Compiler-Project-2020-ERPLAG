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
#include "codeGeneration.h"
#include <string.h>

#define sc startChild
#define rs rightSibling

void codeGen(ASTNode* node, SymbolTable* table, FILE* file){
    switch(node->type){
        case programNode:{
            
            break;
        }
        case moduleNode:{

            break;
        }
        case opNode:{

            break;
        }
        case inputIONode:{
            
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

    codeGen(root, table, fout);
}