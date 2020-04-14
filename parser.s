	.file	"parser.c"
	.comm	_parseTable, 4, 2
	.comm	_FirstFollowSetsOfAll, 896, 5
	.comm	_G, 8, 2
	.comm	_Stack, 3600, 5
	.globl	_no_of_nodes
	.bss
	.align 4
_no_of_nodes:
	.space 4
	.globl	_is_parsetree_valid
	.data
	.align 4
_is_parsetree_valid:
	.long	1
	.globl	_top_of_stack
	.align 4
_top_of_stack:
	.long	-1
	.globl	_terminalMap
	.section .rdata,"dr"
LC0:
	.ascii "#\0"
LC1:
	.ascii "INTEGER\0"
LC2:
	.ascii "REAL\0"
LC3:
	.ascii "BOOLEAN\0"
LC4:
	.ascii "OF\0"
LC5:
	.ascii "ARRAY\0"
LC6:
	.ascii "START\0"
LC7:
	.ascii "END\0"
LC8:
	.ascii "DECLARE\0"
LC9:
	.ascii "MODULE\0"
LC10:
	.ascii "DRIVER\0"
LC11:
	.ascii "PROGRAM\0"
LC12:
	.ascii "RECORD\0"
LC13:
	.ascii "TAGGED\0"
LC14:
	.ascii "UNION\0"
LC15:
	.ascii "GET_VALUE\0"
LC16:
	.ascii "PRINT\0"
LC17:
	.ascii "USE\0"
LC18:
	.ascii "WITH\0"
LC19:
	.ascii "PARAMETERS\0"
LC20:
	.ascii "TRUE\0"
LC21:
	.ascii "FALSE\0"
LC22:
	.ascii "TAKES\0"
LC23:
	.ascii "INPUT\0"
LC24:
	.ascii "RETURNS\0"
LC25:
	.ascii "AND\0"
LC26:
	.ascii "OR\0"
LC27:
	.ascii "FOR\0"
LC28:
	.ascii "IN\0"
LC29:
	.ascii "SWITCH\0"
LC30:
	.ascii "CASE\0"
LC31:
	.ascii "BREAK\0"
LC32:
	.ascii "DEFAULT\0"
LC33:
	.ascii "WHILE\0"
LC34:
	.ascii "DRIVERDEF\0"
LC35:
	.ascii "DEF\0"
LC36:
	.ascii "LE\0"
LC37:
	.ascii "LT\0"
LC38:
	.ascii "DRIVERENDDEF\0"
LC39:
	.ascii "ENDDEF\0"
LC40:
	.ascii "GE\0"
LC41:
	.ascii "GT\0"
LC42:
	.ascii "COLON\0"
LC43:
	.ascii "NE\0"
LC44:
	.ascii "EQ\0"
LC45:
	.ascii "PLUS\0"
LC46:
	.ascii "MINUS\0"
LC47:
	.ascii "DIV\0"
LC48:
	.ascii "RANGEOP\0"
LC49:
	.ascii "SEMICOL\0"
LC50:
	.ascii "COMMA\0"
LC51:
	.ascii "SQBO\0"
LC52:
	.ascii "SQBC\0"
LC53:
	.ascii "BO\0"
LC54:
	.ascii "BC\0"
LC55:
	.ascii "COMMENTMARK\0"
LC56:
	.ascii "MUL\0"
LC57:
	.ascii "ID\0"
LC58:
	.ascii "NUM\0"
LC59:
	.ascii "ASSIGNOP\0"
LC60:
	.ascii "RNUM\0"
LC61:
	.ascii "$\0"
	.data
	.align 32
_terminalMap:
	.long	LC0
	.long	LC1
	.long	LC2
	.long	LC3
	.long	LC4
	.long	LC5
	.long	LC6
	.long	LC7
	.long	LC8
	.long	LC9
	.long	LC10
	.long	LC11
	.long	LC12
	.long	LC13
	.long	LC14
	.long	LC15
	.long	LC16
	.long	LC17
	.long	LC18
	.long	LC19
	.long	LC20
	.long	LC21
	.long	LC22
	.long	LC23
	.long	LC24
	.long	LC25
	.long	LC26
	.long	LC27
	.long	LC28
	.long	LC29
	.long	LC30
	.long	LC31
	.long	LC32
	.long	LC33
	.long	LC34
	.long	LC35
	.long	LC36
	.long	LC37
	.long	LC38
	.long	LC39
	.long	LC40
	.long	LC41
	.long	LC42
	.long	LC43
	.long	LC44
	.long	LC45
	.long	LC46
	.long	LC47
	.long	LC48
	.long	LC49
	.long	LC50
	.long	LC51
	.long	LC52
	.long	LC53
	.long	LC54
	.long	LC55
	.long	LC56
	.long	LC57
	.long	LC58
	.long	LC59
	.long	LC60
	.long	LC61
	.globl	_nonTerminalMap
	.section .rdata,"dr"
LC62:
	.ascii "program\0"
LC63:
	.ascii "moduleDeclarations\0"
LC64:
	.ascii "moduleDeclaration\0"
LC65:
	.ascii "otherModules\0"
LC66:
	.ascii "driverModule\0"
LC67:
	.ascii "module\0"
LC68:
	.ascii "ret\0"
LC69:
	.ascii "input_plist\0"
LC70:
	.ascii "N1\0"
LC71:
	.ascii "output_plist\0"
LC72:
	.ascii "N2\0"
LC73:
	.ascii "dataType\0"
LC74:
	.ascii "range_arrays\0"
LC75:
	.ascii "type\0"
LC76:
	.ascii "moduleDef\0"
LC77:
	.ascii "statements\0"
LC78:
	.ascii "statement\0"
LC79:
	.ascii "ioStmt\0"
LC80:
	.ascii "var\0"
LC81:
	.ascii "whichId\0"
LC82:
	.ascii "simpleStmt\0"
LC83:
	.ascii "assignmentStmt\0"
LC84:
	.ascii "whichStmt\0"
LC85:
	.ascii "lvalueIDStmt\0"
LC86:
	.ascii "lvalueARRStmt\0"
LC87:
	.ascii "Index\0"
LC88:
	.ascii "moduleReuseStmt\0"
LC89:
	.ascii "idList\0"
LC90:
	.ascii "optional\0"
LC91:
	.ascii "N3\0"
LC92:
	.ascii "expression\0"
LC93:
	.ascii "U\0"
LC94:
	.ascii "new_NT\0"
LC95:
	.ascii "arithOrBoolExpr\0"
LC96:
	.ascii "N7\0"
LC97:
	.ascii "AnyTerm\0"
LC98:
	.ascii "boolConstt\0"
LC99:
	.ascii "N8\0"
LC100:
	.ascii "arithmeticExpr\0"
LC101:
	.ascii "N4\0"
LC102:
	.ascii "term\0"
LC103:
	.ascii "N5\0"
LC104:
	.ascii "factor\0"
LC105:
	.ascii "var_id_num\0"
LC106:
	.ascii "op1\0"
LC107:
	.ascii "op2\0"
LC108:
	.ascii "logicalOp\0"
LC109:
	.ascii "relationalOp\0"
LC110:
	.ascii "declareStmt\0"
LC111:
	.ascii "conditionalStmt\0"
LC112:
	.ascii "caseStmts\0"
LC113:
	.ascii "N9\0"
LC114:
	.ascii "value\0"
LC115:
	.ascii "Default\0"
LC116:
	.ascii "iterative\0"
LC117:
	.ascii "range\0"
	.data
	.align 32
_nonTerminalMap:
	.long	LC62
	.long	LC63
	.long	LC64
	.long	LC65
	.long	LC66
	.long	LC67
	.long	LC68
	.long	LC69
	.long	LC70
	.long	LC71
	.long	LC72
	.long	LC73
	.long	LC74
	.long	LC75
	.long	LC76
	.long	LC77
	.long	LC78
	.long	LC79
	.long	LC80
	.long	LC81
	.long	LC82
	.long	LC83
	.long	LC84
	.long	LC85
	.long	LC86
	.long	LC87
	.long	LC88
	.long	LC89
	.long	LC90
	.long	LC91
	.long	LC92
	.long	LC93
	.long	LC94
	.long	LC95
	.long	LC96
	.long	LC97
	.long	LC98
	.long	LC99
	.long	LC100
	.long	LC101
	.long	LC102
	.long	LC103
	.long	LC104
	.long	LC105
	.long	LC106
	.long	LC107
	.long	LC108
	.long	LC109
	.long	LC110
	.long	LC111
	.long	LC112
	.long	LC113
	.long	LC114
	.long	LC115
	.long	LC116
	.long	LC117
	.text
	.globl	_mapTerminal
	.def	_mapTerminal;	.scl	2;	.type	32;	.endef
_mapTerminal:
LFB18:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	8(%ebp), %eax
	movl	_terminalMap(,%eax,4), %eax
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.globl	_mapNonTerminal
	.def	_mapNonTerminal;	.scl	2;	.type	32;	.endef
_mapNonTerminal:
LFB19:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	8(%ebp), %eax
	movl	_nonTerminalMap(,%eax,4), %eax
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE19:
	.section .rdata,"dr"
LC118:
	.ascii "Grammar.txt\0"
	.text
	.globl	_testFirstFollow
	.def	_testFirstFollow;	.scl	2;	.type	32;	.endef
_testFirstFollow:
LFB20:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	$LC118, (%esp)
	call	_populateGrammarWithRules
	cmpl	$1, %eax
	jne	L7
	call	_printGrammarRules
	movl	_G, %eax
	movl	_G+4, %edx
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	_ComputeFirstAndFollowSets
	call	_printFirstFollow
L7:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE20:
	.globl	_getParseTreeNode
	.def	_getParseTreeNode;	.scl	2;	.type	32;	.endef
_getParseTreeNode:
LFB21:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	_no_of_nodes, %eax
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE21:
	.section .rdata,"dr"
LC119:
	.ascii "testreadgrammar.txt\0"
LC120:
	.ascii "a\0"
LC121:
	.ascii "\12Rule number %d\12\11lhs=%s\12\11rhs=\0"
LC122:
	.ascii " %s\0"
	.text
	.globl	_printGrammarRules
	.def	_printGrammarRules;	.scl	2;	.type	32;	.endef
_printGrammarRules:
LFB22:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	subl	$132, %esp
	.cfi_offset 7, -12
	movl	$LC119, (%esp)
	call	_remove
	movl	$LC120, 4(%esp)
	movl	$LC119, (%esp)
	call	_fopen
	movl	%eax, -20(%ebp)
	movl	$0, -12(%ebp)
	jmp	L11
L16:
	leal	-120(%ebp), %edx
	movl	$0, %eax
	movl	$25, %ecx
	movl	%edx, %edi
	rep stosl
	movl	_G, %ecx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	%ecx, %eax
	movl	(%eax), %eax
	movl	_nonTerminalMap(,%eax,4), %eax
	movl	%eax, 4(%esp)
	leal	-120(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcpy
	leal	-120(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$LC121, 4(%esp)
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_fprintf
	leal	-120(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC121, (%esp)
	call	_printf
	movl	_G, %ecx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	%ecx, %eax
	movl	4(%eax), %eax
	movl	%eax, -16(%ebp)
	jmp	L12
L15:
	movl	-16(%ebp), %eax
	movl	4(%eax), %eax
	testl	%eax, %eax
	jne	L13
	movl	-16(%ebp), %eax
	movl	(%eax), %eax
	movl	_terminalMap(,%eax,4), %eax
	movl	%eax, 4(%esp)
	movl	$LC122, (%esp)
	call	_printf
	jmp	L14
L13:
	movl	-16(%ebp), %eax
	movl	(%eax), %eax
	movl	_nonTerminalMap(,%eax,4), %eax
	movl	%eax, 4(%esp)
	movl	$LC122, (%esp)
	call	_printf
L14:
	movl	-16(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -16(%ebp)
L12:
	cmpl	$0, -16(%ebp)
	jne	L15
	addl	$1, -12(%ebp)
L11:
	movl	_G+4, %eax
	cmpl	-12(%ebp), %eax
	jg	L16
	nop
	addl	$132, %esp
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE22:
	.section .rdata,"dr"
LC123:
	.ascii " %s \0"
	.text
	.globl	_printList
	.def	_printList;	.scl	2;	.type	32;	.endef
_printList:
LFB23:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$12, (%esp)
	call	_malloc
	movl	%eax, -12(%ebp)
	movl	8(%ebp), %eax
	movl	%eax, -12(%ebp)
	movl	$1, -16(%ebp)
	jmp	L19
L22:
	movl	-12(%ebp), %eax
	movl	4(%eax), %eax
	testl	%eax, %eax
	jne	L20
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	_mapTerminal
	movl	%eax, 4(%esp)
	movl	$LC123, (%esp)
	call	_printf
	jmp	L21
L20:
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	_mapNonTerminal
	movl	%eax, 4(%esp)
	movl	$LC123, (%esp)
	call	_printf
L21:
	addl	$1, -16(%ebp)
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -12(%ebp)
L19:
	cmpl	$0, -12(%ebp)
	jne	L22
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE23:
	.section .rdata,"dr"
LC124:
	.ascii "\12%d. First(%s) :\11\0"
LC125:
	.ascii "\12%d. Follow(%s) :\11\0"
	.text
	.globl	_printFirstFollow
	.def	_printFirstFollow;	.scl	2;	.type	32;	.endef
_printFirstFollow:
LFB24:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$0, -12(%ebp)
	jmp	L24
L25:
	movl	-12(%ebp), %eax
	movl	_nonTerminalMap(,%eax,4), %eax
	movl	%eax, 8(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC124, (%esp)
	call	_printf
	movl	-12(%ebp), %eax
	movl	_FirstFollowSetsOfAll+4(,%eax,8), %edx
	movl	_FirstFollowSetsOfAll(,%eax,8), %eax
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	_printList
	addl	$1, -12(%ebp)
L24:
	cmpl	$55, -12(%ebp)
	jle	L25
	movl	$0, -12(%ebp)
	jmp	L26
L27:
	movl	-12(%ebp), %eax
	movl	_nonTerminalMap(,%eax,4), %eax
	movl	%eax, 8(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC125, (%esp)
	call	_printf
	movl	-12(%ebp), %eax
	addl	$56, %eax
	movl	_FirstFollowSetsOfAll+4(,%eax,8), %edx
	movl	_FirstFollowSetsOfAll(,%eax,8), %eax
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	_printList
	addl	$1, -12(%ebp)
L26:
	cmpl	$55, -12(%ebp)
	jle	L27
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE24:
	.globl	_testParseTable
	.def	_testParseTable;	.scl	2;	.type	32;	.endef
_testParseTable:
LFB25:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$908, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	call	_fillKeywordsHashTable
	movl	$LC118, (%esp)
	call	_populateGrammarWithRules
	movl	_G, %eax
	movl	_G+4, %edx
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	_ComputeFirstAndFollowSets
	movl	%esp, %edx
	movl	$_FirstFollowSetsOfAll, %ebx
	movl	$224, %eax
	movl	%edx, %edi
	movl	%ebx, %esi
	movl	%eax, %ecx
	rep movsl
	call	_createParseTable
	nop
	addl	$908, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE25:
	.section .rdata,"dr"
	.align 4
LC126:
	.ascii "\12Due to Syntactical Error, Parse Tree cannot be generated\0"
	.text
	.globl	_testParseTree
	.def	_testParseTree;	.scl	2;	.type	32;	.endef
_testParseTree:
LFB26:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$924, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	call	_fillKeywordsHashTable
	movl	$LC118, (%esp)
	call	_populateGrammarWithRules
	movl	_G, %eax
	movl	_G+4, %edx
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	_ComputeFirstAndFollowSets
	movl	%esp, %edx
	movl	$_FirstFollowSetsOfAll, %ebx
	movl	$224, %eax
	movl	%edx, %edi
	movl	%ebx, %esi
	movl	%eax, %ecx
	rep movsl
	call	_createParseTable
	movl	_parseTable, %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_parseInputSourceCode
	movl	%eax, -28(%ebp)
	movl	_is_parsetree_valid, %eax
	cmpl	$1, %eax
	jne	L30
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	call	_printParseTree
	jmp	L32
L30:
	movl	$LC126, (%esp)
	call	_puts
L32:
	nop
	addl	$924, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE26:
	.globl	_testAST
	.def	_testAST;	.scl	2;	.type	32;	.endef
_testAST:
LFB27:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$924, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	call	_fillKeywordsHashTable
	movl	$LC118, (%esp)
	call	_populateGrammarWithRules
	movl	_G, %eax
	movl	_G+4, %edx
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	_ComputeFirstAndFollowSets
	movl	%esp, %edx
	movl	$_FirstFollowSetsOfAll, %ebx
	movl	$224, %eax
	movl	%edx, %edi
	movl	%ebx, %esi
	movl	%eax, %ecx
	rep movsl
	call	_createParseTable
	movl	_parseTable, %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_parseInputSourceCode
	movl	%eax, -28(%ebp)
	movl	_is_parsetree_valid, %eax
	cmpl	$1, %eax
	jne	L34
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	call	_printParseTree
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	call	_createAST
	jmp	L36
L34:
	movl	$LC126, (%esp)
	call	_puts
L36:
	nop
	addl	$924, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE27:
	.globl	_searchForSymbol
	.def	_searchForSymbol;	.scl	2;	.type	32;	.endef
_searchForSymbol:
LFB28:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$12, (%esp)
	call	_malloc
	movl	%eax, -12(%ebp)
	movl	8(%ebp), %eax
	movl	%eax, -12(%ebp)
	jmp	L38
L43:
	movl	-12(%ebp), %eax
	movl	4(%eax), %eax
	testl	%eax, %eax
	jne	L39
	movl	12(%ebp), %eax
	movl	4(%eax), %eax
	testl	%eax, %eax
	jne	L39
	movl	-12(%ebp), %eax
	movl	(%eax), %edx
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	cmpl	%eax, %edx
	jne	L42
	movl	$1, %eax
	jmp	L41
L39:
	movl	-12(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	$1, %eax
	jne	L42
	movl	12(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	$1, %eax
	jne	L42
	movl	-12(%ebp), %eax
	movl	(%eax), %edx
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	cmpl	%eax, %edx
	jne	L42
	movl	$1, %eax
	jmp	L41
L42:
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -12(%ebp)
L38:
	cmpl	$0, -12(%ebp)
	jne	L43
	movl	$0, %eax
L41:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE28:
	.globl	_removeEpsilonFromList
	.def	_removeEpsilonFromList;	.scl	2;	.type	32;	.endef
_removeEpsilonFromList:
LFB29:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$0, -12(%ebp)
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -16(%ebp)
	jmp	L45
L47:
	movl	-16(%ebp), %eax
	movl	%eax, -12(%ebp)
	movl	-16(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -16(%ebp)
L45:
	movl	-16(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L46
	cmpl	$0, -16(%ebp)
	jne	L47
L46:
	cmpl	$0, -12(%ebp)
	jne	L48
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	8(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, (%eax)
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	leal	-1(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L44
L48:
	movl	-16(%ebp), %eax
	movl	8(%eax), %edx
	movl	-12(%ebp), %eax
	movl	%edx, 8(%eax)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_free
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	leal	-1(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 4(%eax)
	nop
L44:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE29:
	.globl	_findNonTerminal
	.def	_findNonTerminal;	.scl	2;	.type	32;	.endef
_findNonTerminal:
LFB30:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$0, -12(%ebp)
	jmp	L51
L54:
	movl	-12(%ebp), %eax
	movl	_nonTerminalMap(,%eax,4), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L52
	movl	-12(%ebp), %eax
	jmp	L53
L52:
	addl	$1, -12(%ebp)
L51:
	cmpl	$55, -12(%ebp)
	jle	L54
	movl	$-1, %eax
L53:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE30:
	.globl	_findTerminal
	.def	_findTerminal;	.scl	2;	.type	32;	.endef
_findTerminal:
LFB31:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$0, -12(%ebp)
	jmp	L56
L59:
	movl	-12(%ebp), %eax
	movl	_terminalMap(,%eax,4), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L57
	movl	-12(%ebp), %eax
	jmp	L58
L57:
	addl	$1, -12(%ebp)
L56:
	cmpl	$61, -12(%ebp)
	jle	L59
	movl	$-1, %eax
L58:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE31:
	.globl	_populateRHS
	.def	_populateRHS;	.scl	2;	.type	32;	.endef
_populateRHS:
LFB32:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$116, %esp
	.cfi_offset 3, -12
	movl	16(%ebp), %eax
	addl	$1, %eax
	movl	%eax, %ebx
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_strlen
	cmpl	%eax, %ebx
	jnb	L83
	jmp	L63
L64:
	addl	$1, 16(%ebp)
L63:
	movl	16(%ebp), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	cmpb	$32, %al
	je	L64
	movl	16(%ebp), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	cmpb	$60, %al
	jne	L65
	addl	$1, 16(%ebp)
	leal	-70(%ebp), %eax
	movl	$30, %ecx
	movl	$0, %ebx
	movl	%ebx, (%eax)
	movl	%ebx, -4(%eax,%ecx)
	leal	4(%eax), %edx
	andl	$-4, %edx
	subl	%edx, %eax
	addl	%eax, %ecx
	andl	$-4, %ecx
	andl	$-4, %ecx
	movl	$0, %eax
L66:
	movl	%ebx, (%edx,%eax)
	addl	$4, %eax
	cmpl	%ecx, %eax
	jb	L66
	addl	%eax, %edx
	movl	$0, -12(%ebp)
	jmp	L68
L69:
	movl	16(%ebp), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	leal	-70(%ebp), %ecx
	movl	-12(%ebp), %edx
	addl	%ecx, %edx
	movb	%al, (%edx)
	addl	$1, 16(%ebp)
	addl	$1, -12(%ebp)
L68:
	movl	16(%ebp), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	cmpb	$62, %al
	jne	L69
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	testl	%eax, %eax
	jne	L70
	movl	$12, (%esp)
	call	_malloc
	movl	%eax, -28(%ebp)
	movl	-28(%ebp), %eax
	movl	$0, 8(%eax)
	movl	-28(%ebp), %eax
	movl	$1, 4(%eax)
	leal	-70(%ebp), %eax
	movl	%eax, (%esp)
	call	_findNonTerminal
	movl	%eax, %edx
	movl	-28(%ebp), %eax
	movl	%edx, (%eax)
	movl	8(%ebp), %eax
	movl	-28(%ebp), %edx
	movl	%edx, 4(%eax)
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	leal	1(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 8(%eax)
	addl	$1, 16(%ebp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_populateRHS
	jmp	L60
L70:
	movl	$12, (%esp)
	call	_malloc
	movl	%eax, -16(%ebp)
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, -16(%ebp)
	jmp	L72
L73:
	movl	-16(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -16(%ebp)
L72:
	movl	-16(%ebp), %eax
	movl	8(%eax), %eax
	testl	%eax, %eax
	jne	L73
	movl	$12, (%esp)
	call	_malloc
	movl	%eax, -32(%ebp)
	movl	-32(%ebp), %eax
	movl	$0, 8(%eax)
	movl	-32(%ebp), %eax
	movl	$1, 4(%eax)
	leal	-70(%ebp), %eax
	movl	%eax, (%esp)
	call	_findNonTerminal
	movl	%eax, %edx
	movl	-32(%ebp), %eax
	movl	%edx, (%eax)
	movl	-16(%ebp), %eax
	movl	-32(%ebp), %edx
	movl	%edx, 8(%eax)
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	leal	1(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 8(%eax)
	addl	$1, 16(%ebp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_populateRHS
	jmp	L60
L65:
	leal	-100(%ebp), %eax
	movl	$0, %ecx
	movl	$30, %edx
	movl	%edx, %ebx
	andl	$-4, %ebx
	movl	$0, %edx
L74:
	movl	%ecx, -100(%ebp,%edx)
	addl	$4, %edx
	cmpl	%ebx, %edx
	jb	L74
	addl	%edx, %eax
	movw	%cx, (%eax)
	addl	$2, %eax
	movl	$0, -20(%ebp)
	jmp	L76
L78:
	movl	16(%ebp), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	leal	-100(%ebp), %ecx
	movl	-20(%ebp), %edx
	addl	%ecx, %edx
	movb	%al, (%edx)
	addl	$1, 16(%ebp)
	addl	$1, -20(%ebp)
L76:
	movl	16(%ebp), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	cmpb	$32, %al
	je	L77
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_strlen
	leal	-1(%eax), %edx
	movl	16(%ebp), %eax
	cmpl	%eax, %edx
	ja	L78
L77:
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	testl	%eax, %eax
	jne	L79
	movl	$12, (%esp)
	call	_malloc
	movl	%eax, -36(%ebp)
	movl	-36(%ebp), %eax
	movl	$0, 8(%eax)
	movl	-36(%ebp), %eax
	movl	$0, 4(%eax)
	leal	-100(%ebp), %eax
	movl	%eax, (%esp)
	call	_findTerminal
	movl	%eax, %edx
	movl	-36(%ebp), %eax
	movl	%edx, (%eax)
	movl	8(%ebp), %eax
	movl	-36(%ebp), %edx
	movl	%edx, 4(%eax)
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	leal	1(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 8(%eax)
	addl	$1, 16(%ebp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_populateRHS
	jmp	L60
L79:
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, -24(%ebp)
	jmp	L81
L82:
	movl	-24(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -24(%ebp)
L81:
	movl	-24(%ebp), %eax
	movl	8(%eax), %eax
	testl	%eax, %eax
	jne	L82
	movl	$12, (%esp)
	call	_malloc
	movl	%eax, -40(%ebp)
	movl	-40(%ebp), %eax
	movl	$0, 8(%eax)
	movl	-40(%ebp), %eax
	movl	$0, 4(%eax)
	leal	-100(%ebp), %eax
	movl	%eax, (%esp)
	call	_findTerminal
	movl	%eax, %edx
	movl	-40(%ebp), %eax
	movl	%edx, (%eax)
	movl	-24(%ebp), %eax
	movl	-40(%ebp), %edx
	movl	%edx, 8(%eax)
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	leal	1(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 8(%eax)
	addl	$1, 16(%ebp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_populateRHS
	jmp	L60
L83:
	nop
L60:
	addl	$116, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE32:
	.section .rdata,"dr"
LC127:
	.ascii "\12Grammar Initialized\0"
	.text
	.globl	_initializeGrammar
	.def	_initializeGrammar;	.scl	2;	.type	32;	.endef
_initializeGrammar:
LFB33:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	$1248, (%esp)
	call	_malloc
	movl	%eax, 8(%ebp)
	movl	$0, 12(%ebp)
	movl	$LC127, (%esp)
	call	_puts
	movl	8(%ebp), %eax
	movl	12(%ebp), %edx
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE33:
	.section .rdata,"dr"
LC128:
	.ascii "r\0"
	.text
	.globl	_populateGrammarWithRules
	.def	_populateGrammarWithRules;	.scl	2;	.type	32;	.endef
_populateGrammarWithRules:
LFB34:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%ebx
	subl	$240, %esp
	.cfi_offset 7, -12
	.cfi_offset 3, -16
	movl	$LC128, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_fopen
	movl	%eax, -24(%ebp)
	movl	_G, %eax
	movl	_G+4, %edx
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	_initializeGrammar
	movl	%eax, _G
	movl	%edx, _G+4
	movl	$0, -12(%ebp)
	leal	-178(%ebp), %eax
	movl	$150, %ecx
	movl	$0, %ebx
	movl	%ebx, (%eax)
	movl	%ebx, -4(%eax,%ecx)
	leal	4(%eax), %edx
	andl	$-4, %edx
	subl	%edx, %eax
	addl	%eax, %ecx
	andl	$-4, %ecx
	shrl	$2, %ecx
	movl	%edx, %edi
	movl	%ebx, %eax
	rep stosl
	movl	$0, -28(%ebp)
L93:
	movl	-24(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$150, 4(%esp)
	leal	-178(%ebp), %eax
	movl	%eax, (%esp)
	call	_fgets
	testl	%eax, %eax
	jne	L87
	movl	$1, %eax
	jmp	L94
L87:
	movl	$0, -184(%ebp)
	movl	$0, -188(%ebp)
	movl	$1, -16(%ebp)
	leal	-222(%ebp), %eax
	movl	$30, %ecx
	movl	$0, %ebx
	movl	%ebx, (%eax)
	movl	%ebx, -4(%eax,%ecx)
	leal	4(%eax), %edx
	andl	$-4, %edx
	subl	%edx, %eax
	addl	%eax, %ecx
	andl	$-4, %ecx
	andl	$-4, %ecx
	movl	$0, %eax
L89:
	movl	%ebx, (%edx,%eax)
	addl	$4, %eax
	cmpl	%ecx, %eax
	jb	L89
	addl	%eax, %edx
	movl	$0, -20(%ebp)
	jmp	L91
L92:
	leal	-178(%ebp), %edx
	movl	-16(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	leal	-222(%ebp), %ecx
	movl	-20(%ebp), %edx
	addl	%ecx, %edx
	movb	%al, (%edx)
	addl	$1, -16(%ebp)
	addl	$1, -20(%ebp)
L91:
	leal	-178(%ebp), %edx
	movl	-16(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	cmpb	$62, %al
	jne	L92
	leal	-222(%ebp), %eax
	movl	%eax, (%esp)
	call	_findNonTerminal
	movl	%eax, -192(%ebp)
	addl	$6, -16(%ebp)
	movl	-16(%ebp), %eax
	movl	%eax, 8(%esp)
	leal	-178(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-192(%ebp), %eax
	movl	%eax, (%esp)
	call	_populateRHS
	movl	_G+4, %eax
	addl	$1, %eax
	movl	%eax, _G+4
	movl	_G, %ecx
	movl	-12(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -12(%ebp)
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	%ecx, %eax
	movl	-192(%ebp), %edx
	movl	%edx, (%eax)
	movl	-188(%ebp), %edx
	movl	%edx, 4(%eax)
	movl	-184(%ebp), %edx
	movl	%edx, 8(%eax)
	jmp	L93
L94:
	addl	$240, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE34:
	.globl	_concatList
	.def	_concatList;	.scl	2;	.type	32;	.endef
_concatList:
LFB35:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	12(%ebp), %eax
	testl	%eax, %eax
	jne	L96
	movl	16(%ebp), %eax
	movl	20(%ebp), %edx
	jmp	L105
L96:
	movl	20(%ebp), %eax
	testl	%eax, %eax
	jne	L98
	movl	8(%ebp), %eax
	movl	12(%ebp), %edx
	jmp	L105
L98:
	movl	$12, (%esp)
	call	_malloc
	movl	%eax, -12(%ebp)
	movl	$0, -28(%ebp)
	movl	$0, -32(%ebp)
	movl	8(%ebp), %eax
	movl	%eax, -12(%ebp)
	jmp	L99
L101:
	movl	$12, (%esp)
	call	_malloc
	movl	%eax, -20(%ebp)
	movl	-20(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	(%edx), %edx
	movl	%edx, (%eax)
	movl	-12(%ebp), %eax
	movl	4(%eax), %edx
	movl	-20(%ebp), %eax
	movl	%edx, 4(%eax)
	movl	-20(%ebp), %eax
	movl	$0, 8(%eax)
	movl	-28(%ebp), %eax
	testl	%eax, %eax
	jne	L100
	movl	-20(%ebp), %eax
	movl	%eax, -32(%ebp)
	movl	-28(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -28(%ebp)
	movl	-32(%ebp), %eax
	movl	%eax, -16(%ebp)
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -12(%ebp)
	jmp	L99
L100:
	movl	-16(%ebp), %eax
	movl	-20(%ebp), %edx
	movl	%edx, 8(%eax)
	movl	-20(%ebp), %eax
	movl	%eax, -16(%ebp)
	movl	-28(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -28(%ebp)
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -12(%ebp)
L99:
	cmpl	$0, -12(%ebp)
	jne	L101
	movl	16(%ebp), %eax
	movl	%eax, -12(%ebp)
	jmp	L102
L104:
	movl	-32(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_searchForSymbol
	xorl	$1, %eax
	testb	%al, %al
	je	L103
	movl	$12, (%esp)
	call	_malloc
	movl	%eax, -24(%ebp)
	movl	-24(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	(%edx), %edx
	movl	%edx, (%eax)
	movl	-12(%ebp), %eax
	movl	4(%eax), %edx
	movl	-24(%ebp), %eax
	movl	%edx, 4(%eax)
	movl	-24(%ebp), %eax
	movl	$0, 8(%eax)
	movl	-16(%ebp), %eax
	movl	-24(%ebp), %edx
	movl	%edx, 8(%eax)
	movl	-24(%ebp), %eax
	movl	%eax, -16(%ebp)
	movl	-28(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -28(%ebp)
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -12(%ebp)
	jmp	L102
L103:
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -12(%ebp)
L102:
	cmpl	$0, -12(%ebp)
	jne	L104
	movl	-32(%ebp), %eax
	movl	-28(%ebp), %edx
L105:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE35:
	.globl	_findFirst
	.def	_findFirst;	.scl	2;	.type	32;	.endef
_findFirst:
LFB36:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$72, %esp
	movl	$0, -28(%ebp)
	movl	$0, -24(%ebp)
	movl	$12, (%esp)
	call	_malloc
	movl	%eax, -12(%ebp)
	movl	8(%ebp), %eax
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	4(%eax), %eax
	testl	%eax, %eax
	jne	L107
	movl	$12, (%esp)
	call	_malloc
	movl	%eax, -16(%ebp)
	movl	-16(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	(%edx), %ecx
	movl	%ecx, (%eax)
	movl	4(%edx), %ecx
	movl	%ecx, 4(%eax)
	movl	8(%edx), %edx
	movl	%edx, 8(%eax)
	movl	-16(%ebp), %eax
	movl	$0, 8(%eax)
	movl	-16(%ebp), %eax
	movl	%eax, -28(%ebp)
	movl	$1, -24(%ebp)
	movl	-28(%ebp), %eax
	movl	-24(%ebp), %edx
	jmp	L112
L107:
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	movl	_FirstFollowSetsOfAll+4(,%eax,8), %edx
	movl	_FirstFollowSetsOfAll(,%eax,8), %eax
	movl	%eax, -28(%ebp)
	movl	%edx, -24(%ebp)
	movl	$12, (%esp)
	call	_malloc
	movl	%eax, -20(%ebp)
	movl	-20(%ebp), %eax
	movl	$0, 4(%eax)
	movl	-20(%ebp), %eax
	movl	$0, 8(%eax)
	movl	-20(%ebp), %eax
	movl	$0, (%eax)
	movl	-28(%ebp), %eax
	movl	-20(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_searchForSymbol
	testb	%al, %al
	je	L109
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	testl	%eax, %eax
	jne	L110
	movl	-28(%ebp), %eax
	movl	-24(%ebp), %edx
	jmp	L112
L110:
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -36(%ebp)
	movl	12(%ebp), %eax
	subl	$1, %eax
	movl	%eax, -32(%ebp)
	movl	-36(%ebp), %eax
	movl	-32(%ebp), %edx
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	_findFirst
	movl	%eax, -44(%ebp)
	movl	%edx, -40(%ebp)
	movl	-44(%ebp), %eax
	movl	-40(%ebp), %edx
	movl	%eax, 8(%esp)
	movl	%edx, 12(%esp)
	movl	-28(%ebp), %eax
	movl	-24(%ebp), %edx
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	_concatList
	movl	%eax, -28(%ebp)
	movl	%edx, -24(%ebp)
	movl	-28(%ebp), %eax
	movl	-20(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_searchForSymbol
	testb	%al, %al
	je	L109
	movl	-44(%ebp), %eax
	movl	-20(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_searchForSymbol
	xorl	$1, %eax
	testb	%al, %al
	je	L109
	leal	-28(%ebp), %eax
	movl	%eax, (%esp)
	call	_removeEpsilonFromList
L109:
	movl	-28(%ebp), %eax
	movl	-24(%ebp), %edx
L112:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE36:
	.globl	_findFollow
	.def	_findFollow;	.scl	2;	.type	32;	.endef
_findFollow:
LFB37:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$88, %esp
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	addl	$56, %eax
	movl	_FirstFollowSetsOfAll+4(,%eax,8), %eax
	testl	%eax, %eax
	jle	L114
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	addl	$56, %eax
	movl	_FirstFollowSetsOfAll+4(,%eax,8), %edx
	movl	_FirstFollowSetsOfAll(,%eax,8), %eax
	jmp	L130
L114:
	movl	$0, -48(%ebp)
	movl	$0, -44(%ebp)
	movl	$0, -12(%ebp)
	jmp	L116
L129:
	movl	_G, %ecx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	%ecx, %eax
	movl	4(%eax), %eax
	movl	%eax, -16(%ebp)
	jmp	L117
L128:
	movl	-16(%ebp), %eax
	movl	4(%eax), %eax
	testl	%eax, %eax
	jne	L118
	movl	-16(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -16(%ebp)
	jmp	L117
L118:
	movl	-16(%ebp), %eax
	movl	(%eax), %edx
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	%eax, %edx
	jne	L119
	movl	-16(%ebp), %eax
	movl	8(%eax), %eax
	testl	%eax, %eax
	jne	L120
	movl	_G, %ecx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	%ecx, %eax
	movl	(%eax), %edx
	movl	-16(%ebp), %eax
	movl	(%eax), %eax
	cmpl	%eax, %edx
	je	L131
	movl	$12, (%esp)
	call	_malloc
	movl	%eax, -40(%ebp)
	movl	-40(%ebp), %eax
	movl	$1, 4(%eax)
	movl	-40(%ebp), %eax
	movl	$0, 8(%eax)
	movl	_G, %ecx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	%ecx, %eax
	movl	(%eax), %edx
	movl	-40(%ebp), %eax
	movl	%edx, (%eax)
	movl	-40(%ebp), %eax
	movl	%eax, (%esp)
	call	_findFollow
	movl	%eax, 8(%esp)
	movl	%edx, 12(%esp)
	movl	-48(%ebp), %eax
	movl	-44(%ebp), %edx
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	_concatList
	movl	%eax, -48(%ebp)
	movl	%edx, -44(%ebp)
	jmp	L122
L120:
	movl	$0, -56(%ebp)
	movl	$0, -52(%ebp)
	movl	-16(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -20(%ebp)
	jmp	L123
L125:
	movl	$12, (%esp)
	call	_malloc
	movl	%eax, -28(%ebp)
	movl	-28(%ebp), %eax
	movl	$0, 8(%eax)
	movl	-20(%ebp), %eax
	movl	4(%eax), %edx
	movl	-28(%ebp), %eax
	movl	%edx, 4(%eax)
	movl	-28(%ebp), %eax
	movl	-20(%ebp), %edx
	movl	(%edx), %edx
	movl	%edx, (%eax)
	movl	-52(%ebp), %eax
	testl	%eax, %eax
	jne	L124
	movl	-28(%ebp), %eax
	movl	%eax, -56(%ebp)
	movl	-52(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -52(%ebp)
	movl	-20(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -20(%ebp)
	movl	-56(%ebp), %eax
	movl	%eax, -24(%ebp)
	jmp	L123
L124:
	movl	-24(%ebp), %eax
	movl	-28(%ebp), %edx
	movl	%edx, 8(%eax)
	movl	-28(%ebp), %eax
	movl	%eax, -24(%ebp)
	movl	-52(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -52(%ebp)
	movl	-20(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -20(%ebp)
L123:
	cmpl	$0, -20(%ebp)
	jne	L125
	movl	-56(%ebp), %eax
	movl	-52(%ebp), %edx
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	_findFirst
	movl	%eax, -64(%ebp)
	movl	%edx, -60(%ebp)
	movl	$12, (%esp)
	call	_malloc
	movl	%eax, -32(%ebp)
	movl	-32(%ebp), %eax
	movl	$0, 4(%eax)
	movl	-32(%ebp), %eax
	movl	$0, 8(%eax)
	movl	-32(%ebp), %eax
	movl	$0, (%eax)
	movl	-64(%ebp), %eax
	movl	-32(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_searchForSymbol
	testb	%al, %al
	je	L126
	leal	-64(%ebp), %eax
	movl	%eax, (%esp)
	call	_removeEpsilonFromList
	movl	-64(%ebp), %eax
	movl	-60(%ebp), %edx
	movl	%eax, 8(%esp)
	movl	%edx, 12(%esp)
	movl	-48(%ebp), %eax
	movl	-44(%ebp), %edx
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	_concatList
	movl	%eax, -48(%ebp)
	movl	%edx, -44(%ebp)
	movl	$12, (%esp)
	call	_malloc
	movl	%eax, -36(%ebp)
	movl	-36(%ebp), %eax
	movl	$1, 4(%eax)
	movl	-36(%ebp), %eax
	movl	$0, 8(%eax)
	movl	_G, %ecx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	%ecx, %eax
	movl	(%eax), %edx
	movl	-36(%ebp), %eax
	movl	%edx, (%eax)
	movl	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	_findFollow
	movl	%eax, 8(%esp)
	movl	%edx, 12(%esp)
	movl	-48(%ebp), %eax
	movl	-44(%ebp), %edx
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	_concatList
	movl	%eax, -48(%ebp)
	movl	%edx, -44(%ebp)
	jmp	L127
L126:
	movl	-64(%ebp), %eax
	movl	-60(%ebp), %edx
	movl	%eax, 8(%esp)
	movl	%edx, 12(%esp)
	movl	-48(%ebp), %eax
	movl	-44(%ebp), %edx
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	_concatList
	movl	%eax, -48(%ebp)
	movl	%edx, -44(%ebp)
L127:
	movl	-16(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -16(%ebp)
	jmp	L117
L119:
	movl	-16(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -16(%ebp)
L117:
	cmpl	$0, -16(%ebp)
	jne	L128
	jmp	L122
L131:
	nop
L122:
	addl	$1, -12(%ebp)
L116:
	cmpl	$102, -12(%ebp)
	jle	L129
	movl	-48(%ebp), %eax
	movl	-44(%ebp), %edx
L130:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE37:
	.section .rdata,"dr"
LC129:
	.ascii "\12****FIRST SETS COMPUTED****\0"
LC130:
	.ascii "\12****FOLLOW SETS COMPUTED****\0"
	.text
	.globl	_ComputeFirstAndFollowSets
	.def	_ComputeFirstAndFollowSets;	.scl	2;	.type	32;	.endef
_ComputeFirstAndFollowSets:
LFB38:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$60, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movl	$0, -28(%ebp)
	jmp	L133
L134:
	movl	-28(%ebp), %eax
	movl	$0, _FirstFollowSetsOfAll+4(,%eax,8)
	movl	-28(%ebp), %eax
	movl	$0, _FirstFollowSetsOfAll(,%eax,8)
	movl	-28(%ebp), %eax
	addl	$56, %eax
	movl	$0, _FirstFollowSetsOfAll+4(,%eax,8)
	movl	-28(%ebp), %eax
	addl	$56, %eax
	movl	$0, _FirstFollowSetsOfAll(,%eax,8)
	addl	$1, -28(%ebp)
L133:
	cmpl	$55, -28(%ebp)
	jle	L134
	movl	$102, -28(%ebp)
	jmp	L135
L136:
	movl	8(%ebp), %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	%ecx, %eax
	movl	(%eax), %esi
	movl	8(%ebp), %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	%ecx, %eax
	movl	8(%eax), %edx
	movl	4(%eax), %eax
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	_findFirst
	movl	%edx, %ecx
	movl	%eax, %edx
	movl	8(%ebp), %edi
	movl	-28(%ebp), %ebx
	movl	%ebx, %eax
	addl	%eax, %eax
	addl	%ebx, %eax
	sall	$2, %eax
	addl	%edi, %eax
	movl	(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%ecx, 12(%esp)
	movl	_FirstFollowSetsOfAll+4(,%eax,8), %edx
	movl	_FirstFollowSetsOfAll(,%eax,8), %eax
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	_concatList
	movl	%eax, _FirstFollowSetsOfAll(,%esi,8)
	movl	%edx, _FirstFollowSetsOfAll+4(,%esi,8)
	subl	$1, -28(%ebp)
L135:
	cmpl	$0, -28(%ebp)
	jns	L136
	movl	$LC129, (%esp)
	call	_puts
	movl	$12, (%esp)
	call	_malloc
	movl	%eax, -32(%ebp)
	movl	-32(%ebp), %eax
	movl	$0, 8(%eax)
	movl	-32(%ebp), %eax
	movl	$0, 4(%eax)
	movl	-32(%ebp), %eax
	movl	$61, (%eax)
	movl	-32(%ebp), %eax
	movl	%eax, -44(%ebp)
	movl	$1, -40(%ebp)
	movl	-44(%ebp), %eax
	movl	-40(%ebp), %edx
	movl	%eax, _FirstFollowSetsOfAll+448
	movl	%edx, _FirstFollowSetsOfAll+452
	movl	$1, -28(%ebp)
	jmp	L137
L138:
	movl	$12, (%esp)
	call	_malloc
	movl	%eax, -36(%ebp)
	movl	-36(%ebp), %eax
	movl	$0, 8(%eax)
	movl	-36(%ebp), %eax
	movl	$1, 4(%eax)
	movl	-28(%ebp), %edx
	movl	-36(%ebp), %eax
	movl	%edx, (%eax)
	movl	-28(%ebp), %eax
	leal	56(%eax), %ebx
	movl	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	_findFollow
	movl	%eax, _FirstFollowSetsOfAll(,%ebx,8)
	movl	%edx, _FirstFollowSetsOfAll+4(,%ebx,8)
	addl	$1, -28(%ebp)
L137:
	cmpl	$55, -28(%ebp)
	jle	L138
	movl	$LC130, (%esp)
	call	_puts
	nop
	addl	$60, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE38:
	.globl	_initializeParseTable
	.def	_initializeParseTable;	.scl	2;	.type	32;	.endef
_initializeParseTable:
LFB39:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$36, %esp
	.cfi_offset 3, -12
	movl	$224, (%esp)
	call	_malloc
	movl	%eax, _parseTable
	movl	$0, -12(%ebp)
	jmp	L140
L143:
	movl	_parseTable, %eax
	movl	-12(%ebp), %edx
	sall	$2, %edx
	leal	(%eax,%edx), %ebx
	movl	$248, (%esp)
	call	_malloc
	movl	%eax, (%ebx)
	movl	$0, -16(%ebp)
	jmp	L141
L142:
	movl	_parseTable, %eax
	movl	-12(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	-16(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	$-1, (%eax)
	addl	$1, -16(%ebp)
L141:
	cmpl	$61, -16(%ebp)
	jle	L142
	addl	$1, -12(%ebp)
L140:
	cmpl	$55, -12(%ebp)
	jle	L143
	nop
	addl	$36, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE39:
	.globl	_createParseTable
	.def	_createParseTable;	.scl	2;	.type	32;	.endef
_createParseTable:
LFB40:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$68, %esp
	.cfi_offset 3, -12
	call	_initializeParseTable
	movl	$0, -12(%ebp)
	jmp	L145
L155:
	movl	_G, %ecx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	%ecx, %eax
	movl	8(%eax), %edx
	movl	4(%eax), %eax
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	_findFirst
	movl	%eax, -44(%ebp)
	movl	%edx, -40(%ebp)
	movl	$12, (%esp)
	call	_malloc
	movl	%eax, -32(%ebp)
	movl	-32(%ebp), %eax
	movl	$0, 4(%eax)
	movl	-32(%ebp), %eax
	movl	$0, 8(%eax)
	movl	-32(%ebp), %eax
	movl	$0, (%eax)
	movl	-44(%ebp), %eax
	movl	-32(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_searchForSymbol
	testb	%al, %al
	je	L146
	movl	-44(%ebp), %eax
	movl	%eax, -16(%ebp)
	jmp	L147
L149:
	movl	-16(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L148
	movl	_parseTable, %ecx
	movl	_G, %ebx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	%ebx, %eax
	movl	(%eax), %eax
	sall	$2, %eax
	addl	%ecx, %eax
	movl	(%eax), %edx
	movl	-16(%ebp), %eax
	movl	(%eax), %eax
	sall	$2, %eax
	addl	%eax, %edx
	movl	-12(%ebp), %eax
	movl	%eax, (%edx)
L148:
	movl	-16(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -16(%ebp)
L147:
	cmpl	$0, -16(%ebp)
	jne	L149
	movl	_G, %ecx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	%ecx, %eax
	movl	(%eax), %eax
	addl	$56, %eax
	movl	8(%ebp,%eax,8), %eax
	movl	%eax, -20(%ebp)
	jmp	L150
L151:
	movl	_parseTable, %ecx
	movl	_G, %ebx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	%ebx, %eax
	movl	(%eax), %eax
	sall	$2, %eax
	addl	%ecx, %eax
	movl	(%eax), %edx
	movl	-20(%ebp), %eax
	movl	(%eax), %eax
	sall	$2, %eax
	addl	%eax, %edx
	movl	-12(%ebp), %eax
	movl	%eax, (%edx)
	movl	-20(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -20(%ebp)
L150:
	cmpl	$0, -20(%ebp)
	jne	L151
	jmp	L152
L146:
	movl	$12, (%esp)
	call	_malloc
	movl	%eax, -24(%ebp)
	movl	-44(%ebp), %eax
	movl	%eax, -24(%ebp)
	jmp	L153
L154:
	movl	_parseTable, %ecx
	movl	_G, %ebx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	%ebx, %eax
	movl	(%eax), %eax
	sall	$2, %eax
	addl	%ecx, %eax
	movl	(%eax), %edx
	movl	-24(%ebp), %eax
	movl	(%eax), %eax
	sall	$2, %eax
	addl	%eax, %edx
	movl	-12(%ebp), %eax
	movl	%eax, (%edx)
	movl	-24(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -24(%ebp)
L153:
	cmpl	$0, -24(%ebp)
	jne	L154
L152:
	addl	$1, -12(%ebp)
L145:
	cmpl	$102, -12(%ebp)
	jle	L155
	movl	$0, -12(%ebp)
	jmp	L156
L160:
	movl	$0, -28(%ebp)
	jmp	L157
L159:
	movl	_parseTable, %eax
	movl	-12(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	-28(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	cmpl	$-1, %eax
	jne	L158
	movl	$12, (%esp)
	call	_malloc
	movl	%eax, -36(%ebp)
	movl	-36(%ebp), %eax
	movl	$0, 8(%eax)
	movl	-36(%ebp), %eax
	movl	$0, 4(%eax)
	movl	-28(%ebp), %edx
	movl	-36(%ebp), %eax
	movl	%edx, (%eax)
	movl	-12(%ebp), %eax
	addl	$56, %eax
	movl	8(%ebp,%eax,8), %eax
	movl	-36(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_searchForSymbol
	testb	%al, %al
	je	L158
	movl	_parseTable, %eax
	movl	-12(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	-28(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	$-2, (%eax)
L158:
	addl	$1, -28(%ebp)
L157:
	cmpl	$61, -28(%ebp)
	jle	L159
	addl	$1, -12(%ebp)
L156:
	cmpl	$55, -12(%ebp)
	jle	L160
	nop
	addl	$68, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE40:
	.globl	_push
	.def	_push;	.scl	2;	.type	32;	.endef
_push:
LFB41:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	_top_of_stack, %eax
	addl	$1, %eax
	movl	%eax, _top_of_stack
	movl	_top_of_stack, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	12(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %edx
	movl	%edx, 4(%eax)
	movl	20(%ebp), %edx
	movl	%edx, 8(%eax)
	nop
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE41:
	.globl	_createParseTreeNode
	.def	_createParseTreeNode;	.scl	2;	.type	32;	.endef
_createParseTreeNode:
LFB42:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$40, (%esp)
	call	_malloc
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	$0, 16(%eax)
	movl	-12(%ebp), %eax
	movl	$0, 20(%eax)
	movl	-12(%ebp), %eax
	movl	$0, 24(%eax)
	movl	-12(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, (%eax)
	movl	12(%ebp), %edx
	movl	%edx, 4(%eax)
	movl	16(%ebp), %edx
	movl	%edx, 8(%eax)
	movl	-12(%ebp), %eax
	movl	$0, 12(%eax)
	movl	-12(%ebp), %eax
	movl	$-1, 28(%eax)
	movl	-12(%ebp), %eax
	movl	$0, 32(%eax)
	movl	-12(%ebp), %eax
	movl	$0, 36(%eax)
	movl	_no_of_nodes, %eax
	addl	$1, %eax
	movl	%eax, _no_of_nodes
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE42:
	.globl	_createParseTree
	.def	_createParseTree;	.scl	2;	.type	32;	.endef
_createParseTree:
LFB43:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$1, -20(%ebp)
	movl	$0, -24(%ebp)
	movl	$0, -16(%ebp)
	movl	-24(%ebp), %eax
	movl	%eax, (%esp)
	movl	-20(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, 8(%esp)
	call	_createParseTreeNode
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE43:
	.section .rdata,"dr"
	.align 4
LC131:
	.ascii "\12Line %d: Lexical Error. Invalid Token \"%s\"\0"
	.align 4
LC132:
	.ascii "\12Line %d: Syntactic Error. Unexpected token \"%s\"\0"
LC133:
	.ascii "\12Parsing finished\0"
	.align 4
LC134:
	.ascii "\12Line %d: Syntactic Error. Expected token \"%s\"\0"
	.align 4
LC135:
	.ascii "\12Line %d: Syntactic Error. Incompatible Token %s. Expected one of these tokens - \0"
LC136:
	.ascii "%s, \0"
	.text
	.globl	_parseInputSourceCode
	.def	_parseInputSourceCode;	.scl	2;	.type	32;	.endef
_parseInputSourceCode:
LFB44:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$340, %esp
	.cfi_offset 3, -12
	movl	$LC128, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_fopen
	movl	%eax, -60(%ebp)
	movl	$-1, _top_of_stack
	movl	$0, -100(%ebp)
	movl	$0, -104(%ebp)
	movl	$61, -108(%ebp)
	movl	-108(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-104(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-100(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	$_Stack, (%esp)
	call	_push
	movl	$0, -112(%ebp)
	movl	$1, -116(%ebp)
	movl	$0, -120(%ebp)
	movl	-120(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-116(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-112(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	$_Stack, (%esp)
	call	_push
	call	_createParseTree
	movl	%eax, -124(%ebp)
	movl	-124(%ebp), %eax
	movl	%eax, -12(%ebp)
	movl	$40, (%esp)
	call	_malloc
	movl	%eax, -16(%ebp)
	movl	-60(%ebp), %eax
	movl	%eax, (%esp)
	call	_getNextToken
	movl	%eax, -16(%ebp)
L228:
	cmpl	$0, -16(%ebp)
	jne	L167
	movl	_top_of_stack, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$_Stack, %eax
	movl	(%eax), %eax
	cmpl	$61, %eax
	jne	L168
	movl	_top_of_stack, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$_Stack+4, %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L169
L168:
	movl	_top_of_stack, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$_Stack+4, %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L172
L169:
	movl	-124(%ebp), %eax
	jmp	L229
L183:
	movl	$12, (%esp)
	call	_malloc
	movl	%eax, -88(%ebp)
	movl	-88(%ebp), %eax
	movl	$0, (%eax)
	movl	-88(%ebp), %eax
	movl	$0, 4(%eax)
	movl	-88(%ebp), %eax
	movl	$0, 8(%eax)
	movl	_top_of_stack, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$_Stack, %eax
	movl	(%eax), %eax
	movl	_FirstFollowSetsOfAll(,%eax,8), %eax
	movl	-88(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_searchForSymbol
	testb	%al, %al
	je	L173
	movl	_top_of_stack, %eax
	subl	$1, %eax
	movl	%eax, _top_of_stack
	movl	-88(%ebp), %eax
	movl	(%eax), %edx
	movl	%edx, (%esp)
	movl	4(%eax), %edx
	movl	%edx, 4(%esp)
	movl	8(%eax), %eax
	movl	%eax, 8(%esp)
	call	_createParseTreeNode
	movl	%eax, -92(%ebp)
	movl	$40, (%esp)
	call	_malloc
	movl	%eax, -96(%ebp)
	movl	-96(%ebp), %eax
	movb	$0, 1(%eax)
	movl	-96(%ebp), %eax
	movb	$0, (%eax)
	movl	-96(%ebp), %eax
	addl	$2, %eax
	movl	$1230196805, (%eax)
	movl	$5132108, 4(%eax)
	movl	-96(%ebp), %eax
	movl	$-1, 28(%eax)
	movl	$20, (%esp)
	call	_malloc
	movl	%eax, %edx
	movl	-96(%ebp), %eax
	movl	%edx, 24(%eax)
	movl	-96(%ebp), %eax
	movl	24(%eax), %eax
	movl	$757935405, (%eax)
	movb	$0, 4(%eax)
	movl	-96(%ebp), %eax
	movl	$0, 36(%eax)
	movl	-92(%ebp), %eax
	movl	-96(%ebp), %edx
	movl	%edx, 12(%eax)
	movl	-92(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 16(%eax)
	movl	-12(%ebp), %eax
	movl	-92(%ebp), %edx
	movl	%edx, 20(%eax)
	movl	$0, -20(%ebp)
	jmp	L174
L178:
	movl	_G, %ecx
	movl	-20(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	%ecx, %eax
	movl	(%eax), %edx
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	cmpl	%eax, %edx
	jne	L230
	movl	_G, %ecx
	movl	-20(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	%ecx, %eax
	movl	4(%eax), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L176
	movl	-12(%ebp), %eax
	movl	-20(%ebp), %edx
	movl	%edx, 28(%eax)
	jmp	L177
L230:
	nop
L176:
	addl	$1, -20(%ebp)
L174:
	cmpl	$102, -20(%ebp)
	jle	L178
L177:
	movl	-12(%ebp), %eax
	movl	%eax, -24(%ebp)
	jmp	L179
L182:
	movl	-24(%ebp), %eax
	movl	24(%eax), %eax
	testl	%eax, %eax
	je	L180
	movl	-24(%ebp), %eax
	movl	24(%eax), %eax
	movl	%eax, -12(%ebp)
	jmp	L172
L180:
	movl	-24(%ebp), %eax
	movl	16(%eax), %eax
	movl	%eax, -24(%ebp)
	nop
L179:
	movl	-124(%ebp), %eax
	cmpl	-24(%ebp), %eax
	jne	L182
	jmp	L172
L173:
	movl	-124(%ebp), %eax
	jmp	L229
L172:
	movl	_top_of_stack, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$_Stack, %eax
	movl	(%eax), %eax
	cmpl	$61, %eax
	jne	L183
	movl	_top_of_stack, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$_Stack+4, %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L183
	movl	-124(%ebp), %eax
	jmp	L229
L167:
	movl	-16(%ebp), %eax
	movzbl	1(%eax), %eax
	testb	%al, %al
	je	L184
	movl	-16(%ebp), %eax
	movl	24(%eax), %edx
	movl	-16(%ebp), %eax
	movl	28(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC131, (%esp)
	call	_printf
	movl	-60(%ebp), %eax
	movl	%eax, (%esp)
	call	_getNextToken
	movl	%eax, -16(%ebp)
	jmp	L185
L184:
	movl	-16(%ebp), %eax
	addl	$2, %eax
	movl	$LC55, 4(%esp)
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L186
	movl	-60(%ebp), %eax
	movl	%eax, (%esp)
	call	_getNextToken
	movl	%eax, -16(%ebp)
	jmp	L185
L186:
	movl	_top_of_stack, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$_Stack+4, %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L187
	movl	_top_of_stack, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$_Stack, %eax
	movl	(%eax), %eax
	cmpl	$61, %eax
	jne	L187
	jmp	L188
L191:
	movl	$0, _is_parsetree_valid
	movl	-16(%ebp), %eax
	leal	2(%eax), %edx
	movl	-16(%ebp), %eax
	movl	28(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC132, (%esp)
	call	_printf
	movl	-60(%ebp), %eax
	movl	%eax, (%esp)
	call	_getNextToken
	movl	%eax, -16(%ebp)
	jmp	L189
L190:
	movl	-60(%ebp), %eax
	movl	%eax, (%esp)
	call	_getNextToken
	movl	%eax, -16(%ebp)
	cmpl	$0, -16(%ebp)
	jne	L189
	jmp	L188
L189:
	movl	-16(%ebp), %eax
	movzbl	1(%eax), %eax
	testb	%al, %al
	jne	L190
L188:
	cmpl	$0, -16(%ebp)
	jne	L191
	movl	-124(%ebp), %eax
	jmp	L229
L187:
	movl	_top_of_stack, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$_Stack+4, %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L192
	movl	-16(%ebp), %eax
	addl	$2, %eax
	movl	%eax, (%esp)
	call	_findTerminal
	movl	%eax, %ecx
	movl	_top_of_stack, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$_Stack, %eax
	movl	(%eax), %eax
	cmpl	%eax, %ecx
	jne	L193
	movl	_top_of_stack, %eax
	subl	$1, %eax
	movl	%eax, _top_of_stack
	movl	$40, (%esp)
	call	_malloc
	movl	%eax, -64(%ebp)
	movl	-64(%ebp), %eax
	movl	-16(%ebp), %edx
	movl	(%edx), %ecx
	movl	%ecx, (%eax)
	movl	4(%edx), %ecx
	movl	%ecx, 4(%eax)
	movl	8(%edx), %ecx
	movl	%ecx, 8(%eax)
	movl	12(%edx), %ecx
	movl	%ecx, 12(%eax)
	movl	16(%edx), %ecx
	movl	%ecx, 16(%eax)
	movl	20(%edx), %ecx
	movl	%ecx, 20(%eax)
	movl	24(%edx), %ecx
	movl	%ecx, 24(%eax)
	movl	28(%edx), %ecx
	movl	%ecx, 28(%eax)
	movl	32(%edx), %ecx
	movl	%ecx, 32(%eax)
	movl	36(%edx), %edx
	movl	%edx, 36(%eax)
	movl	-12(%ebp), %eax
	movl	-64(%ebp), %edx
	movl	%edx, 12(%eax)
	movl	-60(%ebp), %eax
	movl	%eax, (%esp)
	call	_getNextToken
	movl	%eax, -16(%ebp)
	movl	-12(%ebp), %eax
	movl	%eax, -28(%ebp)
	jmp	L194
L197:
	movl	-28(%ebp), %eax
	movl	24(%eax), %eax
	testl	%eax, %eax
	jne	L195
	movl	-28(%ebp), %eax
	movl	16(%eax), %eax
	movl	%eax, -28(%ebp)
	jmp	L194
L195:
	movl	-28(%ebp), %eax
	movl	24(%eax), %eax
	movl	%eax, -12(%ebp)
	jmp	L196
L194:
	movl	-124(%ebp), %eax
	cmpl	-28(%ebp), %eax
	jne	L197
L196:
	movl	-124(%ebp), %eax
	cmpl	-28(%ebp), %eax
	jne	L231
	movl	$LC133, (%esp)
	call	_printf
	jmp	L199
L202:
	movl	$0, _is_parsetree_valid
	movl	-16(%ebp), %eax
	leal	2(%eax), %edx
	movl	-16(%ebp), %eax
	movl	28(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC132, (%esp)
	call	_printf
	movl	-60(%ebp), %eax
	movl	%eax, (%esp)
	call	_getNextToken
	movl	%eax, -16(%ebp)
	jmp	L200
L201:
	movl	-60(%ebp), %eax
	movl	%eax, (%esp)
	call	_getNextToken
	movl	%eax, -16(%ebp)
	cmpl	$0, -16(%ebp)
	jne	L200
	jmp	L199
L200:
	movl	-16(%ebp), %eax
	movzbl	1(%eax), %eax
	testb	%al, %al
	jne	L201
L199:
	cmpl	$0, -16(%ebp)
	jne	L202
	jmp	L231
L193:
	movl	$0, _is_parsetree_valid
	movl	_top_of_stack, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$_Stack, %eax
	movl	(%eax), %eax
	movl	_terminalMap(,%eax,4), %edx
	movl	-16(%ebp), %eax
	movl	28(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC134, (%esp)
	call	_printf
	movl	_top_of_stack, %eax
	subl	$1, %eax
	movl	%eax, _top_of_stack
	jmp	L185
L192:
	movl	_top_of_stack, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$_Stack, %eax
	movl	(%eax), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %ebx
	movl	-16(%ebp), %eax
	addl	$2, %eax
	movl	%eax, (%esp)
	call	_findTerminal
	sall	$2, %eax
	addl	%ebx, %eax
	movl	(%eax), %eax
	movl	%eax, -32(%ebp)
	cmpl	$-1, -32(%ebp)
	je	L203
	cmpl	$-2, -32(%ebp)
	je	L203
	movl	_G, %ecx
	movl	-32(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	%ecx, %eax
	movl	(%eax), %edx
	movl	%edx, -136(%ebp)
	movl	4(%eax), %edx
	movl	%edx, -132(%ebp)
	movl	8(%eax), %eax
	movl	%eax, -128(%ebp)
	movl	$12, (%esp)
	call	_malloc
	movl	%eax, -68(%ebp)
	movl	-68(%ebp), %eax
	movl	$0, (%eax)
	movl	-68(%ebp), %eax
	movl	$0, 4(%eax)
	movl	-68(%ebp), %eax
	movl	$0, 8(%eax)
	movl	-128(%ebp), %eax
	cmpl	$1, %eax
	jne	L204
	movl	-132(%ebp), %eax
	movl	-68(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_searchForSymbol
	testb	%al, %al
	je	L204
	movl	_top_of_stack, %eax
	subl	$1, %eax
	movl	%eax, _top_of_stack
	movl	-68(%ebp), %eax
	movl	(%eax), %edx
	movl	%edx, (%esp)
	movl	4(%eax), %edx
	movl	%edx, 4(%esp)
	movl	8(%eax), %eax
	movl	%eax, 8(%esp)
	call	_createParseTreeNode
	movl	%eax, -72(%ebp)
	movl	$40, (%esp)
	call	_malloc
	movl	%eax, -76(%ebp)
	movl	-76(%ebp), %eax
	movb	$0, 1(%eax)
	movl	-76(%ebp), %eax
	movb	$0, (%eax)
	movl	-76(%ebp), %eax
	addl	$2, %eax
	movl	$1230196805, (%eax)
	movl	$5132108, 4(%eax)
	movl	-76(%ebp), %eax
	movl	$-1, 28(%eax)
	movl	$20, (%esp)
	call	_malloc
	movl	%eax, %edx
	movl	-76(%ebp), %eax
	movl	%edx, 24(%eax)
	movl	-76(%ebp), %eax
	movl	24(%eax), %eax
	movl	$757935405, (%eax)
	movb	$0, 4(%eax)
	movl	-76(%ebp), %eax
	movl	$0, 36(%eax)
	movl	-72(%ebp), %eax
	movl	-76(%ebp), %edx
	movl	%edx, 12(%eax)
	movl	-72(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 16(%eax)
	movl	-12(%ebp), %eax
	movl	-72(%ebp), %edx
	movl	%edx, 20(%eax)
	movl	-12(%ebp), %eax
	movl	-32(%ebp), %edx
	movl	%edx, 28(%eax)
	movl	-12(%ebp), %eax
	movl	%eax, -36(%ebp)
	jmp	L205
L208:
	movl	-36(%ebp), %eax
	movl	24(%eax), %eax
	testl	%eax, %eax
	je	L206
	movl	-36(%ebp), %eax
	movl	24(%eax), %eax
	movl	%eax, -12(%ebp)
	jmp	L207
L206:
	movl	-36(%ebp), %eax
	movl	16(%eax), %eax
	movl	%eax, -36(%ebp)
	nop
L205:
	movl	-124(%ebp), %eax
	cmpl	-36(%ebp), %eax
	jne	L208
L207:
	movl	-124(%ebp), %eax
	cmpl	-36(%ebp), %eax
	jne	L232
	movl	$LC133, (%esp)
	call	_printf
	jmp	L210
L211:
	movl	$0, _is_parsetree_valid
	movl	-16(%ebp), %eax
	leal	2(%eax), %edx
	movl	-16(%ebp), %eax
	movl	28(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC132, (%esp)
	call	_printf
	movl	-60(%ebp), %eax
	movl	%eax, (%esp)
	call	_getNextToken
	movl	%eax, -16(%ebp)
L210:
	cmpl	$0, -16(%ebp)
	jne	L211
	jmp	L232
L204:
	movl	_top_of_stack, %eax
	subl	$1, %eax
	movl	%eax, _top_of_stack
	movl	-12(%ebp), %eax
	movl	-32(%ebp), %edx
	movl	%edx, 28(%eax)
	movl	$0, -40(%ebp)
	movl	-132(%ebp), %eax
	movl	%eax, -44(%ebp)
	jmp	L212
L213:
	movl	-40(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	leal	-8(%ebp), %ebx
	addl	%ebx, %eax
	leal	-308(%eax), %edx
	movl	-44(%ebp), %eax
	movl	(%eax), %ecx
	movl	%ecx, (%edx)
	movl	4(%eax), %ecx
	movl	%ecx, 4(%edx)
	movl	8(%eax), %eax
	movl	%eax, 8(%edx)
	movl	-44(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -44(%ebp)
	addl	$1, -40(%ebp)
L212:
	cmpl	$0, -44(%ebp)
	jne	L213
	movl	-40(%ebp), %eax
	subl	$1, %eax
	movl	%eax, -48(%ebp)
	jmp	L214
L217:
	movl	-48(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	leal	-8(%ebp), %ebx
	addl	%ebx, %eax
	subl	$304, %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L215
	movl	-48(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	leal	-8(%ebp), %ebx
	addl	%ebx, %eax
	subl	$308, %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L233
L215:
	movl	-48(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	leal	-8(%ebp), %ebx
	addl	%ebx, %eax
	subl	$308, %eax
	movl	(%eax), %edx
	movl	%edx, 4(%esp)
	movl	4(%eax), %edx
	movl	%edx, 8(%esp)
	movl	8(%eax), %eax
	movl	%eax, 12(%esp)
	movl	$_Stack, (%esp)
	call	_push
	jmp	L216
L233:
	nop
L216:
	subl	$1, -48(%ebp)
L214:
	cmpl	$0, -48(%ebp)
	jns	L217
	movl	-12(%ebp), %eax
	movl	%eax, -80(%ebp)
	movl	-12(%ebp), %eax
	movl	%eax, -52(%ebp)
	movl	$0, -48(%ebp)
	jmp	L218
L221:
	movl	-48(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	leal	-8(%ebp), %ebx
	addl	%ebx, %eax
	subl	$308, %eax
	movl	(%eax), %edx
	movl	%edx, (%esp)
	movl	4(%eax), %edx
	movl	%edx, 4(%esp)
	movl	8(%eax), %eax
	movl	%eax, 8(%esp)
	call	_createParseTreeNode
	movl	%eax, -84(%ebp)
	cmpl	$0, -48(%ebp)
	jne	L219
	movl	-84(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 16(%eax)
	movl	-80(%ebp), %eax
	movl	-84(%ebp), %edx
	movl	%edx, 20(%eax)
	movl	-84(%ebp), %eax
	movl	%eax, -12(%ebp)
	movl	-84(%ebp), %eax
	movl	%eax, -52(%ebp)
	jmp	L220
L219:
	movl	-52(%ebp), %eax
	movl	-84(%ebp), %edx
	movl	%edx, 24(%eax)
	movl	-84(%ebp), %eax
	movl	-80(%ebp), %edx
	movl	%edx, 16(%eax)
	movl	-84(%ebp), %eax
	movl	%eax, -52(%ebp)
L220:
	addl	$1, -48(%ebp)
L218:
	movl	-48(%ebp), %eax
	cmpl	-40(%ebp), %eax
	jl	L221
	jmp	L185
L203:
	cmpl	$-1, -32(%ebp)
	jne	L222
	jmp	L223
L226:
	movl	$0, _is_parsetree_valid
	movl	$12, (%esp)
	call	_malloc
	movl	%eax, -56(%ebp)
	movl	_top_of_stack, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$_Stack, %eax
	movl	(%eax), %eax
	movl	_FirstFollowSetsOfAll(,%eax,8), %eax
	movl	%eax, -56(%ebp)
	movl	-16(%ebp), %eax
	leal	2(%eax), %edx
	movl	-16(%ebp), %eax
	movl	28(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC135, (%esp)
	call	_printf
	jmp	L224
L225:
	movl	-56(%ebp), %eax
	movl	(%eax), %eax
	movl	_terminalMap(,%eax,4), %eax
	movl	%eax, 4(%esp)
	movl	$LC136, (%esp)
	call	_printf
	movl	-56(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -56(%ebp)
L224:
	cmpl	$0, -56(%ebp)
	jne	L225
	movl	-60(%ebp), %eax
	movl	%eax, (%esp)
	call	_getNextToken
	movl	%eax, -16(%ebp)
	movl	_top_of_stack, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$_Stack, %eax
	movl	(%eax), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %ebx
	movl	-16(%ebp), %eax
	addl	$2, %eax
	movl	%eax, (%esp)
	call	_findTerminal
	sall	$2, %eax
	addl	%ebx, %eax
	movl	(%eax), %eax
	movl	%eax, -32(%ebp)
L223:
	cmpl	$-1, -32(%ebp)
	je	L226
	cmpl	$-2, -32(%ebp)
	jne	L234
	movl	_top_of_stack, %eax
	subl	$1, %eax
	movl	%eax, _top_of_stack
	jmp	L228
L222:
	movl	_top_of_stack, %eax
	subl	$1, %eax
	movl	%eax, _top_of_stack
	jmp	L228
L231:
	nop
	jmp	L228
L232:
	nop
	jmp	L228
L234:
	nop
L185:
	jmp	L228
L229:
	addl	$340, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE44:
	.section .rdata,"dr"
LC137:
	.ascii "w\0"
	.text
	.globl	_printParseTree
	.def	_printParseTree;	.scl	2;	.type	32;	.endef
_printParseTree:
LFB45:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$LC137, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_fopen
	movl	%eax, -12(%ebp)
	movl	8(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_printInorder
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE45:
	.section .rdata,"dr"
LC138:
	.ascii "%s\11\0"
LC139:
	.ascii "%d\11\0"
LC140:
	.ascii " RULE NO !!!! %d\11\0"
LC141:
	.ascii "%f \0"
LC142:
	.ascii "----\11\0"
LC143:
	.ascii "---- ---- ---- ---- \0"
LC144:
	.ascii "RULE NO !!! %d\11\0"
LC145:
	.ascii "ROOT\11\0"
LC146:
	.ascii "yes\11\0"
LC147:
	.ascii "no %s\11\0"
	.text
	.globl	_printInorder
	.def	_printInorder;	.scl	2;	.type	32;	.endef
_printInorder:
LFB46:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	cmpl	$0, 8(%ebp)
	je	L251
	movl	$40, (%esp)
	call	_malloc
	movl	%eax, -12(%ebp)
	movl	8(%ebp), %eax
	movl	20(%eax), %eax
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_printInorder
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$10, (%esp)
	call	_fputc
	movl	8(%ebp), %eax
	movl	20(%eax), %eax
	testl	%eax, %eax
	jne	L240
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	movl	24(%eax), %eax
	movl	%eax, 8(%esp)
	movl	$LC138, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_fprintf
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	movl	28(%eax), %eax
	movl	%eax, 8(%esp)
	movl	$LC139, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_fprintf
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	addl	$2, %eax
	movl	%eax, 8(%esp)
	movl	$LC138, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_fprintf
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	%eax, 8(%esp)
	movl	$LC140, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_fprintf
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	je	L241
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	flds	32(%eax)
	fstpl	8(%esp)
	movl	$LC141, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_fprintf
	jmp	L243
L241:
	movl	12(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	$5, 8(%esp)
	movl	$1, 4(%esp)
	movl	$LC142, (%esp)
	call	_fwrite
	jmp	L243
L240:
	movl	12(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	$20, 8(%esp)
	movl	$1, 4(%esp)
	movl	$LC143, (%esp)
	call	_fwrite
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	%eax, 8(%esp)
	movl	$LC144, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_fprintf
L243:
	movl	8(%ebp), %eax
	movl	16(%eax), %eax
	testl	%eax, %eax
	jne	L244
	movl	12(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	$5, 8(%esp)
	movl	$1, 4(%esp)
	movl	$LC145, (%esp)
	call	_fwrite
	jmp	L245
L244:
	movl	8(%ebp), %eax
	movl	16(%eax), %eax
	movl	(%eax), %eax
	movl	_nonTerminalMap(,%eax,4), %eax
	movl	%eax, 8(%esp)
	movl	$LC138, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_fprintf
L245:
	movl	8(%ebp), %eax
	movl	20(%eax), %eax
	testl	%eax, %eax
	jne	L246
	movl	12(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	$4, 8(%esp)
	movl	$1, 4(%esp)
	movl	$LC146, (%esp)
	call	_fwrite
	jmp	L247
L246:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	_nonTerminalMap(,%eax,4), %eax
	movl	%eax, 8(%esp)
	movl	$LC147, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_fprintf
L247:
	movl	8(%ebp), %eax
	movl	20(%eax), %eax
	testl	%eax, %eax
	je	L252
	movl	8(%ebp), %eax
	movl	20(%eax), %eax
	movl	24(%eax), %eax
	movl	%eax, -12(%ebp)
	jmp	L249
L250:
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_printInorder
	movl	-12(%ebp), %eax
	movl	24(%eax), %eax
	movl	%eax, -12(%ebp)
L249:
	cmpl	$0, -12(%ebp)
	jne	L250
	jmp	L237
L251:
	nop
	jmp	L237
L252:
	nop
L237:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE46:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_remove;	.scl	2;	.type	32;	.endef
	.def	_fopen;	.scl	2;	.type	32;	.endef
	.def	_strcpy;	.scl	2;	.type	32;	.endef
	.def	_fprintf;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_malloc;	.scl	2;	.type	32;	.endef
	.def	_fillKeywordsHashTable;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_createAST;	.scl	2;	.type	32;	.endef
	.def	_free;	.scl	2;	.type	32;	.endef
	.def	_strcmp;	.scl	2;	.type	32;	.endef
	.def	_strlen;	.scl	2;	.type	32;	.endef
	.def	_fgets;	.scl	2;	.type	32;	.endef
	.def	_getNextToken;	.scl	2;	.type	32;	.endef
	.def	_fclose;	.scl	2;	.type	32;	.endef
	.def	_fputc;	.scl	2;	.type	32;	.endef
	.def	_fwrite;	.scl	2;	.type	32;	.endef
