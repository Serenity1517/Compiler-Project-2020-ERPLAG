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

void processArrayIdNode(ASTNode* node, SymbolTable* table, FILE* file, int* currTempNo){

}

void processIntegerExpr(ASTNode* node, SymbolTable* table, FILE* file, int* currTempNo){
    fprintf(file, "\n;------Processing integer expression-----\n");
    //1. process left operand and load it in ax
    if(node->sc->type == numNode)
        fprintf(file, "\n\tmov ax, %d\n", (int)node->sc->node.numNode.value);
    else if(node->sc->type == idNode){
        SymbolTableEntry* sym1 = lookupString(node->sc->node.idnode.lexeme, table, idEntry, true, node->sc->node.idnode.line_no);
        fprintf(file, "\n\tmov ax, WORD[rbp+%d];\tleft operand is %s\n", sym1->symbol.idEntry.offset, node->sc->node.idnode.lexeme);
    }
    else if(node->sc->type == opNode){
        processIntegerExpr(node->sc, table, file, currTempNo);
        char* tempName = createTempVarName(*currTempNo, integer);
        SymbolTableEntry* sym2 = lookupString(tempName, table, idEntry, true, -1);
        fprintf(file, "\n\tmov ax, WORD[rbp+%d];\tleft operand is %s\n", sym2->symbol.idEntry.offset, tempName);
    }
    else{   //arrayIdNode
        processArrayIdNode(node, table, file, currTempNo);
        char* tempName = createTempVarName(*currTempNo, integer);
        SymbolTableEntry* sym9 = lookupString(tempName,table,idEntry,true,-1);
        fprintf(file, "\n\tmov ax, WORD[rbp+%d];\tleft operand is %s", sym9->symbol.idEntry.offset, tempName);
    }

    //2. process right operand and load it in bx 
    fprintf(file, "\tpush rax\n"); //save ax in case it is used below
    if(node->sc->rs->type == numNode)
        fprintf(file, "\tmov bx, %d\n", (int)node->sc->rs->node.numNode.value);
    else if(node->sc->rs->type == idNode){
        SymbolTableEntry* sym3 = lookupString(node->sc->rs->node.idnode.lexeme, table, idEntry, true, node->sc->rs->node.idnode.line_no);
        fprintf(file, "\tmov bx, WORD[rbp+%d];\tright operand is %s\n", sym3->symbol.idEntry.offset, node->sc->rs->node.idnode.lexeme);
    }
    else if(node->sc->rs->type == opNode){
        processIntegerExpr(node->sc->rs, table, file, currTempNo);
        char* tempName = createTempVarName(*currTempNo, integer);
        SymbolTableEntry* sym4 = lookupString(tempName, table, idEntry, true, -1);
        fprintf(file, "\tmov bx, WORD[rbp+%d];\tright operand is %s\n", sym4->symbol.idEntry.offset, tempName);
    }
    else{   //arrayIdNdoe
        processArrayIdNode(node, table, file, currTempNo);
        char* tempName = createTempVarName(*currTempNo, integer);
        SymbolTableEntry* sym9 = lookupString(tempName,table,idEntry,true,-1);
        fprintf(file, "\n\tmov bx, WORD[rbp+%d];\tleft operand is %s", sym9->symbol.idEntry.offset, tempName);
    }
    
    //3. perform the calculation
    fprintf(file, "\tpop rax\n");
    if(strcmp(node->node.opNode.token, "PLUS")==0)
        fprintf(file, "\tadd ax,bx\n");
    else if(strcmp(node->node.opNode.token, "MUL")==0)
        fprintf(file, "\tmul bx\n");    //assumes no overflow.. result fits in 16 bit ax register
    else if(strcmp(node->node.opNode.token, "MINUS")==0)
        fprintf(file, "\tsub ax,bx\n");
    else{
        //DIV
    }

    //4. store final res(inside ax) into temporary variable
    *currTempNo += 1;
    char* finalTemp = createTempVarName(*currTempNo, integer);
    SymbolTableEntry* sym = lookupString(finalTemp, table, idEntry, true, -1);
    fprintf(file, "\tmov WORD[rbp+%d], ax\n;------expression computed. result is in %s------\n", sym->symbol.idEntry.offset, finalTemp);
    return;
}

void processBooleanExpr(ASTNode* node, SymbolTable* table, FILE* file, int* currTempNo, int* currUtilIntNo){
    fprintf(file, "\n;------Processing boolean expression-----\n");
    //1. process left operand and load it in ax/al
    if(node->sc->type == boolNode){
        if(strcmp(node->sc->node.boolNode.token, "TRUE")==0)
            fprintf(file, "\tmov al, 1\n");
        else
            fprintf(file, "\tmov al, 0\n");
    }
	else if(node->sc->type == numNode)
		fprintf(file, "\n\tmov ax, %d\n", (int)node->sc->node.numNode.value);
    else if(node->sc->type == idNode){
         SymbolTableEntry* sym1 = lookupString(node->sc->node.idnode.lexeme, table, idEntry, true, node->sc->node.idnode.line_no);
		if(sym1->symbol.idEntry.type.type.primitiveType == boolean)
        	fprintf(file, "\n\tmov al, BYTE[rbp+%d];\tleft operand is %s\n", sym1->symbol.idEntry.offset, node->sc->node.idnode.lexeme);
		else
			fprintf(file, "\n\tmov ax, WORD[rbp+%d];\tleft operand is %s\n", sym1->symbol.idEntry.offset, node->sc->node.idnode.lexeme);
    }
    else if(node->sc->type == opNode){
        if(strcmp(node->sc->node.opNode.token,"GE") ||
            strcmp(node->sc->node.opNode.token,"LE") ||
            strcmp(node->sc->node.opNode.token,"GT") ||
            strcmp(node->sc->node.opNode.token,"LT") ||
            strcmp(node->sc->node.opNode.token,"NE") ||
            strcmp(node->sc->node.opNode.token,"EQ") ||
            strcmp(node->sc->node.opNode.token,"AND") ||
            strcmp(node->sc->node.opNode.token,"OR")){
                processBooleanExpr(node->sc, table, file, currTempNo, currUtilIntNo);
                char* tempName = createTempVarName(*currTempNo, boolean);
                SymbolTableEntry* sym2 = lookupString(tempName, table, idEntry, true, -1);
                fprintf(file, "\n\tmov al, BYTE[rbp+%d];\tleft operand is %s\n", sym2->symbol.idEntry.offset, tempName);
            }
        else {  //arithmetic operator
            processIntegerExpr(node->sc, table, file, currUtilIntNo);
            char* tempName = createTempVarName(*currUtilIntNo, integer);
            SymbolTableEntry* sym2 = lookupString(tempName, table, idEntry, true, -1);
            fprintf(file, "\n\tmov ax, WORD[rbp+%d];\tleft operand is %s\n", sym2->symbol.idEntry.offset, tempName);
        }
    }
    else{
        processArrayIdNode(node->sc, table, file, currTempNo);
        char* tempName = createTempVarName(*currTempNo, boolean);
        SymbolTableEntry* sym9 = lookupString(tempName,table,idEntry,true,-1);
        fprintf(file, "\n\tmov al, BYTE[rbp+%d];\tleft operand is %s", sym9->symbol.idEntry.offset, tempName);
    }
    
    //2. process right operand and load it in bx/bl
    fprintf(file, "\tpush rax\n"); //save al in case it is used below
    if(node->sc->rs->type == boolNode){
        if(strcmp(node->sc->rs->node.boolNode.token, "TRUE")==0)
            fprintf(file, "\tmov bl, 1\n");
        else
            fprintf(file, "\tmov bl, 0\n");
    }
	else if(node->sc->rs->type == numNode)
		fprintf(file, "\n\tmov bx, %d\n", (int)node->sc->rs->node.numNode.value);
    else if(node->sc->rs->type == idNode){
         SymbolTableEntry* sym1 = lookupString(node->sc->rs->node.idnode.lexeme, table, idEntry, true, node->sc->rs->node.idnode.line_no);
        if(sym1->symbol.idEntry.type.type.primitiveType == boolean)
        	fprintf(file, "\n\tmov bl, BYTE[rbp+%d];\tleft operand is %s\n", sym1->symbol.idEntry.offset, node->sc->rs->node.idnode.lexeme);
		else
			fprintf(file, "\n\tmov bx, WORD[rbp+%d];\tleft operand is %s\n", sym1->symbol.idEntry.offset, node->sc->rs->node.idnode.lexeme);
    }
    else if(node->sc->rs->type == opNode){
        if(strcmp(node->sc->rs->node.opNode.token,"GE") ||
            strcmp(node->sc->rs->node.opNode.token,"LE") ||
            strcmp(node->sc->rs->node.opNode.token,"GT") ||
            strcmp(node->sc->rs->node.opNode.token,"LT") ||
            strcmp(node->sc->rs->node.opNode.token,"NE") ||
            strcmp(node->sc->rs->node.opNode.token,"EQ") ||
            strcmp(node->sc->rs->node.opNode.token,"AND") ||
            strcmp(node->sc->rs->node.opNode.token,"OR")){
                processBooleanExpr(node->sc->rs, table, file, currTempNo, currUtilIntNo);
                char* tempName = createTempVarName(*currTempNo, boolean);
                SymbolTableEntry* sym2 = lookupString(tempName, table, idEntry, true, -1);
                fprintf(file, "\n\tmov bl, BYTE[rbp+%d];\tright operand is %s\n", sym2->symbol.idEntry.offset, tempName);
            }
        else {  //arithmetic operator
            processIntegerExpr(node->sc->rs, table, file, currUtilIntNo);
            char* tempName = createTempVarName(*currUtilIntNo, integer);
            SymbolTableEntry* sym2 = lookupString(tempName, table, idEntry, true, -1);
            fprintf(file, "\n\tmov bx, WORD[rbp+%d];\tright operand is %s\n", sym2->symbol.idEntry.offset, tempName);
        }
    }
    else{
        processArrayIdNode(node->sc->rs, table, file, currTempNo);
        char* tempName = createTempVarName(*currTempNo, boolean);
        SymbolTableEntry* sym9 = lookupString(tempName,table,idEntry,true,-1);
        fprintf(file, "\n\tmov bl, BYTE[rbp+%d];\tleft operand is %s", sym9->symbol.idEntry.offset, tempName);
    }

    //3. perform the calculation
    fprintf(file, "\tpop rax\n");
    //First 6 operators operate on integers stored in ax,bx
    if(strcmp(node->node.opNode.token, "GT")==0){
        fprintf(file, "\tcmp ax,bx\n\tjg greater%d\n",utilLabel);
        fprintf(file, "\tmov al,0\n\tjmp notgreater%d\n",utilLabel);
        fprintf(file, "greater%d:\n\tmov al,1\nnotgreater%d:\n",utilLabel,utilLabel);
        utilLabel++;
    }
    else if(strcmp(node->node.opNode.token, "GE")==0){
        fprintf(file, "\tcmp ax,bx\n\tjge greatereq%d\n",utilLabel);
        fprintf(file, "\tmov al,0\n\tjmp notgreatereq%d\n",utilLabel);
        fprintf(file, "greatereq%d:\n\tmov al,1\nnotgreatereq%d:\n",utilLabel,utilLabel);
        utilLabel++;
    }
    else if(strcmp(node->node.opNode.token, "LT")==0){
        fprintf(file, "\tcmp ax,bx\n\tjl lesser%d\n",utilLabel);
        fprintf(file, "\tmov al,0\n\tjmp notlesser%d\n",utilLabel);
        fprintf(file, "lesser%d:\n\tmov al,1\nnotlesser%d:\n",utilLabel,utilLabel);
        utilLabel++;
    }
    else if(strcmp(node->node.opNode.token, "LE")==0){
        fprintf(file, "\tcmp ax,bx\n\tjle lessereq%d\n",utilLabel);
        fprintf(file, "\tmov al,0\n\tjmp notlessereq%d\n",utilLabel);
        fprintf(file, "lessereq%d:\n\tmov al,1\nnotlessereq%d:\n",utilLabel,utilLabel);
        utilLabel++;
    }
    else if(strcmp(node->node.opNode.token, "NE")==0){
        fprintf(file, "\tcmp ax,bx\n\tjne notequal%d\n",utilLabel);
        fprintf(file, "\tmov al,0\n\tjmp notnotequal%d\n",utilLabel);
        fprintf(file, "notequal%d:\n\tmov al,1\nnotnotequal%d:\n",utilLabel,utilLabel);
        utilLabel++;
    }
    else if(strcmp(node->node.opNode.token, "EQ")==0){
        fprintf(file, "\tcmp ax,bx\n\tje equal%d\n",utilLabel);
        fprintf(file, "\tmov al,0\n\tjmp notequal%d\n",utilLabel);
        fprintf(file, "equal%d:\n\tmov al,1\nnotequal%d:\n",utilLabel,utilLabel);
        utilLabel++;
    }
    //Next 2 operators operate on booleans stored in al,bl
    else if(strcmp(node->node.opNode.token, "AND")==0)
        fprintf(file, "\tand al, bl\n");
    else if(strcmp(node->node.opNode.token, "OR")==0){
        fprintf(file, "\tor al, bl\n");
    }

    //4. store final res(inside al) into temporary variable
    *currTempNo += 1;
    char* finalTemp = createTempVarName(*currTempNo, boolean);
    SymbolTableEntry* sym = lookupString(finalTemp, table, idEntry, true, -1);
    fprintf(file, "\tmov BYTE[rbp+%d], al\n;------expression computed. result is in %s------\n", sym->symbol.idEntry.offset, finalTemp);
    return;
}

int processExpression(ASTNode* node, SymbolTable* table, FILE* file, PrimitiveType exprType){
    int finalTempNo = 0;
    int utilIntTempNo = 0;
    if(exprType == integer)
        processIntegerExpr(node, table, file, &finalTempNo);
    else if(exprType == boolean)
        processBooleanExpr(node, table, file, &finalTempNo, &utilIntTempNo);
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
                            fprintf(file, "\tmov al, BYTE[rbp+%d]\n", rhsSym->symbol.idEntry.offset);
                            type_of_assignment = 0;
                        }
                        else if(rhsSym->symbol.idEntry.type.type.primitiveType == integer){
                            fprintf(file, "\tmov ax, WORD[rbp+%d]\n", rhsSym->symbol.idEntry.offset);
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
                        fprintf(file, "\tmov ax, WORD[rbp+%d]\n", sym->symbol.idEntry.offset);
                        type_of_assignment = 1;
                    }
                    else if(node->sc->rs->node.opNode.typeOfExpr == boolean){
                        int tempBoolVarNo = processExpression(node->sc->rs, table, file, boolean);
                        char* tempName = createTempVarName(tempBoolVarNo, boolean);
                        SymbolTableEntry* sym = lookupString(tempName, table, idEntry, true, -1);
                        fprintf(file, "\tmov al, BYTE[rbp+%d]\n", sym->symbol.idEntry.offset);
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
                    fprintf(file, "\tmov BYTE[rbp+%d], al\n", lhsSym->symbol.idEntry.offset);
                else if(type_of_assignment == 1)
                    fprintf(file, "\tmov WORD[rbp+%d], ax\n", lhsSym->symbol.idEntry.offset);
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
                            int h = sym->symbol.idEntry.type.type.arrayType.high;
                            int l = sym->symbol.idEntry.type.type.arrayType.low;
                            int iteration = h-l+1;
                            fprintf(file,"\n;-------code for scanning integer array-------\n");
                            fprintf(file,"\tpush rbp\n");
                            fprintf(file,"\tmov rdi, Input_Array1\n");
                            fprintf(file,"\tmov rsi, %d\n",iteration);
                            fprintf(file,"\txor rax, rax\n\tcall printf\n\tpop rbp\n");
                            //////////////////////////////
                            fprintf(file,"\tpush rbp\n");
                            fprintf(file,"\tmov rdi, onScreenInt\n");
                            fprintf(file,"\txor rax, rax\n\tcall printf\n\tpop rbp\n");
                            /////////////////////////////
                            fprintf(file,"\tpush rbp\n");
                            fprintf(file,"\tmov rdi, Input_Array2\n");
                            fprintf(file,"\tmov rsi, %d\n",l);
                            fprintf(file,"\tmov rdx, %d\n",h);
                            fprintf(file,"\txor rax, rax\n\tcall printf\n\tpop rbp\n");
                            int i = 0;
                            int off = sym->symbol.idEntry.offset;
                            while(iteration > 0)
                            {
                                fprintf(file,"\tpush rbp\n");
                                fprintf(file,"\tmov rdi, Input_Format\n");
                                fprintf(file,"\tlea rsi, [int1]\n");
                                fprintf(file,"\txor rax, rax\n");
                                fprintf(file,"\tcall scanf\n");
                                fprintf(file,"\tpop rbp\n");
                                fprintf(file,"\tmov WORD[rbp + %d], ax\n",(i*2 + off));
                                i++;
                                iteration--;
                            }
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
                            fprintf(file, "\n;-----code for scanning integer variable----\n\tpush rbp\n\tmov rdi, inputInt\n\txor rax, rax\n\tcall printf\n\tpop rbp\n");
                            //write code for scanning input integer
                            fprintf(file, "\tpush rbp\n\tmov rdi, Input_Format\n\tlea rsi,[int1]\n\txor rax,rax\n\tcall scanf\n\tpop rbp\n");//6 = 4 + 2//lite.. sahi he na.. u sure?pretty suresill...i
                            fprintf(file, "\tmov ax, WORD[int1]\n");// scanned value now in ax
                            fprintf(file, "\tmov WORD[rbp+%d],ax\n;-----------\n", sym->symbol.idEntry.offset);
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
                                fprintf(file, "\n;------code for printing integer variable-----\n\tpush rbp\n\tmov ax, WORD[rbp + %d]\n",sym->symbol.idEntry.offset);
                                fprintf(file, "\tmov rdi, output\n\tmovsx rsi, ax\n\txor rax, rax\n\tcall printf\n\tpop rbp\n;------------\n");

                                break;
                            }
                            case real:{
                                break;
                            }
                            case boolean:{  
                                //[rbp+%d], sym->symbol.idEntry.offset --> al
                                //eg: print(x) where x is a boolean (1 byte).. so use al
                                //in memory true is stored as 1, false is stored as 0
                                //same as before.. [rbp+%d], sym->symbol.idEntry,offset
                                //isme check lagana padega.. whether the value is 1 or 0
                                //mup me yaad he cmp instruction hota tha.. compare
                                //uske baad we use jne / je 
                                //for that you need to create labels
                                //so
                                //see upar in this file
                                fprintf(file, "\n;------code for printing Boolean variable-----\n");
                                fprintf(file,"\tmov al, BYTE[rbp + %d]\n",sym->symbol.idEntry.offset);
                                fprintf(file,"\tcmp al, 1\n\tjne zero%d\n\tpush rbp\n\tmov rdi, trueOutput\n\txor rax, rax\n\tcall printf\n\tpop rbp\n",utilLabel++);
                                fprintf(file,"\tjmp empty%d\n",utilLabel++);
                                fprintf(file,"\tzero%d:\n\tpush rbp\n\tmov rdi, falseOutput\n\t\txor rax, rax\n\t\tcall printf\n\tpop rbp\n",utilLabel - 2);
                                fprintf(file,"\tempty%d:\n",utilLabel - 1);

                                break;// achha samajh gya.....yes jne and je yes yes..yaad hai....wo 2 ghante ki playlist me ye sab hi hai
                            }
                        }
                    }
                    else{   //if the id is an array, print like this : Output: 12 4 -8 9 10 -18
                        switch(sym->symbol.idEntry.type.type.arrayType.t){
                            case integer:{ //integer array
                                if(sym->symbol.idEntry.type.type.arrayType.low>=0 && sym->symbol.idEntry.type.type.arrayType.high>=0){  //static array
                                    fprintf(file,"\n;-------code for printing static array---------\n");
                                    int h = sym->symbol.idEntry.type.type.arrayType.high;
                                    int l = sym->symbol.idEntry.type.type.arrayType.low;
                                    int iteration = h-l+1;
                                    int ofs = sym->symbol.idEntry.offset;
                                    int i = 0;
                                    fprintf(file, "\tpush rbp\n\tmov rdi, output_array\n\txor rax, rax\n\tcall printf\n\tpop rbp\n;------------\n");
                                    
                                    while(iteration > 0){
                                        fprintf(file,"\tpush rbp\n\tmov ax, WORD[rbp + %d]\n",(ofs + 2*i));
                                        fprintf(file, "\tmov rdi, array_value\n\tmovsx rsi, ax\n\txor rax, rax\n\tcall printf\n\tpop rbp\n;------------\n");
                                        i++;
                                        iteration--;
                                    } 
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
        case forLoopNode:{
            SymbolTableEntry* sym = lookupString(node->sc->node.idnode.lexeme, table, idEntry, true, node->sc->node.idnode.line_no);
            // checking range of for loop iterating variable
            fprintf(file, ";---------------Code for ForLoop-------------------\n");
            if(node->sc->rs->sc->type == numNode && node->sc->rs->sc->rs->type == numNode){ //both range Nodes are integer
                fprintf(file, "\tmov WORD[rbp + %d], %d\n",sym->symbol.idEntry.offset, (int)node->sc->rs->sc->node.numNode.value);
                fprintf(file,"forLoopEntry%d:\n",forLoopLabel++);
                fprintf(file,"\tmov ax, WORD[rbp + %d]\n",sym->symbol.idEntry.offset);
                fprintf(file,"\tcmp ax, %d\n", (int)node->sc->rs->sc->rs->node.numNode.value+1);
                fprintf(file, "\tje forLoopExit%d:",forLoopLabel-1);
                SymbolTableEntry* sym2 = lookupBlock(&node->node.forLoopNode.block, table, forLoopEntry, false);
                ASTNode* temp = node->sc->rs->rs;
                if(temp->type != nullNode){
                    while(temp != NULL){
                        codeGen(temp, sym2->table, file);
                        temp = temp->next;
                    }
                }
                fprintf(file,"\tmov ax, WORD[rbp + %d]\n",sym->symbol.idEntry.offset);
                fprintf(file,"\tinc ax\n");
                fprintf(file,"\tmov [rbp + %d], ax\n",sym->symbol.idEntry.offset);
                fprintf(file,"\tjmp forLoopEntryt%d\n",forLoopLabel-1);
                fprintf(file,"foLoopExit%d:\n",forLoopLabel-1);
            }
            else if(node->sc->rs->sc->type == idNode && node->sc->rs->sc->rs->type == numNode)    
            {
                
            }
            else if(node->sc->rs->sc->type == numNode && node->sc->rs->sc->rs->type == idNode){

            }
            else{ // both idNodes

            }
            
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
    forLoopLabel = 0;
    whileLoopLabel = 0;
    caseLabel = 0;
    //add initial lines of code //:)we need headers....they'll go before this..
    fprintf(fout, "\nsection .data\n");
    fprintf(fout,"\tinputInt: db \"Input: Enter an integer value\",10,0\n");//resume
    fprintf(fout,"\toutput: db \"Output: %%"); fprintf(fout, "d\", 10, 0\n");
    fprintf(fout,"output_array : db \"Output: \",0\n");
    fprintf(fout,"array_value : db \" %%"); fprintf(fout,"d\",0\n");
    fprintf(fout, "\tInput_Format : db \"%%"); fprintf(fout, "d\",0\n");
    fprintf(fout, "\tInput_Array1 : db \"Input: Enter %%"); fprintf(fout,"d elements of\", 0\n"); 
    fprintf(fout, "\tonScreenInt : db \"integer\", 0\n");
    fprintf(fout, "\tonScreenBool : db \"boolean\", 0\n");
    fprintf(fout, "\tonScreenReal : db \"real\", 0\n");
    fprintf(fout, "\tInput_Array2 : db \" for range %%"); fprintf(fout, "d to %%"); fprintf(fout, "d\", 10, 0\n");
    fprintf(fout, "\ttrueOutput db \"Output: true\",10,0\n");   //string is terminated by newline followed by null char
    fprintf(fout, "\tfalseOutput db \"Output: false\",10,0\n");//listen// did you change this
    fprintf(fout, "\tlenFalseOutput equ 6");
    fprintf(fout, "\nsection .bss\n\tint1 : resd 1\nsection .text\n\tglobal main\n\textern scanf\n\textern printf\n");
    codeGen(root, table, fout);
    fprintf(fout, "\n\n\tmov rax, 1\n\tint 80h\n");   //exit the program
    fclose(fout);
    return;
}
