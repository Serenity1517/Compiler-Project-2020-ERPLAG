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
#ifndef parserdef
#define parserdef

#define NO_OF_GRAMMAR_RULES 103
#define NO_OF_TERMINALS 62 //includes 27 possible tokens obtained from lexer + epsilon + 33 keywords + $
//for debugging
//#define NO_OF_TERMINALS 5
// #define NO_OF_NONTERMINALS 4
// #define NO_OF_GRAMMAR_RULES 5
#define NO_OF_NONTERMINALS 56
#define MAX_STACK_SIZE 300

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include "lexer.h"
#include "astDef.h"

typedef enum NonTerminal {
    program,
	moduleDeclarations,
	moduleDeclaration,
	otherModules,
	driverModule,
	module,
	ret,
	input_plist,
	N1,
	output_plist,
	N2,
	dataType,
	range_arrays,
	type,
	moduleDef,
	statements,
	statement,
	ioStmt,
	var,
	whichId,
	simpleStmt,
	assignmentStmt,
	whichStmt,
	lvalueIDStmt,
	lvalueARRStmt,
	Index,
	moduleReuseStmt,
	idList,
	optional,
	N3,
	expression,
	U,
	new_NT,
	arithOrBoolExpr,
	N7,
	AnyTerm,
	boolConstt,
	N8,
	arithmeticExpr,
	N4,
	term,
	N5,
	factor,
	var_id_num,
	op1,
	op2,
	logicalOp,
	relationalOp,
	declareStmt,
	conditionalStmt,
	caseStmts,
	N9,
	value,
	Default,
	iterative,
	range
}NonTerminal;

typedef enum Terminal{ 
    EPSILON, 
    INTEGER,
    REAL,
    BOOLEAN,
    OF,
    ARRAY,
    START,
    END,
    DECLARE,
    MODULE,
    DRIVER,
    PROGRAM,
    RECORD,
    TAGGED,
    UNION,
    GET_VALUE,
    PRINT,
    USE,
    WITH,
    PARAMETERS,
    TRUE,
    FALSE,
    TAKES,
    INPUT,
    RETURNS,
    AND,
    OR,
    FOR,
    IN,
    SWITCH,
    CASE,
    BREAK,
    DEFAULT,
    WHILE,
    DRIVERDEF,
    DEF,
    LE,
    LT,
    DRIVERENDDEF,
    ENDDEF,
    GE,
    GT,
    COLON,
    NE,
    EQ,
    PLUS,
    MINUS,
    DIV,
    RANGEOP,
    SEMICOL,
    COMMA,
    SQBO,
    SQBC,
    BO,
    BC,
    COMMENTMARK,
    MUL,
    ID,
    NUM,
	ASSIGNOP,
    RNUM,
    $
}Terminal;

//tagged union to denote the type of a symbol - terminal or nonterminal
typedef union{
    Terminal terminal;
    NonTerminal nonterminal;
}SymbolType;

//strucure for denoting a symbol.
typedef struct SymbolNode{
    SymbolType type;        //denotes type of the symbol (either non-terminal or terminal) -> usage of tagged union
    int tag;                //denotes tag for the tagged union representation of SymbolType. 0 -> Terminal, 1 -> NonTerminal
    struct SymbolNode *next;       //next pointer to next SymbolNode in a linkedlist
}SymbolNode;

//structure for denoting linked list of SymbolNodes (used to represent list of terminals/non-terminals occuring on rhs of a grammar rule).
typedef struct SymbolNodesList{
    SymbolNode *start;      //head of the linkedlist of SymbolNodes
    int len;                //length of the linkedlist
}SymbolNodesList;

//structure for denoting a grammar rule
struct Rule{
    NonTerminal lhs;        //non-terminal appearing on lhs of the production rule
    SymbolNodesList rhs;    //linked list of symbols
    //int no_of_rhs;          //number of rhs SymbolNodesLists present for the given lhs non-terminal rule. In above example no_of_rhs = 3   
};
typedef struct Rule Rule;

typedef struct Grammar{
    Rule *rules;            //array of rules. eg:- rules[0] would denote the first rule; rules[94] would denote the last rule(95th rule)
    int no_of_rules;        //number of rules (eg:- consider S -> Ab | BC | Def as 3 rules) 
}Grammar;

//structure that encapsulates first and follow information of all nonterminals in the grammar 
typedef struct FirstAndFollow{
    SymbolNodesList first[NO_OF_NONTERMINALS];      /*array of :- list(set) of symbols(with tag 0 => terminals) in the first set of a non-terminal 
                                eg: first[moduleDeclaration] would mean first[2], which would denote a linkedlist(set) of all terminals in first(moduleDeclaration)*/
    SymbolNodesList follow[NO_OF_NONTERMINALS];     //array of :- list(set) of symbols(with tag 0 => terminals) in the follow set of a non-terminal
}FirstAndFollow;

//structure that defines a cell in the parsing table 
typedef struct ParseTableEntry{
    int rule_no;        /*integer pointer to the rule inside the cell of parse table. -1 if the cell is blank(error)
                          G.rules[rule_no] will give the corresponding rule for this   */
}ParseTableEntry;

/*ParseTableEntry parseTableEntry[NO_OF_NONTERMINALS][NO_OF_TERMINALS];    
write the above line in parser.c */

/*structure that describes a node in the parse tree
NOTE: the struct SymbolNode is used to represent any node in this parse tree. 
        HOWEVER, the (SymbolNode*)SymbolNode.next field is NULL for all the nodes in parse tree
        bcoz this field was intended for use only in case of SymbolNodes linked list, and not in case of parse tree
*/
typedef struct ParseTreeNode{
    SymbolNode node;        //represent the node in a tree
    TokenDetails *tkn;       // stores token corresponding to the terminal (leaf nodes)
    struct ParseTreeNode *parent;     //pointer to the parent SymbolNode of the current SymbolNode. NULL if the current node is root node
    struct ParseTreeNode *startChild; //pointer to the first child of the current SymbolNode. NULL if current node is leaf node
    struct ParseTreeNode *rightSibling; //pointer to the next right sibling of the current SymbolNode. NULL if it's the last child or if it's the only child of the parent node
    int rule_no;                    //stores the rule no. by which current nonterminal is expanded. 
    ASTNode *syn;           //synthesized attribute (used during AST creation)
    ASTNode *inh;           //inherited attribute (used during AST creation)
}ParseTreeNode;
/*structure that describes a parse tree
NOTE : the structrure SymbolNode is used to represent the 
*/
typedef struct ParseTree{
    ParseTreeNode *root;      //root node of parse tree.     
}ParseTree;

#endif
