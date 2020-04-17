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
int declaredVarOffset;

SymbolTableEntry* createTemporory(int i,PrimitiveType p)
{
    SymbolTableEntry *s =  (SymbolTableEntry *)malloc(sizeof(SymbolTableEntry));
    ASTNode *tempASTNode = createASTNode(idNode);
    s->symbol.idEntry.isTemporary = true;
    switch (p)
    {
    case integer:{
        sprintf(tempASTNode->node.idnode.lexeme,"TI%d",i);
        s->tag = idEntry;
        s->symbol.idEntry.node = tempASTNode;
        s->symbol.idEntry.next = NULL;
        s->symbol.idEntry.type.tag = primitive;
        s->symbol.idEntry.type.type.primitiveType =  integer;
        s->symbol.idEntry.isInputParam = false;
        s->next = NULL;
        s->symbol.idEntry.width = 2;
        break;
    }
    case boolean:{
        sprintf(tempASTNode->node.idnode.lexeme,"TB%d",i);
        s->tag = idEntry;
        s->symbol.idEntry.node = tempASTNode;
        s->symbol.idEntry.next = NULL;
        s->symbol.idEntry.type.tag = primitive;
        s->symbol.idEntry.type.type.primitiveType =  boolean;
        s->symbol.idEntry.isInputParam = false;
        s->next = NULL;
        s->symbol.idEntry.width = 1;
        break;
    }
    case real:{
        sprintf(tempASTNode->node.idnode.lexeme,"TR%d",i);
        s->tag = idEntry;
        s->symbol.idEntry.node = tempASTNode;
        s->symbol.idEntry.next = NULL;
        s->symbol.idEntry.type.tag = primitive;
        s->symbol.idEntry.type.type.primitiveType =  real;
        s->symbol.idEntry.isInputParam = false;
        s->next = NULL;
        s->symbol.idEntry.width = 4;
        break;
    }
    }
    return s;
}

/*This function adds all the required number of temporaries for the currMod module(for codeGen)
currMod -> moduleNode of the module
currOffset -> offset to be given to first temporary variable
*/
void processTemporaries(ASTNode* currMod, int currOffset, SymbolTable* rootSymbolTable){
    //ti%d, tr%d, tb%d
    if(currMod->type == nullNode)
        return;

    SymbolTableEntry* sym;  
    int ofs;
    SymbolTable* currTable;
    if(currMod->sc->type == nullNode){
         sym = lookupString("driverModule",rootSymbolTable,driverEntry,false,-1);
        currTable = sym->table;
        ofs = sym->symbol.driverEntry.activationRecordSize;
    }
    else
    {
        sym = lookupString(currMod->sc->node.idnode.lexeme,rootSymbolTable,functionEntry,false,-1);
        currTable = sym->table;
        ofs = sym->symbol.functionEntry.activationRecordSize;
    }
        
    int i = 1;
    int count =  currMod->node.moduleNode.maxTempInt-1;
    
    while(count > 0)
    {
        SymbolTableEntry* s = createTemporory(i,integer);
        s->symbol.idEntry.offset = ofs;
        ofs += s->symbol.idEntry.width;
        int hash = computeStringHash(s->symbol.idEntry.node->node.idnode.lexeme);
        SymbolTableEntry* temp = currTable->listHeads[hash];
        if(temp == NULL)
        {
            currTable->listHeads[hash] = s;
        }
        else
        {
            while(temp->next != NULL)
                temp =  temp->next;
            temp->next = s;
        }
        i++;
        count--;
    }
    i = 1;
    count =  currMod->node.moduleNode.maxTempBool-1;
    while(count > 0)
    {
        SymbolTableEntry* s = createTemporory(i,boolean);
        s->symbol.idEntry.offset = ofs;
        ofs += s->symbol.idEntry.width;
        int hash = computeStringHash(s->symbol.idEntry.node->node.idnode.lexeme);
        SymbolTableEntry* temp = currTable->listHeads[hash];
        if(temp == NULL)
        {
            currTable->listHeads[hash] = s;
        }
        else
        {
            while(temp->next != NULL)
                temp =  temp->next;
            temp->next = s;
        }
        i++;
        count--;    
    }
    i = 1;
    count = currMod->node.moduleNode.maxTempReal-1;
    while(count > 0)
    {
        SymbolTableEntry* s = createTemporory(i,real);
        s->symbol.idEntry.offset = ofs;
        ofs += s->symbol.idEntry.width;
        int hash = computeStringHash(s->symbol.idEntry.node->node.idnode.lexeme);
        SymbolTableEntry* temp = currTable->listHeads[hash];
        if(temp == NULL)
        {
            currTable->listHeads[hash] = s;
        }
        else
        {
            while(temp->next != NULL)
                temp =  temp->next;
            temp->next = s;
        }
        i++;
        count--;    
    }
}

void computeOffsets(ASTNode* root, SymbolTable* rootSymbolTable){
    ASTNode* otherMod = root->sc->rs;  
    ASTNode* driverMod = root->sc->rs->rs;
    ASTNode* otherMod2 = root->sc->rs->rs->rs;
    while(otherMod != NULL){
        offset = 0;
        declaredVarOffset = 0;
        calcOffsets(otherMod, rootSymbolTable);
        processTemporaries(otherMod, declaredVarOffset, rootSymbolTable);
        otherMod = otherMod->next;
    }
    offset = 0;
    calcOffsets(driverMod, rootSymbolTable); 
    processTemporaries(driverMod, offset, rootSymbolTable);
    while(otherMod2 != NULL){
        offset = 0;
        declaredVarOffset = 0;
        calcOffsets(otherMod2, rootSymbolTable); 
        processTemporaries(otherMod2, declaredVarOffset, rootSymbolTable);
        otherMod2 = otherMod2->next;
    }
}
    

void calcOffsets(ASTNode* currModule, SymbolTable* rootSymbolTable){

    if(currModule->type == nullNode)
        return;
    if(currModule->node.moduleNode.isOverloaded == true)
        return;
    ASTNode* stmtNode = currModule->sc->rs->rs->rs;
	if(currModule->sc->type == nullNode){
		SymbolTableEntry* sym = lookupString("driverModule",rootSymbolTable,driverEntry,false,-1);
   		SymbolTable* currTable = sym->table;//ye calcculate karke neeche function me pass karna he
   		while(stmtNode != NULL){
            processStatement(stmtNode, currTable);
            stmtNode = stmtNode->next;
   		} 
        sym->symbol.driverEntry.activationRecordSize = offset;
        return;			
	}
    
    SymbolTableEntry* sym = lookupString(currModule->sc->node.idnode.lexeme,rootSymbolTable,functionEntry,false,-1);
    SymbolTable* currTable = sym->table;//ye calcculate karke neeche function me pass karna he
    while(stmtNode != NULL){
        processStatement(stmtNode, currTable);
        stmtNode = stmtNode->next;
    }
    sym->symbol.functionEntry.activationRecordSize = offset;
    declaredVarOffset = offset;

    //process input parameters
    offset = 0;
    ASTNode* inputParams = currModule->sc->rs;
    while(inputParams != NULL)
    {
        SymbolTableEntry* sym = lookupString(inputParams->sc->node.idnode.lexeme,currTable,idEntry,false,inputParams->sc->node.idnode.line_no);
        if(sym->symbol.idEntry.type.tag == array){
            sym->symbol.idEntry.offset = offset;
            sym->symbol.idEntry.width = 5;
            offset+=5;
        }
        else{ // primitive type
            PrimitiveType t = sym->symbol.idEntry.type.type.primitiveType;
            if(t == integer){
                sym->symbol.idEntry.offset = offset;
                sym->symbol.idEntry.width = 2;
                offset += 2;
            }
            else if(t == boolean){
                sym->symbol.idEntry.offset = offset;
                sym->symbol.idEntry.width = 1;
                offset += 2;
            }
            else { // real  
                sym->symbol.idEntry.offset = offset;
                sym->symbol.idEntry.width = 4;
                offset += 4;
            }
        }
        inputParams = inputParams->next;
    } 

    //process output parameters
    ASTNode* outputParams = currModule->sc->rs->rs;
    if(outputParams->type != nullNode){
        while(outputParams != NULL)
        {
            SymbolTableEntry* sym = lookupString(outputParams->sc->node.idnode.lexeme,currTable,idEntry,false,outputParams->sc->node.idnode.line_no);
            if(sym->symbol.idEntry.type.tag == array){
                printf("Output Parameters cannot be array :-check symboltable entry for outputparam\n");
            }
            else{ // primitive type
                PrimitiveType t = sym->symbol.idEntry.type.type.primitiveType;
                if(t == integer){
                    sym->symbol.idEntry.offset = offset;
                    sym->symbol.idEntry.width = 2;
                    offset += 2;
                }
                else if(t == boolean){
                    sym->symbol.idEntry.offset = offset;
                    sym->symbol.idEntry.width = 1;
                    offset += 2;
                }
                else { // real  
                    sym->symbol.idEntry.offset = offset;
                    sym->symbol.idEntry.width = 4;
                    offset += 4;
                }
            }
            outputParams = outputParams->next;
        }
    }
}

void processStatement(ASTNode* stmtNode, SymbolTable* currTable){
    switch(stmtNode->type){
        case declareNode:{
            Typeof* declareType = &stmtNode->node.declareNode.typeOfId;
            if(declareType->tag == array){
                if(declareType->type.arrayType.high>=0 && declareType->type.arrayType.low>=0){  //static
                    int factor;
                    switch(declareType->type.arrayType.t){
                        case integer: {factor=2; break;}
                        case real: {factor=4; break;}
                        case boolean: {factor=1; break;}
                    }
                    int currWidth = 1+factor*(declareType->type.arrayType.high - declareType->type.arrayType.low + 1);
                    ASTNode* declareId = stmtNode->sc;
                    while(declareId != NULL){
                        if(declareId->node.idnode.isDuplicate == false){
                            SymbolTableEntry* sym = lookupString(declareId->node.idnode.lexeme,currTable,idEntry,false,declareId->node.idnode.line_no);
                            sym->symbol.idEntry.offset = offset;
                            sym->symbol.idEntry.width = currWidth;
                            offset += currWidth;
                        }
                        declareId = declareId->next;
                    }
                }
                else{       //dynamic..assign width 2
                    ASTNode* declareId = stmtNode->sc;
                    while(declareId != NULL){
                        if(declareId->node.idnode.isDuplicate == false){
                            SymbolTableEntry* sym = lookupString(declareId->node.idnode.lexeme,currTable,idEntry,false,declareId->node.idnode.line_no);
                            sym->symbol.idEntry.offset = offset;
                            sym->symbol.idEntry.width = 1;
                            offset += 2;
                        }
                        declareId = declareId->next;
                    }
                }
            }
            else{       //primitive
                ASTNode* idtraverse = stmtNode->sc;
                while(idtraverse != NULL)
                {
                    if(idtraverse->node.idnode.isDuplicate == false){
                        SymbolTableEntry* sym = lookupString(idtraverse->node.idnode.lexeme,currTable,idEntry,false,idtraverse->node.idnode.line_no);
                        PrimitiveType t = sym->symbol.idEntry.type.type.primitiveType;
                        if(t == integer){
                            sym->symbol.idEntry.offset = offset;
                            sym->symbol.idEntry.width = 2;
                            offset += 2;
                        }
                        else if(t == boolean){
                            sym->symbol.idEntry.offset = offset;
                            sym->symbol.idEntry.width = 1;
                            offset += 2;
                        }
                        else { // real  
                            sym->symbol.idEntry.offset = offset;
                            sym->symbol.idEntry.width = 4;
                            offset += 4;
                        }
                    }
                    idtraverse = idtraverse->next; //push karde
                }
            }
            break;
        }
        case forLoopNode:{
            ASTNode* forLoopStmt = stmtNode->sc->rs->rs;
            SymbolTableEntry* sym = lookupBlock(&stmtNode->node.forLoopNode.block,currTable,forLoopEntry,false);
            SymbolTable* curr= sym->table;
            while(forLoopStmt != NULL){
                processStatement(forLoopStmt,curr);
                forLoopStmt = forLoopStmt->next;
            }
            break;
        }
        case whileLoopNode:{
            ASTNode *whileStmt = stmtNode->sc->rs;
            SymbolTableEntry* sym = lookupBlock(&stmtNode->node.whileLoopNode.block,currTable,whileLoopEntry,false);
            SymbolTable* curr= sym->table;
            //(Block* b, SymbolTable* table, SymbolForm f, bool deepSearch);
            while(whileStmt != NULL)
            {
                processStatement(whileStmt,curr);
                whileStmt = whileStmt->next;
            }
            break;
        }
        case conditionalNode:{
            SymbolTableEntry* sym = lookupBlock(&stmtNode->node.conditionalNode.block,currTable,switchCaseEntry,false);
            SymbolTable* curr = sym->table;
            ASTNode* caseStmt = stmtNode->sc->rs;
            while(caseStmt != NULL){
                processStatement(caseStmt, curr);
                caseStmt = caseStmt->next;
            }
            if(stmtNode->sc->rs->rs->type != nullNode)
                processStatement(stmtNode->sc->rs->rs, curr);
            break;
        }
        case caseNode:{
            ASTNode* stmt = stmtNode->sc;
            while(stmt != NULL){
                processStatement(stmt, currTable);
                stmt = stmt->next;
            }
        }
        default:{
            break;
        }
    }
}

char type_of_element[3][10] = {"integer","real","boolean"};

void printSymbolTableEntry(SymbolTableEntry* sym,SymbolTable* currTable)
{
    switch(sym->tag){
        case idEntry:{
            /*if(sym->symbol.idEntry.isTemporary == true)
                break;*/

            int nestingLevel = 0;
            SymbolTable* table = currTable;
            while(table->tableType != functionBlock){
                nestingLevel++;
                table = table->parent;
            }
            if(strcmp(table->scope.scope,"driverModule")==0){ // case for driverModule
                SymbolTableEntry* s = lookupString(table->scope.scope,table->parent,driverEntry,false,-1);
                if(sym->symbol.idEntry.type.tag == primitive){
                    ASTNode* temp = sym->symbol.idEntry.node;
                    printf("%s  %s  %d-%d   %d  ",sym->symbol.idEntry.node->node.idnode.lexeme, table->scope.scope, s->symbol.driverEntry.block.start, s->symbol.driverEntry.block.end, temp->node.idnode.line_no);
                    printf("%d  no  --- --- %s  %d  %d\n",sym->symbol.idEntry.width, type_of_element[sym->symbol.idEntry.type.type.primitiveType], sym->symbol.idEntry.offset,nestingLevel);
                }
                else{// array node
                    if((sym->symbol.idEntry.type.type.arrayType.low == -1) ||(sym->symbol.idEntry.type.type.arrayType.high == -1)){ //dynamic array
                        ASTNode* temp = sym->symbol.idEntry.node;
                        temp = temp->rs->sc->sc;// range node's first child (low index)
                        printf("%s  %s  %d-%d   %d  yes   ",sym->symbol.idEntry.node->node.idnode.lexeme, table->scope.scope, s->symbol.driverEntry.block.start, s->symbol.driverEntry.block.end, sym->symbol.idEntry.node->node.idnode.line_no);
                        if(sym->symbol.idEntry.type.type.arrayType.low == -1){ //low is idNode
                            printf("%d  dynamic    [%s", sym->symbol.idEntry.width, temp->node.idnode.lexeme);
                        }
                        else{
                            printf("%d  dynamic    [%s", sym->symbol.idEntry.width, temp->node.numNode.lexeme);
                        }
                        if(sym->symbol.idEntry.type.type.arrayType.high == -1){ // high is idnode
                            printf(",%s]    %s  %d  %d\n", temp->rs->node.idnode.lexeme, type_of_element[sym->symbol.idEntry.type.type.primitiveType], sym->symbol.idEntry.offset, nestingLevel);
                        }
                        else{
                            printf(",%s]    %s  %d  %d\n", temp->rs->node.numNode.lexeme, type_of_element[sym->symbol.idEntry.type.type.primitiveType], sym->symbol.idEntry.offset, nestingLevel);
                        }
                    }
                    else //static array
                    {
                        printf("%s  %s  %d-%d   %d  yes  ",sym->symbol.idEntry.node->node.idnode.lexeme, table->scope.scope, s->symbol.driverEntry.block.start, s->symbol.driverEntry.block.end, sym->symbol.idEntry.node->node.idnode.line_no);
                        printf("%d  static [%d,%d] %s  %d  %d\n", sym->symbol.idEntry.width, sym->symbol.idEntry.type.type.arrayType.low, sym->symbol.idEntry.type.type.arrayType.high, type_of_element[sym->symbol.idEntry.type.type.primitiveType], sym->symbol.idEntry.offset,nestingLevel);
                    }                    
                }
            } 
            else {   // case for otherModules
                SymbolTableEntry* s = lookupString(table->scope.scope,table->parent,functionEntry,false,-1);
                if(sym->symbol.idEntry.type.tag == primitive){
                    printf("%s  %s  %d-%d   %d  %d  no  --- --- %s  %d  %d\n",sym->symbol.idEntry.node->node.idnode.lexeme,table->scope.scope,s->symbol.functionEntry.block.start,s->symbol.functionEntry.block.end,sym->symbol.idEntry.node->node.idnode.line_no,sym->symbol.idEntry.width,type_of_element[sym->symbol.idEntry.type.type.primitiveType],sym->symbol.idEntry.offset,nestingLevel);
                }
                else{ // array node

                }
            }
            break;
        }
        case driverEntry:{
            printSymbolTable(sym->table);
            break;
        }
        case functionEntry:{
            printSymbolTable(sym->table);
            break;
        }
        case forLoopEntry:{
            printSymbolTable(sym->table);
            break;
        }
        case whileLoopEntry:{
            printSymbolTable(sym->table);
            break;
        }
        case switchCaseEntry:{
            printSymbolTable(sym->table);
            break;
        }
    }
}

void printSymbolTable(SymbolTable* root)
{
    //printf("variable_name	scope(module_name)	scope(line_numbers)     width	isArray	static_or_dynamic   range_lexemes    type_of_element    offset  nesting_level\n");
    if(root == NULL)
        return;
    SymbolTableEntry* tab;
    int i;
    for(i=0;i<SYM_TABLE_SLOTS;i++)
    {
        tab = root->listHeads[i];
        while(tab != NULL)
        {
            printSymbolTableEntry(tab,root);
            tab = tab->next;
        }
    }
}
