# Compiler-Project-2020-ERPLAG
A highly modular Compiler made for a toy language called ERPLAG as part of course CS F363 : Compiler Construction at BITS Pilani, Pilani Campus.
The specifications for ERPLAG can be found in the language specifications document. 

The compiler takes as input any source code file (of .txt format) and can perform the following:
    Lexical Analysis to generate a stream of tokens.
    Syntax Analyis/Parsing to generate the parse tree for the given code
    Construction of Abstract Syntax Tree, to compress the parse tree by about 70-75%.
    Construction of Symbol Table by traversing the AST.
    Semantic Analysis on the AST to check expression types and other semantics specific to various constructs.
    Code Generation to generate assembly code for the given input code.
 

To run on Linux terminal, type :

> make

> ./compiler <testcase> <output>
    
where <testcase> denotes the relative path of the input source code file (.txt format); eg: codegen_testcases/c5.txt
and <output> denotes the relative path of the output assembly code file (.asm format); eg: code.asm

Upon selecting the option to generate assembly code, a .asm file is generated.
To run the <filename>.asm file on Linux terminal, type:
> nasm -f elf64 <filename>.asm
> gcc -no-pie <filenme>.o -o code
> ./code
