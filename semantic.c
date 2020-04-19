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

ListOfErrors* semanticErrors;
bool whileLoopAssignsValue;

ListOfErrors* getSemanticErrorObject()
{
    return semanticErrors;
}

//then call the typechecking functions from here
//for the same, we will pass error object to every function
void initializeErrorObject(){
    semanticErrors = (ListOfErrors*)malloc(sizeof(ListOfErrors));
    semanticErrors->head = NULL;
    semanticErrors->numberOfErr = 0;
}

Error* createErrorObject()
{
    Error *error = (Error *)malloc(sizeof(Error));
    error->next = NULL;
    return error;
}

/*Control function for semantic analysis. 
This function calls for construction of symbol table, type checking of expressions
type checking for function calls etc*/
void semanticAnalyzer(){
	ASTNode *astRoot = getAST();
    initializeErrorObject();
	processAST(astRoot,NULL,semanticErrors);
    
    //construct symboltable
    //processAST(astRoot,NULL,semanticErrors);
    /*NOTE:In above function, following semantic checks have been performed arleady*/
    /**
     * Output parameter overloading inside module definition
     * Duplicate module Declarations
     * Duplicate variable declarations inside a block (doubt--is a variable visible inside inner scopes? can't we overshadow it? if we can, then change code in processAST where deep lookup is performed for checking duplicate declaration)
     * */
    printf("SYMBOL TABLE CREATED\n");
    SymbolTable* rootSymbolTable = getsymbolTable();
    //now perform semantic analysis
    analyzeAST(astRoot, rootSymbolTable, semanticErrors);
    initializeDeclaredList(astRoot, rootSymbolTable);
    populateModuleSequenceMap(astRoot, rootSymbolTable);
    checkModules(astRoot, semanticErrors);
    computeOffsets(astRoot, rootSymbolTable);
	SymbolTable* finalTable = getsymbolTable();
	return;
}

int countLeaves(ASTNode* node)
{
    if(node == NULL)
        return 0;
    if(node->sc == NULL)
        return 1;
    else{
        int count = 0;
        ASTNode* temp = node->sc;
        while(temp != NULL)
        {
            count += countLeaves(temp);    
            temp = temp->rightSibling;
        }
        return count;
    }
    return 0;    
}
//node opnode
void setWhileLoopConditionFlag(ASTNode* node, bool set, SymbolTable* currtable){
    switch(node->type)
    {
        case opNode:{
            setWhileLoopConditionFlag(node->sc,set,currtable);
            setWhileLoopConditionFlag(node->sc->rs,set,currtable);
            return;
        }
        case idNode:{
            SymbolTableEntry* entry = lookupString(node->node.idnode.lexeme,currtable,idEntry,true,node->node.idnode.line_no);
            if(entry == NULL)
                return;
            entry->symbol.idEntry.isWhileLoopCondition = set;
            return;
        }
        case arrayIdNode:{
            SymbolTableEntry* sym = lookupString(node->sc->node.idnode.lexeme, currtable, idEntry, true, node->sc->node.idnode.line_no);
            if(sym == NULL)
                return;
            sym->symbol.idEntry.isWhileLoopCondition = set;
            return;
        }
        case boolNode: {
            return;
        }
        case nullNode: {
            return;
        }
    }
}

/*This recursive function traverses AST and performs various semantic checks*/
void analyzeAST(ASTNode* node, SymbolTable* table, ListOfErrors* semanticErrors){
    switch(node->type){
        case programNode:{
            ASTNode *t1 = node->sc->rs;
            while(t1 !=NULL)
            {
                analyzeAST(t1, table, semanticErrors);
                t1 = t1->next;
            }
            analyzeAST(node->sc->rs->rs, table, semanticErrors);
            t1 = node->sc->rs->rs->rs;
  
            while(t1 !=NULL)
            {
                analyzeAST(t1, table, semanticErrors);
                t1 = t1->next;
            }
            break;
        }
        case moduleNode:{
            //check if driverModule
            if(node->sc->type == nullNode){
                SymbolTableEntry* curr = lookupString("driverModule", table, driverEntry, false,-1);
                if(curr==NULL)       //not possible
                    printf("\nSymbotable populated wrongly\n");
                
                //now process its statements
                //curr->table gives us the table for this scope
                ASTNode* traverse = node->sc->rs->rs->rs;
                while(traverse != NULL){
                    analyzeAST(traverse, curr->table, semanticErrors);
                    traverse = traverse->next;
                }                    
            }

            //if it's not a driver module
            else{   
                    //first obtain the symboltable corresponding to this module
                    SymbolTableEntry* curr = lookupString(node->sc->node.idnode.lexeme, table, functionEntry, false,-1);
                    if(curr == NULL){
                        printf("\nRoot Symboltable not populated with this function");
                        //not possible. check code
                    }
                    
                    //now process its statements
                    //curr->table gives us the table for this scope
                    if(node->node.moduleNode.isOverloaded == false){
                        ASTNode* traverse = node->sc->rs->rs->rs;
                        while(traverse != NULL){
                            analyzeAST(traverse, curr->table, semanticErrors);
                            traverse = traverse->next;
                        }
                        //now staetmetnts have been processed. check if all the output parameters have been assigned a value or not
                        ASTNode* travOutputParam = node->sc->rs->rs;
                        if(travOutputParam->type != nullNode){
                        while(travOutputParam != NULL){
                            if(travOutputParam->node.outputParamNode.isAssigned == false){
                                //semantic error :
                                Error *err = createErrorObject();   err->lineNo = travOutputParam->sc->node.idnode.line_no;  strcpy(err->error,"No value was assigned for output param: ");
                                strcat(err->error, travOutputParam->sc->node.idnode.lexeme); 
                                //printf("LINE %d: %s\n",err->lineNo,err->error);
                                Error *temporary = semanticErrors->head;
                                if(temporary == NULL)
                                {
                                    semanticErrors->head = err;    
                                    semanticErrors->numberOfErr += 1; 
                                }
                                else
                                {
                                    while(temporary->next != NULL)
                                        temporary = temporary->next;
                                    temporary->next = err;
                                    semanticErrors->numberOfErr += 1;   
                                }
                                
                            }
                            travOutputParam = travOutputParam->next;
                        }
                    }
                }
            }
            
            break;
        }

        case declareNode:{
            break;
        }

        case opNode:{
            PrimitiveType t = extractTypeOfExpression(node, table, semanticErrors);
            if(t == -1) break;
            SymbolTable* currFuncTable = table;
            while(currFuncTable->tableType != functionBlock)
                currFuncTable = currFuncTable->parent;

            ASTNode* currModNode;
            if(strcmp(currFuncTable->scope.scope, "driverModule") == 0){
                SymbolTableEntry* driverFunction = lookupString("driverModule", getsymbolTable(), driverEntry, false, -1);
                currModNode = driverFunction->symbol.driverEntry.driverNode;
            }
            else{
                SymbolTableEntry* currFunction = lookupString(currFuncTable->scope.scope, getsymbolTable(), functionEntry, false, -1);
                currModNode = currFunction->symbol.functionEntry.inputListHead->parent;
            }
            
            int leafCount = countLeaves(node);
            if(t==integer){
                if(leafCount > currModNode->node.moduleNode.maxTempInt)
                    currModNode->node.moduleNode.maxTempInt = leafCount;
            }
            else if(t==real){
                if(leafCount > currModNode->node.moduleNode.maxTempReal)
                    currModNode->node.moduleNode.maxTempReal = leafCount;
            }
            else{   //boolean. in this case we might also need integer temporaries
                if(leafCount-1 > currModNode->node.moduleNode.maxTempInt)
                    currModNode->node.moduleNode.maxTempInt = leafCount-1;
                if(leafCount > currModNode->node.moduleNode.maxTempBool)
                    currModNode->node.moduleNode.maxTempBool = leafCount;
            }
            break;
        }

        case assignmentNode:{
            //first check if lhs variable has been declared
            
            //0. check if this assignment statement is inside a whileloop. if yes,then check if one of the variables in its condition is assigned a value
            SymbolTable* tempTable = table;
            while(tempTable != NULL){
                if(tempTable->tableType == whileLoopBlock)
                    break;
                tempTable = tempTable->parent;
            }
            if(tempTable != NULL){      //we are inside while loop
                if(node->sc->type == idNode){
                    SymbolTableEntry* lhsSym = lookupString(node->sc->node.idnode.lexeme,table,idEntry,true,node->sc->node.idnode.line_no);
                    if(lhsSym != NULL){
                        if(lhsSym->symbol.idEntry.isWhileLoopCondition)
                            whileLoopAssignsValue = true;
                    }
                }
                else if(node->sc->type == arrayIdNode){   //arrayIdNode
                    SymbolTableEntry* lhsSym = lookupString(node->sc->sc->node.idnode.lexeme,table,idEntry,true,node->sc->sc->node.idnode.line_no);
                    if(lhsSym != NULL){
                        if(lhsSym->symbol.idEntry.isWhileLoopCondition)
                            whileLoopAssignsValue = true;
                    }
                }
            }

            //1. check if 'for-loop' iterating variable has been assigned 
            ASTNode *temp = node->parent;
            while(temp->parent != NULL){
                if(temp->type == forLoopNode && strcmp(temp->sc->node.idnode.lexeme,node->sc->node.idnode.lexeme)==0){
                    //semantic error
                    Error *err = createErrorObject();   err->lineNo = node->sc->node.idnode.line_no;  strcpy(err->error,"Assigning a value to for loop iterating variable is not allowed:"); 
                    //printf("LINE %d: %s\n",err->lineNo,err->error);
                    Error *temporary = semanticErrors->head;
                    if(temporary == NULL)
                    {
                        semanticErrors->head = err;    
                        semanticErrors->numberOfErr += 1; 
                    }
                    else
                    {
                        while(temporary->next != NULL)
                            temporary = temporary->next;
                        temporary->next = err;
                        semanticErrors->numberOfErr += 1;   
                    }
                    break;
                }
                else
                    temp = temp->parent;
            }
            
            //2. check if assignment is done for output parameter. if yes, set outputParamNode->isAssigned = true;
            ASTNode* trav = node->parent;
            while(trav->type != moduleNode)
                trav = trav->parent;
            if(trav->sc->type != nullNode){   //only if we are not iside drvire module
                ASTNode* travOutputParam = trav->sc->rs->rs;
                while(travOutputParam != NULL){
                    if(travOutputParam->type == nullNode)
                        break;
                    if(strcmp(travOutputParam->sc->node.idnode.lexeme, node->sc->node.idnode.lexeme) == 0){
                        travOutputParam->node.outputParamNode.isAssigned = true;
                        
                    }
                    travOutputParam = travOutputParam->next;
                }
            }

            //3. process the rhs of the assignment statements.
            ASTNode* rhsProcess = node->sc->rs;
            //first exempt the special case of A:=B where both A and B are arrays
            if(node->sc->type == idNode && node->sc->rs->type == idNode){
                SymbolTableEntry *sym1 = lookupString(node->sc->node.idnode.lexeme,table,idEntry,true,node->sc->node.idnode.line_no);
                SymbolTableEntry *sym2 = lookupString(node->sc->rs->node.idnode.lexeme,table,idEntry,true,node->sc->rs->node.idnode.line_no);
                if(sym1 == NULL){
                    Error *err_lhs = createErrorObject();
                    err_lhs->lineNo = node->sc->node.idnode.line_no;
                    sprintf(err_lhs->error,"Variable %s used in this expression has not been declared.",node->sc->node.idnode.lexeme);
                    //printf("LINE %d: %s\n",err_lhs->lineNo,err_lhs->error);
                    Error *temporary = semanticErrors->head;
                    if(temporary == NULL){
                        semanticErrors->head = err_lhs;    
                        semanticErrors->numberOfErr += 1; 
                    }
                    else{
                        while(temporary->next != NULL)
                            temporary = temporary->next;
                        temporary->next = err_lhs;
                        semanticErrors->numberOfErr += 1;   
                    }
                    break;
                }
                if(sym2 == NULL){
                    Error *err_lhs = createErrorObject();
                    err_lhs->lineNo = node->sc->rs->node.idnode.line_no;
                    sprintf(err_lhs->error,"Variable %s used in this expression has not been declared.",node->sc->rs->node.idnode.lexeme);
                    //printf("LINE %d: %s\n",err_lhs->lineNo,err_lhs->error);
                    Error *temporary = semanticErrors->head;
                    if(temporary == NULL){
                        semanticErrors->head = err_lhs;    
                        semanticErrors->numberOfErr += 1; 
                    }
                    else{
                        while(temporary->next != NULL)
                            temporary = temporary->next;
                        temporary->next = err_lhs;
                        semanticErrors->numberOfErr += 1;   
                    }
                    break;
                }
                if(sym1->symbol.idEntry.type.tag == array && sym2->symbol.idEntry.type.tag == array){
                    ArrayType* lhsarr = &sym1->symbol.idEntry.type.type.arrayType;
                    ArrayType* rhsarr = &sym2->symbol.idEntry.type.type.arrayType;
                    if(lhsarr->low != -1 && lhsarr->high != -1 && rhsarr->low != -1 && rhsarr->high != -1){ //static
                        if(lhsarr->low == rhsarr->low && lhsarr->high == rhsarr->high)
                            break;
                    }
                    else{   //dynamic
                        if(sym1->symbol.idEntry.type.type.arrayType.t == sym2->symbol.idEntry.type.type.arrayType.t){

                        }
                        else
                        {
                            Error *err = createErrorObject();
                            err->lineNo =  node->sc->node.idnode.line_no;
                            strcpy(err->error,"Type MisMatch in Assignment Statement.");
                            //printf("LINE %d: %s\n",err->lineNo,err->error);
                            Error *temporary = semanticErrors->head;
                            if(temporary == NULL)
                            {
                                semanticErrors->head = err;    
                                semanticErrors->numberOfErr += 1; 
                            }
                            else
                            {
                                while(temporary->next != NULL)
                                    temporary = temporary->next;
                                temporary->next = err;
                                semanticErrors->numberOfErr += 1;   
                            }
                        }
                        
                        break;
                    }
                }
            }
            
            while(rhsProcess != NULL)
            {
                analyzeAST(rhsProcess,table,semanticErrors);
                rhsProcess = rhsProcess->next;
            }
            
            PrimitiveType t_lhs = extractTypeOfExpression(node->sc,table,semanticErrors);
            PrimitiveType t_rhs = extractTypeOfExpression(node->sc->rs,table,semanticErrors);
            if(t_rhs == -1 || t_lhs == -1)
                break;
            //type mismatch : int:=boolean
            if(t_lhs != t_rhs)
            {
                Error *err_lhs_rhs = createErrorObject();
                err_lhs_rhs->lineNo = node->sc->node.idnode.line_no;
                strcpy(err_lhs_rhs->error,"Type MisMatch in Assignment Statement.");
                //printf("LINE %d: %s\n",err_lhs_rhs->lineNo,err_lhs_rhs->error);
                Error *temporary = semanticErrors->head;
                    if(temporary == NULL)
                    {
                        semanticErrors->head = err_lhs_rhs;    
                        semanticErrors->numberOfErr += 1; 
                    }
                    else
                    {
                        while(temporary->next != NULL)
                            temporary = temporary->next;
                        temporary->next = err_lhs_rhs;
                        semanticErrors->numberOfErr += 1;   
                    }
            }
            break; 
        } 
        case functionCallNode:{
            SymbolTableEntry* func = lookupString(node->sc->rs->node.idnode.lexeme, table, functionEntry, true,-1);
            //1.void functions handling
            if(func->symbol.functionEntry.outputListHead->type == nullNode){  //actually a void function
                if(node->sc->type != nullNode){
                    //semantic error: void function should not return anything
                    Error *err = createErrorObject();   err->lineNo = node->sc->rs->node.idnode.line_no;  strcpy(err->error,"Void function must not return anything"); 
                    //printf("LINE %d: %s\n",err->lineNo,err->error);
                    Error *temporary = semanticErrors->head;
                    if(temporary == NULL)
                    {
                        semanticErrors->head = err;    
                        semanticErrors->numberOfErr += 1; 
                    }
                    else
                    {
                        while(temporary->next != NULL)
                            temporary = temporary->next;
                        temporary->next = err;
                        semanticErrors->numberOfErr += 1;   
                    }
                }
            }
            else{   //check output parameters
                FunctionType* f = &func->symbol.functionEntry.inOutType; ///Typeof* in o/p param types linkedlist
                int i = 0;
                ASTNode* travCallOut = node->sc;    //idNode in output paramters linkedlist
                while(travCallOut != NULL && i < f->noOfOutputs){
                    if(travCallOut->type == nullNode){
                        //semantic error : function must return something
                        Error *err = createErrorObject();   err->lineNo = node->sc->rs->node.idnode.line_no;  strcpy(err->error,"Void function must not return anything"); 
                        //printf("LINE %d: %s\n",err->lineNo,err->error);
                        Error *temporary = semanticErrors->head;
                        if(temporary == NULL)
                        {
                            semanticErrors->head = err;    
                            semanticErrors->numberOfErr += 1; 
                        }
                        else
                        {
                            while(temporary->next != NULL)
                                temporary = temporary->next;
                            temporary->next = err;
                            semanticErrors->numberOfErr += 1;   
                        }
                    }
                    SymbolTableEntry* travCallOutput = lookupString(travCallOut->node.idnode.lexeme, table, idEntry, true,travCallOut->node.idnode.line_no);
                    if(travCallOutput == NULL)
                    {
                    	Error *err = createErrorObject();   err->lineNo = travCallOut->node.idnode.line_no;  strcpy(err->error,"Output Parameter not declared"); 
                        //printf("LINE %d: %s\n",err->lineNo,err->error);
                        Error *temporary = semanticErrors->head;
                        if(temporary == NULL)
                        {
                            semanticErrors->head = err;    
                            semanticErrors->numberOfErr += 1; 
                        }
                        else
                        {
                            while(temporary->next != NULL)
                                temporary = temporary->next;
                            temporary->next = err;
                            semanticErrors->numberOfErr += 1;   
                        }	
                        
                    }
                    
                   else {
                   		if(travCallOutput->symbol.idEntry.type.tag == array){
                        //semantic error : function cannot return array
                        Error *err = createErrorObject();   err->lineNo = travCallOut->node.idnode.line_no;  strcpy(err->error,"Function cannot return array"); 
                        Error *temporary = semanticErrors->head;
                        if(temporary == NULL)
                        {
                            semanticErrors->head = err;    
                            semanticErrors->numberOfErr += 1; 
                        }
                        else
                        {
                            while(temporary->next != NULL)
                                temporary = temporary->next;
                            temporary->next = err;
                            semanticErrors->numberOfErr += 1;   
                        }
                        travCallOut = travCallOut->next;
                        i++;
                        continue;
                    }
                    if(travCallOutput->symbol.idEntry.type.type.primitiveType != f->outputList[i].type.primitiveType){
                        //semantic error : output type mismatch
                        Error *err = createErrorObject();   err->lineNo = travCallOut->node.idnode.line_no;  strcpy(err->error,"Output types mismatch"); 
                        //printf("LINE %d: %s\n",err->lineNo,err->error);
                        Error *temporary = semanticErrors->head;
                        if(temporary == NULL)
                        {
                            semanticErrors->head = err;    
                            semanticErrors->numberOfErr += 1; 
                        }
                        else
                        {
                            while(temporary->next != NULL)
                                temporary = temporary->next;
                            temporary->next = err;
                            semanticErrors->numberOfErr += 1;   
                        }
                        travCallOut = travCallOut->next;
                        i++;
                        continue;
                    }
                  }
					i++;
					travCallOut = travCallOut->next;
                }

                if(!(travCallOut == NULL && i == f->noOfOutputs)){
                    //semantic error : output parameter  count mismatch
                    Error *err = createErrorObject();   err->lineNo = node->sc->rs->node.idnode.line_no;  strcpy(err->error,"Output parameter count mismatch"); 
                    //printf("LINE %d: %s\n",err->lineNo,err->error);
                    Error *temporary = semanticErrors->head;
                    if(temporary == NULL)
                    {
                        semanticErrors->head = err;    
                        semanticErrors->numberOfErr += 1; 
                    }
                    else
                    {
                        while(temporary->next != NULL)
                            temporary = temporary->next;
                        temporary->next = err;
                        semanticErrors->numberOfErr += 1;   
                    }
                }
            }

            
            //2. types and no of input parameters of function must be same as declaration
            FunctionType* inp = &func->symbol.functionEntry.inOutType;
            struct Typeof* travDefIn = inp->inputList;
            int i=0; 
            ASTNode *travCallIn = node->sc->rs->rs;
            int counter = 0;
            ASTNode* checkNoOfInputs = node->sc->rs->rs;
            while(checkNoOfInputs != NULL)
            {
            	counter++;
            	checkNoOfInputs = checkNoOfInputs->next;
            }
            
            if(counter != inp->noOfInputs)
            {
            	 	Error *err = createErrorObject();   err->lineNo = node->sc->rs->node.idnode.line_no;  strcpy(err->error,"Input parameter count mismatch"); 
                    //printf("LINE %d: %s\n",err->lineNo,err->error);
                    Error *temporary = semanticErrors->head;
                    if(temporary == NULL)
                    {
                        semanticErrors->head = err;    
                        semanticErrors->numberOfErr += 1; 
                    }
                    else
                    {
                        while(temporary->next != NULL)
                            temporary = temporary->next;
                        temporary->next = err;
                        semanticErrors->numberOfErr += 1;   
                    }
                    
            }
            //else{
		        while(travCallIn != NULL && i < inp->noOfInputs)
		        {
		            SymbolTableEntry* sym = lookupString(travCallIn->node.idnode.lexeme, table, idEntry, true,travCallIn->node.idnode.line_no);
		            if(sym == NULL)
		            {
		                //input parameter must be declared
		                Error *err = createErrorObject();   err->lineNo = travCallIn->node.idnode.line_no;  strcpy(err->error,"Input parameter must be declared before use"); 
		                //printf("LINE %d: %s\n",err->lineNo,err->error);
		                Error *temporary = semanticErrors->head;
		                if(temporary == NULL)
		                {
		                    semanticErrors->head = err;    
		                    semanticErrors->numberOfErr += 1; 
		                }
		                else
		                {
		                    while(temporary->next != NULL)
		                        temporary = temporary->next;
		                    temporary->next = err;
		                    semanticErrors->numberOfErr += 1;   
		                }
		                travCallIn = travCallIn->next;
		                i++;
		                continue;
		            }
		            else
		            {
		                if(sym->symbol.idEntry.type.type.primitiveType != travDefIn[i].type.primitiveType && sym->symbol.idEntry.type.tag == primitive && travDefIn[i].tag == primitive)
		                {
		                    // semantic error
		                    Error *err = createErrorObject();   err->lineNo = travCallIn->node.idnode.line_no;  strcpy(err->error,"Input parameter type mismatch"); 
		                    //printf("LINE %d: %s\n",err->lineNo,err->error);
		                    Error *temporary = semanticErrors->head;
		                    if(temporary == NULL)
		                    {
		                        semanticErrors->head = err;    
		                        semanticErrors->numberOfErr += 1; 
		                    }
		                    else
		                    {
		                        while(temporary->next != NULL)
		                            temporary = temporary->next;
		                        temporary->next = err;
		                        semanticErrors->numberOfErr += 1;   
		                    }
		                    travCallIn = travCallIn->next;
		                    i++;
		                    continue;                        
		                }
		                else if(sym->symbol.idEntry.type.tag == array && travDefIn[i].tag == array)
		                {
                            if((sym->symbol.idEntry.type.type.arrayType.t != travDefIn[i].type.arrayType.t)){
                                Error *err = createErrorObject();   err->lineNo = travCallIn->node.idnode.line_no;  strcpy(err->error,"Array in formal parameter is of different type than actual parameter"); 
                                Error *temporary = semanticErrors->head;
                                //printf("LINE %d: %s\n",err->lineNo,err->error);
                                if(temporary == NULL)
                                {
                                    semanticErrors->head = err;    
                                    semanticErrors->numberOfErr += 1; 
                                }
                                else
                                {
                                    while(temporary->next != NULL)
                                        temporary = temporary->next;
                                    temporary->next = err;
                                    semanticErrors->numberOfErr += 1;   
                                }
                            }
                            else{   //arrays' primitive types match, so check indexes only if both are static
                                if(sym->symbol.idEntry.type.type.arrayType.high>=0 && sym->symbol.idEntry.type.type.arrayType.low>=0 && travDefIn[i].type.arrayType.high>=0 && travDefIn[i].type.arrayType.low>=0){
                                    if((sym->symbol.idEntry.type.type.arrayType.high != travDefIn[i].type.arrayType.high )||(sym->symbol.idEntry.type.type.arrayType.low != travDefIn[i].type.arrayType.low)){
                                        Error *err = createErrorObject();   err->lineNo = travCallIn->node.idnode.line_no;  strcpy(err->error,"Array in formal parameter is of different type than actual parameter(index ranges don't match)"); 
                                        Error *temporary = semanticErrors->head;
                                        //printf("LINE %d: %s\n",err->lineNo,err->error);
                                        if(temporary == NULL)
                                        {
                                            semanticErrors->head = err;    
                                            semanticErrors->numberOfErr += 1; 
                                        }
                                        else
                                        {
                                            while(temporary->next != NULL)
                                                temporary = temporary->next;
                                            temporary->next = err;
                                            semanticErrors->numberOfErr += 1;   
                                        }
                                    }
                                }
                            }
		                    
		                    travCallIn = travCallIn->next;
		                    i++;
		                    continue;
		                }
		                else if(sym->symbol.idEntry.type.tag != travDefIn[i].tag){ 
		                    //semantic error:input parameter type mismatch
		                    Error *err = createErrorObject();   err->lineNo = travCallIn->node.idnode.line_no;  strcpy(err->error,"Input parameter type mismatch "); 
		                    //printf("LINE %d: %s\n",err->lineNo,err->error);
		                    Error *temporary = semanticErrors->head;
		                    if(temporary == NULL)
		                    {
		                        semanticErrors->head = err;    
		                        semanticErrors->numberOfErr += 1; 
		                    }
		                    else
		                    {
		                        while(temporary->next != NULL)
		                            temporary = temporary->next;
		                        temporary->next = err;
		                        semanticErrors->numberOfErr += 1;   
		                    }
		                    travCallIn = travCallIn->next;
		                    i++;
		                    continue;
		                }   
		                i++;
		                travCallIn = travCallIn->next;
		            }
		            
		        }
            //}
            
            break;
        }

        case conditionalNode:{  //switch-case. assumes swtiching variable is declared and is not of type array
            //1. check switching variable and apply semantic checks based on its type
            SymbolTableEntry* sym = lookupString(node->sc->node.idnode.lexeme, table, idEntry, true,node->sc->node.idnode.line_no);
            switch(sym->symbol.idEntry.type.type.primitiveType){
                case integer:{
                    if(node->sc->rs->rs->type == nullNode)
                    {
                        // semantic error default node missing  
                        Error *err = createErrorObject();   err->lineNo = node->node.conditionalNode.block.end;  strcpy(err->error,"Default Statement missing line "); 
                        //printf("LINE %d: %s\n",err->lineNo,err->error);
                        Error *temporary = semanticErrors->head;
                        if(temporary == NULL)
                        {
                            semanticErrors->head = err;    
                            semanticErrors->numberOfErr += 1; 
                        }
                        else
                        {
                            while(temporary->next != NULL)
                                temporary = temporary->next;
                            temporary->next = err;
                            semanticErrors->numberOfErr += 1;   
                        }
                    }
                    ASTNode *temp = node->sc->rs;
                    while(temp != NULL)
                    {
                        if(temp->sc->rs->type == numNode && strcmp(temp->sc->rs->node.numNode.token,"NUM")==0)
                            temp = temp->next;
                        else
                        {
                            //semantic error case node is not an integer
                            Error *err = createErrorObject();   err->lineNo = temp->node.caseNode.line;  strcpy(err->error,"Case Node is not an integer "); 
                            //printf("LINE %d: %s\n",err->lineNo,err->error);
                            Error *temporary = semanticErrors->head;
                            if(temporary == NULL)
                            {
                                semanticErrors->head = err;    
                                semanticErrors->numberOfErr += 1; 
                            }
                            else
                            {
                                while(temporary->next != NULL)
                                    temporary = temporary->next;
                                temporary->next = err;
                                semanticErrors->numberOfErr += 1;   
                            }
                            temp = temp->next;
                            //break;
                        }
                    }
                    break;
                }
                case real:{
                        Error *err = createErrorObject();   err->lineNo = node->sc->node.idnode.line_no;  strcpy(err->error,"Switching variable cannot be of real type :"); 
                        //printf("LINE %d: %s\n",err->lineNo,err->error);
                        Error *temporary = semanticErrors->head;
                        if(temporary == NULL)
                        {
                            semanticErrors->head = err;    
                            semanticErrors->numberOfErr += 1; 
                        }
                        else
                        {
                            while(temporary->next != NULL)
                                temporary = temporary->next;
                            temporary->next = err;
                            semanticErrors->numberOfErr += 1;   
                        }
                    break;
                }
                case boolean:{
                    if(node->sc->rs->rs->type != nullNode){
                        Error *err = createErrorObject();   err->lineNo = node->sc->rs->rs->node.caseNode.line;  strcpy(err->error,"Switch case on boolean variable cannot have default case"); 
                        //printf("LINE %d: %s\n",err->lineNo,err->error);
                        Error *temporary = semanticErrors->head;
                        while(temporary->next != NULL)
                            temporary = temporary->next;
                        temporary->next = err; semanticErrors->numberOfErr += 1;
                    }
                    if(!(node->sc->rs->sc->rs->type == boolNode && node->sc->rs->next->sc->rs->type == boolNode && node->sc->rs->next->next == NULL)){
                        Error *err = createErrorObject();   err->lineNo = node->sc->rs->node.caseNode.line;  strcpy(err->error,"Switch case on boolean variable must have exactly 2 cases, true and false"); 
                        //printf("LINE %d: %s\n",err->lineNo,err->error);
                        Error *temporary = semanticErrors->head;
                        if(temporary == NULL)
                        {
                            semanticErrors->head = err;    
                            semanticErrors->numberOfErr += 1; 
                        }
                        else
                        {
                            while(temporary->next != NULL)
                                temporary = temporary->next;
                            temporary->next = err;
                            semanticErrors->numberOfErr += 1;   
                        }
                    }
                    else 
                    {
                        if(strcmp(node->sc->rs->sc->rs->node.boolNode.token,node->sc->rs->next->sc->rs->node.boolNode.token)==0)
                        {
                            Error *err = createErrorObject();   err->lineNo = node->sc->rs->node.caseNode.line;  strcpy(err->error,"Duplicate case conditions"); 
                            //printf("LINE %d: %s\n",err->lineNo,err->error);
                            Error *temporary = semanticErrors->head;
                            if(temporary == NULL)
                            {
                                semanticErrors->head = err;    
                                semanticErrors->numberOfErr += 1; 
                            }
                            else
                            {
                                while(temporary->next != NULL)
                                    temporary = temporary->next;
                                temporary->next = err;
                                semanticErrors->numberOfErr += 1;   
                            }
                        }
                    }
                    
                    ASTNode *temp = node->sc->rs;
                    while(temp != NULL)
                    {
                        if(temp->sc->rs->type == boolNode && ((strcmp(temp->sc->rs->node.boolNode.token,"FALSE")==0)||(strcmp(temp->sc->rs->node.boolNode.token,"TRUE")==0)))
                            temp = temp->next;
                        else
                        {
                            //semantic error case node is not an integer
                            Error *err = createErrorObject();   err->lineNo = temp->node.caseNode.line;  strcpy(err->error,"Case Node is not an boolean "); 
                            //printf("LINE %d: %s\n",err->lineNo,err->error);
                            Error *temporary = semanticErrors->head;
                            if(temporary == NULL)
                            {
                                semanticErrors->head = err;    
                                semanticErrors->numberOfErr += 1; 
                            }
                            else
                            {
                                while(temporary->next != NULL)
                                    temporary = temporary->next;
                                temporary->next = err;
                                semanticErrors->numberOfErr += 1;   
                            }
                            temp = temp->next;
                            //break;
                        }
                    }
                }
            }
            
            //2. process its cases and default case
                //first need to obtain the switch case scope's table
            SymbolTableEntry* switchEntry = lookupBlock(&node->node.conditionalNode.block,table,switchCaseEntry,false);
            ASTNode* case_node = node->sc->rs;
            while(case_node != NULL){
                analyzeAST(case_node, switchEntry->table, semanticErrors);
                case_node = case_node->next;
            }
            if(node->sc->rs->rs->type != nullNode)
                analyzeAST(node->sc->rs->rs, switchEntry->table, semanticErrors);
            break;
        } 
        case caseNode:{
            //1. now process the case's statements
            ASTNode* caseStmt = node->sc;
            if(caseStmt->type != nullNode){
                while(caseStmt != NULL){
                    analyzeAST(caseStmt, table, semanticErrors);
                    caseStmt = caseStmt->next;
                }
            }
            break;
        }  
        case forLoopNode : {
            SymbolTableEntry *floop = lookupBlock(&node->node.forLoopNode.block,table,forLoopEntry,false);
            ASTNode* forStmt =  node->sc->rs->rs;
            ASTNode* ranNode = node->sc->rs;
            if(strcmp(ranNode->sc->node.numNode.token,"RNUM")==0 || strcmp(ranNode->sc->rs->node.numNode.token,"RNUM")){
                Error* err = createErrorObject();
                err->lineNo = ranNode->sc->node.numNode.line_no;
                strcpy(err->error,"Range of For Loop variables should be integers.");
                //printf("LINE %d: %s\n",err->lineNo,err->error);
                Error *temporary = semanticErrors->head;
                if(temporary == NULL)
                {
                    semanticErrors->head = err;    
                    semanticErrors->numberOfErr += 1; 
                }
                else
                {
                    while(temporary->next != NULL)
                        temporary = temporary->next;
                    temporary->next = err;
                    semanticErrors->numberOfErr += 1;   
                }
                break;
            }
            int high = (int)ranNode->sc->rs->node.numNode.value;
            int low  = (int)ranNode->sc->node.numNode.value;
            if(low > high)
            {
                Error* err = createErrorObject();
                err->lineNo = ranNode->sc->node.numNode.line_no;
                strcpy(err->error,"Range of For Loop variable is not defined correctly.");
                //printf("LINE %d: %s\n",err->lineNo,err->error);
                Error *temporary = semanticErrors->head;
                if(temporary == NULL)
                {
                    semanticErrors->head = err;    
                    semanticErrors->numberOfErr += 1; 
                }
                else
                {
                    while(temporary->next != NULL)
                        temporary = temporary->next;
                    temporary->next = err;
                    semanticErrors->numberOfErr += 1;   
                }
                break;
            }
            if(forStmt->type != nullNode){
                while(forStmt != NULL)
                {
                    analyzeAST(forStmt,floop->table,semanticErrors);
                    forStmt = forStmt->next;
                }
            }
            break;
        }         
        case whileLoopNode: {
            //1. check the type of the expression in while loop condition
            PrimitiveType t = extractTypeOfExpression(node->sc,table,semanticErrors);
            if(t != boolean)
            {
                if(t==-1)
                    break;
                //semantic error
                Error* err = createErrorObject();
                err->lineNo = node->node.whileLoopNode.block.start;
                strcpy(err->error,"While Loop Condition doesn't evaluates to a boolean");
                //printf("LINE %d: %s\n",err->lineNo,err->error);
                Error *temporary = semanticErrors->head;
                if(temporary == NULL)
                {
                    semanticErrors->head = err;    
                    semanticErrors->numberOfErr += 1; 
                }
                else
                {
                    while(temporary->next != NULL)
                        temporary = temporary->next;
                    temporary->next = err;
                    semanticErrors->numberOfErr += 1;   
                }
            }
            else
            {
                setWhileLoopConditionFlag(node->sc, true, table);  //mark the variables that appear in while loop condition
                whileLoopAssignsValue = false;
                SymbolTableEntry* wloop = lookupBlock(&node->node.whileLoopNode.block,table,whileLoopEntry,false);
                // Now process the statements
                ASTNode* whileStmt =  node->sc->rs;
                if(whileStmt->type != nullNode){
                    while(whileStmt != NULL)
                    {
                        analyzeAST(whileStmt,wloop->table,semanticErrors);
                        whileStmt = whileStmt->next;
                    }
                }
                setWhileLoopConditionFlag(node->sc, false,table);     //unmark the variables that appear in while loop condition 
                //check if while loop assigns value to one of the variables in condition
                if(!whileLoopAssignsValue){
                    //semantic error
                    Error* err = createErrorObject();
                    err->lineNo = node->node.whileLoopNode.block.start;
                    strcpy(err->error,"While Loop does not assign a value to one of the variables in its condition");
                    //printf("LINE %d: %s\n",err->lineNo,err->error);
                    Error *temporary = semanticErrors->head;
                    if(temporary == NULL)
                    {
                        semanticErrors->head = err;    
                        semanticErrors->numberOfErr += 1; 
                    }
                    else
                    {
                        while(temporary->next != NULL)
                            temporary = temporary->next;
                        temporary->next = err;
                        semanticErrors->numberOfErr += 1;   
                    }
                }
            }
            break;
        }
    }
}



void swapNodes(Error* a, Error* b){
	//struct Error* tnext;
	char terror[150];
	int tlineNo;
	/*tnext = a->next;
	a->next = b->next;
	b->next = tnext; */
	strcpy(terror,a->error);
	strcpy(a->error,b->error);
	strcpy(b->error,terror);
	tlineNo = a->lineNo;
	a->lineNo = b->lineNo;
	b->lineNo = tlineNo;
}

int checkEquality(Error* a, Error* b){
	if((a->lineNo == b->lineNo) && (strcmp(a->error, b->error)==0))
		return 1;
	else
		return 0;
}

Error* sortLinkedList(Error* head){
	Error* f1 = head;
    Error* f2;
    for(;f1->next != NULL ; f1 = f1->next)
    {
        for(f2 = f1->next ; f2 != NULL ; f2 = f2->next)
        {
            if(f1->lineNo > f2->lineNo){
                swapNodes(f1,f2);
            }
        }
    }
	return head;
}

Error* removeDuplicates(Error* head){
	Error* head2 = sortLinkedList(head);
	Error* current = head2;
	Error* temp;
    if (current == NULL)
    	return NULL;
	while (current -> next != NULL){
        if (checkEquality(current, current->next)){
            temp = current -> next -> next;
            free(current -> next);
            current -> next = temp;
        }
        else{
            current = current -> next;
        }
    }
	return head;
}

void printErrors(ListOfErrors *errors)
{
    if(errors->head == NULL)
    {
        printf("NO ERRORS FOUND\n");
		return;
    }
    errors->head = removeDuplicates(errors->head);
    Error* err = errors->head;
    while(err != NULL)
    {
        printf("LINE:%d %s\n",err->lineNo,err->error);
        err = err->next;
    }
}
