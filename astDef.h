/*
 * Group no. 50
 * Aniruddha Mahajan -------- 2017A7PS0145P
 * Ravindra Singh Shekhawat - 2017A7PS0146P
 * Shreyas Srikrishna ------- 2017A7PS0162P
 * Chetan Sharma ------------ 2017A7PS0182P
 */

#ifndef astDef
#define astDef

#define NO_OF_AST_NODE_TYPES 21

#include "lexer.h"    // including previous libraries
#include "typeExtractorDef.h"
//#include "symboltable.h"

typedef enum NodeType{
    programNode,        //blank struct
    moduleNode,         //blank struct
    inputParamNode,     //blank struct
    outputParamNode,    //blank struct
    typeNode,           //INTEGER/REAL/BOOLEAN types  
    arrayTypeNode,      //blank struct    
    rangeNode,          //blank struct   
    forLoopNode,        //blank struct
    whileLoopNode,      //blank struct
    inputIONode,        //blank struct      
    outputIONode,       //blank struct
    arrayIdNode,        //blank struct  
    assignmentNode,     //blank struct
    functionCallNode,   //blank struct
    opNode,             //binary/unary operator (includes relational, arithmetic and boolean expression operators)
    declareNode,        //blank struct
    conditionalNode,    //blank struct
    caseNode,           //blank struct
    numNode,            //NUM/RNUM constants
    boolNode,           //TRUE/FALSE constants
    idNode,             //Identifiers
    nullNode           //Used for NULL Productions
} NodeType;

//Block structure
typedef struct Block{
    int start;
    int end;
}Block;

typedef struct ProgramNode{
    //1st Child : ((empty/nonempty555)list of moduleDeclarations)linkedlist of IdNodes
    //2nd Child : ((empty/nonempty)list of modules)linkedlist of ModuleNodes
    //3rd Child : ModuleNode for Driver Module
    //4th Child : ((empty/nonempty)list of modules)linkedlist of ModuleNodes
}ProgramNode;

typedef struct ModuleNode{
    //1st child : (id representing name of module)IdNode
    //2nd child : ((nonempty)list of input parameters)linkedlist of InputParamNodes
    //3rd child : ((empty/nonempty)list of output parameters)linkedlist of OutputParamNodes
    //4th child : ((empty/nonempty)list of statements of the module)linkedlist of statementNodes (can be any one of the possible statement structures)
    FunctionType* typeOfFunc;
}ModuleNode;

typedef struct InputParamNode{
    //1st child : (Identifier)idNode
    //2nd Child : (Type of Identifier)TypeNode or ArrayTypeNode
}InputParamNode;

typedef struct OutputParamNode{  
    //1st child : (Identifier)IdNode
    //2nd child : (type of above identifier)TypeNode
}OutputParamNode;

typedef struct TypeNode{   // This node stores type constants such as REAL, BOOLEAN, INTEGER etc.
    char token[21];         //contains "INTEGER" or "REAL" or "BOOLEAN"
    char lexeme[21];        //contains the lexeme(might be lowercase)
    int line_no;
}TypeNode;

typedef struct ArrayTypeNode{
    //1st Child : (Range of array)RangeNode
    //2nd Child : (Type of array)TypeNode
}ArrayTypeNode;

typedef struct RangeNode{ 
    //1st child : (start index)NumNode or IdNode
    //2nd child : (end index) NumNode or IdNode
}RangeNode;

typedef struct ForLoopNode {
    //1st child : (Identifier acting as iterator)IdNode
    //2nd child : (Range of above iteartor)RangeNode
    //3rd child : ((empty/nonempty)list of statements inside forloop)linkedlist of statement nodes (can be any type of statement)
    struct Block block;
}ForLoopNode;

typedef struct WhileLoopNode{
    //1st Child : (arithematic or boolean expression)linked list of opnodes
    //2nd Child : ((empty/nonempty)list of statements inside body)linkedlist of statement nodes: can be any one of the possible statement structures 
    struct Block block;
}WhileLoopNode;

typedef struct InputIONode{
    //1st Child : (Identifier into which input is being taken)IdNode
}InputIONode;

typedef struct OutputIONode{
    //1st Child : (The value which is going to be printed) Idnode, NumNode, BoolNode
}OutputIONode;

typedef struct ArrayIdNode{ 
    //1st Child: (identifier representing the array)IdNode
    //2nd Child: (Index of the array)IdNode/NumNode
}ArrayIdNode;

typedef struct AssignmentNode{  //This node stores assignment operator
    //1st Child : (LHS)IdNode/ArrayIdNode
    //2nd Child : (RHS)BoolNode/NumNode/IdNode/OpNode(some nested expression)
}AssignmentNode;

typedef struct FunctionCallNode{
    //1st Child : ((empty/nonempty)list of output variables of module)linkedlist of IdNodes 
    //2nd Child : (Name of function) IdNode
    //3rd Child : ((nonempty)list of input parameters) linkedlist of IdNodes 
}FunctionCallNode;

typedef struct OpNode{   // this node stores arithmetic operators like PLUS, MINS etc
    /*1st child : (nested expression)
    //2nd child : (in case of unary op)NullNode
                    OR
                    (nested expression)*/
    char token[21];
    char lexeme[21];
    int line_no;
    PrimitiveType typeOfExpr;
}OpNode;

typedef struct DeclareNode{
    //1st Child : ((nonempty)list of Declared variables)list of IdNodes
    //2nd Child : (Defines the datatype of variable that is declared)ArrayTypeNode or TypeNode
    Typeof typeOfId;
}DeclareNode;

typedef struct ConditionalNode{
    //1st Child : (Switching Variable) IdNode
    //2nd Child : ((nonempty) list of cases)linkedList of CaseNodes
    //3rd Child : (Default case) CaseNode 
    struct Block block;
}ConditionalNode;

typedef struct CaseNode{
    //1st child : ((empty/nonempty)list of statements in case body)linkedlist of statement nodes (can be any of the possible statements)
    /*2nd child : (case value) NumNode or BoolNode
                    OR
                   (default case) NULL  */ 

}CaseNode;

//NUM/RNUM constants
typedef struct NumNode{ 
    char token[21];        // will help to differentiate between NUM and RNUM
    char lexeme[21];
    int line_no;
    float value;        
}NumNode;

//TRUE/FALSE constants
typedef struct BoolNode{
    char token[21];
    char lexeme[21];
    int line_no;
}BoolNode;

//Identifiers
typedef struct IdNode{
    char token[21];
    char lexeme[21];
    int line_no;
}IdNode;

typedef struct NullNode{
    //No children
}NullNode;

typedef union astNodeType {    // This is union of all types of node present in the AST.
    ProgramNode programNode;
    ModuleNode moduleNode;
    InputParamNode inputParamNode;
    OutputParamNode outputParamNode;
    TypeNode typeNode;
    ArrayTypeNode arrayTypeNode;
    RangeNode rangeNode;
    ForLoopNode forLoopNode;
    WhileLoopNode whileLoopNode;
    InputIONode inputIONode;
    OutputIONode outputIONode;
    ArrayIdNode arrayIdNode;
    AssignmentNode assignmentNode;
    FunctionCallNode functionCallNode;
    OpNode opNode;
    DeclareNode declareNode;
    ConditionalNode conditionalNode;
    CaseNode caseNode;
    NumNode numNode;
    BoolNode boolNode;
    IdNode idnode;
    NullNode nullNode;
}astNodeType;

//Structure for AST tree node. This structure is basically a tagged union.
//need to add addr, code fields for IR generation   
typedef struct ASTNode {            
    union astNodeType node;               //Stores information about the node. It is an tagged union variable.
    enum NodeType type;                  //Tag of tagged union of astNodeType that will differentiate between types of nodes
    struct ASTNode* next;       //will be used in case of linkedlist of ASTNodes
    struct ASTNode* parent;
    struct ASTNode* rightSibling;
    struct ASTNode* startChild;
    struct SymbolTable* scopeTable;        //points to the symbol table where this variable/function is hashed
}ASTNode;

#endif
                
