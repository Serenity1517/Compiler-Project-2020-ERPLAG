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

int utilLabel;  //util%d, utilLabel; utilLabel++
int forLoopLabel;
int whileLoopLabel;
int caseLabel;

char* createTempVarName(int num, PrimitiveType type){
    char* res = malloc(sizeof(char)*4);
    refreshBuffer(res, 4);
    if(type == integer)
        sprintf(res, "TI%d", num);
    else if(type == boolean)
        sprintf(res, "TB%d", num);
    else
        sprintf(res, "TR%d", num);
    return res;
}

void processIntegerExpr(ASTNode* node, SymbolTable* table, FILE* file, int* currTempNo){
    fprintf(file, "\n;------Processing integer expression-----\n");
    //1. process left operand and load it in ax
    if(node->sc->type == numNode)
        fprintf(file, "\n\tmov ax, %d\n", (int)node->sc->node.numNode.value);
    else if(node->sc->type == idNode){
        SymbolTableEntry* sym1 = lookupString(node->sc->node.idnode.lexeme, table, idEntry, true, node->sc->node.idnode.line_no);
        fprintf(file, "\n\tmov ax, [ebp+%d];\tleft operand is %s\n", sym1->symbol.idEntry.offset, node->sc->node.idnode.lexeme);
    }
    else if(node->sc->type == opNode){
        processIntegerExpr(node->sc, table, file, currTempNo);
        char* tempName = createTempVarName(*currTempNo, integer);
        SymbolTableEntry* sym2 = lookupString(tempName, table, idEntry, true, -1);
        fprintf(file, "\n\tmov ax, [ebp+%d];\tleft operand is %s\n", sym2->symbol.idEntry.offset, tempName);
    }
    else{
           //arrayIdNode
    }

    //2. process right operand and load it in bx 
    fprintf(file, "\tpush ax\n"); //save ax in case it is used below
    if(node->sc->rs->type == numNode)
        fprintf(file, "\tmov bx, %d\n", (int)node->sc->rs->node.numNode.value);
    else if(node->sc->rs->type == idNode){
        SymbolTableEntry* sym3 = lookupString(node->sc->rs->node.idnode.lexeme, table, idEntry, true, node->sc->rs->node.idnode.line_no);
        fprintf(file, "\tmov bx, [ebp+%d];\tright operand is %s\n", sym3->symbol.idEntry.offset, node->sc->rs->node.idnode.lexeme);
    }
    else if(node->sc->rs->type == opNode){
        processIntegerExpr(node->sc->rs, table, file, currTempNo);
        char* tempName = createTempVarName(*currTempNo, integer);
        SymbolTableEntry* sym4 = lookupString(tempName, table, idEntry, true, -1);
        fprintf(file, "\tmov bx, [ebp+%d];\tright operand is %s\n", sym4->symbol.idEntry.offset, tempName);
    }
    else{
        //arrayIdNode
    }
    
    //3. perform the calculation
    fprintf(file, "\tpop ax\n");
    if(strcmp(node->node.opNode.token, "PLUS")==0)
        fprintf(file, "\tadd ax,bx\n");
    else if(strcmp(node->node.opNode.token, "MUL")==0)
        fprintf(file, "\tmul bx\n");    //assumes no overflow.. result fits in 16 bit ax register
    else if(strcmp(node->node.opNode.token, "MINUS")==0)
        fprintf(file, "\tsub ax,bx\n");
    else{
        //DIV
    }

    //3. store final res(inside ax) into temporary variable
    *currTempNo += 1;
    char* finalTemp = createTempVarName(*currTempNo, integer);
    SymbolTableEntry* sym = lookupString(finalTemp, table, idEntry, true, -1);
    fprintf(file, "\tmov [ebp+%d], ax\n;------expression computed. result is in %s------", sym->symbol.idEntry.offset, finalTemp);
    return;
}

void processBooleanExpr(ASTNode* node, SymbolTable* table, FILE* file, int* currTempNo){

}

int processExpression(ASTNode* node, SymbolTable* table, FILE* file, PrimitiveType exprType){
    int finalTempNo = 0;
    if(exprType == integer)
        processIntegerExpr(node, table, file, &finalTempNo);
    else if(exprType == boolean)
        processBooleanExpr(node, table, file, &finalTempNo);
    else{}
        //processRealExpr(node, table, file, &finalTempNo);
    fprintf(file, "\n;-----expression processed, result is stored inside temp number %d of type %d\n", finalTempNo, exprType);
    return finalTempNo;
}   

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
            fprintf(file, "\nmain:\n");
            codeGen(driverMod, driver_entry->table, file);
            break;
        }
        case moduleNode:{
            //1. Special case of driver module
            if(node->sc->type == nullNode){
                SymbolTableEntry* sym = lookupString("driverModule", table->parent, driverEntry, false, -1);
                fprintf(file, "\tsub rsp, %d\n", sym->symbol.driverEntry.ARSizeWithTemp);
                fprintf(file, "\tmov rbp, rsp\n");  //for driver, the frame base is same as bottom of stack.(as the frame/activation record for the driver function is located right at the bottom of the stack)
                ASTNode* stmt = node->sc->rs->rs->rs;
                while(stmt != NULL){
                    codeGen(stmt, table, file);
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
            //1.first compute rhs and store result in eax/ax/al
            int type_of_assignment = -1;        //set 0 for boolean, 1 for int 2, for real
            fprintf(file, "\n;-------assignment stmt-----\n\tpush rax\n");
            switch(node->sc->rs->type){
                case numNode:{
                    if(strcmp(node->sc->rs->node.numNode.token,"NUM")==0){
                        fprintf(file, "\tmov ax, %d\n", (int)node->sc->rs->node.numNode.value);
                        type_of_assignment = 1;
                    }
                    else{
                        //real
                        type_of_assignment = 2;
                    }
                    break;
                }
                case boolNode:{
                    type_of_assignment = 0;
                    if(strcmp(node->sc->rs->node.boolNode.token, "TRUE")==0)
                        fprintf(file, "\tmov al, 1\n");
                    else
                        fprintf(file, "\tmov al, 0\n");
                    break;
                }
                case idNode:{
                    SymbolTableEntry* rhsSym = lookupString(node->sc->rs->node.idnode.lexeme, table, idEntry, true, node->sc->rs->node.idnode.line_no);
                    if(rhsSym->symbol.idEntry.type.tag == primitive){
                        if(rhsSym->symbol.idEntry.type.type.primitiveType == boolean){
                            fprintf(file, "\tmov al, [ebp+%d]\n", rhsSym->symbol.idEntry.offset);
                            type_of_assignment = 0;
                        }
                        else if(rhsSym->symbol.idEntry.type.type.primitiveType == integer){
                            fprintf(file, "\tmov ax, [ebp+%d]\n", rhsSym->symbol.idEntry.offset);
                            type_of_assignment = 1;
                        }
                        else{
                            type_of_assignment = 2;
                            //real
                        }
                    }
                    else{   //case A:=B where both A and B are arrays
                        //array
                    }
                    break;
                }
                case arrayIdNode:{
                    //rhs is like A[3] or A[b]
                    break;
                }
                case opNode:{
                    if(node->sc->rs->node.opNode.typeOfExpr == integer){
                        int tempIntVarNo = processExpression(node->sc->rs, table, file, integer);
                        char* tempName = createTempVarName(tempIntVarNo, integer);
                        SymbolTableEntry* sym = lookupString(tempName, table, idEntry, true, -1);
                        fprintf(file, "\tmov ax, [ebp+%d]\n", sym->symbol.idEntry.offset);
                        type_of_assignment = 1;
                    }
                    else if(node->sc->rs->node.opNode.typeOfExpr == boolean){
                        int tempBoolVarNo = processExpression(node->sc->rs, table, file, boolean);
                        char* tempName = createTempVarName(tempBoolVarNo, boolean);
                        SymbolTableEntry* sym = lookupString(tempName, table, idEntry, true, -1);
                        fprintf(file, "\tmov al, [ebp+%d]\n", sym->symbol.idEntry.offset);
                        type_of_assignment = 0;
                    }
                    else{
                        //real
                    }
                    break;
                }

            }
            //2. now perform the assignment
            if(node->sc->type == arrayIdNode){  //lhs -> a[2] or a[b]
                //a[2] = ...
            }
            else{       //idnode
                SymbolTableEntry* lhsSym = lookupString(node->sc->node.idnode.lexeme, table, idEntry, true, -1);
                if(type_of_assignment == 0)
                    fprintf(file, "\tmov [ebp+%d], al\n", lhsSym->symbol.idEntry.offset);
                else if(type_of_assignment == 1)
                    fprintf(file, "\tmov [ebp+%d], ax\n", lhsSym->symbol.idEntry.offset);
                else if(type_of_assignment == 2){} //real
            }
                  
            //3. restore rax  
            fprintf(file, "\tpop rax\n;--------------\n");
            break;
        }
        case opNode:{         
            break;
        }
        case idNode:{
            break;
        }
        case numNode:{
            break;
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
                            fprintf(file, "\n;-----code for scanning integer variable----\npush inputInt\n\tcall printf\n");
                            //write code for scanning input integer
                            fprintf(file, "\tpush int1\n\tpush Input_Format\n\tcall scanf\n\tadd esp, 6\n");//6 = 4 + 2//lite.. sahi he na.. u sure?pretty suresill...i
                            fprintf(file, "\tmov ax, [int1]\n");// scanned value now in ax
                            fprintf(file, "\tmov [ebp+%d],ax\n;-----------\n", sym->symbol.idEntry.offset);
                            break;
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
                                fprintf(file, "\n;------code for printing integer variable-----\n\tmov bx, [ebp + %d]\n",sym->symbol.idEntry.offset);
                                fprintf(file, "\tpush bx\n\tpush output\n\tcall printf\n\tadd esp, 6\n;------------\n");

                                break;
                            }
                            case real:{
                                break;
                            }
                            case boolean:{  
                                //[ebp+%d], sym->symbol.idEntry.offset --> al
                                //eg: print(x) where x is a boolean (1 byte).. so use al
                                //in memory true is stored as 1, false is stored as 0
                                //same as before.. [ebp+%d], sym->symbol.idEntry,offset
                                //isme check lagana padega.. whether the value is 1 or 0
                                //mup me yaad he cmp instruction hota tha.. compare
                                //uske baad we use jne / je 
                                //for that you need to create labels
                                //so
                                //see upar in this file
                                fprintf(file, "\n;------code for printing Boolean variable-----\n");
                                fprintf(file,"\tmov al, [ebp + %d]\n",sym->symbol.idEntry.offset);
                                fprintf(file,"\tcmp al, 1\n\tjne zero%d\n\tpush trueOutput\n\tcall printf\n",utilLabel++);
                                fprintf(file,"\tjmp empty%d\n",utilLabel++);
                                fprintf(file,"\tzero%d:\n\t\tpush falseOutput\n\t\tcall printf\n",utilLabel - 2);
                                fprintf(file,"\tempty%d:\n",utilLabel - 1);

                                break;// achha samajh gya.....yes jne and je yes yes..yaad hai....wo 2 ghante ki playlist me ye sab hi hai
                            }
                        }
                    }
                    else{   //if the id is an array, print like this : Output: 12 4 -8 9 10 -18
                        switch(sym->symbol.idEntry.type.type.arrayType.t){
                            case integer:{ //integer array
                                if(sym->symbol.idEntry.type.type.arrayType.low>=0 && sym->symbol.idEntry.type.type.arrayType.high>=0){  //static array
                                    
                                }
                                else{
                                    //dynamic
                                }
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
    fprintf(fout,"\tinputInt: db \"Input: Enter an integer value\",10,0\n");//resume
    fprintf(fout,"\toutput: db \"Output: %d\", 0\n");
    fprintf(fout, "\tInput_Format : db \"%d\",0\n");
    fprintf(fout, "\tintInput db \'Input: Enter an integer value\',10,0\n");    //10 is newline character, 0 is null character
    fprintf(fout, "\tlenIntInput equ 30\n");
    fprintf(fout, "\tlenTrueOutput equ 5\n");
    fprintf(fout, "\ttrueOutput db \"Output: true\",10,0\n");   //string is terminated by newline followed by null char
    fprintf(fout, "\tfalseOutput db \"Output: false\",10,0\n");//listen// did you change this
    fprintf(fout, "\tlenFalseOutput equ 6");
    fprintf(fout, "\nsection .bss\n\tint1 : resw 1\nsection .text\n\tglobal main\n\textern scanf\n\textern printf\n");
    codeGen(root, table, fout);
    fprintf(fout, "\n\n\tmov rax, 1\n\tint 80h");   //exit the program
    fclose(fout);
    return;
}
