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

int utilLabel;
int forLoopLabel;
int whileLoopLabel;
int caseLabel;

void codeGen(ASTNode* node, SymbolTable* table, FILE* file, PrimitiveType arithExprType){
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
                    codeGen(mod1, mod1_entry->table, file,-1);
                }
            } 
            //2. Process mod2's module list 
            if(mod2->type != nullNode){
                while(mod2 != NULL){
                    SymbolTableEntry* mod2_entry = lookupString(mod2->sc->node.idnode.lexeme, table, functionEntry, false, -1);
                    fprintf(file, "\nmodule%d:\n", mod2_entry->symbol.functionEntry.sequenceNumber);
                    codeGen(mod2, mod2_entry->table, file,-1);
                }
            }   
            //3. Process driver module
            SymbolTableEntry* driver_entry = lookupString("driverModule", table, driverEntry, false, -1);
            fprintf(file, "\n_start:\n");
            codeGen(driverMod, driver_entry->table, file,-1);
            break;
        }
        case moduleNode:{
            //1. Special case of driver module
            if(node->sc->type == nullNode){
                fprintf(file, "\tmov rbp, rsp\n");  //for driver, the frame base is same as bottom of stack.(as the frame/activation record for the driver function is located right at the bottom of the stack)
                ASTNode* stmt = node->sc->rs->rs->rs;
                while(stmt != NULL){
                    codeGen(stmt, table, file,-1);
                    stmt = stmt->next;
                }
            }
            //2.Any other module
            else{

            }
            break;
        }
        case declareNode:{
            //no asm code needs to be generated here. the declared variables are already stored in symboltable and their offsets are available.
            break;
        }
        case assignmentNode:{
            switch(node->sc->type){
                case idNode:{
                    SymbolTableEntry* sym = lookupString(node->sc->node.idnode.lexeme, table, idEntry, true, -1);
                    switch(node->sc->rs->type){
                        case numNode:{  //eg: a:=5
                            if(strcmp(node->sc->rs->node.numNode.token,"NUM")==0)   //integer
                                fprintf(file, "\n\tpush ax\n\tmov ax,%d\n\tmov [ebp+%d],ax\n\tpop ax\n", (int)node->sc->rs->node.numNode.value, sym->symbol.idEntry.offset);
                            else{   //real

                            }
                            break;
                        }
                        case boolNode:{ //eg: a:=true
                            break;    
                        }
                        case idNode:{   //eg: a:=b
                            //can have case A:=B where both A and B are arrays
                            break;
                        }
                        case opNode:{   //eg: a:=b+c
                            if(node->sc->rs->node.opNode.typeOfExpr == integer){
                                fprintf(file,"\n\tpush ax\n");
                                codeGen(node->sc->rs, table, file,integer); //this produces output value in ax register (for int) OR al (bool) OR eax(real)
                                fprintf(file, "\tmov [ebp+%d],ax\n\tpop ax\n", sym->symbol.idEntry.offset);
                            }
                            else if(node->sc->rs->node.opNode.typeOfExpr == boolean){
                                fprintf(file, "\n\tpush al\n");
                                codeGen(node->sc->rs,table,file,boolean);
                                fprintf(file, "\tmov [ebp+%d],al\n\tpop al\n", sym->symbol.idEntry.offset);
                            }
                            else{       //real

                            }
                            break;
                        }
                    }
                    break;
                }
                case arrayIdNode:{
                    SymbolTableEntry* sym = lookupString(node->sc->node.idnode.lexeme, table, idEntry, true, -1);
                    switch(node->sc->rs->type){
                        case numNode:{
                            switch(node->sc->sc->rs->type){
                                case idNode:{   //eg: a[b]:=5
                                    break;
                                }
                                case numNode:{  //eg: a[2]:=5
                                    break;
                                }
                            }
                            break;
                        }
                        case boolNode:{
                            switch(node->sc->sc->rs->type){
                                case idNode:{   //eg: a[b]:=false
                                    break;
                                }
                                case numNode:{  //eg: a[2]:=false
                                    break;                                    
                                }
                            }
                            break;
                        }
                        case idNode:{
                            switch(node->sc->sc->rs->type){
                                case idNode:{   //eg: a[b]:=c
                                    break;
                                }
                                case numNode:{  //eg: a[2]:=c
                                    break;                                    
                                }
                            }
                            break;
                        }
                        case opNode:{
                            switch(node->sc->sc->rs->type){
                                case idNode:{   //eg: a[b]:=c+d
                                    break;
                                }
                                case numNode:{  //eg: a[2]:=c+d
                                    break;                                    
                                }
                            }
                            break;
                        }
                    }
                    break;
                }
            }
            break;
        }
        case opNode:{
            //in the end, rax register will store the value of the expression. rax is already pushed onto stack in case before this
            //depending on typeOfExpr (int, bool, real) result will be stored in ax, al, OR ___(xmm?)
            switch(arithExprType){
                case integer:{
                    if(node->sc->rs->type == nullNode){ //special unary op case
                        break;
                    }
                    
                }
                case real:{
                    break;
                }
                case boolean:{
                    break;
                }
            }
            break;
        }
        case idNode:{
            
        }
        case numNode:{

        }
        case inputIONode:{
            SymbolTableEntry* sym = lookupString(node->sc->node.idnode.lexeme,table,idEntry,true,-1);
            switch(sym->symbol.idEntry.type.tag){
                case array:{
                    switch(sym->symbol.idEntry.type.type.arrayType.t){
                        case integer:{  //input integer array..//pehle sirf ye karlo kyuki test case me sirf int arr hai
                            break;
                        }
                        case real:{     //input real array
                            break;
                        }   
                        case boolean:{  //input bool array
                            break;
                        }
                    }
                    break;// nothing
                }
                case primitive:{
                    switch(sym->symbol.idEntry.type.type.primitiveType){
                        case integer:{
                            fprintf(file, "\n\tpush rax\n\tpush rbx\n\tpush rcx\n\tpush rdx\n\tmov rax,4\n\tmov rbx,1\n\tmov rcx,intInput\n\tmov rdx,lenIntInput\n\tint 80h\n\tpop rdx\n\tpop rcx\n\tpop rbx\n\tpop rax\n");
                            //write code for scanning input integer
                            fprintf(file,"\tpush int1\n\tpush Input_Format\n\tcall _scanf\n\tadd esp, 6\n");//6 = 4 + 2//lite.. sahi he na.. u sure?pretty suresill...i
                            fprintf(file,"\tmov ax, [int1]\n");// scanned value now in ax
                            fprintf(file, "\tmov [ebp+%d],ax\n", sym->symbol.idEntry.offset);   //ok
                            break;//ok
                        }   //sun.. neeche outputIoNode me case idNode wala likh de.,
                        case real:{
                            break;
                        }   
                        case boolean:{
                            break;
                        }
                    }
                    break;
                }
            }
            break;
        }
        case outputIONode:{
            switch(node->sc->type){
                case idNode:{
                    SymbolTableEntry* sym = lookupString(node->sc->node.idnode.lexeme, table, idEntry, true, -1);
                    if(sym->symbol.idEntry.type.tag == primitive){
                        switch(sym->symbol.idEntry.type.type.primitiveType){
                            case integer:{  //eg: print(z) where z is an integer
                                fprintf(file,"\tmov bx, [ebp + %d]\n",sym->symbol.idEntry.offset);
                                fprintf(file,"\tpush bx\n\tpush output\n\tcall _printf\n\tadd esp, 6\n");

                                break;
                            }
                            case real:{
                                break;
                            }
                            case boolean:{  //eg: print(x) where x is a boolean (1 byte).. so use al
                                //in memory true is stored as 1, false is stored as 0
                                //same as before.. [ebp+%d], sym->symbol.idEntry,offset
                                //isme check lagana padega.. whether the value is 1 or 0
                                //mup me yaad he cmp instruction hota tha.. compare
                                //uske baad we use jne / je 
                                //for that you need to create labels
                                //so
                                //see upar in this file
                                break;// achha samajh gya.....yes jne and je yes yes..yaad hai....wo 2 ghante ki playlist me ye sab hi hai
                            }
                        }
                    }
                    else{   //if the id is an array, print like this : Output: 12 4 -8 9 10 -18
                        switch(sym->symbol.idEntry.type.type.arrayType.t){
                            case integer:{ //integer array
                                break;
                            }
                            case real:{
                                break;
                            }
                            case boolean:{
                                break;
                            }
                        }
                    }
                    break;
                }
                case numNode:{
                    break;
                }
                case boolNode:{
                    break;
                }
            }
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
    
    utilLabel = 0;

    //add initial lines of code //:)we need headers....they'll go before this..
    fprintf(fout, "\nsection .data\n");
    fprintf(fout,"\toutput: db \"Output: %d\", 0\n");
    fprintf(fout, "\tInput_Format : db \"%d\",0\n");
    fprintf(fout, "\tintInput db \'Input: Enter an integer value\',10,0\n");    //10 is newline character, 0 is null character
    fprintf(fout, "\tlenIntInput equ 30\n");
    fprintf(fout, "\ttrueOutput db \'true\',10,0\n");   //string is terminated by newline followed by null char
    fprintf(fout, "\tlenTrueOutput equ 5");
    fprintf(fout, "\tfalseOutput db \'false\',10,0\n");
    fprintf(fout, "\tlenFalseOutput equ 6");
    fprintf(fout, "\nsection .bss\n\tint1 : resw 1\nsection .text\n\tglobal _start\n\textern _scanf\n\textern _printf\n");
    codeGen(root, table, fout, -1);
    fprintf(fout, "\n\n\tmov rax, 1\n\tint 80h");   //exit the program
    fclose(fout);
    return;
}