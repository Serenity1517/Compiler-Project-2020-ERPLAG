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
#include <string.h>
#define sc startChild
#define rs rightSibling       
  
//(enum NodeType)int to char* map for astNodes
char *astNodeMap[] = {
    "ProgramNode",
    "ModuleNode",
    "InputParamNode",
    "OutputParamNode",
    "TypeNode",
    "ArrayTypeNode",
    "RangeNode",
    "ForLoopNode",
    "WhileLoopNode",
    "InputIONode",
    "OutputIONode",
    "ArrayIdNode",
    "AssignmentNode",
    "FunctionCallNode",
    "OpNode",
    "DeclareNode",
    "ConditionalNode",
    "CaseNode",
    "NumNode",
    "BoolNode",
    "IdNode",
    "NullNode"
};

ASTNode* AST;   //Pointer to the root of the Abstract Syntax Tree

/*This function creates an ASTNode*/
ASTNode* createASTNode(NodeType type){
    ASTNode *node = (ASTNode*)malloc(sizeof(ASTNode));
    node->type = type;
    node->parent = NULL;
    node->rightSibling = NULL;
    node->startChild = NULL;
    node->next = NULL;
    return node;
}

/*utility function*/

ASTNode* getAST()
{
	return AST;
}

/*This function traverses parse tree and creates AST*/
void createAST(ParseTreeNode *node){
    
    //the below case will never occur though, given the way in which switch case is written
    //if node is a leaf node, do nothing and just return because there is no rule being applied on a leaf node
    if(node->sc == NULL)
        return;
    int rno = node->rule_no;
    rno += 1;     //because grammar object's rules array is indexed starting from 0
    switch(rno){
        //<program> --> <moduleDeclarations><otherModules><driverModule><otherModules%>
 		case 1: {
            createAST(node->sc);
            createAST(node->sc->rs);
            createAST(node->sc->rs->rs);
            createAST(node->sc->rs->rs->rs);
            ASTNode *curr = createASTNode(programNode);
            ParseTreeNode *temp = node->sc;
            curr->sc = node->sc->syn;
            curr->sc->rs = node->sc->rs->syn;
            curr->sc->rs->rs = node->sc->rs->rs->syn;
            curr->sc->rs->rs->rs = node->sc->rs->rs->rs->syn;

            ASTNode *traverse = curr->sc;
            
            //curr->sc me moduleDeclarations ki linkedlist ka head he (if list is nonempty)
            //if list is empty, curr->sc is a nullNode
            //1.update moduleDeclaration list's parent pointers
            if(traverse->type == nullNode){
                traverse->parent = curr;
            }
            else{
                while(traverse != NULL) {
                traverse->parent = curr;
                traverse = traverse->next;
                }
            }
            

            //2.update otherModules list's parent pointers
            traverse = curr->sc->rs;
            if(traverse->type == nullNode){
                traverse->parent = curr;
            }
            else{
                while(traverse != NULL) {
                traverse->parent = curr;
                traverse = traverse->next;
                }
            }

            //3.update otherModules% list's parent pointers
            traverse = curr->sc->rs->rs->rs;
            if(traverse->type == nullNode){
                traverse->parent = curr;
            }
            else{
                while(traverse != NULL) {
                traverse->parent = curr;
                traverse = traverse->next;
                }
            }

            //4. update driverModule's parent pointers
            //driverModule will give moduleNode
            curr->sc->rs->rs->parent =  curr;
			
            node->syn = curr;
            
            free(node->sc->rs->rs->rs);
            free(node->sc->rs->rs);
            free(node->sc->rs);
            free(node->sc);  
            break;
        }  

        //<moduleDeclaration> --> DECLARE MODULE ID SEMICOL
		case 4: {
            ASTNode *curr = createASTNode(idNode);
            curr->node.idnode.line_no = node->sc->rs->rs->tkn->line_no;
            strcpy(curr->node.idnode.lexeme,node->sc->rs->rs->tkn->lexeme);
            strcpy(curr->node.idnode.token,node->sc->rs->rs->tkn->token);
            node->syn = curr;
            free(node->sc->rs->rs->rs);
            free(node->sc->rs->rs);
            free(node->sc->rs);
            free(node->sc);
            break;
        }

        //<driverModule> --> DRIVERDEF DRIVER PROGRAM DRIVERENDDEF <moduleDef>
		case 7: {
            createAST(node->sc->rs->rs->rs->rs);
            ASTNode *curr = createASTNode(moduleNode);
            curr->sc = createASTNode(nullNode);
            curr->sc->parent = curr;
            curr->sc->rs = createASTNode(nullNode);
            curr->sc->rs->parent = curr;
            curr->sc->rs->rs = createASTNode(nullNode);
            curr->sc->rs->rs->parent = curr;
            
            curr->sc->rs->rs->rs = node->sc->rs->rs->rs->rs->syn;
            
            ASTNode* traverse = curr->sc->rs->rs->rs;
            if(traverse->type == nullNode){
                traverse->parent = curr;
            }
            else{
                while(traverse != NULL) {

                traverse->parent = curr;
                traverse = traverse->next;
                }
            }
            
            node->syn = curr;
            free(node->sc->rs->rs->rs);
            free(node->sc->rs->rs);
            free(node->sc->rs);
            free(node->sc);
            break;
        }
        
        //<module> --> DEF MODULE ID ENDDEF TAKES INPUT SQBO <input_plist> SQBC SEMICOL <ret><moduleDef>
		case 8: {
            ASTNode *curr = createASTNode(moduleNode);
            curr->sc = createASTNode(idNode);
            strcpy(curr->sc->node.idnode.token,node->sc->rs->rs->tkn->token);
            strcpy(curr->sc->node.idnode.lexeme,node->sc->rs->rs->tkn->lexeme);
            curr->sc->node.idnode.line_no=node->sc->rs->rs->tkn->line_no;
            curr->sc->parent = curr;

            //compute <input_plist>.syn and update parent pointers
            //of all inputparamnodes present in it
            createAST(node->sc->rs->rs->rs->rs->rs->rs->rs);
            curr->sc->rs = node->sc->rs->rs->rs->rs->rs->rs->rs->syn;
            ASTNode *traverse = curr->sc->rs;
            while(traverse != NULL) {
                traverse->parent = curr;
                traverse = traverse->next;
            }

            //compute <ret>.syn and update parent pointers of all
            //outputparamnodes present in it
            createAST(node->sc->rs->rs->rs->rs->rs->rs->rs->rs->rs->rs); 
            curr->sc->rs->rs = node->sc->rs->rs->rs->rs->rs->rs->rs->rs->rs->rs->syn;
            traverse = curr->sc->rs->rs;
            while(traverse != NULL) {
                traverse->parent = curr;
                traverse = traverse->next;
            }

            //compute <moduleDef>.syn
            createAST(node->sc->rs->rs->rs->rs->rs->rs->rs->rs->rs->rs->rs);//<moduleDef>
            curr->sc->rs->rs->rs = node->sc->rs->rs->rs->rs->rs->rs->rs->rs->rs->rs->rs->syn;
            //update all parents for list (of statements) obtained from <moduleDef>.syn
            traverse = curr->sc->rs->rs->rs;
            if(traverse->type == nullNode)
                traverse->parent = curr;
            else {
                while(traverse != NULL){
                    traverse->parent = curr;
                    traverse = traverse->next;
                }
            }
            
            node->syn = curr;
            free(node->sc->rs->rs->rs->rs->rs->rs->rs->rs->rs->rs->rs);
            free(node->sc->rs->rs->rs->rs->rs->rs->rs->rs->rs->rs);
            free(node->sc->rs->rs->rs->rs->rs->rs->rs->rs->rs);
            free(node->sc->rs->rs->rs->rs->rs->rs->rs->rs);
            free(node->sc->rs->rs->rs->rs->rs->rs->rs);
            free(node->sc->rs->rs->rs->rs->rs->rs);
            free(node->sc->rs->rs->rs->rs->rs);
            free(node->sc->rs->rs->rs->rs);
            free(node->sc->rs->rs->rs);
            free(node->sc->rs->rs);
            free(node->sc->rs);
            free(node->sc);
            break;
        }

        //<ret> --> RETURNS SQBO <output_plist> SQBC SEMICOL
        case 9:{
            createAST(node->sc->rs->rs);
            node->syn = node->sc->rs->rs->syn;
            free(node->sc->rs->rs->rs->rs);
            free(node->sc->rs->rs->rs);
            free(node->sc->rs->rs);
            free(node->sc->rs);
            free(node->sc);
            break;
        }

        //<Default> --> DEFAULT COLON <statements> BREAK SEMICOL
		case 101: {
            ASTNode* curr = createASTNode(caseNode);
            curr->node.caseNode.line = node->sc->tkn->line_no;
            node->sc->rs->rs->inh = NULL;
            createAST(node->sc->rs->rs);
            curr->sc = node->sc->rs->rs->syn;
            curr->sc->parent = curr;
            curr->sc->rs = NULL;
            node->syn = curr;
            free(node->sc->rs->rs->rs->rs);
            free(node->sc->rs->rs->rs);
            free(node->sc->rs->rs);
            free(node->sc->rs);
            free(node->sc); 
            break;   
        }

        // Rule of type A->xyBC
		case 11: {
            ASTNode *temp = createASTNode(inputParamNode);
            temp->sc = createASTNode(idNode);
            strcpy(temp->sc->node.idnode.lexeme,node->sc->tkn->lexeme);
            strcpy(temp->sc->node.idnode.token,node->sc->tkn->token);
            temp->sc->node.idnode.line_no=node->sc->tkn->line_no;
            temp->sc->parent = temp;

            //compute <dataType>.syn
            createAST(node->sc->rs->rs);
            temp->sc->rs = node->sc->rs->rs->syn;
            temp->sc->rs->parent = temp;
            
            node->sc->rs->rs->rs->inh = temp;
            //compute <N1>.syn
            createAST(node->sc->rs->rs->rs);
            node->syn = node->sc->rs->rs->rs->syn;

            free(node->sc->rs->rs->rs);
            free(node->sc->rs->rs);
            free(node->sc->rs);
            free(node->sc);
            break;
        }
        
        //contains right recursion: A->xyzBA
        case 12: {  
            ASTNode *temp = createASTNode(inputParamNode);
            temp->sc = createASTNode(idNode);
            strcpy(temp->sc->node.idnode.token,node->sc->rs->tkn->token);
            strcpy(temp->sc->node.idnode.lexeme,node->sc->rs->tkn->lexeme);
            temp->sc->node.idnode.line_no=node->sc->rs->tkn->line_no;
            createAST(node->sc->rs->rs->rs);
            temp->sc->rs = node->sc->rs->rs->rs->syn;
            node->sc->rs->rs->rs->rs->inh = temp;
            createAST(node->sc->rs->rs->rs->rs);
            if(node->inh != NULL){
                //insertAtbeginning
                node->inh->next = node->sc->rs->rs->rs->rs->syn;
                //propogate syn
                node->syn = node->inh;
            }
            else {
                node->syn = node->sc->rs->rs->rs->rs->syn;
            }

            //free
            free(node->sc->rs->rs->rs->rs);
            free(node->sc->rs->rs->rs);
            free(node->sc->rs->rs);
            free(node->sc->rs);
            free(node->sc);
            break;
        } 
         
        //Rule of type A->xyBC 
        case 14: {
            ASTNode *temp = createASTNode(outputParamNode);
            temp->node.outputParamNode.isAssigned = false;
            temp->sc = createASTNode(idNode);
            strcpy(temp->sc->node.idnode.lexeme, node->sc->tkn->lexeme);
            strcpy(temp->sc->node.idnode.token,node->sc->tkn->token);
            temp->sc->node.idnode.line_no=node->sc->tkn->line_no;
            temp->sc->parent = temp;

            //compute <type>.syn
            createAST(node->sc->rs->rs);
            temp->sc->rs = node->sc->rs->rs->syn;
            temp->sc->rs->parent = temp;
            
            node->sc->rs->rs->rs->inh = temp;
            //compute <N1>.syn
            createAST(node->sc->rs->rs->rs);
            node->syn = node->sc->rs->rs->rs->syn;

            free(node->sc->rs->rs->rs);
            free(node->sc->rs->rs);
            free(node->sc->rs);
            free(node->sc);
            break;
        }

        //<N2> --> COMMA ID COLON <type><N2>
        case 15: {
            ASTNode *temp = createASTNode(outputParamNode);
            temp->node.outputParamNode.isAssigned = false;
            temp->sc = createASTNode(idNode);
            strcpy(temp->sc->node.idnode.token,node->sc->rs->tkn->token);
            strcpy(temp->sc->node.idnode.lexeme,node->sc->rs->tkn->lexeme);
            temp->sc->node.idnode.line_no=node->sc->rs->tkn->line_no;
            createAST(node->sc->rs->rs->rs);
            temp->sc->rs = node->sc->rs->rs->rs->syn;
            node->sc->rs->rs->rs->rs->inh = temp;
            createAST(node->sc->rs->rs->rs->rs);
            if(node->inh != NULL){
                //insertAtbeginning
                node->inh->next = node->sc->rs->rs->rs->rs->syn;
                //propogate syn
                node->syn = node->inh;
            }
            else {
                node->syn = node->sc->rs->rs->rs->rs->syn;
            }

            //free
            free(node->sc->rs->rs->rs->rs);
            free(node->sc->rs->rs->rs);
            free(node->sc->rs->rs);
            free(node->sc->rs);
            free(node->sc);
            break;
        }

       // Rules of type  A->pqBrsE           
		case 17: {
            createAST(node->sc->rs->rs);
            createAST(node->sc->rs->rs->rs->rs->rs);
            ASTNode *curr = createASTNode(arrayTypeNode);
            curr->sc = node->sc->rs->rs->syn;
            curr->sc->parent =curr;
            curr->sc->rs = node->sc->rs->rs->rs->rs->rs->syn;
            curr->sc->rs->parent = curr;
            node->syn =curr;
            free(node->sc->rs->rs->rs->rs->rs);
            free(node->sc->rs->rs->rs->rs);
            free(node->sc->rs->rs->rs);
            free(node->sc->rs->rs);
            free(node->sc->rs);
            free(node->sc);
            break;
        }

        // Rules of the type  A->ByC 
		case 21: {
            createAST(node->sc);
            createAST(node->sc->rs->rs);
            ASTNode *curr = createASTNode(rangeNode);
            curr->sc = node->sc->syn;
            curr->sc->parent =  curr;
            curr->sc->rs = node->sc->rs->rs->syn;
            curr->sc->rs->parent = curr;
            node->syn =curr;
            free(node->sc->rs->rs);
            free(node->sc->rs);
            free(node->sc);
            break;
        }

        //<moduleDef> --> START <statements> END
        case 25: {
            node->sc->rs->inh = NULL;
            createAST(node->sc->rs);
            node->syn = node->sc->rs->syn;
            free(node->sc->rs->rs);
            free(node->sc->rs);
            free(node->sc);
            break;
        }

        // Rules of the type  A-> pqrsBtuCv
		case 33: {
            ASTNode *temp = createASTNode(idNode);
            strcpy(temp->node.idnode.lexeme,node->sc->rs->rs->tkn->lexeme);
            strcpy(temp->node.idnode.token,node->sc->rs->rs->tkn->token);
            temp->node.idnode.line_no=node->sc->rs->rs->tkn->line_no;
            createAST(node->sc->rs->rs->rs->rs);    //<range>
            node->sc->rs->rs->rs->rs->rs->rs->rs->inh = NULL;   //set statements.inh = null
            createAST(node->sc->rs->rs->rs->rs->rs->rs->rs);   //<statements>

            ASTNode *curr = createASTNode(forLoopNode);
            //set block's start and end line numbers
            curr->node.forLoopNode.block.start = node->sc->rs->rs->rs->rs->rs->rs->tkn->line_no;
            curr->node.forLoopNode.block.end = node->sc->rs->rs->rs->rs->rs->rs->rs->rs->tkn->line_no;
            
            //add ID.tkn and update its parent
            curr->sc = temp;
            curr->sc->parent = curr;
            //add <range>.syn and update its parent
            curr->sc->rs = node->sc->rs->rs->rs->rs->syn;
            curr->sc->rs->parent = curr;
            //add <statements>.syn and update parents of all statements in linkedlist
            curr->sc->rs->rs = node->sc->rs->rs->rs->rs->rs->rs->rs->syn;
            ASTNode *traverse = curr->sc->rs->rs;
            if(traverse->type == nullNode)
                traverse->parent = curr;
            else {
                while(traverse != NULL) {
                    traverse->parent = curr;
                    traverse = traverse->next;
                }
            }
            
            //set lhs.syn
            node->syn =curr;

            free(node->sc->rs->rs->rs->rs->rs->rs->rs->rs);
            free(node->sc->rs->rs->rs->rs->rs->rs->rs);
            free(node->sc->rs->rs->rs->rs->rs->rs);
            free(node->sc->rs->rs->rs->rs->rs);
            free(node->sc->rs->rs->rs->rs);
            free(node->sc->rs->rs->rs);
            free(node->sc->rs->rs);
            free(node->sc->rs);
            free(node->sc);
            break;
        }

        //Rule of type A->pqBrsCt 
		case 34: {
            createAST(node->sc->rs->rs);    //<arithOrBoolExpr>.syn
            node->sc->rs->rs->rs->rs->rs->inh = NULL;   //set statements.inh = null
            createAST(node->sc->rs->rs->rs->rs->rs);    //<statements>.syn

            ASTNode *curr = createASTNode(whileLoopNode);
            //set block's start and end line numbers
            curr->node.whileLoopNode.block.start = node->sc->rs->rs->rs->rs->tkn->line_no;
            curr->node.whileLoopNode.block.end = node->sc->rs->rs->rs->rs->rs->rs->tkn->line_no;

            //add <arithOrBoolExpr>.syn and update its parent
            curr->sc = node->sc->rs->rs->syn;
            curr->sc->parent = curr;
            //add <statements>.syn and update parents of all statements
            //in linked list of <statements>.syn
            curr->sc->rs = node->sc->rs->rs->rs->rs->rs->syn;
            ASTNode *traverse = curr->sc->rs;
            if(traverse->type == nullNode){
                traverse->parent = curr;
            }
            else{
                while(traverse != NULL) {
                    traverse->parent = curr;
                    traverse = traverse->next;
                }
            }
            //set lhs.syn    
            node->syn = curr;

            free(node->sc->rs->rs->rs->rs->rs->rs);
            free(node->sc->rs->rs->rs->rs->rs);
            free(node->sc->rs->rs->rs->rs);
            free(node->sc->rs->rs->rs);
            free(node->sc->rs->rs);
            free(node->sc->rs);
            free(node->sc);
            break;
        }
      
        //<ioStmt> --> GET_VALUE BO ID BC SEMICOL
		case 35: {
            // create idnode
            ASTNode *curr = createASTNode(idNode);
            strcpy(curr->node.idnode.lexeme,node->sc->rs->rs->tkn->lexeme);
            strcpy(curr->node.idnode.token,node->sc->rs->rs->tkn->token);
            curr->node.idnode.line_no=node->sc->rs->rs->tkn->line_no;
            // create inputIONode and assign idnode
            ASTNode *temp = createASTNode(inputIONode);
            temp->sc = curr;
            temp->sc->parent = temp;
            // set lhs.syn
            node->syn = temp;
            free(node->sc->rs->rs->rs->rs);  
            free(node->sc->rs->rs->rs);  
            free(node->sc->rs->rs);  
            free(node->sc->rs);
            free(node->sc);  
            break;
        }
        
        //<ioStmt> --> PRINT BO <var> BC SEMICOL
        case 36: {
            createAST(node->sc->rs->rs);
            ASTNode *curr = createASTNode(outputIONode);
            curr->sc = node->sc->rs->rs->syn;
            curr->sc->parent = curr;
            //set lhs.syn
            node->syn = curr; 
            free(node->sc->rs->rs->rs->rs);
            free(node->sc->rs->rs->rs);
            free(node->sc->rs->rs);
            free(node->sc->rs);
            free(node->sc);
            break;
        }

        // Rules of the type A->xBz
		case 39: {
            createAST(node->sc->rs);
            ASTNode *curr = createASTNode(arrayIdNode);
            curr->sc = node->inh;
            curr->sc->parent =  curr;
            curr->sc->rs = node->sc->rs->syn;
            curr->sc->rs->parent = curr;
            // set lhs.syn
            node->syn  = curr;
            //free
            free(node->sc->rs->rs);
            free(node->sc->rs);
            free(node->sc);
            break;
        }
        
        //<assignmentStmt> --> ID <whichStmt>
        //<idList> --> ID <N3>
        //<var_id_num> --> ID <whichId>
		case 43:
        case 53:
        case 78: {
            // creating idnode
            ASTNode *temp = createASTNode(idNode);
            strcpy(temp->node.idnode.lexeme,node->sc->tkn->lexeme);
            strcpy(temp->node.idnode.lexeme,node->sc->tkn->lexeme);
            temp->node.idnode.line_no=node->sc->tkn->line_no;     
            //setting <whichStmt>.inh = idnode
            node->sc->rs->inh = temp;

            createAST(node->sc->rs);
            node->syn = node->sc->rs->syn;
            free(node->sc->rs);
            free(node->sc);
            break;
        }
        
        //<whichStmt> --> <lvalueIDStmt>
		case 44: {
            // for <whichStmt> --> <lvalueIDStmt>
            node->sc->inh  = node->inh;
            createAST(node->sc);
            // set lhs.syn
            node->syn = node->sc->syn;
            free(node->sc);
            break;
        }

        //<whichStmt> --> <lvalueARRStmt>
		case 45: {
            // for <whichStmt> --> <lvalueARRStmt>
            node->sc->inh  = node->inh;
            createAST(node->sc);
            // set lhs.syn
            node->syn = node->sc->syn;
            free(node->sc);
            break;
        }

        //<lvalueIDStmt> --> ASSIGNOP <expression> SEMICOL
		case 46: {
            // for <lvalueIDStmt> --> ASSIGNOP <expression> SEMICOL
            createAST(node->sc->rs);
            // assignOpNode created 
            ASTNode *curr =  createASTNode(assignmentNode);
            // assigning children of assignNode 
            curr->sc = node->inh;
            curr->sc->parent =  curr;
            curr->sc->rs = node->sc->rs->syn;
            curr->sc->rs->parent = curr;

            //set lhs.syn
            node->syn =curr;
            //freeeee
            free(node->sc->rs->rs); 
            free(node->sc->rs);
            free(node->sc);
            break;
        }
        
        //<lvalueARRStmt> --> SQBO <Index> SQBC ASSIGNOP <expression> SEMICOL
		case 47: {
            //<lvalueARRStmt> --> SQBO <Index> SQBC ASSIGNOP <expression> SEMICOL
            // calc <Index>
            createAST(node->sc->rs);
            // calc <expression>
            createAST(node->sc->rs->rs->rs->rs);
            //creating arrayIdNode
            ASTNode *temp = createASTNode(arrayIdNode);
            temp->sc =node->inh;
            temp->sc->parent = temp;
            temp->sc->rs = node->sc->rs->syn;
            temp->sc->rs->parent = temp;

            // creating assignmentNode 
            ASTNode *curr =  createASTNode(assignmentNode);
            curr->sc = temp;
            curr->sc->parent = curr;
            curr->sc->rs = node->sc->rs->rs->rs->rs->syn;
            curr->sc->rs->parent = curr;
            
            //set lhs.syn
            node->syn =  curr;

            //free
            free(node->sc->rs->rs->rs->rs->rs);
            free(node->sc->rs->rs->rs->rs);
            free(node->sc->rs->rs->rs);
            free(node->sc->rs->rs);
            free(node->sc->rs);
            free(node->sc);
            break;
        }

        //<Index> --> ID
		case 49: {
            //creating idnode
            ASTNode *temp = createASTNode(idNode);
            strcpy(temp->node.idnode.lexeme,node->sc->tkn->lexeme);
            strcpy(temp->node.idnode.lexeme,node->sc->tkn->lexeme);
            temp->node.idnode.line_no=node->sc->tkn->line_no;
            //set lhs.syn
            node->syn = temp;
            //
            free(node->sc);
            break;
        }
        
        //<moduleReuseStmt> --> <optional> USE MODULE ID WITH PARAMETERS <idList> SEMICOL
		case 50: {
            node->sc->inh = NULL;
            //compute <optional>.syn
            createAST(node->sc);
    
            ASTNode *curr = createASTNode(functionCallNode);
            
            //add optional.syn as first child, and also update parents
            //because optional.syn contains linked list of idnodes
            curr->sc = node->sc->syn;
            ASTNode *traverse = curr->sc;
            if(traverse->type == nullNode){
                traverse->parent = curr;
            }
            else{
                while(traverse != NULL) {
                traverse->parent = curr;
                traverse = traverse->next;
                }
            }
            
            //create and add idnode as second child of curr
            ASTNode *temp = createASTNode(idNode);
            strcpy(temp->node.idnode.lexeme,node->sc->rs->rs->rs->tkn->lexeme);
            strcpy(temp->node.idnode.lexeme,node->sc->rs->rs->rs->tkn->lexeme);
            temp->node.idnode.line_no=node->sc->rs->rs->rs->tkn->line_no;
            curr->sc->rs = temp;
            curr->sc->rs->parent = curr;
            
            //compute idlist.syn
            createAST(node->sc->rs->rs->rs->rs->rs->rs);
            //add idList.syn as third child and also update
            //parent pointers of all idnodes in linkedlist
            curr->sc->rs->rs = node->sc->rs->rs->rs->rs->rs->rs->syn;
            traverse = curr->sc->rs->rs;
            while(traverse != NULL) {
                traverse->parent = curr;
                traverse = traverse->next;
            }

            //set lhs.syn
            node->syn = curr;

            //free
            free(node->sc->rs->rs->rs->rs->rs->rs->rs);
            free(node->sc->rs->rs->rs->rs->rs->rs);
            free(node->sc->rs->rs->rs->rs->rs);
            free(node->sc->rs->rs->rs->rs);
            free(node->sc->rs->rs->rs);
            free(node->sc->rs->rs);
            free(node->sc->rs);
            free(node->sc);
            break;
        }

        //<optional> --> SQBO <idList> SQBC ASSIGNOP
		case 51:{
            //lhs.syn = rhs.syn
            createAST(node->sc->rs);
            node->syn = node->sc->rs->syn;
            free(node->sc->rs->rs->rs);
            free(node->sc->rs->rs);
            free(node->sc->rs);
            free(node->sc);
            break;
        }

        //<N3> --> COMMA ID <N3>
		case 54:{
            ASTNode *temp =  createASTNode(idNode);
            strcpy(temp->node.idnode.token,node->sc->rs->tkn->token); 
            strcpy(temp->node.idnode.lexeme,node->sc->rs->tkn->lexeme); 
            temp->node.idnode.line_no = node->sc->rs->tkn->line_no;
            node->sc->rs->rs->inh = temp;
            // to make list 
            createAST(node->sc->rs->rs);
            if(node->inh != NULL) {
                //insertAtBeginning
                node->inh->next = node->sc->rs->rs->syn;
                node->syn  = node->inh;
            }
            else {
                node->syn = node->sc->rs->rs->syn;
            }
            
            //free
            free(node->sc->rs->rs);
            free(node->sc->rs);
            free(node->sc);
            break;
        }
        
        //<U> --> <op1> <new_NT>
		case 58: { 
            createAST(node->sc);
            createAST(node->sc->rs);
            // adding children to already created opNode and OpNode is present in node->sc->syn
            node->sc->syn->sc = node->sc->rs->syn;
            node->sc->syn->sc->parent = node->sc->syn;
            node->sc->syn->sc->rs = createASTNode(nullNode);
            // set lhs.syn = opnode
            node->syn = node->sc->syn;
            //freeee
            free(node->sc->rs);
            free(node->sc);
            break;
        }

        //<arithOrBoolExpr> --> <AnyTerm><N7>
        //<AnyTerm> --> <arithmeticExpr> <N8>
        //<arithmeticExpr> --> <term><N4>
        //<term> --> <factor><N5>
        case 61:
		case 64: 
        case 70:
        case 73: {
            //compute <AnyTerm>.syn
            createAST(node->sc);
            node->sc->rs->inh = node->sc->syn;
            //compute <N7>.syn
            createAST(node->sc->rs);
            node->syn = node->sc->rs->syn;
            //free
            free(node->sc->rs);
            free(node->sc);
            break;
        }

        //<N7> --> <logicalOp><AnyTerm><N7%>       
        //<N4> --> <op1><term><N4> 
        //<N5> --> <op2><factor><N5>
		case 62: 
		case 71:
        case 74: {
            //compute logicalOp.syn
            createAST(node->sc); 
            //compute anyterm.syn
            createAST(node->sc->rs);
            //populate children of logicalop.syn and set parents
            node->sc->syn->sc = node->inh;
            node->sc->syn->sc->parent = node->sc->syn;
            node->sc->syn->sc->rs = node->sc->rs->syn;
            node->sc->syn->sc->rs->parent = node->sc->syn;
            
            //set <N7%>.inh
            node->sc->rs->rs->inh = node->sc->syn;
            //compute <N7%>.syn
            createAST(node->sc->rs->rs);
            //set lhs.syn
            node->syn = node->sc->rs->rs->syn;
            //free
            free(node->sc->rs->rs);
            free(node->sc->rs);
            free(node->sc);
            break;
        }

        //<N8> --> <relationalOp> <arithmeticExpr>
		case 68: {
            //compute relationalop.syn
            createAST(node->sc);
            //compute <arithmeticExpr>.syn
            createAST(node->sc->rs);
            //populate children of relationalop.syn
            node->sc->syn->sc = node->inh;
            node->sc->syn->sc->parent = node->sc->syn;
            node->sc->syn->sc->rs = node->sc->rs->syn;
            node->sc->syn->sc->rs->parent = node->sc->syn;

            //set lhs.syn
            node->syn = node->sc->syn;
            //free
            free(node->sc->rs);
            free(node->sc);
            break;
        }

        //<declareStmt> --> DECLARE <idList> COLON <dataType> SEMICOL
		case 93: {
            //compute <idList>.syn and <dataType>.syn
            createAST(node->sc->rs);
            createAST(node->sc->rs->rs->rs);
            
            //populate children of new node and set parents
            ASTNode *curr = createASTNode(declareNode);
            curr->sc = node->sc->rs->syn;
            curr->sc->parent = curr;
            curr->sc->rs = node->sc->rs->rs->rs->syn;
            curr->sc->rs->parent = curr;
            // setting parent pointers of idList
            ASTNode *traverse = curr->sc;
            while(traverse != NULL) {
                traverse->parent = curr;
                traverse = traverse ->next;
            }     
		
	    node->syn = curr;

            //free  
            free(node->sc->rs->rs->rs->rs);
            free(node->sc->rs->rs->rs);
            free(node->sc->rs->rs);
            free(node->sc->rs);
            free(node->sc);
            break;     
        }

        //rule of type A->pq(ID)rsBCt
        //B is a list of CaseNodes, so update parents 
        //C is a list of statements, update parents
		case 94: {
            ASTNode *curr = createASTNode(conditionalNode);
            ASTNode *temp = createASTNode(idNode);

            //set the block's start and end line numbers
            curr->node.conditionalNode.block.start = node->sc->rs->rs->rs->rs->tkn->line_no;
            curr->node.conditionalNode.block.end = node->sc->rs->rs->rs->rs->rs->rs->rs->tkn->line_no;
            
            strcpy(temp->node.idnode.lexeme,node->sc->rs->rs->tkn->lexeme);
            strcpy(temp->node.idnode.lexeme,node->sc->rs->rs->tkn->lexeme);
            temp->node.idnode.line_no=node->sc->rs->rs->tkn->line_no; 
            
            //add ID as first child
            curr->sc = temp;
            curr->sc->parent = curr;

            //compute caseStmts.syn and update parent nodes of all casenodes
            createAST(node->sc->rs->rs->rs->rs->rs);
            curr->sc->rs = node->sc->rs->rs->rs->rs->rs->syn;
            ASTNode *traverse = curr->sc->rs;
            while(traverse != NULL){
                traverse->parent = curr;
                traverse = traverse->next;
            }

            //compute Default.syn and update parent nodes
            createAST(node->sc->rs->rs->rs->rs->rs->rs);
            curr->sc->rs->rs = node->sc->rs->rs->rs->rs->rs->rs->syn;
            traverse = curr->sc->rs->rs;
            if(traverse->type == nullNode)  //if its an empty list of statements
                traverse->parent = curr;
            else {
                while(traverse != NULL){
                    traverse->parent = curr;
                    traverse = traverse->next;
                }
            }
            

            //set lhs.syn
            node->syn = curr;

            //free
            free(node->sc->rs->rs->rs->rs->rs->rs->rs);
            free(node->sc->rs->rs->rs->rs->rs->rs);
            free(node->sc->rs->rs->rs->rs->rs);
            free(node->sc->rs->rs->rs->rs);
            free(node->sc->rs->rs->rs);
            free(node->sc->rs->rs);
            free(node->sc->rs);
            free(node->sc);
            break;
        }

        //rule of type A -> pBqCrsT
        //C(<statements>) is a list, so update parents
        //T is expanded by right recursion in case 96
		case 95: {
            ASTNode *temp = createASTNode(caseNode);
            temp->node.caseNode.line = node->sc->tkn->line_no;
            //compute <value>.syn
            createAST(node->sc->rs);
            temp->sc = node->sc->rs->syn;
            temp->sc->parent = temp;
            
            //compute <statements>.syn and update its parents
            node->sc->rs->rs->rs->inh = NULL;
            createAST(node->sc->rs->rs->rs);
            temp->sc->rs = node->sc->rs->rs->rs->syn; 
            ASTNode *traverse = temp->sc->rs;
            if(traverse->type == nullNode)
                traverse->parent = temp;
            else {
                while(traverse != NULL){
                    traverse->parent = temp;
                    traverse = traverse->next;
                }
            }
                

            node->sc->rs->rs->rs->rs->rs->rs->inh = temp;
            //compute <N9>
            createAST(node->sc->rs->rs->rs->rs->rs->rs);
            node->syn = node->sc->rs->rs->rs->rs->rs->rs->syn;
        
            //free
            free(node->sc->rs->rs->rs->rs->rs->rs);
            free(node->sc->rs->rs->rs->rs->rs);
            free(node->sc->rs->rs->rs->rs);
            free(node->sc->rs->rs->rs);
            free(node->sc->rs->rs);
            free(node->sc->rs);
            free(node->sc);
            break;
        }

        //right recursion of type A->pBqCrsA
        //C is a linkedlist of statements, so update parents
		case 96: {
            ASTNode *temp = createASTNode(caseNode);
            temp->node.caseNode.line = node->sc->tkn->line_no;
            //compute <value>.syn
            createAST(node->sc->rs);
            temp->sc = node->sc->rs->syn;
            temp->sc->parent = temp;

            //compute <statements>.syn and update parent pointers
            node->sc->rs->rs->rs->inh = NULL;
            createAST(node->sc->rs->rs->rs);
            temp->sc->rs = node->sc->rs->rs->rs->syn;
            ASTNode *traverse = temp->sc->rs;
            if(traverse->type == nullNode){
                traverse->parent = temp;
            }
            else{
                while(traverse != NULL) {
                traverse->parent = temp;
                traverse = traverse->next;
                }
            }
            
            //set <N9%>.inh
            node->sc->rs->rs->rs->rs->rs->rs->inh = temp;
            //compute <N9%>.syn
            createAST(node->sc->rs->rs->rs->rs->rs->rs);
            //insertATbeginning 
            node->inh->next = node->sc->rs->rs->rs->rs->rs->rs->syn;
            
            //set lhs.syn
            node->syn = node->inh;
            
            //free
            free(node->sc->rs->rs->rs->rs->rs->rs);
            free(node->sc->rs->rs->rs->rs->rs);
            free(node->sc->rs->rs->rs->rs);
            free(node->sc->rs->rs->rs);
            free(node->sc->rs->rs);
            free(node->sc->rs);
            free(node->sc);
            break;
        }
        
        //<range> --> NUM RANGEOP NUM%
		case 103: {
            ASTNode *temp1 = createASTNode(numNode);
            strcpy(temp1->node.numNode.lexeme, node->sc->tkn->lexeme);
            strcpy(temp1->node.numNode.token, node->sc->tkn->token);
            temp1->node.numNode.line_no = node->sc->tkn->line_no;
            temp1->node.numNode.value = node->sc->tkn->value;
            ASTNode *temp2 = createASTNode(numNode);
            strcpy(temp2->node.numNode.lexeme, node->sc->rs->rs->tkn->lexeme);
            strcpy(temp2->node.numNode.token, node->sc->rs->rs->tkn->token);
            temp2->node.numNode.line_no = node->sc->rs->rs->tkn->line_no;
            temp2->node.numNode.value = node->sc->rs->rs->tkn->value;

            ASTNode *curr = createASTNode(rangeNode);
            curr->sc = temp1;
            curr->sc->parent = curr;
            curr->sc->rs = temp2;
            curr->sc->rs->parent = curr;
            
            node->syn = curr;

            free(node->sc->rs->rs);
            free(node->sc->rs);
            free(node->sc);
            break;
        }

        //right recursion of type A->BA'
		case 2:
		case 5:
		case 26: {
            //compute B.syn
            createAST(node->sc);
            //set A'.inh
            node->sc->rs->inh = node->sc->syn;
            //compute A'.syn
            createAST(node->sc->rs);

            //insertatbeginning
            if(node->inh != NULL) {
                node->inh->next = node->sc->rs->syn;
                node->syn = node->inh;
            }
            else {   //when we have reached topmost A 
                //we now have the entire list in "A'.syn", i.e. "node->sc->rs->syn"
                node->syn = node->sc->rs->syn;
            }
            break;
        }

        //Rules of type A->xBy
		case 59:
		case 76: {
            createAST(node->sc->rs);
            node->syn =  node->sc->rs->syn;
            free(node->sc->rs->rs);
            free(node->sc->rs);
            free(node->sc);
            break;
        }
        
        //typeNode productions
        case 18:
		case 19:
		case 20:        
        case 22:
		case 23:
		case 24: {
            ASTNode *curr = createASTNode(typeNode);
            strcpy(curr->node.typeNode.lexeme, node->sc->tkn->lexeme);
            strcpy(curr->node.typeNode.token, node->sc->tkn->token);
            curr->node.typeNode.line_no = node->sc->tkn->line_no;
            node->syn = curr;
            free(node->sc);
            break;
        }
        
        //just set lhs.syn = rhs.syn
        case 28:
		case 29:
		case 30:
		case 31:
		case 32:
        case 37:
		case 38:
        case 41:
		case 42:
		case 56:
		case 57:
		case 60: 
		case 65:
		case 77: {
            createAST(node->sc);
            node->syn = node->sc->syn;
            free(node->sc);
            break;
        }

        //opNode productions
        case 81:
		case 82:
		case 83:
		case 84:
		case 85:
		case 86:
		case 87:
		case 88:
		case 89:
		case 90:
		case 91:
		case 92: {
            ASTNode *curr = createASTNode(opNode);
            strcpy(curr->node.opNode.lexeme, node->sc->tkn->lexeme);
            strcpy(curr->node.opNode.token, node->sc->tkn->token);
            curr->node.opNode.line_no = node->sc->tkn->line_no;
            node->syn = curr;
            free(node->sc);
            break;
        }
        // TRUE AND TRUE AND TRUE
        //numNode (leaf) productions
		case 48:
		case 79:
		case 80:
		case 98: {
            ASTNode *curr = createASTNode(numNode);
            strcpy(curr->node.numNode.lexeme, node->sc->tkn->lexeme);
            strcpy(curr->node.numNode.token, node->sc->tkn->token);
            curr->node.numNode.line_no = node->sc->tkn->line_no;
            curr->node.numNode.value = node->sc->tkn->value;
            node->syn = curr;
            free(node->sc);
            break;
        }

        //boolNode (leaf) productions
        case 66:
        case 67:
		case 99:
		case 100: {
            ASTNode *curr = createASTNode(boolNode);
            strcpy(curr->node.boolNode.lexeme, node->sc->tkn->lexeme);
            strcpy(curr->node.boolNode.token, node->sc->tkn->token);
            curr->node.boolNode.line_no = node->sc->tkn->line_no;
            node->syn = curr;
            free(node->sc);
            break;
        }

        //null productions (set syn = inh)      
		case 3:
		case 6:
        case 13:
		case 16:
		case 27:
		case 40:
		case 52:
		case 55:
		case 63:
		case 69:
		case 72:
		case 75:
		case 97: {
			if(node->inh == NULL)   //empty list. only possible in case 3,6,27,52
                node->syn = createASTNode(nullNode);
            else
                node->syn = node->inh;
            free(node->sc);
            break;
        }

        //null productions (set syn = nullNode)
		case 10:
		case 102: {
            node->syn = createASTNode(nullNode);
            free(node->sc);
            break;
        }
    }


    //*******************************************************************************//
    //In the end, syn attribute for <program> will contain the pointer to root of AST.
    if(node->node.type.nonterminal == (NonTerminal)program) {
        AST = node->syn;
        printAST(AST);
    }
}



// inorder traversal of AST
void printAST(ASTNode *root)
{
    if(root == NULL)
        return;
    //1.Print first child
    printAST(root->sc);

    //2. Print Node
    printf("%s\n",astNodeMap[root->type]);
    ASTNode* n = root->next;
    while(n!=NULL){
	printf("->%s",astNodeMap[n->type]);
	n = n->next;
    }
    
    //3. Print rest of the children
    if(root->sc == NULL)
        return;
    
	ASTNode *temp = root->sc->rs;
	while(temp != NULL)
	{
	    printAST(temp);
		temp = temp->rs;
	}
	//printf("%s\n",astNodeMap[temp->type]);
}
