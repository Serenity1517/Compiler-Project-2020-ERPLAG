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
#include <string.h>
#define sc startChild
#define rs rightSibling

//#define SYM_TABLE_SLOTS  (already defined in symboltableDef.h)

//Root SymbolTable
SymbolTable* symbolTableRoot;

//Global int to store number of modules. Also used to assign a sequence number to each module
int moduleNumber;

//Global bool flag to check duplicate output parameters
bool dupOutputParamErrorFound = false;

/*Computes the hash of Block b*/
int computeBlockHash(Block* b){
    int hash=0;
    hash = b->start * b->end;
    hash = hash % SYM_TABLE_SLOTS;
    hash += b->start + b->end;
    hash = hash % SYM_TABLE_SLOTS;
    return hash;
}

/*Computes hash of string s*/
int computeStringHash(char* s){
    int hash=0;
    int len = strlen(s);
    int i;
    for(i=0;i<len;i++)
    {
        hash = hash + (int)s[i];
        hash = hash % SYM_TABLE_SLOTS;
    }
    return hash;
}

/*Creates a SymbolTable of type type*/
SymbolTable* createSymbolTable(SymbolTableType type){
    SymbolTable* table = (SymbolTable*)malloc(sizeof(SymbolTable));
    table->parent = NULL;
    table->next = NULL;
    table->childScope = NULL;
    //scope will be assigned in the calling function
    int i;
    for(i=0; i<SYM_TABLE_SLOTS; i++)
        table->listHeads[i] = NULL; // table me value daalne ke liye same scope pe
    table->tableType = type;
    return table;
}

/*Creates a SymbolTableEntry of Symbol s having SymbolForm f*/
SymbolTableEntry* createSymbolTableEntry(Symbol* s, SymbolForm f){
    SymbolTableEntry *entry = (SymbolTableEntry*)malloc(sizeof(SymbolTableEntry));
    entry->next = NULL;
    entry->symbol = *s;
    entry->tag = f;
    entry->table = NULL;
    return entry;
}

/*Creates symbol from ASTNode*/
Symbol* createSymbol(ASTNode* astNode){    //need to check node->type and create symbol accordingly

    Symbol* sym = (Symbol*)malloc(sizeof(Symbol));

    if(astNode->type == idNode && astNode->parent->type != moduleNode && astNode->parent->type != programNode){
        sym->idEntry.node = astNode;
        sym->idEntry.offset = 0;
        sym->idEntry.width = 0;
    }
    else if(astNode->type == moduleNode){       //module Definition
        strcpy(sym->functionEntry.functionName, astNode->sc->node.idnode.lexeme);
        sym->functionEntry.inputListHead = astNode->sc->rs;
        sym->functionEntry.outputListHead = astNode->sc->rs->rs;
        sym->functionEntry.sequenceNumber = moduleNumber;
        moduleNumber++;
        sym->functionEntry.isDefined = true;
    }
    else if(astNode->type == forLoopNode){
        sym->forLoopEntry.node = astNode;
    }
    else if(astNode->type == whileLoopNode){
        sym->whileLoopEntry.node = astNode;
    }
    else if(astNode->type == conditionalNode){
        sym->switchCaseEntry.node = astNode;
    }
    else if(astNode->type == programNode){
        //sym->driverEntry.sequenceNumber = moduleNumber++;
    }
    else
        return sym;


    return sym;
}

/*This function checks for equivalence of two Symbols s1,s2 having SymbolForms f1,f2*/
bool isSymbolEqual(Symbol* s1, SymbolForm f1, Symbol* s2, SymbolForm f2){
    if(f1 != f2)
        return false;

    else {
        switch(f1){
            case idEntry:{
                if(strcmp(s1->idEntry.node->node.idnode.lexeme,s2->idEntry.node->node.idnode.lexeme)==0)
                    return true;
                else{
                    return false;
                }
                break;
            }
            case functionEntry:{
                if(strcmp(s1->functionEntry.functionName, s2->functionEntry.functionName)==0)
                    return true;
                else{
                    return false;
                }
            }
            case forLoopEntry:{
                if((s1->forLoopEntry.node->node.forLoopNode.block.start == s2->forLoopEntry.node->node.forLoopNode.block.start) && (s1->forLoopEntry.node->node.forLoopNode.block.end == s2->forLoopEntry.node->node.forLoopNode.block.end))
                    return true;
                else{
                    return false;
                }
                break;
            }
            case whileLoopEntry:{
                if((s1->whileLoopEntry.node->node.whileLoopNode.block.start == s2->whileLoopEntry.node->node.whileLoopNode.block.start) && (s1->whileLoopEntry.node->node.whileLoopNode.block.end == s2->whileLoopEntry.node->node.whileLoopNode.block.end))
                    return true;
                else
                    return false;
                break;
            }
            case switchCaseEntry:{
                if((s1->switchCaseEntry.node->node.conditionalNode.block.start == s2->switchCaseEntry.node->node.conditionalNode.block.start) && (s1->switchCaseEntry.node->node.conditionalNode.block.end == s2->switchCaseEntry.node->node.conditionalNode.block.end))
                    return true;
                else
                    return false;
                break;
            }
        }
    }
}

/*
Looks up string in given SymbolTable and returns its SymbolTableEntry pointer
If this function returns NULL, invoke it again and this time pass the SymbolTable in outer scope compared to prev one
parameter deepSearch : false - lookup only in table, and not it's subsequent outer scopes
                     :  true - lookup in all tables till outermost scope
*/
SymbolTableEntry* lookupString(char* s, SymbolTable* table, SymbolForm f, bool deepSearch){  //f can be either functionEntry or idEntry
    if(table == NULL)
        return NULL;
    SymbolTableEntry* temp = table->listHeads[computeStringHash(s)];
    if(f == functionEntry){     //if target entry is functionEntry
        while(temp != NULL){
            if(temp->tag != f)
                temp = temp->next;
            else if(strcmp(temp->symbol.functionEntry.functionName, s)==0)
                    return temp;
            else
                temp = temp->next;
        }
        //entry not found in table
        if(deepSearch)
            return lookupString(s, table->parent, f, true);
        else
            return NULL;
    }
    else if(f == idEntry){       //if target entry is idEntry
        while(temp != NULL){
            if(temp->tag != idEntry)    //if entry is not idEntry
                temp = temp->next;
            else if(strcmp(temp->symbol.idEntry.node->node.idnode.lexeme, s) == 0)  //id entry found
                return temp;
            else                //if identry doesn't match
                temp = temp->next;
        }
        //entry not found in table
        if(deepSearch)
            return lookupString(s, table->parent, f, true);
        else
            return NULL;
    }
    else if(f == driverEntry){       //if target is driverEntry
        while(temp != NULL){
            if(temp->tag != f)
                temp = temp->next;
            else
                return temp;
        }
        return NULL;
    }
    else
        return NULL;
    return NULL;
}


SymbolTableEntry* checkForOutputParamOverloading(char* s, SymbolTable* table){
    if(table == NULL)
        return NULL;
    SymbolTableEntry* temp = table->listHeads[computeStringHash(s)];
    
    
    //if target entry is idEntry
    while(temp != NULL){
        if(temp->tag != idEntry)    //if entry is not idEntry
            temp = temp->next;
        else if(strcmp(temp->symbol.idEntry.node->node.idnode.lexeme, s) == 0)  //id entry found
            return temp;
        else                //if identry doesn't match
            temp = temp->next;
    }
    //entry not found in table
    //return lookupString(s, table->parent, idEntry);
    return NULL;
}

void recursiveCheckOverload(ASTNode* outputParam, SymbolTable* table)      //will also require error object parameter
{
	
    SymbolTable* traverse1 = table;
    if(table == NULL)
        return; 
    while(traverse1 != NULL){
        if(checkForOutputParamOverloading(outputParam->sc->node.idnode.lexeme, traverse1) == NULL){
            recursiveCheckOverload(outputParam, traverse1->childScope);
            if(dupOutputParamErrorFound == true)
                return;
            else
                traverse1 = traverse1->next;
        }
        else{
            dupOutputParamErrorFound = true;
            //semantic error : declaration of variable inside function that shares same name as outputParameter
            printf("\nSEMANTIC ERROR\n");
            return;
        }
    }
    return;
}

/*Process AST*/
//recursive
//when this is called for the first time, curr is passed as NULL
void processAST(ASTNode* node, SymbolTable* curr){

    // switch-case on ASTNode type
    switch(node->type){
        case programNode:{
            //node points to programNode, curr is NULL
            symbolTableRoot = createSymbolTable(root);

            //Scope scope and SymbolTableType tableType fields are invalid for this root node.
            ASTNode *traverse = node->sc;

            processAST(traverse, symbolTableRoot);  //process moduleDeclarations
            
            moduleNumber = 0;

            processAST(traverse->rs, symbolTableRoot);    //process otherModules
             
            processAST(traverse->rs->rs, symbolTableRoot);//process driverModule
            
	    processAST(traverse->rs->rs->rs, symbolTableRoot);//process otherModules%

            
            break;
        }
        
        case moduleNode:{
            //one of the list of moduleNodes generated by <otherModules> or <otherModules%>

            //Independent case for handling driver module
            if(node->sc->type == nullNode && node->sc->rs->type == nullNode && node->sc->rs->rs->type == nullNode){   //
                //1.Create table for driver module
                SymbolTable* newTable = createSymbolTable(functionBlock);
                //set newTable.scope equal to name of curr function
                Scope scp;
                scp.scope = (char*)malloc(sizeof(char)*21);
                strcpy(scp.scope, "driverModule");
                newTable->scope = scp;
                
                // assigning pointers of parent of this newTable (i.e. curr)
                newTable->parent = curr;
                
                //inserting newTable into linkedlist of SymbolTables starting from curr->childScope
                SymbolTable* t1 = curr->childScope;
                if(t1 == NULL)
                    curr->childScope = newTable;
                else {
                    while(t1->next != NULL)
                        t1 = t1->next;
                    t1->next = newTable;
                }

                //2. insert SymbolTableEntry of SymbolForm : driverEntry
                Symbol* s = (Symbol*)malloc(sizeof(Symbol)); //node->type is moduleNode here
                s->driverEntry.sequenceNumber = moduleNumber;
                moduleNumber++;
                SymbolTableEntry *sym = createSymbolTableEntry(s, driverEntry);
                
                int hash = computeStringHash("driverModule");
                if(symbolTableRoot->listHeads[hash] == NULL){
                    symbolTableRoot->listHeads[hash] = sym;
                    symbolTableRoot->listHeads[hash]->table = newTable;
                }
                else{
                    SymbolTableEntry *temp = symbolTableRoot->listHeads[hash];
                    while(temp->next != NULL)
                        temp = temp->next;
                    temp->next = sym;
                    temp->next->table = newTable;
                }

                //now process the statements in the module
                ASTNode* traverse = node->sc->rs->rs->rs;
                while(traverse != NULL){
                    processAST(traverse, newTable);
                    traverse = traverse->next;
                }

                break;
            }

            SymbolTableEntry* info = lookupString(node->sc->node.idnode.lexeme, curr, functionEntry, false);

            if(info == NULL){   //if module is previously not defined/declared

                //1. Create table for this module
                SymbolTable* newTable = createSymbolTable(functionBlock);
                //set newTable.scope equal to name of curr function
                Scope scp;
                scp.scope = (char*)malloc(sizeof(char)*21);
                strcpy(scp.scope, node->sc->node.idnode.lexeme);
                newTable->scope = scp;

                //assigning pointers of this newTable
                newTable->parent = curr;
                    
                // assigning pointers of parent of this newTable (i.e. curr)
                SymbolTable* t1 = curr->childScope;
                if(t1 == NULL)
                    curr->childScope = newTable;
                else {
                    while(t1->next != NULL)
                        t1 = t1->next;
                    t1->next = newTable;
                }

                //2.Create an entry for this module in current table
                Symbol *s = createSymbol(node);
                int hash = computeStringHash(s->functionEntry.functionName);
                // creating a symbol of type functionEntry and populating it's fields.
                SymbolTableEntry *sym = createSymbolTableEntry(s,functionEntry);
                //inserting the symbol into the table
                if(curr->listHeads[hash] == NULL) { // if linked list is empty
                    curr->listHeads[hash] = sym;
                    curr->listHeads[hash]->table = newTable;
                }
                else {                   // if linked list is not empty
                    SymbolTableEntry *temp = curr->listHeads[hash];
                    while(temp->next != NULL)
                        temp = temp->next;
                    temp->next =  sym;
                    temp->next->table = newTable;
                }


                //now process the statements in the module
                ASTNode* traverse = node->sc->rs->rs->rs;
                while(traverse != NULL){
                    processAST(traverse, newTable);
                    traverse = traverse->next;
                }

                // we can check declaration of outputparmeters by traversing thorugh newTable
                ASTNode* outputParamHead = node->sc->rs->rs;    //points to first outputParamNode
                while(outputParamHead != NULL){     //check all outputParamNodes in linkedlist
                    dupOutputParamErrorFound = false;
                    if(outputParamHead->type == nullNode)
						break;
					else {
                    	recursiveCheckOverload(outputParamHead, newTable);  //also pass error object
                    	outputParamHead = outputParamHead->next;
                    }
                }
            }

            else if(info->symbol.functionEntry.isDefined == false){    //if module is previously declared,but not defined
                //now create a symbol table for the function's scope, process it and then set isDefined = true
                //first update info
                info->symbol.functionEntry.inputListHead = node->sc->rs;
                info->symbol.functionEntry.outputListHead = node->sc->rs->rs;
                info->symbol.functionEntry.isDefined = true;

                SymbolTable* newTable = createSymbolTable(functionBlock);
                //set newTable.scope equal to the name of curr function
                Scope scp;
                scp.scope = (char *)malloc(sizeof(char)*21);
                strcpy(scp.scope, node->sc->node.idnode.lexeme);
                newTable->scope = scp;

                //assigning pointers of this newTable
                newTable->parent = curr;

                SymbolTableEntry *entry = lookupString(newTable->scope.scope, curr, functionEntry, false);
                
                if(entry == NULL)   //error. fix code. should never reach this case
                    printf("Debugging Error.....Buggesh Code\n");
                else
                    entry->table = newTable;
                    
                // assigning pointers of parent of this newTable (i.e. curr)
                SymbolTable* t1 = curr->childScope;
                if(t1 == NULL)
                    curr->childScope = newTable;
                else {
                    while(t1->next != NULL)
                        t1 = t1->next;
                    t1->next = newTable;
                }

                //now process the statements in the module
                ASTNode* traverse = node->sc->rs->rs->rs;
                while(traverse != NULL){
                    processAST(traverse, newTable);
                    traverse = traverse->next;
                }
                
                // we can check declaration of outputparmeters by traversing thorugh newTable
                ASTNode* outputParamHead = node->sc->rs->rs;    //points to first outputParamNode
                	while(outputParamHead != NULL){     //check all outputParamNodes in linkedlist
		                dupOutputParamErrorFound = false;
		                if(outputParamHead->type == nullNode)
							break;
						else
		                	recursiveCheckOverload(outputParamHead, newTable);  //also pass error object
		                outputParamHead = outputParamHead->next;
		            
                	}
               
            }

            else{
                //semantic error : function overloading
            }
            break;
        }
        case inputParamNode:{

            break;
        }
        case outputParamNode:{

            break;
        }
        case typeNode:{


            break;
        }
        case arrayTypeNode:{

            break;
        }
        case rangeNode:{

            break;
        }
        case forLoopNode:{ // for forLoopEntries
            //2.first create block object corresp.to this node, hash it and add to curr table.
            //1.then create new table for this scope, and process its statements
            
            //1.now create new table for this scope, and process its statements
            SymbolTable* newTable = createSymbolTable(forLoopBlock);
            //set newTable.scope.block_scope equal to curr block
            Scope scp;
            scp.block_scope = node->node.forLoopNode.block;
            newTable->scope = scp;

            //assigning pointers of this newTable
            newTable->parent = curr;

            // assigning pointers of parent of this newTable (i.e. curr)
            SymbolTable* t1 = curr->childScope;
            if(t1 == NULL)
                curr->childScope = newTable;
            else {
                while(t1->next != NULL)
                    t1 = t1->next;
                t1->next = newTable;
            }

            //2. (a)create block, hash it and add to curr table
            Block forBlock = node->node.forLoopNode.block;
            int hash = computeBlockHash(&forBlock);
            //2. (b)insert into table. NOTE: we can never have duplicate blocks, so no need to check
            SymbolTableEntry* temp = curr->listHeads[hash];
            if(temp == NULL){    //empty slot, just insert
                curr->listHeads[hash] = createSymbolTableEntry(createSymbol(node),forLoopEntry);
                curr->listHeads[hash]->table = newTable;
            }
            else {              //collision
                while(temp->next != NULL)
                    temp = temp->next;
                temp->next = createSymbolTableEntry(createSymbol(node),forLoopEntry);
                temp->next->table = newTable;
            }

            //now process the statements in the module
            ASTNode* traverse = node->sc->rs->rs;
            while(traverse != NULL){
                processAST(traverse, newTable);
                traverse = traverse->next;
            }

            break;
        }
        case whileLoopNode:{    //for whileLoopNodes
            //1. create a new table for whileLoop's scope
            printf("\nWHILE LOOP ENTRY\n");
            SymbolTable* newTable = createSymbolTable(whileLoopBlock);
            //set newTable.scope.block_scope equal to curr block
            Scope scp;
            scp.block_scope = node->node.whileLoopNode.block;
            newTable->scope = scp;

            //assigning pointers of this newTable
            newTable->parent =curr;

            // assigning pointers of parent of this newTable (i.e. curr)
            SymbolTable *t1 = curr->childScope;
            if(t1 == NULL)
                curr->childScope = newTable;
            else {
                while(t1->next != NULL)
                    t1 = t1->next;
                t1->next = newTable;
            }

            //2. Insert a whileLoopEntry in current table
            Block whileBlock = node->node.forLoopNode.block;
            int hash = computeBlockHash(&whileBlock);
        
            // insert into table.
            SymbolTableEntry *temp = curr->listHeads[hash];
            if(temp == NULL) {
                curr->listHeads[hash] = createSymbolTableEntry(createSymbol(node),whileLoopEntry);
                curr->listHeads[hash]->table = newTable;
            }
            else {  // collision
                while(temp->next != NULL)
                    temp = temp->next;
                temp->next = createSymbolTableEntry(createSymbol(node),whileLoopEntry);
                temp->next->table = newTable;
            }

            //now process the statements in the module
            ASTNode* traverse = node->sc->rs;
            while(traverse != NULL){
                processAST(traverse, newTable);
                traverse = traverse->next;
            }
            break;
        }
        case inputIONode:{
            //do nothing
            break;
        }
        case outputIONode:{
            //DO NOTHING
            break;
        }
        case arrayIdNode:{

            break;
        }
        case assignmentNode:{
            //do nothing
            break;
        }
        case functionCallNode:{
            //do nothing
            break;
        }
        case opNode:{
            //do nothing
            break;
        }
        case declareNode:{
            // add all the identifiers in the current table only.
            ASTNode *temp = node->sc;
	    if(temp != NULL)
		processAST(temp, curr);

            break;
        }
        case caseNode:{
            //just process the statements in this case block
            //now process the statements in the module
            ASTNode* traverse = node->sc->rs;
            while(traverse != NULL){
            	printf("yes yes yesss\n");
                processAST(traverse, curr);
                traverse = traverse->next;
            }
            break;
        }
        case conditionalNode:{
            //1. create a new table for switch case's scope
            SymbolTable* newTable = createSymbolTable(switchCaseBlock);
            //set newTable.scope.block_scope equal to curr block
            Scope scp;
            scp.block_scope = node->node.conditionalNode.block;
            newTable->scope = scp;

            //assigning pointers of this newTable
            newTable->parent = curr;
            // assigning pointers of parent of this newTable (i.e. curr)
            SymbolTable *t1 = curr->childScope;
            if(t1 == NULL)
                curr->childScope = newTable;
            else {
                while(t1->next != NULL)
                    t1 = t1->next;
                t1->next = newTable;
            }
            
            //2. hash this switch case block into curr table, and process its statements
            int hash = computeBlockHash(&node->node.conditionalNode.block);
            SymbolTableEntry* temp = curr->listHeads[hash];
            if(temp == NULL) {  //empty slot, just insert
                curr->listHeads[hash] = createSymbolTableEntry(createSymbol(node),forLoopEntry);
                curr->listHeads[hash]->table = newTable;
            }
            else {              //collision
                while(temp->next != NULL)
                    temp = temp->next;
                temp->next = createSymbolTableEntry(createSymbol(node),forLoopEntry);
                temp->next->table = newTable;
            }

            //now process the casenodes
            ASTNode* traverse = node->sc->rs;
            while(traverse != NULL){
                processAST(traverse, newTable);
                traverse = traverse->next;
            }
            //now process the default node(it is also a CaseNode)
            processAST(node->sc->rs->rs, newTable);
            break;
        }
        case numNode:{
            break;
        }
        case boolNode:{
            break;
        }
        case idNode: {
            switch(node->parent->type){
                case programNode:{      //case of moduleDeclaration
                    //curr has root table
                    //here we have encountered function prototype. populate in table
                    if(lookupString(node->node.idnode.lexeme, curr, functionEntry, false) == NULL){ //add to table
                        int hash = computeStringHash(node->node.idnode.lexeme);
                        Symbol* sym = createSymbol(node);
                        strcpy(sym->functionEntry.functionName, node->node.idnode.lexeme);
                        sym->functionEntry.inputListHead = NULL;
                        sym->functionEntry.outputListHead = NULL;
                        sym->functionEntry.isDeclared = true;
                        sym->functionEntry.isDefined = false;
                        if(curr->listHeads[hash] == NULL)  //first element in list
                            curr->listHeads[hash] = createSymbolTableEntry(sym, functionEntry);
                        else {
                            SymbolTableEntry* temp = curr->listHeads[hash];
                            while(temp->next != NULL)
                                temp = temp->next;
                            temp->next = createSymbolTableEntry(sym, functionEntry);
                        }
                    }
                    else{
                        //semantic error: duplicate module declaration
                    }

                    //process remaining moduleDeclarations(remaining idNodes in linkedlist)
                    ASTNode *temp = node->next;
                    if(temp != NULL)
			processAST(temp, curr);
                    break;
                }
                case moduleNode:{
                    // do nothing as Name of function is already stored in the symbol table
                    break;
                }
                case declareNode:{
                    if(lookupString(node->node.idnode.lexeme,curr,idEntry,true) == NULL)
                    {
                        int hash = computeStringHash(node->node.idnode.lexeme);
                        SymbolTableEntry *sym = createSymbolTableEntry(createSymbol(node),idEntry);
        
                        if(curr->listHeads[hash] == NULL)  //first element in list
                            curr->listHeads[hash] = sym;
                        else {
                            SymbolTableEntry* temp = curr->listHeads[hash];

                            while(temp->next != NULL)
                                temp = temp->next;
                            temp->next = sym;
                        }
			
			if(node->next != NULL)
			    processAST(node->next, curr);
                        
                    }
                    else
                    {
                        // semantic error. variable already declared
                    }

                    break;
                }
                default:{
                    break;
                }

            }
            break;
        }
        case nullNode: {
            //do nothing
            
            printf("NULL NODE");
            break;
        }
    }
}


//temporary function
void checkSymbolTable()
{
	ASTNode *n = getAST();
	processAST(n,NULL);
	
}

SymbolTable* getsymbolTable()
{
	return symbolTableRoot;
}
//Semantic error:
                //1. Type checking related
                    /*{
                        //TypeExtractor.c -> semantic.c
                    }*/
                //2. Declaration related 
                    //a. duplicate declarations
                    //b. outputparameter overloading inside function
