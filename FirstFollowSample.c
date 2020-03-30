//Jai Mata Di
//Jai Shree Ram
//Jai Bhole

#include <stdio.h>

/*
1. E → TX
2. X → +TX 
3. X-> ε
4. T → FY
5. Y → *FY
6. Y → ε 
7. F → (E) | id
*/

/*
FIRST(E) = FIRST(T) = FIRST(F) = {(, id}

FIRST(X) = {+, ε}

FIRST(Y) = {*, ε}

FOLLOW(E) = {),$}
FOLLOW(T) = {+,),$}
FOLLOW(X) = {),$}
FOLLOW(Y) = {+,),$}
FOLLOW(F) = {*,+,),$}
*/

typedef enum NonTerminal {
    E,
    X,
    T,
    Y,
    F
}NonTerminal;

typedef enum Terminal{ 
    PLUS,
    EPSILON,
    STAR,
    BO,
    BC,
    ID,
    $
}Terminal;


void initializeParseTable(ParseTableEntry **T ,int row_no)
{
    int i;
    for(i=0;i<NO_OF_TERMINALS;i++)
    {
        T[row_no][i].rule_no = -1;
    }
}



typedef union{
    Terminal terminal;
    NonTerminal nonterminal;
}SymbolType;

//strucure for denoting a symbol.
typedef struct SymbolNode{
    SymbolType type;        //denotes type of the symbol (either non-terminal or terminal) -> usage of tagged union
    int tag;                //denotes tag for the tagged union representation of SymbolType. 0 -> Terminal, 1 -> NonTerminal
    SymbolNode *next;       //next pointer to next SymbolNode in a linkedlist
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
    SymbolNodesList first[53];      /*array of :- list(set) of symbols(with tag 0 => terminals) in the first set of a non-terminal 
                                eg: first[moduleDeclaration] would mean first[2], which would denote a linkedlist(set) of all terminals in first(moduleDeclaration)*/
    SymbolNodesList follow[53];     //array of :- list(set) of symbols(with tag 0 => terminals) in the follow set of a non-terminal
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



    /*FOLLOW(E) = {),$}
FOLLOW(T) = {+,),$}
FOLLOW(X) = {),$}
FOLLOW(Y) = {+,),$}
FOLLOW(F) = {*,+,),$}
*/
}
