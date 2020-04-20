all: compiler

compiler: lexer.c parser.c driver.c ast.c symboltable.c typeExtractor.c semantic.c offsetComputer.c functionCheck.c codeGeneration.c
	gcc lexer.c parser.c driver.c ast.c symboltable.c typeExtractor.c semantic.c offsetComputer.c functionCheck.c codeGeneration.c -lm -o compiler
clean:
	rm -rf *o compiler
