#include "lexer.h"
#include "parser.h"
#include <ctype.h>
#include <string.h>
#include <math.h>

Grammar G;

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
    "ASSIGNOP",
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
    "RNUM",
    "$"
};

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
    "boolConstt",
    "var_id_num",
    "var",
    "whichId",
    "simpleStmt",
    "assignmentStmt",
    "whichStmt",
    "lvalueIDStmt",
    "lvalueARRStmt",
    "index",
    "moduleReuseStmt",
    "optional",
    "idList",
    "N3",
    "arithmeticOrBooleanExpr",
    "N7",
    "AnyTerm",
    "N8",
    "arithmeticExpr",
    "N4",
    "term",
    "N5",
    "factor",
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
    "iterativeStmt",
    "range"
};

void printGrammarRules(Grammar G) {
    int i;
    remove("testreadgrammar.txt");
    FILE *fout = fopen("testreadgrammar.txt","a");
    for(i=0; i<G.no_of_rules;i++){
        char line_out[100] = {0};
        strcpy(line_out, nonTerminalMap[G.rules[i].lhs]);
        printf("\nline_out=%s$", line_out);
        fprintf(fout, "\nRule number %d\n\tlhs=%s\n\trhs=", i, line_out);
        int k;
        SymbolNode *temp = G.rules[i].rhs.start;
        while(temp != NULL){
            
            if(temp->tag==0){
                fprintf(fout," %s",terminalMap[temp->type.terminal]);
            }
            else
            {
                fprintf(fout," %s",nonTerminalMap[temp->type.nonterminal]);
            }
            temp=temp->next;
        }
        //fprintf("");
        //fputs(line_out, fout);
    }
    return ;
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
}

/* This function recursively populates the RHS portion of the rule
    parameters : rl - Rule pointer
                buff - current input line stored as character array(contains everything except '\n')
                i - pointer to first T/NT
*/
void populateRHS(Rule *rl, char *buff, int i)
{
    printf("\nInside populate rhs. len(buff)=%dparams : i=%d\ti points to %c", strlen(buff),i,buff[i]);//<

    if(i+1>=strlen(buff)) { 
        printf("\nreturned from populate rhs");
        return;}
    while(buff[i]==' ')
        i++; 
    if(buff[i]=='<')   // if rule is non-terminal
    {   
        printf("\nits a nonterminal. i=%d\n",i);
        i++;
        //printf(" i is  %c ",buff[i]);
        char t[30] = {'\0'};
        int j=0;
        while(buff[i]!='>')
        {
            printf("\ni=%d j=%d",i,j);
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
            SymbolNode *temp = rl->rhs.start;
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
        printf("\nits a terminal");
        char t[30]={'\0'};
        int j=0;
        //printf("\n\t\t%d\n",buff[strlen(buff)-1]);
        while(buff[i]!=' ' && i<strlen(buff)-1)
        {
            t[j] = buff[i];
            i++;
            j++;
        }
    printf("\tt=%s$", t);
        if(rl->rhs.start == NULL)           //if current rules has empty rhs
        {
            //printf("\n\tcurrent rule has empty rhs");
            SymbolNode *node =(SymbolNode *)malloc(sizeof(SymbolNode));
            node->next = NULL;
            node->tag = 0;
            node->type.terminal = findTerminal(t);
            printf("\n\tcurrent terminal map number = %d",node->type.terminal);
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
            printf("\n\tcurrent terminal map number = %d",node->type.terminal);
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
        char buff[100] = {'\0'};
        int grammar_rule_iteration=0;
        while (true)
        {
            if(fgets(buff, 100, inFile)==NULL)
                return 1;
            //printf("\nHere1\n");
            //Rule *rl = (Rule*)malloc(sizeof(Rule));
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
            printf("\n\ngrammar rule number : %d\tlhs=%s$", ++grammar_rule_iteration, lhs);

            rl.lhs = findNonTerminal(lhs);
            //printf("\tnonterminalmap=%d", rl->lhs);
            i=i+6;
            
            //reached first symbol on rhs
            populateRHS(&rl,buff,i);  // recusively populates RHS of rule 
            G.no_of_rules += 1;
            G.rules[gram++] = rl;
            printf("\n****\n****\nG.rules[%d].lhs = %d", gram-1,G.rules[gram-1].lhs);
            //need to complete function
        }
    return 0;     
}

int main(){
    populateGrammarWithRules("Grammar.txt");
    printf("no of g rules =%d\n",G.no_of_rules);
    printGrammarRules(G);

    return 0;

}

