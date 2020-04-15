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

int main (int argc,char **argv)
{
    int option;
	clock_t begin, end;
	double total_CPU_time,total_CPU_time_in_seconds;
	//printf("%s %s %s", argv[0], argv[1], argv[2]);
    while(1){
		printf("Please Select Option\n");
		printf("***********************\n");
		printf("1. Press 1 to check for removal of comments.  \n");
		printf("2. Press 2 to print the list of tokens on the console. \n");
		printf("3. Press 3 to parse the input file. \n");
		printf("4. Press 4 to find the time taken for parsing the input. \n");
		printf("5. Press 5 to find AST. \n");
		printf("6. Press 6 to test symboltable. \n");
		printf("7. Press 7 to test semantic analyzer.\n");
        printf("8. Press 8 to generate assembly code\n");
		printf("9. Press 0 for exit. \n");
		printf("\n");    
		scanf("%d", &option);
        switch(option){
 			case 0: printf("Exiting!\n");
					return 0;

            case 1: removeComments(argv[1]);
					printf("Please check file named removedComments.txt for output\n`");
					//printOnConsole();                    
					return 0;

            case 2: testLexer(argv[1]);
                    return 0;

            case 3: testParseTree(argv[1], argv[2]);
                    return 0;

            case 4: begin =clock();
                    //double total_CPU_time, total_CPU_time_in_seconds;
                   
                    testParseTree(argv[1], argv[2]);		//during parsing, lexical analyzer will be used. So the total time taken would be for lexical+syntactical analysis
                    end = clock();
                    total_CPU_time  =  (double) (end - begin);
                    total_CPU_time_in_seconds =   total_CPU_time / CLOCKS_PER_SEC;
					printf("\n total_CPU_time = %f Total_CPU_time_in_seconds = %f\n\n",total_CPU_time,total_CPU_time_in_seconds);
                    return 0;

            case 5: testAST(argv[1],argv[2]);
                    return 0;
            case 6:	{
            		testAST(argv[1],argv[2]);
            		//checkSymbolTable();
            		//SymbolTable* tabble = getsymbolTable();
            		return 0;
            }
			case 7: {
				testAST(argv[1],argv[2]);
				semanticAnalyzer();
				SymbolTable* s = getsymbolTable();
				ListOfErrors* semanticErrors = getSemanticErrorObject();
				int compressionR =  getCompressionRatio();
				printf("Compression Ratio: %d\n",compressionR);
				return 0;
			}
			case 8:{
				testAST(argv[1], argv[2]);
				semanticAnalyzer();
				//codeGenControl(getAST(), getsymbolTable(), argv[3]);
			}
            		
        }
    }
    return 0;
}


