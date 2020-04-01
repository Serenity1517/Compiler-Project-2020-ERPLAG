/*
 * Group no. 50
 * Aniruddha Mahajan -------- 2017A7PS0145P
 * Ravindra Singh Shekhawat - 2017A7PS0146P
 * Shreyas Srikrishna ------- 2017A7PS0162P
 * Chetan Sharma ------------ 2017A7PS0182P
 */

#ifndef symboltableDef
#define symboltableDef

#include "lexer.h"
#include "parser.h"
#include "ast.h"
#include "typeExtractorDef.h"

#define SYM_TABLE_SLOTS 20

// Different types of Symbol blocks (which scope/block current table corresponds to)
typedef enum SymbolTableType{
    root,
    functionBlock,
    whileLoopBlock,
    forLoopBlock,
    switchCaseBlock
}SymbolTableType;

// Different types of symbols (types of hashed entries in the table's slots)
typedef enum SymbolForm{
    idEntry,
    driverEntry,
    functionEntry,
    forLoopEntry,
    whileLoopEntry,
    switchCaseEntry
}SymbolForm;

/* Identifier */   
typedef struct IdEntry{
    struct ASTNode* node;        //pointer to corresponding ast node(IdNode)
    int width;          // size of the Identifier NUM has different size than RNUM
    int offset;         // offset calculation field will be assigned in Semantic Analyser Phase
    enum Typeof type;        //type of the identifier
}IdEntry;

/* Driver Module*/
typedef struct DriverEntry{
    int sequenceNumber;     
}DriverEntry;

/*Module*/
typedef struct FunctionEntry{
    //struct ASTNode* node;  //ast node pointer to function's ModuleNode
    char functionName[21];
    struct ASTNode* inputListHead; //ast node pointer to first input parameter node
    struct ASTNode* outputListHead;//ast node pointer to first output parameter node
    int sequenceNumber;
    bool isDeclared;        //true if function prototype exists, false if not
    bool isDefined;         //true if function definition exists, false if not
    struct FunctionType type;      //type (input/output) of the function
}FunctionEntry;

typedef struct ForLoopEntry{
    struct ASTNode* node;  //ast node pointer to forLoop's forLoopNode
}ForLoopEntry;

typedef struct WhileLoopEntry{
    struct ASTNode* node;  //ast node pointer to while loop's whileLoopNode
}WhileLoopEntry;

typedef struct SwitchCaseEntry{
    struct ASTNode* node;  //ast node pointer to switch-case block's ConditionalNode
}SwitchCaseEntry;


//Symbol in the symboltable can be one of the following types of entries :
typedef union Symbol{
    struct IdEntry idEntry;
    struct DriverEntry driverEntry;
    struct FunctionEntry functionEntry; 
    struct ForLoopEntry forLoopEntry;
    struct WhileLoopEntry whileLoopEntry;
    struct SwitchCaseEntry switchCaseEntry;
}Symbol;


/*This struct represents a given symbol table entry. (It itself might be a part of a linkedlist of symboltable entries)
*/
typedef struct SymbolTableEntry{
    struct SymbolTableEntry* next;  //The next symbol table entry in the linkedlist
    union Symbol symbol;           //The symbol present at this entry                  
    enum SymbolForm tag;             //tag for the above union
    struct SymbolTable* table;      //The symboltable corresponding to current entry(which is a functionEntry/driverEntry/block)
}SymbolTableEntry;

//Union for scope
typedef union Scope{
    struct Block block_scope;
    char* scope;
}Scope;

/*This struct represents the actual contents of a symbol table
    Need to add fields in future for codegen and type extraction if needed*/
typedef struct SymbolTable{
    struct SymbolTable* parent; //The parent tree node (the outer scope corresponding to current scope)
    struct SymbolTable* next;   //The next SymbolTableNode at the current level of tree (basically the rightSibling)
    struct SymbolTable* childScope; //basically the child of this table; (inward scoping)

     /*When there is collision, the symboltable entries form a chain (linkedlist) at the slot where they collide. 
     so basically each slot in the table will hold a pointer to the head of the linkedlist of symboltable entries */
    struct SymbolTableEntry* listHeads[SYM_TABLE_SLOTS];

    union Scope scope;

    /*This enumerated variable tells us the type of the block we are currently in
     (whether it is a function or conditional block or iterative block)*/
    enum SymbolTableType tableType;      //This also acts as tag for above union
}SymbolTable;



#endif
