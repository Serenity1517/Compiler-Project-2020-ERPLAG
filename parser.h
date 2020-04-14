//Jai Mata Di
//Jai Shree Ram
//Jai Bhole

/*
 * Group no. 50
 * Aniruddha Mahajan -------- 2017A7PS0145P
 * Ravindra Singh Shekhawat - 2017A7PS0146P
 * Shreyas Srikrishna ------- 2017A7PS0162P
 * Chetan Sharma ------------ 2017A7PS0182P
 */
#ifndef parser
#define parser

#include "parserDef.h"

//Main Required Functions 
void ComputeFirstAndFollowSets(Grammar G);
void createParseTable(FirstAndFollow F);
ParseTree parseInputSourceCode(char *testcaseFile, ParseTableEntry **T);
void printParseTree(ParseTree PT, char *outFile);


//Some Utility Functions
bool searchForSymbol(SymbolNode *start, SymbolNode *symbol);
void removeEpsilonFromList(SymbolNodesList *list);
int findNonTerminal(char *arr);
int findTerminal(char *arr);
void populateRHS(Rule *rl, char *buff, int i);
Grammar initializeGrammar(Grammar G);
int populateGrammarWithRules(char *grammarFile);
SymbolNodesList concatList(SymbolNodesList list1, SymbolNodesList list2);
SymbolNodesList findFirst(SymbolNodesList rhs);
SymbolNodesList findFollow(SymbolNode *node);
void initializeParseTable();
void push(SymbolNode *st,SymbolNode nd);
ParseTreeNode *createParseTreeNode(SymbolNode sym);
ParseTree createParseTree();
void printInorder(ParseTreeNode* curr, FILE *f);
void testAST(char *inputFile, char *parseTreeOutFile);
int getParseTreeNode();

//For debugging
void testFirstFollow();
char *mapTerminal(int i);
char *mapNonTerminal(int i);
void printGrammarRules();
void printList(SymbolNodesList L);
void printFirstFollow();
void testParseTable();
void testParseTree(char *inputFile, char *parseTreeOutFile);

#endif     

