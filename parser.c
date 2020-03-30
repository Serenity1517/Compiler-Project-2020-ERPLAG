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
#include <ctype.h>
#include <string.h>
#include <math.h>


ParseTableEntry **parseTable;    								//ParseTableEntry** (parsetable object)
FirstAndFollow FirstFollowSetsOfAll;                                //FirstAndFollow Object
Grammar G;                                                          //Grammar Object
SymbolNode Stack[MAX_STACK_SIZE];                                  // Stack to be used in parsing

int no_of_nodes=0;		//for debugging

int is_parsetree_valid =1;

int top_of_stack = -1;
//integer to string mapping of Terminals
char *terminalMap[] ={ 
    "#",            //to represent epsilon in .txt file 
    "INTEGER",
    "REAL",
    "BOOLEAN",
    "OF",
    "ARRAY",
    "START",
    "END",
    "DECLARE",
    "MODULE",
    "DRIVER",
    "PROGRAM",
    "RECORD",
    "TAGGED",
    "UNION",
    "GET_VALUE",
    "PRINT",
    "USE",
    "WITH",
    "PARAMETERS",
    "TRUE",
    "FALSE",
    "TAKES",
    "INPUT",
    "RETURNS",
    "AND",
    "OR",
    "FOR",
    "IN",
    "SWITCH",
    "CASE",
    "BREAK",
    "DEFAULT",
    "WHILE",
    "DRIVERDEF",
    "DEF",
    "LE",
    "LT",
    "DRIVERENDDEF",
    "ENDDEF",
    "GE",
    "GT",
    "COLON",
    "NE",
    "EQ",
    "PLUS",
    "MINUS",
    "DIV",
    "RANGEOP",
    "SEMICOL",
    "COMMA",
    "SQBO",
    "SQBC",
    "BO",
    "BC",
    "COMMENTMARK",
    "MUL",
    "ID",
    "NUM",
	"ASSIGNOP",
    "RNUM",
    "$"
};

//Integer to String mapping of Non-Terminals
char *nonTerminalMap [] ={
	"program",
	"moduleDeclarations",
	"moduleDeclaration",
	"otherModules",
	"driverModule",
	"module",
	"ret",
	"input_plist",
	"N1",
	"output_plist",
	"N2",
	"dataType",
	"range_arrays",
	"type",
	"moduleDef",
	"statements",
	"statement",
	"ioStmt",
	"var",
	"whichId",
	"simpleStmt",
	"assignmentStmt",
	"whichStmt",
	"lvalueIDStmt",
	"lvalueARRStmt",
	"Index",
	"moduleReuseStmt",
	"idList",
	"optional",
	"N3",
	"expression",
	"U",
	"new_NT",
	"arithOrBoolExpr",
	"N7",
	"AnyTerm",
	"boolConstt",
	"N8",
	"arithmeticExpr",
	"N4",
	"term",
	"N5",
	"factor",
	"var_id_num",
	"op1",
	"op2",
	"logicalOp",
	"relationalOp",
	"declareStmt",
	"conditionalStmt",
	"caseStmts",
	"N9",
	"value",
	"Default",
	"iterative",
	"range"
};

/*-----DEBUGGING FUNCTIONS------------*/
char *mapTerminal(int i){
    return terminalMap[i];
}
char *mapNonTerminal(int i){
    return nonTerminalMap[i];
}
void testFirstFollow(){
    if(populateGrammarWithRules("Grammar.txt")==1){
        printGrammarRules();	//1
        ComputeFirstAndFollowSets(G);
        printFirstFollow();
    }
	//printf("%d ",findNonTerminal("arithOrBoolExp"));
}

/*This function is used to print the grammar rules onto a file
    Used for debugging purposes
*/
void printGrammarRules() {
    int i;
    remove("testreadgrammar.txt");
    FILE *fout = fopen("testreadgrammar.txt","a");
    for(i=0; i<G.no_of_rules;i++){
        char line_out[100] = {0};
        strcpy(line_out, nonTerminalMap[G.rules[i].lhs]);
        fprintf(fout, "\nRule number %d\n\tlhs=%s\n\trhs=", i, line_out);
        printf("\nRule number %d\n\tlhs=%s\n\trhs=", i, line_out);
        int k;
        SymbolNode *temp = G.rules[i].rhs.start;
        while(temp != NULL){		//2
            
            if(temp->tag==0){
                //fprintf(fout," %s",terminalMap[temp->type.terminal]);
                printf(" %s",terminalMap[temp->type.terminal]);	//3
            }
            else
            {
                //fprintf(fout," %s",nonTerminalMap[temp->type.nonterminal]);
                printf(" %s",nonTerminalMap[temp->type.nonterminal]);
            }
            temp=temp->next;	//4
        }
    }
    return ;
}

//This function prints a SymbolNodesList object.
void printList(SymbolNodesList L){
    SymbolNode* temp = (SymbolNode*)malloc(sizeof(SymbolNode));
    temp = L.start;
    int ele = 1;
    while(temp != NULL){
        if(temp->tag==0)
            printf(" %s ", mapTerminal(temp->type.terminal));
        else
            printf(" %s ", mapNonTerminal(temp->type.nonterminal));
        ele++;
        temp = temp->next;
    }
}
/*This function is used to print first follow sets onto a file*/
void printFirstFollow(){
    int i;
    for(i=0; i<NO_OF_NONTERMINALS; i++){
         printf("\n%d. First(%s) :\t",i, nonTerminalMap[i]);
        printList(FirstFollowSetsOfAll.first[i]);
    }

    for(i=0; i<NO_OF_NONTERMINALS; i++){
        printf("\n%d. Follow(%s) :\t", i, nonTerminalMap[i]);
        printList(FirstFollowSetsOfAll.follow[i]);
    }
    // printf("\n\nfollow(otherModules).start->tag = %d ",FirstFollowSetsOfAll.follow[3].start->tag);
}

void testParseTable(){
	fillKeywordsHashTable();
    populateGrammarWithRules("Grammar.txt");
    ComputeFirstAndFollowSets(G);
    createParseTable(FirstFollowSetsOfAll);
    /*int i,j;
    printf("\nParseTable:");
    for(i=0; i<NO_OF_NONTERMINALS; i++){
        for(j=0; j<NO_OF_TERMINALS; j++){
            printf(" %d", parseTable[i][j].rule_no);
        }
        printf("\n");
    }*/
}

void testParseTree(char *inputFile, char *parseTreeOutFile){
	fillKeywordsHashTable();
	populateGrammarWithRules("Grammar.txt");
	ComputeFirstAndFollowSets(G);
	createParseTable(FirstFollowSetsOfAll);
	ParseTree PT;
	PT = parseInputSourceCode(inputFile, parseTable);
	if(is_parsetree_valid == 1)	
	{
		printParseTree(PT, parseTreeOutFile);
	}	
	else
	{
		printf("\nDue to Syntactical Error, Parse Tree cannot be generated\n");
	}
}

void testAST(char *inputFile, char *parseTreeOutFile){
	fillKeywordsHashTable();
	populateGrammarWithRules("Grammar.txt");
	ComputeFirstAndFollowSets(G);
	createParseTable(FirstFollowSetsOfAll);
	ParseTree PT;
	PT = parseInputSourceCode(inputFile, parseTable);
	if(is_parsetree_valid == 1)	
	{
		printParseTree(PT, parseTreeOutFile);
        createAST(PT.root);
	}	
	else
	{
		printf("\nDue to Syntactical Error, Parse Tree cannot be generated\n");
	}
}


/*-------------UTILITY FUNCTIONS------------*/

//This function searches for SymbolNode* symbol in a symbolnodeslist starting with SymbolNode *start (the parameter to this function)
bool searchForSymbol(SymbolNode *start, SymbolNode *symbol){
    SymbolNode *temp = (SymbolNode*)malloc(sizeof(SymbolNode));
    temp = start;
    while(temp != NULL) {
        if(temp->tag == 0 && symbol->tag == 0){
            if(temp->type.terminal == symbol->type.terminal){
                return true;
            }
        }
        else if(temp->tag == 1 && symbol->tag == 1){
            if(temp->type.nonterminal == symbol->type.nonterminal){
                return true;
            }
        }
        temp = temp->next;
    }
    return false;
}

/*This function removes epsilon from a given SymbolNodesList (which is actually a set of terminals)
NOTE: IT is known that epsilon exists in the list */
void removeEpsilonFromList(SymbolNodesList *list){
    SymbolNode *prev = NULL;
    SymbolNode *curr = list->start;
    while(curr->type.terminal != EPSILON && curr != NULL){
        prev = curr;
        curr = curr->next;
    }
    if(prev == NULL){        //if epsilon is found at the start itself
        list->start = list->start->next;
        list->len--;
        return;
    }
    else {
        prev->next = curr->next;
        free(curr);
        list->len--;
        return;
    }
}

/*This function returns the index of non-terminal from the nonTerminalMap array*/
int findNonTerminal(char *arr)
{
    int i;
    for(i=0;i<NO_OF_NONTERMINALS;i++)
    {
        if(strcmp(arr,nonTerminalMap[i])==0)
            return i;    
    }
	return -1;
	//printf("\n Non Terminal not found*******************");
	
}

/*This function returns the index of terminal from the terminalMap array  */
int findTerminal(char *arr)
{
    int i;
    for(i=0;i<NO_OF_TERMINALS;i++)
    {
        if(strcmp(arr,terminalMap[i])==0)
            return i;    
    }
	return -1;
	//printf("\n Terminal not found*******************");
}

/* This function recursively populates the RHS portion of the rule
    parameters : rl - Rule pointer
                buff - current input line stored as character array(contains everything except '\n')
                i - pointer to first T/NT
*/
void populateRHS(Rule *rl, char *buff, int i)
{
    if(i+1>=strlen(buff))       //if we have reached the end of the buffer
        return;

    while(buff[i]==' ')
        i++; 
    if(buff[i]=='<')   // if rule is non-terminal
    {   
        i++;
        char t[30] = {'\0'};
        int j=0;
        while(buff[i]!='>')
        {
            t[j] = buff[i];
            i++;
            j++;
        }
	
        //printf("\nt=%s, i points to %c", t, buff[i]);
        //i points to '>'
        if(rl->rhs.start == NULL)       //if the current rule has an empty rhs, create first node in rhs linked list
        {
            SymbolNode *node =(SymbolNode *)malloc(sizeof(SymbolNode));
            node->next = NULL;
            node->tag = 1;
            node->type.nonterminal = findNonTerminal(t);
            rl->rhs.start = node;
            rl->rhs.len += 1;
            i++;
            populateRHS(rl,buff,i);
        }
        else     // if current rule doesn't have an empty rhs
        {
            SymbolNode *temp =(SymbolNode *)malloc(sizeof(SymbolNode)); 
            temp=rl->rhs.start;
            while(temp->next != NULL)
            {
                temp = temp->next;
            }
            SymbolNode *node =(SymbolNode *)malloc(sizeof(SymbolNode));
            node->next = NULL;
            node->tag = 1;
            node->type.nonterminal = findNonTerminal(t);
            temp->next = node;
            rl->rhs.len += 1;
            i++;
            populateRHS(rl,buff,i);
        }
    }
    else    // if rule is a terminal
    {
        char t[30]={'\0'};
        int j=0;
        while(buff[i]!=' ' && i<strlen(buff)-1)
        {
            t[j] = buff[i];
            i++;
            j++;
        }
    //printf("\tt=%s$", t);
        if(rl->rhs.start == NULL)           //if current rules has empty rhs
        {
            SymbolNode *node =(SymbolNode *)malloc(sizeof(SymbolNode));
            node->next = NULL;
            node->tag = 0;
            node->type.terminal = findTerminal(t);
            rl->rhs.start = node;
            rl->rhs.len += 1;
            i++;
            populateRHS(rl,buff,i);
        }
        else        //if current rule has non empty rhs, append current node to linkedlist(rhs)
        {
            SymbolNode *temp = rl->rhs.start;
            while(temp->next != NULL)
            {
                temp = temp->next;
            }
            SymbolNode *node =(SymbolNode *)malloc(sizeof(SymbolNode));
            node->next = NULL;
            node->tag = 0;
            node->type.terminal = findTerminal(t);
            temp->next = node;
            rl->rhs.len += 1;
            i++;
            populateRHS(rl,buff,i);
        }
    }
}

/*This function initializes a Grammar Object*/
Grammar initializeGrammar(Grammar G){
    G.rules=(Rule*)malloc(sizeof(Rule)*(NO_OF_GRAMMAR_RULES+1));
    G.no_of_rules=0;
    printf("\nGrammar Initialized\n");
    return G;
}


/*This function populates the Grammar G with rules written in input grammarFile
    Returns : 1, if successful
              0, if not successful  
*/
int populateGrammarWithRules(char *grammarFile){
    FILE *inFile = fopen(grammarFile,"r");
    /*look at Grammar.txt and then write code to parse it and populate Grammar *G with the Rules
        in the process you have to iteratively create a Rule object, then add it to G sequentially
        go through the structures in parserDef.h thoroughly*/
        G = initializeGrammar(G);
        int gram=0;
        char buff[150] = {'\0'};
        int grammar_rule_iteration=0;
        while (true)
        {
            if(fgets(buff, 150, inFile)==NULL)
                return 1;
            Rule rl;
            rl.rhs.len=0;
            rl.rhs.start = NULL;
            int i=1;    //skip i=0; as buff[0] = '<'
            char lhs[30]={0};
            int j=0;
            while(buff[i]!='>'){
                lhs[j]=buff[i];
                i++;
                j++;
            }

            rl.lhs = findNonTerminal(lhs);
            i=i+6;
            
            //reached first symbol on rhs
            populateRHS(&rl,buff,i);  // recusively populates RHS of rule 
            G.no_of_rules += 1;
            G.rules[gram++] = rl;
        }
    printf("\nGrammar Populated With All Rules.\n");
    return 0;     
}


/*This function concats list2(linkedlist) to list1(linkedlist) and returns final list
    NOTE: It also removes duplicate elements <-- IMPORTANT
*/
SymbolNodesList concatList(SymbolNodesList list1, SymbolNodesList list2){
    if(list1.len==0)
        return list2;
    if(list2.len==0)
        return list1;
    SymbolNodesList finalList;
    SymbolNode * temp = (SymbolNode*)malloc(sizeof(SymbolNode));
    finalList.len = 0 ;
    finalList.start = NULL;
    temp = list1.start;
    SymbolNode *tail;
    while(temp != NULL)
    {
        SymbolNode *new = (SymbolNode*)malloc(sizeof(SymbolNode));
        new->type = temp->type;
        new->tag = temp->tag;
        new->next = NULL;
        if(finalList.len==0){
            finalList.start = new;
            finalList.len++;
            tail = finalList.start;
            temp = temp->next;
            continue;
        }
        tail->next = new;
        tail = new;
        finalList.len++;
        temp = temp->next;
    }

    temp = list2.start;
    while(temp != NULL)
    {
        if(searchForSymbol(finalList.start, temp) == false){
            SymbolNode *new = (SymbolNode*)malloc(sizeof(SymbolNode));
            new->type = temp->type;
            new->tag = temp->tag;
            new->next = NULL;
            tail->next = new;
            tail = new;
            finalList.len++;
            temp = temp->next;
        }
        else 
            temp = temp->next;
    }
    return finalList;
}

//This function returns a linkedlist of symbols(terminals; tag=0) representing the first set of a given linkedlist of symbols(terminals and nonterminals)
SymbolNodesList findFirst(SymbolNodesList rhs)
{
    SymbolNodesList finalResult;
    
    finalResult.start=NULL;
    finalResult.len=0;
    SymbolNode *temp = (SymbolNode*)malloc(sizeof(SymbolNode));
	temp = rhs.start;
    if(temp->tag == 0){         //if starting symbol in rhs is a terminal, then return it directly
        // printf("\ncase 1: its a terminal");
        SymbolNode *temp2 = (SymbolNode*)malloc(sizeof(SymbolNode));
		*temp2 = *temp;
        temp2->next=NULL;
        finalResult.start=temp2;
        finalResult.len=1;
        return finalResult;
    }
    else {                      //if starting symbol in rhs is a nonterminal, make a recursive call to find it's First set
        // printf("\ncase2: its a nonterminal");
        /*
        int i;
        for(i=0; i<NO_OF_GRAMMAR_RULES; i++){       //find all such rules where this nonterminal temp occurs in lhs
            if(G.rules[i].lhs == temp->type.nonterminal){
                finalResult = concatList(finalResult, findFirst(G.rules[i].rhs));
            }
        }
         //temp epsilon node
        SymbolNode *tempEpsilonSymbol = (SymbolNode*)malloc(sizeof(SymbolNode));    //creating an EPSILON SymbolNode
        tempEpsilonSymbol->tag=0;
        tempEpsilonSymbol->next=NULL;
        tempEpsilonSymbol->type.terminal=EPSILON;
            
        if(searchForSymbol(finalResult.start, tempEpsilonSymbol)){ //if the list contains epsilon. 
            SymbolNodesList x;
            x.start=temp->next;
            x.len=rhs.len-1;
            finalResult = concatList(finalResult, findFirst(x));
        }
        */
        // printf("\n\tcurr nonterminal = %s", nonTerminalMap[temp->type.nonterminal]);
        finalResult = FirstFollowSetsOfAll.first[temp->type.nonterminal];
        // printf("\tInside findFirst, finalResult=");
        // printList(finalResult);
        SymbolNode *tempEpsilonSymbol = (SymbolNode*)malloc(sizeof(SymbolNode));    //creating an EPSILON SymbolNode
        tempEpsilonSymbol->tag=0;
        tempEpsilonSymbol->next=NULL;
        tempEpsilonSymbol->type.terminal=EPSILON;

        if(searchForSymbol(finalResult.start, tempEpsilonSymbol)){ //if the list contains epsilon. 
            // printf("\n\t\t\t@@@@EPSILON FOUND IN FINALRESULT");
            if(temp->next == NULL) {        //there is nothing left in rhs now.
                return finalResult;
            }
            SymbolNodesList x;
            x.start=temp->next;
            x.len=rhs.len-1;
            // printf("\n\t\tfinalResult : ");
            // printList(finalResult);
            // printf("\n\t\tx : ");
            // printList(x);
            SymbolNodesList firstOfx = findFirst(x);
            finalResult = concatList(finalResult, firstOfx);
            //abhi finalResult me epsilon he
            //aur findFirst(x) me epsilon nahi he
            //to finalResult se eps hatao
            if(searchForSymbol(finalResult.start, tempEpsilonSymbol)==true)
                if(searchForSymbol(firstOfx.start, tempEpsilonSymbol)==false)
                    removeEpsilonFromList(&finalResult);
            // printf("\n\t\t\tafter concat, finalLIst : ");
            // printList(finalResult);
        }
        return finalResult;
    }
}

/*This function finds and returns the follow set of the given nonterminal*/
SymbolNodesList findFollow(SymbolNode *node){       //node->tag=1(nonterminal)
    //printf("\n***Inside findFollow(%s)\n",nonTerminalMap[node->type.nonterminal]);
    //first check if this followset is already computed
    if(FirstFollowSetsOfAll.follow[node->type.nonterminal].len > 0){  //if it has already been computed
        //printf("\n\tFollow alreaady computed. Length of follow set = %d",FirstFollowSetsOfAll.follow[node->type.nonterminal].len);
        return FirstFollowSetsOfAll.follow[node->type.nonterminal];
    }
    SymbolNodesList finalList;
    finalList.start=NULL;
    finalList.len=0;
    int i;
    for(int i=0; i<NO_OF_GRAMMAR_RULES; i++){   //1        //search each grammar rule's rhs for required non-terminal
        SymbolNode *temp = G.rules[i].rhs.start;
        //determine whether this non-terminal occurs on right side of a rule by traversing the rhs
        //printf("\n\t RHS ===");
        //printList(G.rules[i].rhs);
        while(temp != NULL){       //3
            if(temp->tag == 0){     // 2//if current symbol is a terminal, just continue  
                temp = temp->next;	//4
            }
            else {                  //if current symbol is a nonterminal
                if(temp->type.nonterminal == node->type.nonterminal){        //if required node is found on rhs
                    if(temp->next == NULL){  //5	     //if current nonterminal is the rightmost symbol on rhs
                        //printf("\n\t\tCurrent nonterminal found on rhs(rightmost) of rule no %d",i);
                        if(G.rules[i].lhs == temp->type.nonterminal){   //if the rightmost nonterminal is same as lhs terminal
                            //then don't consider this recursion case.
                            break;		//6
                        }
                        SymbolNode *LHS = (SymbolNode*)malloc(sizeof(SymbolNode));
                        LHS->tag=1;
                        LHS->next=NULL;
                        LHS->type.nonterminal=G.rules[i].lhs;
                        finalList = concatList(finalList, findFollow(LHS));             //add follow of lhs to follow of current non-terminal
                        break;
                    }
                    else{               //if current nonterminal is not the rightmost symbol on rhs
                        //first create a SymbolNodesList of the remaining nodes on rhs
                        //printf("\n\t\tCurrent nonterminal found on rhs(in middle of rlue no %d",i); //7
                        SymbolNodesList remRHS;
                        remRHS.start=NULL;
                        remRHS.len=0;
                        SymbolNode *tempRHS = temp->next;
                        SymbolNode *tail;           //will be used to point to the last element of remRHS
                        while(tempRHS != NULL){
                            SymbolNode *new = (SymbolNode*)malloc(sizeof(SymbolNode));         //create new node to be added to remRHS list
                            new->next=NULL;
                            new->tag=tempRHS->tag;
                            new->type=tempRHS->type;
                            if(remRHS.len==0){       //if this is the first node being added to the list
                                remRHS.start = new;
                                remRHS.len++;
                                tempRHS=tempRHS->next;
                                tail = remRHS.start;
                                continue;
                            }
                            tail->next = new;
                            tail = new;
                            remRHS.len++;
                            tempRHS = tempRHS->next;
                        }
/*
                        printf("\n\t\tremRHS ==");
                        printList(remRHS);
                        printf("\n");*/
                        //now that remRHS is created, add first(remRHS) to our required follow set (i.e. finalList) of SymbolNode* node.
                        //but first check if it contains epsilon. if yes, add everything except epsilon and add follow of lhs to required list.   
                        SymbolNodesList tempFirst = findFirst(remRHS);
                        SymbolNode *tempEpsilonSymbol = (SymbolNode*)malloc(sizeof(SymbolNode));    //creating an EPSILON SymbolNode
                        tempEpsilonSymbol->tag=0;
                        tempEpsilonSymbol->next=NULL;
                        tempEpsilonSymbol->type.terminal=EPSILON; 
                        if(searchForSymbol(tempFirst.start, tempEpsilonSymbol)){            //if it contains epsilon
                            removeEpsilonFromList(&tempFirst);              //remove epsilon from list. NOTE: parameter passing by reference.
                            finalList = concatList(finalList, tempFirst);
                            //now add follow of lhs to our required finalList
                            SymbolNode *LHS = (SymbolNode*)malloc(sizeof(SymbolNode));      //create temp LHS SymbolNode 
                            LHS->tag=1;
                            LHS->next=NULL;
                            LHS->type.nonterminal=G.rules[i].lhs;
                            finalList = concatList(finalList, findFollow(LHS));
                            //printf("\n\t\t^^^^^finalList : ");
                           // printList(finalList);
                        } 
                        else{       //if it doesn't contain epsilon, then simply add it to required lsit
                            // printf("\n\t\t**Printing finalList : ");
                            // printList(finalList);
                            //printf("\n\t\t&&&Printing tempfirst : ");
                            //printList(tempFirst);
                            finalList = concatList(finalList, tempFirst);
                            //printf("\n\t\t\tPrninting finalList after concat: ");
							//printf("\n\t\t^^^^^finalList : ");                            
							//printList(finalList);
                        } 
                    }
                    temp = temp->next;
                    
                }
                else {          //if this is not the required node, just continue
                    temp = temp->next;  //8
                }
            }
        }
    }
    return finalList;    
}
    

/* This function computes First and Follow Sets of all non-terminals in the grammar G
    so that FirstAndFollow F is appropriately populated.
    -> Read all comments in the parserDef.h file surrounding TerminalNode, TerminalSet and FirstAndFollow
    -> You will need to create TerminalNodes and eventually make a two TerminalSets : 'first' and 'follow'
       out of them for given NonTerminal nonterminal (int(nonterminal)=i) and then set:
        F.first[i] = first  ; F.follow[i] = follow
*/
void ComputeFirstAndFollowSets(Grammar G){
    //first initialize all first and follow sets to null
    int i;
    for(i=0; i<NO_OF_NONTERMINALS; i++){
        FirstFollowSetsOfAll.first[i].len=0;
        FirstFollowSetsOfAll.first[i].start=NULL;
        FirstFollowSetsOfAll.follow[i].len=0;
        FirstFollowSetsOfAll.follow[i].start=NULL;
    }

    //computing first sets first
    for(i=NO_OF_GRAMMAR_RULES-1; i>=0; i--){
        // if(i==0) {printf("\n^^^rhs = "); printList(G.rules[i].rhs);}
        FirstFollowSetsOfAll.first[G.rules[i].lhs] = concatList(FirstFollowSetsOfAll.first[G.rules[i].lhs], findFirst(G.rules[i].rhs));  
        //printf("\n%d. First(%s)=",i, nonTerminalMap[G.rules[i].lhs]);
        //printList(FirstFollowSetsOfAll.first[G.rules[i].lhs]);      
    }

    printf("\n****FIRST SETS COMPUTED****\n");

    //compute follow sets now
    SymbolNodesList tempDollar;
    SymbolNode *dollar = (SymbolNode*)malloc(sizeof(SymbolNode));
    dollar->next = NULL;
    dollar->tag = 0;
    dollar->type.terminal = $;
    tempDollar.start = dollar;
    tempDollar.len=1;

    //first add dollar to follow set of program (start symbol)
    FirstFollowSetsOfAll.follow[program] = tempDollar;
    //printf("\n\nCOMPUTING FOLLOW SETS. FOLLOW(program)=");
    //printList(FirstFollowSetsOfAll.follow[program]);
    for(i=1; i<NO_OF_NONTERMINALS; i++){
        //printf("\n\ni=%d",i);
        SymbolNode *temp = (SymbolNode*)malloc(sizeof(SymbolNode));
        temp->next=NULL;
        temp->tag=1;
        temp->type.nonterminal=i;
        //printf("\tcalling findFollow(%s)",nonTerminalMap[temp->type.nonterminal]);
        FirstFollowSetsOfAll.follow[i] = findFollow(temp);
        //printf("\n\n\t\t\t\t$$$$$$PRINTING ACTUAL FOLLOW SET : ");
        //printList(FirstFollowSetsOfAll.follow[i]);
        //printf("\n$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$\n");
		//printf("\n%d. Follow(%s)=",i, nonTerminalMap[i]);
        //printList(FirstFollowSetsOfAll.first[G.rules[i].lhs]);
    }
    printf("\n****FOLLOW SETS COMPUTED****\n");
}


/*
    - This function initializes the parse table row to -1.
*/
void initializeParseTable()
{
	parseTable = (ParseTableEntry**)malloc(sizeof(ParseTableEntry*)*NO_OF_NONTERMINALS);
	
    int i,j;
    for(i=0;i<NO_OF_NONTERMINALS;i++)
    {
		parseTable[i] = (ParseTableEntry*)malloc(sizeof(ParseTableEntry)*NO_OF_TERMINALS);
        for(j=0;j<NO_OF_TERMINALS;j++)
        {
            parseTable[i][j].rule_no = -1;
        }
        
    }
	/*for(i=0;i<NO_OF_NONTERMINALS;i++){
		for(j=0;j<NO_OF_TERMINALS;j++){
			//printf(" %d",parseTable[i][j].rule_no);			
		}
		printf("\n");
	}*/
}


/* - This function gets input FirstAndFollow F, and a 2-d array of parse table entries : ParseTableEntry **T
   - Read all comments in parseDef.h surrounding TerminalNode, TerminalSet, FirstAndFollow, ParseTableEntry
   - Traverse the T matrix row by row (Non-terminal by non-terminal) in outer loop
   - Traverse col by col (terminal by terminal) in inner loop 
   - During each iteration, check if the terminal belongs in F.first(nonterminal). If not, make isErr true
      and continue. If yes, create an entry in T by making a use of (int)TerminalNode.corresponding_rule_no and
      hence populate the T table with rules.
    - NOTE: Rules can be found in the global Grammar object G
*/
void createParseTable(FirstAndFollow F){
    initializeParseTable();
    int i;
    for (i=0; i<NO_OF_GRAMMAR_RULES; i++){   // traversing all the grammar rules
        SymbolNodesList finalFirstSet;
        finalFirstSet = findFirst(G.rules[i].rhs);
        SymbolNode *tempEpsilonSymbol = (SymbolNode*)malloc(sizeof(SymbolNode));    //creating an EPSILON SymbolNode
        tempEpsilonSymbol->tag=0;
        tempEpsilonSymbol->next=NULL;
        tempEpsilonSymbol->type.terminal=EPSILON;
        if(searchForSymbol(finalFirstSet.start, tempEpsilonSymbol))   // if EPSILON is present then we need to find Follow of LHS
        {
            SymbolNode *temp = finalFirstSet.start;
            while(temp != NULL)   // non-epsilon terminals ka hisab 
            {
                if(temp->type.terminal != EPSILON)
                {
                    parseTable[G.rules[i].lhs][temp->type.terminal].rule_no = i;
                }
                temp = temp -> next;
            }  
                // to check FOLLOW(A) 
            SymbolNode * foll = F.follow[G.rules[i].lhs].start;
            while(foll!= NULL)
            {
                parseTable[G.rules[i].lhs][foll->type.terminal].rule_no = i;    
                foll = foll -> next;
            }
        }
        else   // if EPSILON is not present then we only need to use First set
        {
            SymbolNode *temp = (SymbolNode*)malloc(sizeof(SymbolNode));
			temp = finalFirstSet.start;
            while(temp != NULL)
            {
                parseTable[G.rules[i].lhs][temp->type.terminal].rule_no = i;
                temp = temp -> next;
            } 
        }
    }

    /*now add all those cells to syn sets(-2) which are currently error cells (-1) a
    and for which terminal(column) lies in follow set of nonterminal(row)*/
    for(i=0;i<NO_OF_NONTERMINALS;i++)
    {
        int j;
        for(j=0;j<NO_OF_TERMINALS;j++)
        {
            if(parseTable[i][j].rule_no == -1){
                SymbolNode *temp = (SymbolNode*)malloc(sizeof(SymbolNode));
                temp->next = NULL;
                temp->tag = 0;
                temp->type.terminal = j;
                if(searchForSymbol(F.follow[i].start, temp))        //if terminal occurs in follow set, then make cell syn
                {
                    parseTable[i][j].rule_no = -2;  // syn position
                }
            }
        }
    }
	/*for(i=0;i<NO_OF_NONTERMINALS;i++){
		int j;
		for(j=0;j<NO_OF_TERMINALS;j++){
			printf(" %d",parseTable[i][j].rule_no);			
		}
		printf("\n");
	}*/
}

/*This function pushes a SymbolNode nd to a stack who's top pointer is SymbolNode *st*/
void push(SymbolNode *st,SymbolNode nd) {
    st[++top_of_stack] = nd;
}

/* This function creates Parse Tree Node */
ParseTreeNode *createParseTreeNode(SymbolNode sym) {
    ParseTreeNode *nd = (ParseTreeNode*)malloc(sizeof(ParseTreeNode));
    nd->parent = NULL;
    nd->startChild = NULL;
    nd->rightSibling = NULL;
    nd->node = sym ;
    nd->tkn = NULL;
    nd->rule_no = -1;
    nd->syn = NULL;
    nd->inh = NULL;
	no_of_nodes++;
    return nd;
}

/*This function creates and intializes a parse tree. */
ParseTree createParseTree() {
    ParseTree tree ;
    SymbolNode strt ;
    strt.tag = 1;
    strt.type.nonterminal = program;
    strt.next = NULL;
    tree.root = createParseTreeNode(strt);
    return tree;        
}


/* - This function takes a testcaseFile as input and uses the parsing table T to return a parsetree 
    it implements predictive parsing
    --see details on nalanda notice : Interface details*/
ParseTree parseInputSourceCode(char *testcaseFile, ParseTableEntry **T){
    
    FILE *fileptr = fopen(testcaseFile,"r");
    top_of_stack = -1;
    //pushing $ symbol to the stack
    SymbolNode dollar;
    dollar.next = NULL;
    dollar.tag = 0;
    dollar.type.terminal = $;
    push(Stack,dollar);
    // pushing start Symbol to the symbol
    SymbolNode startSymbol;
    startSymbol.next = NULL;
    startSymbol.tag = 1;
    startSymbol.type.terminal = program;
    push(Stack,startSymbol);

    //create a parse tree 
    ParseTree parse_tree = createParseTree();
    ParseTreeNode *curr_top_node = parse_tree.root;     //this is the pointer to the parse-tree node that's currently on top of stack
    
    TokenDetails *tkn = (TokenDetails*)malloc(sizeof(TokenDetails));
	tkn = getNextToken(fileptr);
	
    while(1)
    {
		//1
        if(tkn == NULL){        //i/p tokens stream finished. terminate parsing
			if((Stack[top_of_stack].type.terminal==$ && Stack[top_of_stack].tag==0) || Stack[top_of_stack].tag==0)		
	            return parse_tree;
			else {				//this means nonterminal(s) is/are still left in stack when input has finished. This means now check if that this/these nonterminal(s) can produce epsilon
				while(!(Stack[top_of_stack].type.terminal==$ && Stack[top_of_stack].tag==0)){		//till all nonterminals are not popped out, try to apply null productions
					SymbolNode *tempEpsilon =(SymbolNode *)malloc(sizeof(SymbolNode));	//temp epislon node
	                tempEpsilon->type.terminal = EPSILON;
	                tempEpsilon->tag = 0;
                	tempEpsilon->next = NULL;			
					if(searchForSymbol(FirstFollowSetsOfAll.first[Stack[top_of_stack].type.nonterminal].start, tempEpsilon)==true){
						//pop nonterminal from stack
						top_of_stack--;
                        //(a) add epsilon as child of curr_top_node
                        ParseTreeNode *eps = createParseTreeNode(*tempEpsilon);     
                        TokenDetails *tok = (TokenDetails*)malloc(sizeof(TokenDetails));
						tok->is_err=false;
                        tok->is_num=false;
                        strcpy(tok->token,"EPSILON");
                        tok->line_no = -1;
                        tok->lexeme = (char *)malloc(sizeof(char)*20);
                        strcpy(tok->lexeme,"----");
						tok->error=NULL;
                        eps->tkn = tok;
                        eps->parent = curr_top_node;
                        curr_top_node->startChild = eps;
						
                        //add rule number of production used to curr_top_node->rule_no
                        int p;
                        for(p=0; p<NO_OF_GRAMMAR_RULES; p++){
                            if(G.rules[p].lhs != curr_top_node->node.type.nonterminal)  //if lhs is not curr nonterminal
                                continue;
                            if(G.rules[p].rhs.start->type.terminal == EPSILON){
                                curr_top_node->rule_no = p;
                                break;
                            }
                        }

                        //(b) update curr_top_node
                        ParseTreeNode *traverse = curr_top_node;
                        while(traverse != parse_tree.root){
                            if(traverse->rightSibling != NULL){
                                curr_top_node = traverse->rightSibling;
                                break;
                            }
                            else {
                                traverse = traverse->parent;
                                continue;
                            }
                        }
                    }
					else
						return parse_tree;
				}
				//exited while loop succesfully. return parse tree
				return parse_tree;
			}
        }
        if(tkn->is_err == true){    //discard token and display lexical error
				printf("\nLine %d: Lexical Error. Invalid Token \"%s\"",tkn->line_no, tkn->lexeme);
            	tkn = getNextToken(fileptr);
            	continue;
        }
		if(strcmp(tkn->token, "COMMENTMARK")==0){	//if i/p token is a commentmark, just ignore it
			tkn = getNextToken(fileptr);
			continue;
		}

        if(Stack[top_of_stack].tag == 0 && Stack[top_of_stack].type.terminal == $){ //reached top of stack. terminate parsing
            while(tkn != NULL){
				is_parsetree_valid =0;
				printf("\nLine %d: Syntactic Error. Unexpected token \"%s\"",tkn->line_no, tkn->token);
                tkn = getNextToken(fileptr);
                while(tkn->is_err==true){
                    tkn = getNextToken(fileptr);
                    if(tkn==NULL)
                        break;
                }
            }
            return parse_tree;
        }
             
		if(Stack[top_of_stack].tag == 0) {      //if the top of stack contains a terminal 
            if(findTerminal(tkn->token) == Stack[top_of_stack].type.terminal){      // input terminal matches with top of stack 
                top_of_stack--;
                TokenDetails *tok = (TokenDetails*)malloc(sizeof(TokenDetails));
                *tok = *tkn;
                curr_top_node->tkn = tok ;
                tkn = getNextToken(fileptr);

				//now update curr_top_node
                ParseTreeNode *traverse = curr_top_node;                  
                while(traverse != parse_tree.root){
                    if(traverse->rightSibling == NULL){ //if right sibling doesnt exist, traverse to parent
                        traverse = traverse->parent;
                        continue;
                    }
                    else {          //right sibling exists, assign currtopnode to it
                        curr_top_node = traverse->rightSibling;
                        break;
                    }//id+(id*id+id+)id
                    // id+(id+)id
                }
                if(traverse == parse_tree.root){
                        printf("\nParsing finished");
                        while(tkn != NULL){
							is_parsetree_valid =0;
							printf("\nLine %d: Syntactic Error. Unexpected token \"%s\"",tkn->line_no, tkn->token);
                            tkn = getNextToken(fileptr);
                            while(tkn->is_err==true){
                                tkn = getNextToken(fileptr);
                                if(tkn==NULL)
                                break;
                            }
                        }
                }
                continue;    
            }  
            else {          //input terminal doesn;t match with top of stack terminal
				//isExpected=true. i.e., popped out terminal was an 'expected' token
				is_parsetree_valid =0;
				printf("\nLine %d: Syntactic Error. Expected token \"%s\"",tkn->line_no, terminalMap[Stack[top_of_stack].type.terminal]);
                top_of_stack--;
                continue;               
            }
        }
        else {       //if the top of stack contains a non-terminal
            //first make a SymbolNode* element of input token? needed?
            //SymbolNode *nextToken = (SymbolNode*)malloc(sizeof(SymbolNode));
            //nextToken->tag=0;
            // nextToken->next=NULL;
            // nextToken->type.terminal = findTerminal(tkn->token);
            
            //find the rule value from parsetable's entry corresponding to current input token(terminal) and current top of stack(nonterminal) 
            int curr_rule = T[Stack[top_of_stack].type.nonterminal][findTerminal(tkn->token)].rule_no;
            
            //if the input token has a cell containing a rule in parsetable corresponding to the non-terminal on top of stack
            //then pop the nonterminal(lhs of the rule) from stack, and push it's rhs in reverse order
            if(curr_rule != -1 && curr_rule != -2){   // rule is correct
                Rule currRule = G.rules[curr_rule];
                SymbolNode *tempEpsilon =(SymbolNode *)malloc(sizeof(SymbolNode));
                tempEpsilon->type.terminal = EPSILON;
                tempEpsilon->tag = 0;
                tempEpsilon->next = NULL;
                if(currRule.rhs.len == 1 && searchForSymbol(currRule.rhs.start, tempEpsilon))
                {
                    //this means the production rule we are using is a NULL PRODUCTION
                    //the curr_top_node needs to be updated accordingly
                    //1. Update Stack - just pop the nonterminal from stack (because it's a null production)
                    top_of_stack--;

                    //2. Populate Parse Tree and update curr_top_node.
                    //2(a) add epsilon as child of curr_top_node
                    ParseTreeNode *eps = createParseTreeNode(*tempEpsilon);     
                    TokenDetails *tok = (TokenDetails*)malloc(sizeof(TokenDetails));
					tok->is_err=false;
                    tok->is_num =false;
                    strcpy(tok->token,"EPSILON");
                    tok->line_no = -1;
                    tok->lexeme = (char *)malloc(sizeof(char)*20);
                    strcpy(tok->lexeme,"----");
					tok->error=NULL;
                    eps->tkn = tok;
                    eps->parent = curr_top_node;
                    curr_top_node->startChild = eps;
                    curr_top_node->rule_no = curr_rule;

                    //2(b) update curr_top_node
                    ParseTreeNode *traverse = curr_top_node;
                    while(traverse != parse_tree.root){
                        if(traverse->rightSibling != NULL){
                            curr_top_node = traverse->rightSibling;
                            break;
                        }
                        else {
                            traverse = traverse->parent;
                            continue;
                        }
                    }
                    if(traverse == parse_tree.root){
                        printf("\nParsing finished");
                        while(tkn != NULL){
							is_parsetree_valid =0;
							printf("\nLine %d: Syntactic Error. Unexpected token \"%s\"",tkn->line_no, tkn->token);
                            tkn = getNextToken(fileptr);
                        }
                    }
                    continue;   //continue reading next token (move to next iteration)
                }
                // when rule is not a null production
                //pop element from stack
                top_of_stack--;
                curr_top_node->rule_no = curr_rule;
                int x=0;
                SymbolNode temparr[15];
                SymbolNode *temp = currRule.rhs.start;
                while(temp != NULL){    //we need to store the linkedlist in reverse order (for pushing onto stack)
                    temparr[x] = *temp;  
                    temp = temp->next;                  
                    x++;
                }
                int j;

                //1. Update Stack. Push elements in revrse order
                for(j=x-1; j>=0; j--){
                    if(temparr[j].tag==0 && temparr[j].type.terminal==EPSILON)
                        continue;
                    push(Stack, temparr[j]);
                }

                //2. Populate ParseTree
				ParseTreeNode *currLHS = curr_top_node;
                ParseTreeNode *traverseSiblings = curr_top_node;
                for(j=0;j<x;j++){
                    ParseTreeNode *child = createParseTreeNode(temparr[j]);
                    //TokenDetails tok;
                    //*child->tkn = tok;
                    if(j==0){
                        child->parent = curr_top_node;
                        currLHS->startChild = child;
                        curr_top_node = child;
                        traverseSiblings = child;
                    }
                    else
                    {
                        traverseSiblings->rightSibling = child;
                        child->parent = currLHS;
                        traverseSiblings = child;
                    }
                }
            }

            /*if the input token has a cell containing -1 corresponding to non-terminal on top of stack
            then perform ERROR RECOVERY.*/
            else if(curr_rule == -1){
                //int curr_rule = T[Stack[top_of_stack].type.nonterminal][findTerminal(tkn->token)].rule_no;
                while(curr_rule == -1){
					//isExpected=true
					is_parsetree_valid =0;
					SymbolNode *temp = (SymbolNode*)malloc(sizeof(SymbolNode));
					temp = FirstFollowSetsOfAll.first[Stack[top_of_stack].type.nonterminal].start;
					printf("\nLine %d: Syntactic Error. Incompatible Token %s. Expected one of these tokens - ",tkn->line_no, tkn->token);
					while(temp != NULL){
						printf("%s, ",terminalMap[temp->type.terminal]);
						temp = temp->next;
					}
                    tkn = getNextToken(fileptr);
                    curr_rule = T[Stack[top_of_stack].type.nonterminal][findTerminal(tkn->token)].rule_no;
                }

                if(curr_rule == -2){        //we hit a terminal which lies in follow set. then DISCARD the nonterminal on stack
                    top_of_stack--;
                }
                else {                      //we hit a terminal which lies in first set. continue with next iteration
                    continue;
                }
            }
            else                        //we hit a syn cell. just pop the nonterminal from stack   
            {
                top_of_stack--;   
            }
        }
    }
}
/* This function takes a parsetree PT and outFile as input and prints PT onto the output file
    -see details on nalanda notice : Interface details*/
void printParseTree(ParseTree PT, char *outFile){
	//remove(outFile);
	FILE *f = fopen(outFile, "w");	
	printInorder(PT.root, f);
	fclose(f);
    return;
}

/*This function prints the inorder traversal of a tree rooted at ParseTreeNode *node */
void printInorder(ParseTreeNode* curr, FILE *f) 
{ 
    
	if (curr == NULL) 
        return; 
    ParseTreeNode *temp = (ParseTreeNode*)malloc(sizeof(ParseTreeNode));

	//1. Print Leftmost Child	//2
	printInorder(curr->startChild, f);

	//2. Print Parent			//3
	fprintf(f, "\n");
	if(curr->startChild == NULL){	//if its a leaf node, print lexeme and line number and token and number
		fprintf(f,"%s\t",curr->tkn->lexeme);
		fprintf(f,"%d\t",curr->tkn->line_no);
		fprintf(f,"%s\t",curr->tkn->token);
		fprintf(f," RULE NO !!!! %d\t",curr->rule_no);
		if(curr->tkn->is_num == true)
			fprintf(f,"%f ",curr->tkn->value);
		else
			fprintf(f,"----\t");
	}
	else
	{ 			//if not leaf
		fprintf(f,"---- ---- ---- ---- ");
		fprintf(f,"RULE NO !!! %d\t",curr->rule_no);
	}	
	//print parent node symbol
	if(curr->parent == NULL)	//if root node
		fprintf(f,"ROOT\t");
	else
		fprintf(f,"%s\t", nonTerminalMap[curr->parent->node.type.nonterminal]);

	if(curr->startChild == NULL)
		fprintf(f,"yes\t");
	else
		fprintf(f,"no %s\t", nonTerminalMap[curr->node.type.nonterminal]);

	//3. Print remaining right siblings	//4
	
	if(curr->startChild == NULL)
		return;
	temp = curr->startChild->rightSibling;
	while(temp != NULL){
		printInorder(temp,f);
		temp = temp->rightSibling;
	}
} 





