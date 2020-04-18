/*
 * Group no. 50
 * Aniruddha Mahajan -------- 2017A7PS0145P
 * Ravindra Singh Shekhawat - 2017A7PS0146P
 * Shreyas Srikrishna ------- 2017A7PS0162P
 * Chetan Sharma ------------ 2017A7PS0182P
 */
#include "lexer.h"
#include "parser.h"
#include <time.h>
#include "ast.h"
#include "symboltable.h"
#include "semantic.h"
#include "codeGeneration.h"
#include "offsetComputer.h"

int main (int argc,char **argv)
{
    int option;
	clock_t begin, end;
	double total_CPU_time,total_CPU_time_in_seconds;
	//printf("%s %s %s", argv[0], argv[1], argv[2]);
    while(1){
		printf("Please Select Option\n");
		printf("***********************\n");
		printf("1. Press 1 to test lexer.  \n");
		printf("2. Press 2 to print parse tree. \n");
		printf("3. Press 3 to Print Abstract Syntax Tree (AST). \n");
		printf("4. Press 4 to Find Compression Ratio. \n");
		printf("5. Press 5 to Print Symbol Table. \n");
		printf("6. Press 6 to Print Activation Record Size. \n");
		printf("7. Press 7 to Print Static and Dynamic Arrays.\n");
        printf("8. Press 8 to Check Errors and Total Compilation Time. \n");
		printf("9. Press 9 for Assembly Code Generation. \n");
		printf("10.Press 0 for Exit.\n");
		printf("\n");    
		scanf("%d", &option);
        switch(option){
 			case 0: printf("Exiting!\n");
					return 0;

            case 1: testLexer(argv[1]);
                    return 0;

            case 2: testParseTree(argv[1], argv[2]);
                    return 0;

			case 3: {
					testAST(argv[1],argv[2]);
					ASTNode* root = getAST();
					printAST(root);
					return 0;
			}

			case 4: {
					testAST(argv[1],argv[2]);
					int parseNode = getParseTreeNode();
					int astNodes = getAstNodes();
					printf("Parse Tree Nodes: %d		Memory Used in Parse tree: %ld\n",parseNode,parseNode*sizeof(ParseTreeNode));
					printf("Abstract Syntax Tree Nodes: %d		Memory used in AST: %ld\n",astNodes,parseNode*sizeof(ASTNode));
					int compressionR =  getCompressionRatio();
					printf("Compression Ratio: %d\n",compressionR);
					return 0;
			}
			case 5: {
				testAST(argv[1],argv[2]);
				semanticAnalyzer();
				SymbolTable* s = getsymbolTable();
    			printf("variable_name	scope(module_name)	scope(line_numbers)     width	isArray		static_or_dynamic   range_lexemes    type_of_element    offset  nesting_level\n");
				printSymbolTable(s);
				return 0;
			}

			case 6: {
				testAST(argv[1],argv[2]);
				semanticAnalyzer();
				SymbolTable* s = getsymbolTable();
				printActivationRecord(s);
				return 0;
			}
			case 7: {
				testAST(argv[1],argv[2]);
				semanticAnalyzer();
				SymbolTable* s = getsymbolTable();
				printArrays(s);
				return 0;
			}
			case 8:{begin =clock();
                    //double total_CPU_time, total_CPU_time_in_seconds;
                   	testAST(argv[1],argv[2]);
					semanticAnalyzer();
					ListOfErrors* error = getSemanticErrorObject();
					printErrors(error);
                    end = clock();
                    total_CPU_time  =  (double) (end - begin);
                    total_CPU_time_in_seconds =   total_CPU_time / CLOCKS_PER_SEC;
					printf("\n\n total_CPU_time = %f Total_CPU_time_in_seconds = %f\n\n",total_CPU_time,total_CPU_time_in_seconds);
				
				return 0;
			}
			case 9:{
				testAST(argv[1], argv[2]);
				semanticAnalyzer();
				codeGenControl(getAST(), getsymbolTable(), argv[3]);
				return 0;
			}
            		
        }
    }
    return 0;
}


