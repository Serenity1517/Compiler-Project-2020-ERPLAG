	.file	"semantic.c"
	.comm	_semanticErrors, 4, 2
	.text
	.globl	_getSemanticErrorObject
	.def	_getSemanticErrorObject;	.scl	2;	.type	32;	.endef
_getSemanticErrorObject:
LFB17:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	_semanticErrors, %eax
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE17:
	.globl	_initializeErrorObject
	.def	_initializeErrorObject;	.scl	2;	.type	32;	.endef
_initializeErrorObject:
LFB18:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	$8, (%esp)
	call	_malloc
	movl	%eax, _semanticErrors
	movl	_semanticErrors, %eax
	movl	$0, (%eax)
	movl	_semanticErrors, %eax
	movl	$0, 4(%eax)
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.globl	_createErrorObject
	.def	_createErrorObject;	.scl	2;	.type	32;	.endef
_createErrorObject:
LFB19:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$160, (%esp)
	call	_malloc
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	$0, (%eax)
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE19:
	.section .rdata,"dr"
LC0:
	.ascii "SYMBOL TABLE CREATED\0"
	.text
	.globl	_semanticAnalyzer
	.def	_semanticAnalyzer;	.scl	2;	.type	32;	.endef
_semanticAnalyzer:
LFB20:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	call	_getAST
	movl	%eax, -12(%ebp)
	call	_initializeErrorObject
	movl	_semanticErrors, %eax
	movl	%eax, 8(%esp)
	movl	$0, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_processAST
	movl	$LC0, (%esp)
	call	_puts
	call	_getsymbolTable
	movl	%eax, -16(%ebp)
	movl	_semanticErrors, %eax
	movl	%eax, 8(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_analyzeAST
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_initializeDeclaredList
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_populateModuleSequenceMap
	movl	_semanticErrors, %eax
	movl	%eax, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_checkModules
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_computeOffsets
	call	_getsymbolTable
	movl	%eax, -20(%ebp)
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE20:
	.section .rdata,"dr"
LC1:
	.ascii "driverModule\0"
LC2:
	.ascii "\12Symbotable populated wrongly\0"
	.align 4
LC3:
	.ascii "\12Root Symboltable not populated with this function\0"
LC4:
	.ascii "LINE %d: %s\12\0"
	.align 4
LC5:
	.ascii "Assigning a value to for loop iterating variable is not allowed:\0"
	.align 4
LC6:
	.ascii "Array in formal parameter is of different type than actual parameter\0"
	.align 4
LC7:
	.ascii "Array in formal parameter is of different type than actual parameter(index ranges don't match)\0"
LC8:
	.ascii "NUM\0"
	.align 4
LC9:
	.ascii "Switch case on boolean variable must have exactly 2 cases, true and false\0"
LC10:
	.ascii "FALSE\0"
LC11:
	.ascii "TRUE\0"
	.text
	.globl	_analyzeAST
	.def	_analyzeAST;	.scl	2;	.type	32;	.endef
_analyzeAST:
LFB21:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$396, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movl	8(%ebp), %eax
	movl	60(%eax), %eax
	cmpl	$17, %eax
	ja	L189
	movl	L11(,%eax,4), %eax
	jmp	*%eax
	.section .rdata,"dr"
	.align 4
L11:
	.long	L10
	.long	L12
	.long	L189
	.long	L189
	.long	L189
	.long	L189
	.long	L189
	.long	L13
	.long	L14
	.long	L189
	.long	L189
	.long	L189
	.long	L15
	.long	L16
	.long	L17
	.long	L190
	.long	L19
	.long	L20
	.text
L10:
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	%eax, -28(%ebp)
	jmp	L21
L22:
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	call	_analyzeAST
	movl	-28(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -28(%ebp)
L21:
	cmpl	$0, -28(%ebp)
	jne	L22
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	72(%eax), %eax
	movl	16(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_analyzeAST
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	72(%eax), %eax
	movl	72(%eax), %eax
	movl	%eax, -28(%ebp)
	jmp	L23
L24:
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	call	_analyzeAST
	movl	-28(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -28(%ebp)
L23:
	cmpl	$0, -28(%ebp)
	jne	L24
	jmp	L9
L12:
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	60(%eax), %eax
	cmpl	$21, %eax
	jne	L25
	movl	$-1, 16(%esp)
	movl	$0, 12(%esp)
	movl	$1, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_lookupString
	movl	%eax, -200(%ebp)
	cmpl	$0, -200(%ebp)
	jne	L26
	movl	$LC2, (%esp)
	call	_puts
L26:
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	72(%eax), %eax
	movl	72(%eax), %eax
	movl	%eax, -32(%ebp)
	jmp	L27
L28:
	movl	-200(%ebp), %eax
	movl	88(%eax), %eax
	movl	16(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	-32(%ebp), %eax
	movl	%eax, (%esp)
	call	_analyzeAST
	movl	-32(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -32(%ebp)
L27:
	cmpl	$0, -32(%ebp)
	jne	L28
	jmp	L191
L25:
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	leal	21(%eax), %edx
	movl	$-1, 16(%esp)
	movl	$0, 12(%esp)
	movl	$2, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_lookupString
	movl	%eax, -204(%ebp)
	cmpl	$0, -204(%ebp)
	jne	L30
	movl	$LC3, (%esp)
	call	_printf
L30:
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	xorl	$1, %eax
	testb	%al, %al
	je	L191
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	72(%eax), %eax
	movl	72(%eax), %eax
	movl	%eax, -36(%ebp)
	jmp	L31
L32:
	movl	-204(%ebp), %eax
	movl	88(%eax), %eax
	movl	16(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	_analyzeAST
	movl	-36(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -36(%ebp)
L31:
	cmpl	$0, -36(%ebp)
	jne	L32
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	72(%eax), %eax
	movl	%eax, -40(%ebp)
	movl	-40(%ebp), %eax
	movl	60(%eax), %eax
	cmpl	$21, %eax
	je	L191
	jmp	L33
L38:
	movl	-40(%ebp), %eax
	movzbl	(%eax), %eax
	xorl	$1, %eax
	testb	%al, %al
	je	L34
	call	_createErrorObject
	movl	%eax, -208(%ebp)
	movl	-40(%ebp), %eax
	movl	76(%eax), %eax
	movl	44(%eax), %edx
	movl	-208(%ebp), %eax
	movl	%edx, 156(%eax)
	movl	-208(%ebp), %eax
	addl	$4, %eax
	movl	$1981837134, (%eax)
	movl	$1702194273, 4(%eax)
	movl	$1935767328, 8(%eax)
	movl	$1936941344, 12(%eax)
	movl	$1701734249, 16(%eax)
	movl	$1868963940, 20(%eax)
	movl	$1970217074, 24(%eax)
	movl	$1953853556, 28(%eax)
	movl	$1918988320, 32(%eax)
	movl	$540700001, 36(%eax)
	movb	$0, 40(%eax)
	movl	-40(%ebp), %eax
	movl	76(%eax), %eax
	leal	21(%eax), %edx
	movl	-208(%ebp), %eax
	addl	$4, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcat
	movl	-208(%ebp), %eax
	leal	4(%eax), %edx
	movl	-208(%ebp), %eax
	movl	156(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	call	_printf
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -44(%ebp)
	cmpl	$0, -44(%ebp)
	jne	L36
	movl	16(%ebp), %eax
	movl	-208(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L34
L37:
	movl	-44(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -44(%ebp)
L36:
	movl	-44(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L37
	movl	-44(%ebp), %eax
	movl	-208(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
L34:
	movl	-40(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -40(%ebp)
L33:
	cmpl	$0, -40(%ebp)
	jne	L38
	jmp	L191
L17:
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_extractTypeOfExpression
	jmp	L9
L15:
	movl	8(%ebp), %eax
	movl	68(%eax), %eax
	movl	%eax, -48(%ebp)
	jmp	L39
L46:
	movl	-48(%ebp), %eax
	movl	60(%eax), %eax
	cmpl	$7, %eax
	jne	L40
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	leal	21(%eax), %edx
	movl	-48(%ebp), %eax
	movl	76(%eax), %eax
	addl	$21, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L40
	call	_createErrorObject
	movl	%eax, -212(%ebp)
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	44(%eax), %edx
	movl	-212(%ebp), %eax
	movl	%edx, 156(%eax)
	movl	-212(%ebp), %eax
	addl	$4, %eax
	movl	$LC5, %ebx
	movl	$65, %edx
	movl	(%ebx), %ecx
	movl	%ecx, (%eax)
	movl	-4(%ebx,%edx), %ecx
	movl	%ecx, -4(%eax,%edx)
	leal	4(%eax), %edi
	andl	$-4, %edi
	subl	%edi, %eax
	subl	%eax, %ebx
	addl	%eax, %edx
	andl	$-4, %edx
	movl	%edx, %eax
	shrl	$2, %eax
	movl	%ebx, %esi
	movl	%eax, %ecx
	rep movsl
	movl	-212(%ebp), %eax
	leal	4(%eax), %edx
	movl	-212(%ebp), %eax
	movl	156(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	call	_printf
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -52(%ebp)
	cmpl	$0, -52(%ebp)
	jne	L43
	movl	16(%ebp), %eax
	movl	-212(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L45
L44:
	movl	-52(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -52(%ebp)
L43:
	movl	-52(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L44
	movl	-52(%ebp), %eax
	movl	-212(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L45
L40:
	movl	-48(%ebp), %eax
	movl	68(%eax), %eax
	movl	%eax, -48(%ebp)
L39:
	movl	-48(%ebp), %eax
	movl	68(%eax), %eax
	testl	%eax, %eax
	jne	L46
L45:
	movl	8(%ebp), %eax
	movl	68(%eax), %eax
	movl	%eax, -56(%ebp)
	jmp	L47
L48:
	movl	-56(%ebp), %eax
	movl	68(%eax), %eax
	movl	%eax, -56(%ebp)
L47:
	movl	-56(%ebp), %eax
	movl	60(%eax), %eax
	cmpl	$1, %eax
	jne	L48
	movl	-56(%ebp), %eax
	movl	76(%eax), %eax
	movl	60(%eax), %eax
	cmpl	$21, %eax
	je	L49
	movl	-56(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	72(%eax), %eax
	movl	%eax, -60(%ebp)
	jmp	L50
L53:
	movl	-60(%ebp), %eax
	movl	60(%eax), %eax
	cmpl	$21, %eax
	je	L192
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	leal	21(%eax), %edx
	movl	-60(%ebp), %eax
	movl	76(%eax), %eax
	addl	$21, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L52
	movl	-60(%ebp), %eax
	movb	$1, (%eax)
L52:
	movl	-60(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -60(%ebp)
L50:
	cmpl	$0, -60(%ebp)
	jne	L53
	jmp	L49
L192:
	nop
L49:
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	%eax, -216(%ebp)
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	60(%eax), %eax
	cmpl	$20, %eax
	jne	L54
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	60(%eax), %eax
	cmpl	$20, %eax
	jne	L54
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	44(%eax), %eax
	movl	8(%ebp), %edx
	movl	76(%edx), %edx
	addl	$21, %edx
	movl	%eax, 16(%esp)
	movl	$1, 12(%esp)
	movl	$0, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_lookupString
	movl	%eax, -220(%ebp)
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	44(%eax), %eax
	movl	8(%ebp), %edx
	movl	76(%edx), %edx
	movl	72(%edx), %edx
	addl	$21, %edx
	movl	%eax, 16(%esp)
	movl	$1, 12(%esp)
	movl	$0, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_lookupString
	movl	%eax, -224(%ebp)
	cmpl	$0, -220(%ebp)
	jne	L55
	call	_createErrorObject
	movl	%eax, -228(%ebp)
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	44(%eax), %edx
	movl	-228(%ebp), %eax
	movl	%edx, 156(%eax)
	movl	-228(%ebp), %eax
	addl	$4, %eax
	movl	$542328908, (%eax)
	movl	$1092642415, 4(%eax)
	movl	$1734964083, 8(%eax)
	movl	$1852140910, 12(%eax)
	movl	$1953702004, 16(%eax)
	movl	$1835365473, 20(%eax)
	movl	$544501349, 24(%eax)
	movl	$1847620457, 28(%eax)
	movl	$1679848559, 32(%eax)
	movl	$1634493285, 36(%eax)
	movl	$6579570, 40(%eax)
	movl	-228(%ebp), %eax
	leal	4(%eax), %edx
	movl	-228(%ebp), %eax
	movl	156(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	call	_printf
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -64(%ebp)
	cmpl	$0, -64(%ebp)
	jne	L58
	movl	16(%ebp), %eax
	movl	-228(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L9
L59:
	movl	-64(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -64(%ebp)
L58:
	movl	-64(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L59
	movl	-64(%ebp), %eax
	movl	-228(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L9
L55:
	cmpl	$0, -224(%ebp)
	jne	L60
	call	_createErrorObject
	movl	%eax, -232(%ebp)
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	44(%eax), %edx
	movl	-232(%ebp), %eax
	movl	%edx, 156(%eax)
	movl	-232(%ebp), %eax
	addl	$4, %eax
	movl	$542328914, (%eax)
	movl	$1092642415, 4(%eax)
	movl	$1734964083, 8(%eax)
	movl	$1852140910, 12(%eax)
	movl	$1953702004, 16(%eax)
	movl	$1835365473, 20(%eax)
	movl	$544501349, 24(%eax)
	movl	$1847620457, 28(%eax)
	movl	$1679848559, 32(%eax)
	movl	$1634493285, 36(%eax)
	movl	$6579570, 40(%eax)
	movl	-232(%ebp), %eax
	leal	4(%eax), %edx
	movl	-232(%ebp), %eax
	movl	156(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	call	_printf
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -68(%ebp)
	cmpl	$0, -68(%ebp)
	jne	L63
	movl	16(%ebp), %eax
	movl	-232(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L9
L64:
	movl	-68(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -68(%ebp)
L63:
	movl	-68(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L64
	movl	-68(%ebp), %eax
	movl	-232(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L9
L60:
	movl	-220(%ebp), %eax
	movl	72(%eax), %eax
	cmpl	$1, %eax
	jne	L54
	movl	-224(%ebp), %eax
	movl	72(%eax), %eax
	cmpl	$1, %eax
	jne	L54
	movl	-220(%ebp), %eax
	addl	$16, %eax
	movl	%eax, -236(%ebp)
	movl	-224(%ebp), %eax
	addl	$16, %eax
	movl	%eax, -240(%ebp)
	movl	-236(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	$-1, %eax
	je	L54
	movl	-236(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	$-1, %eax
	je	L54
	movl	-240(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	$-1, %eax
	je	L54
	movl	-240(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	$-1, %eax
	je	L54
	movl	-236(%ebp), %eax
	movl	4(%eax), %edx
	movl	-240(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	%eax, %edx
	jne	L54
	movl	-236(%ebp), %eax
	movl	8(%eax), %edx
	movl	-240(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	%eax, %edx
	je	L193
L54:
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	16(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_extractTypeOfExpression
	movl	%eax, -244(%ebp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-216(%ebp), %eax
	movl	%eax, (%esp)
	call	_extractTypeOfExpression
	movl	%eax, -248(%ebp)
	cmpl	$-1, -248(%ebp)
	je	L189
	cmpl	$-1, -244(%ebp)
	je	L189
	movl	-244(%ebp), %eax
	cmpl	-248(%ebp), %eax
	je	L194
	call	_createErrorObject
	movl	%eax, -252(%ebp)
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	44(%eax), %edx
	movl	-252(%ebp), %eax
	movl	%edx, 156(%eax)
	movl	-252(%ebp), %eax
	addl	$4, %eax
	movl	$1701869908, (%eax)
	movl	$1936280864, 4(%eax)
	movl	$1668571469, 8(%eax)
	movl	$1852383336, 12(%eax)
	movl	$1936933152, 16(%eax)
	movl	$1835951977, 20(%eax)
	movl	$544501349, 24(%eax)
	movl	$1952543827, 28(%eax)
	movl	$1852140901, 32(%eax)
	movw	$11892, 36(%eax)
	movb	$0, 38(%eax)
	movl	-252(%ebp), %eax
	leal	4(%eax), %edx
	movl	-252(%ebp), %eax
	movl	156(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	call	_printf
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -72(%ebp)
	cmpl	$0, -72(%ebp)
	jne	L67
	movl	16(%ebp), %eax
	movl	-252(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L194
L68:
	movl	-72(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -72(%ebp)
L67:
	movl	-72(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L68
	movl	-72(%ebp), %eax
	movl	-252(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L194
L16:
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	leal	21(%eax), %edx
	movl	$-1, 16(%esp)
	movl	$1, 12(%esp)
	movl	$2, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_lookupString
	movl	%eax, -256(%ebp)
	movl	-256(%ebp), %eax
	movl	32(%eax), %eax
	movl	60(%eax), %eax
	cmpl	$21, %eax
	jne	L69
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	60(%eax), %eax
	cmpl	$21, %eax
	je	L74
	call	_createErrorObject
	movl	%eax, -260(%ebp)
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	44(%eax), %edx
	movl	-260(%ebp), %eax
	movl	%edx, 156(%eax)
	movl	-260(%ebp), %eax
	addl	$4, %eax
	movl	$1684631382, (%eax)
	movl	$1853187616, 4(%eax)
	movl	$1869182051, 8(%eax)
	movl	$1970085998, 12(%eax)
	movl	$1847620723, 16(%eax)
	movl	$1914729583, 20(%eax)
	movl	$1920300133, 24(%eax)
	movl	$1851859054, 28(%eax)
	movl	$1768453241, 32(%eax)
	movw	$26478, 36(%eax)
	movb	$0, 38(%eax)
	movl	-260(%ebp), %eax
	leal	4(%eax), %edx
	movl	-260(%ebp), %eax
	movl	156(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	call	_printf
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -76(%ebp)
	cmpl	$0, -76(%ebp)
	jne	L72
	movl	16(%ebp), %eax
	movl	-260(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L74
L73:
	movl	-76(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -76(%ebp)
L72:
	movl	-76(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L73
	movl	-76(%ebp), %eax
	movl	-260(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L74
L69:
	movl	-256(%ebp), %eax
	addl	$44, %eax
	movl	%eax, -264(%ebp)
	movl	$0, -80(%ebp)
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	%eax, -84(%ebp)
	jmp	L75
L96:
	movl	-84(%ebp), %eax
	movl	60(%eax), %eax
	cmpl	$21, %eax
	jne	L76
	call	_createErrorObject
	movl	%eax, -268(%ebp)
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	44(%eax), %edx
	movl	-268(%ebp), %eax
	movl	%edx, 156(%eax)
	movl	-268(%ebp), %eax
	addl	$4, %eax
	movl	$1684631382, (%eax)
	movl	$1853187616, 4(%eax)
	movl	$1869182051, 8(%eax)
	movl	$1970085998, 12(%eax)
	movl	$1847620723, 16(%eax)
	movl	$1914729583, 20(%eax)
	movl	$1920300133, 24(%eax)
	movl	$1851859054, 28(%eax)
	movl	$1768453241, 32(%eax)
	movw	$26478, 36(%eax)
	movb	$0, 38(%eax)
	movl	-268(%ebp), %eax
	leal	4(%eax), %edx
	movl	-268(%ebp), %eax
	movl	156(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	call	_printf
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -88(%ebp)
	cmpl	$0, -88(%ebp)
	jne	L78
	movl	16(%ebp), %eax
	movl	-268(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L76
L79:
	movl	-88(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -88(%ebp)
L78:
	movl	-88(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L79
	movl	-88(%ebp), %eax
	movl	-268(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
L76:
	movl	-84(%ebp), %eax
	movl	44(%eax), %eax
	movl	-84(%ebp), %edx
	addl	$21, %edx
	movl	%eax, 16(%esp)
	movl	$1, 12(%esp)
	movl	$0, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_lookupString
	movl	%eax, -272(%ebp)
	cmpl	$0, -272(%ebp)
	jne	L80
	call	_createErrorObject
	movl	%eax, -284(%ebp)
	movl	-84(%ebp), %eax
	movl	44(%eax), %edx
	movl	-284(%ebp), %eax
	movl	%edx, 156(%eax)
	movl	-284(%ebp), %eax
	addl	$4, %eax
	movl	$1886680399, (%eax)
	movl	$1344304245, 4(%eax)
	movl	$1835102817, 8(%eax)
	movl	$1919251557, 12(%eax)
	movl	$1953459744, 16(%eax)
	movl	$1667589152, 20(%eax)
	movl	$1701994860, 24(%eax)
	movw	$100, 28(%eax)
	movl	-284(%ebp), %eax
	leal	4(%eax), %edx
	movl	-284(%ebp), %eax
	movl	156(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	call	_printf
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -92(%ebp)
	cmpl	$0, -92(%ebp)
	jne	L83
	movl	16(%ebp), %eax
	movl	-284(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L85
L84:
	movl	-92(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -92(%ebp)
L83:
	movl	-92(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L84
	movl	-92(%ebp), %eax
	movl	-284(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L85
L80:
	movl	-272(%ebp), %eax
	movl	72(%eax), %eax
	cmpl	$1, %eax
	jne	L86
	call	_createErrorObject
	movl	%eax, -276(%ebp)
	movl	-84(%ebp), %eax
	movl	44(%eax), %edx
	movl	-276(%ebp), %eax
	movl	%edx, 156(%eax)
	movl	-276(%ebp), %eax
	addl	$4, %eax
	movl	$1668183366, (%eax)
	movl	$1852795252, 4(%eax)
	movl	$1851876128, 8(%eax)
	movl	$544501614, 12(%eax)
	movl	$1970562418, 16(%eax)
	movl	$1629515378, 20(%eax)
	movl	$2036429426, 24(%eax)
	movb	$0, 28(%eax)
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -96(%ebp)
	cmpl	$0, -96(%ebp)
	jne	L89
	movl	16(%ebp), %eax
	movl	-276(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L88
L90:
	movl	-96(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -96(%ebp)
L89:
	movl	-96(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L90
	movl	-96(%ebp), %eax
	movl	-276(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
L88:
	movl	-84(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -84(%ebp)
	addl	$1, -80(%ebp)
	jmp	L75
L86:
	movl	-272(%ebp), %eax
	movl	16(%eax), %edx
	movl	-264(%ebp), %eax
	movl	4(%eax), %ecx
	movl	-80(%ebp), %eax
	imull	$60, %eax, %eax
	addl	%ecx, %eax
	movl	(%eax), %eax
	cmpl	%eax, %edx
	je	L85
	call	_createErrorObject
	movl	%eax, -280(%ebp)
	movl	-84(%ebp), %eax
	movl	44(%eax), %edx
	movl	-280(%ebp), %eax
	movl	%edx, 156(%eax)
	movl	-280(%ebp), %eax
	addl	$4, %eax
	movl	$1886680399, (%eax)
	movl	$1948284021, 4(%eax)
	movl	$1936027769, 8(%eax)
	movl	$1936289056, 12(%eax)
	movl	$1668571501, 16(%eax)
	movw	$104, 20(%eax)
	movl	-280(%ebp), %eax
	leal	4(%eax), %edx
	movl	-280(%ebp), %eax
	movl	156(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	call	_printf
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -100(%ebp)
	cmpl	$0, -100(%ebp)
	jne	L93
	movl	16(%ebp), %eax
	movl	-280(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L92
L94:
	movl	-100(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -100(%ebp)
L93:
	movl	-100(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L94
	movl	-100(%ebp), %eax
	movl	-280(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
L92:
	movl	-84(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -84(%ebp)
	addl	$1, -80(%ebp)
	jmp	L75
L85:
	addl	$1, -80(%ebp)
	movl	-84(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -84(%ebp)
L75:
	cmpl	$0, -84(%ebp)
	je	L95
	movl	-264(%ebp), %eax
	movl	12(%eax), %eax
	cmpl	-80(%ebp), %eax
	jg	L96
L95:
	cmpl	$0, -84(%ebp)
	jne	L97
	movl	-264(%ebp), %eax
	movl	12(%eax), %eax
	cmpl	-80(%ebp), %eax
	je	L74
L97:
	call	_createErrorObject
	movl	%eax, -288(%ebp)
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	44(%eax), %edx
	movl	-288(%ebp), %eax
	movl	%edx, 156(%eax)
	movl	-288(%ebp), %eax
	addl	$4, %eax
	movl	$1886680399, (%eax)
	movl	$1881175157, 4(%eax)
	movl	$1835102817, 8(%eax)
	movl	$1919251557, 12(%eax)
	movl	$1970234144, 16(%eax)
	movl	$1830843502, 20(%eax)
	movl	$1634562921, 24(%eax)
	movl	$6841204, 28(%eax)
	movl	-288(%ebp), %eax
	leal	4(%eax), %edx
	movl	-288(%ebp), %eax
	movl	156(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	call	_printf
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -104(%ebp)
	cmpl	$0, -104(%ebp)
	jne	L99
	movl	16(%ebp), %eax
	movl	-288(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L74
L100:
	movl	-104(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -104(%ebp)
L99:
	movl	-104(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L100
	movl	-104(%ebp), %eax
	movl	-288(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
L74:
	movl	-256(%ebp), %eax
	addl	$44, %eax
	movl	%eax, -292(%ebp)
	movl	-292(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -296(%ebp)
	movl	$0, -108(%ebp)
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	72(%eax), %eax
	movl	%eax, -112(%ebp)
	movl	$0, -116(%ebp)
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	72(%eax), %eax
	movl	%eax, -120(%ebp)
	jmp	L101
L102:
	addl	$1, -116(%ebp)
	movl	-120(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -120(%ebp)
L101:
	cmpl	$0, -120(%ebp)
	jne	L102
	movl	-292(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	-116(%ebp), %eax
	je	L107
	call	_createErrorObject
	movl	%eax, -300(%ebp)
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	44(%eax), %edx
	movl	-300(%ebp), %eax
	movl	%edx, 156(%eax)
	movl	-300(%ebp), %eax
	addl	$4, %eax
	movl	$1970302537, (%eax)
	movl	$1634738292, 4(%eax)
	movl	$1701667186, 8(%eax)
	movl	$544367988, 12(%eax)
	movl	$1853189987, 16(%eax)
	movl	$1768759412, 20(%eax)
	movl	$1952542067, 24(%eax)
	movw	$26723, 28(%eax)
	movb	$0, 30(%eax)
	movl	-300(%ebp), %eax
	leal	4(%eax), %edx
	movl	-300(%ebp), %eax
	movl	156(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	call	_printf
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -124(%ebp)
	cmpl	$0, -124(%ebp)
	jne	L105
	movl	16(%ebp), %eax
	movl	-300(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L107
L106:
	movl	-124(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -124(%ebp)
L105:
	movl	-124(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L106
	movl	-124(%ebp), %eax
	movl	-300(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L107
L135:
	movl	-112(%ebp), %eax
	movl	44(%eax), %eax
	movl	-112(%ebp), %edx
	addl	$21, %edx
	movl	%eax, 16(%esp)
	movl	$1, 12(%esp)
	movl	$0, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_lookupString
	movl	%eax, -304(%ebp)
	cmpl	$0, -304(%ebp)
	jne	L108
	call	_createErrorObject
	movl	%eax, -308(%ebp)
	movl	-112(%ebp), %eax
	movl	44(%eax), %edx
	movl	-308(%ebp), %eax
	movl	%edx, 156(%eax)
	movl	-308(%ebp), %eax
	addl	$4, %eax
	movl	$1970302537, (%eax)
	movl	$1634738292, 4(%eax)
	movl	$1701667186, 8(%eax)
	movl	$544367988, 12(%eax)
	movl	$1953723757, 16(%eax)
	movl	$543515168, 20(%eax)
	movl	$1818453348, 24(%eax)
	movl	$1684370017, 28(%eax)
	movl	$1717920288, 32(%eax)
	movl	$543519343, 36(%eax)
	movl	$6648693, 40(%eax)
	movl	-308(%ebp), %eax
	leal	4(%eax), %edx
	movl	-308(%ebp), %eax
	movl	156(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	call	_printf
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -128(%ebp)
	cmpl	$0, -128(%ebp)
	jne	L111
	movl	16(%ebp), %eax
	movl	-308(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L110
L112:
	movl	-128(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -128(%ebp)
L111:
	movl	-128(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L112
	movl	-128(%ebp), %eax
	movl	-308(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
L110:
	movl	-112(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -112(%ebp)
	addl	$1, -108(%ebp)
	jmp	L107
L108:
	movl	-304(%ebp), %eax
	movl	16(%eax), %edx
	movl	-108(%ebp), %eax
	imull	$60, %eax, %ecx
	movl	-296(%ebp), %eax
	addl	%ecx, %eax
	movl	(%eax), %eax
	cmpl	%eax, %edx
	je	L113
	movl	-304(%ebp), %eax
	movl	72(%eax), %eax
	testl	%eax, %eax
	jne	L113
	movl	-108(%ebp), %eax
	imull	$60, %eax, %edx
	movl	-296(%ebp), %eax
	addl	%edx, %eax
	movl	56(%eax), %eax
	testl	%eax, %eax
	jne	L113
	call	_createErrorObject
	movl	%eax, -312(%ebp)
	movl	-112(%ebp), %eax
	movl	44(%eax), %edx
	movl	-312(%ebp), %eax
	movl	%edx, 156(%eax)
	movl	-312(%ebp), %eax
	addl	$4, %eax
	movl	$1970302537, (%eax)
	movl	$1634738292, 4(%eax)
	movl	$1701667186, 8(%eax)
	movl	$544367988, 12(%eax)
	movl	$1701869940, 16(%eax)
	movl	$1936289056, 20(%eax)
	movl	$1668571501, 24(%eax)
	movw	$104, 28(%eax)
	movl	-312(%ebp), %eax
	leal	4(%eax), %edx
	movl	-312(%ebp), %eax
	movl	156(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	call	_printf
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -132(%ebp)
	cmpl	$0, -132(%ebp)
	jne	L116
	movl	16(%ebp), %eax
	movl	-312(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L115
L117:
	movl	-132(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -132(%ebp)
L116:
	movl	-132(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L117
	movl	-132(%ebp), %eax
	movl	-312(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
L115:
	movl	-112(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -112(%ebp)
	addl	$1, -108(%ebp)
	jmp	L107
L113:
	movl	-304(%ebp), %eax
	movl	72(%eax), %eax
	cmpl	$1, %eax
	jne	L118
	movl	-108(%ebp), %eax
	imull	$60, %eax, %edx
	movl	-296(%ebp), %eax
	addl	%edx, %eax
	movl	56(%eax), %eax
	cmpl	$1, %eax
	jne	L118
	movl	-304(%ebp), %eax
	movl	16(%eax), %edx
	movl	-108(%ebp), %eax
	imull	$60, %eax, %ecx
	movl	-296(%ebp), %eax
	addl	%ecx, %eax
	movl	(%eax), %eax
	cmpl	%eax, %edx
	je	L119
	call	_createErrorObject
	movl	%eax, -316(%ebp)
	movl	-112(%ebp), %eax
	movl	44(%eax), %edx
	movl	-316(%ebp), %eax
	movl	%edx, 156(%eax)
	movl	-316(%ebp), %eax
	addl	$4, %eax
	movl	$LC6, %ebx
	movl	$69, %edx
	movl	(%ebx), %ecx
	movl	%ecx, (%eax)
	movl	-4(%ebx,%edx), %ecx
	movl	%ecx, -4(%eax,%edx)
	leal	4(%eax), %edi
	andl	$-4, %edi
	subl	%edi, %eax
	subl	%eax, %ebx
	addl	%eax, %edx
	andl	$-4, %edx
	movl	%edx, %eax
	shrl	$2, %eax
	movl	%ebx, %esi
	movl	%eax, %ecx
	rep movsl
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -136(%ebp)
	movl	-316(%ebp), %eax
	leal	4(%eax), %edx
	movl	-316(%ebp), %eax
	movl	156(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	call	_printf
	cmpl	$0, -136(%ebp)
	jne	L122
	movl	16(%ebp), %eax
	movl	-316(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L124
L123:
	movl	-136(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -136(%ebp)
L122:
	movl	-136(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L123
	movl	-136(%ebp), %eax
	movl	-316(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L124
L119:
	movl	-304(%ebp), %eax
	movl	24(%eax), %eax
	testl	%eax, %eax
	js	L124
	movl	-304(%ebp), %eax
	movl	20(%eax), %eax
	testl	%eax, %eax
	js	L124
	movl	-108(%ebp), %eax
	imull	$60, %eax, %edx
	movl	-296(%ebp), %eax
	addl	%edx, %eax
	movl	8(%eax), %eax
	testl	%eax, %eax
	js	L124
	movl	-108(%ebp), %eax
	imull	$60, %eax, %edx
	movl	-296(%ebp), %eax
	addl	%edx, %eax
	movl	4(%eax), %eax
	testl	%eax, %eax
	js	L124
	movl	-304(%ebp), %eax
	movl	24(%eax), %edx
	movl	-108(%ebp), %eax
	imull	$60, %eax, %ecx
	movl	-296(%ebp), %eax
	addl	%ecx, %eax
	movl	8(%eax), %eax
	cmpl	%eax, %edx
	jne	L125
	movl	-304(%ebp), %eax
	movl	20(%eax), %edx
	movl	-108(%ebp), %eax
	imull	$60, %eax, %ecx
	movl	-296(%ebp), %eax
	addl	%ecx, %eax
	movl	4(%eax), %eax
	cmpl	%eax, %edx
	je	L124
L125:
	call	_createErrorObject
	movl	%eax, -320(%ebp)
	movl	-112(%ebp), %eax
	movl	44(%eax), %edx
	movl	-320(%ebp), %eax
	movl	%edx, 156(%eax)
	movl	-320(%ebp), %eax
	addl	$4, %eax
	movl	$LC7, %ebx
	movl	$95, %edx
	movl	(%ebx), %ecx
	movl	%ecx, (%eax)
	movl	-4(%ebx,%edx), %ecx
	movl	%ecx, -4(%eax,%edx)
	leal	4(%eax), %edi
	andl	$-4, %edi
	subl	%edi, %eax
	subl	%eax, %ebx
	addl	%eax, %edx
	andl	$-4, %edx
	movl	%edx, %eax
	shrl	$2, %eax
	movl	%ebx, %esi
	movl	%eax, %ecx
	rep movsl
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -140(%ebp)
	movl	-320(%ebp), %eax
	leal	4(%eax), %edx
	movl	-320(%ebp), %eax
	movl	156(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	call	_printf
	cmpl	$0, -140(%ebp)
	jne	L127
	movl	16(%ebp), %eax
	movl	-320(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L124
L128:
	movl	-140(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -140(%ebp)
L127:
	movl	-140(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L128
	movl	-140(%ebp), %eax
	movl	-320(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
L124:
	movl	-112(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -112(%ebp)
	addl	$1, -108(%ebp)
	jmp	L107
L118:
	movl	-304(%ebp), %eax
	movl	72(%eax), %edx
	movl	-108(%ebp), %eax
	imull	$60, %eax, %ecx
	movl	-296(%ebp), %eax
	addl	%ecx, %eax
	movl	56(%eax), %eax
	cmpl	%eax, %edx
	je	L129
	call	_createErrorObject
	movl	%eax, -324(%ebp)
	movl	-112(%ebp), %eax
	movl	44(%eax), %edx
	movl	-324(%ebp), %eax
	movl	%edx, 156(%eax)
	movl	-324(%ebp), %eax
	addl	$4, %eax
	movl	$1970302537, (%eax)
	movl	$1634738292, 4(%eax)
	movl	$1701667186, 8(%eax)
	movl	$544367988, 12(%eax)
	movl	$1701869940, 16(%eax)
	movl	$1936289056, 20(%eax)
	movl	$1668571501, 24(%eax)
	movw	$8296, 28(%eax)
	movb	$0, 30(%eax)
	movl	-324(%ebp), %eax
	leal	4(%eax), %edx
	movl	-324(%ebp), %eax
	movl	156(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	call	_printf
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -144(%ebp)
	cmpl	$0, -144(%ebp)
	jne	L132
	movl	16(%ebp), %eax
	movl	-324(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L131
L133:
	movl	-144(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -144(%ebp)
L132:
	movl	-144(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L133
	movl	-144(%ebp), %eax
	movl	-324(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
L131:
	movl	-112(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -112(%ebp)
	addl	$1, -108(%ebp)
	jmp	L107
L129:
	addl	$1, -108(%ebp)
	movl	-112(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -112(%ebp)
L107:
	cmpl	$0, -112(%ebp)
	je	L195
	movl	-292(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	-108(%ebp), %eax
	jg	L135
	jmp	L195
L19:
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	44(%eax), %eax
	movl	8(%ebp), %edx
	movl	76(%edx), %edx
	addl	$21, %edx
	movl	%eax, 16(%esp)
	movl	$1, 12(%esp)
	movl	$0, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_lookupString
	movl	%eax, -328(%ebp)
	movl	-328(%ebp), %eax
	movl	16(%eax), %eax
	cmpl	$1, %eax
	je	L137
	cmpl	$1, %eax
	jb	L138
	cmpl	$2, %eax
	je	L139
	jmp	L136
L138:
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	72(%eax), %eax
	movl	60(%eax), %eax
	cmpl	$21, %eax
	jne	L140
	call	_createErrorObject
	movl	%eax, -332(%ebp)
	movl	8(%ebp), %eax
	movl	4(%eax), %edx
	movl	-332(%ebp), %eax
	movl	%edx, 156(%eax)
	movl	-332(%ebp), %eax
	addl	$4, %eax
	movl	$1634100548, (%eax)
	movl	$544500853, 4(%eax)
	movl	$1952543827, 8(%eax)
	movl	$1852140901, 12(%eax)
	movl	$1768759412, 16(%eax)
	movl	$1852404595, 20(%eax)
	movl	$1768693863, 24(%eax)
	movl	$2123118, 28(%eax)
	movl	-332(%ebp), %eax
	leal	4(%eax), %edx
	movl	-332(%ebp), %eax
	movl	156(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	call	_printf
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -148(%ebp)
	cmpl	$0, -148(%ebp)
	jne	L142
	movl	16(%ebp), %eax
	movl	-332(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L140
L143:
	movl	-148(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -148(%ebp)
L142:
	movl	-148(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L143
	movl	-148(%ebp), %eax
	movl	-332(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
L140:
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	%eax, -152(%ebp)
	jmp	L144
L150:
	movl	-152(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	60(%eax), %eax
	cmpl	$18, %eax
	jne	L145
	movl	-152(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	$LC8, 4(%esp)
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L145
	movl	-152(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -152(%ebp)
	jmp	L144
L145:
	call	_createErrorObject
	movl	%eax, -336(%ebp)
	movl	-152(%ebp), %eax
	movl	(%eax), %edx
	movl	-336(%ebp), %eax
	movl	%edx, 156(%eax)
	movl	-336(%ebp), %eax
	addl	$4, %eax
	movl	$1702060355, (%eax)
	movl	$1685016096, 4(%eax)
	movl	$1936269413, 8(%eax)
	movl	$1953459744, 12(%eax)
	movl	$544104736, 16(%eax)
	movl	$1702129257, 20(%eax)
	movl	$544367975, 24(%eax)
	movb	$0, 28(%eax)
	movl	-336(%ebp), %eax
	leal	4(%eax), %edx
	movl	-336(%ebp), %eax
	movl	156(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	call	_printf
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -156(%ebp)
	cmpl	$0, -156(%ebp)
	jne	L148
	movl	16(%ebp), %eax
	movl	-336(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L147
L149:
	movl	-156(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -156(%ebp)
L148:
	movl	-156(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L149
	movl	-156(%ebp), %eax
	movl	-336(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
L147:
	movl	-152(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -152(%ebp)
L144:
	cmpl	$0, -152(%ebp)
	jne	L150
	jmp	L136
L137:
	call	_createErrorObject
	movl	%eax, -340(%ebp)
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	44(%eax), %edx
	movl	-340(%ebp), %eax
	movl	%edx, 156(%eax)
	movl	-340(%ebp), %eax
	addl	$4, %eax
	movl	$1953068883, (%eax)
	movl	$1852401763, 4(%eax)
	movl	$1635131495, 8(%eax)
	movl	$1650551154, 12(%eax)
	movl	$1663067500, 16(%eax)
	movl	$1869508193, 20(%eax)
	movl	$1700929652, 24(%eax)
	movl	$543584032, 28(%eax)
	movl	$1818322290, 32(%eax)
	movl	$1887007776, 36(%eax)
	movl	$3809381, 40(%eax)
	movl	-340(%ebp), %eax
	leal	4(%eax), %edx
	movl	-340(%ebp), %eax
	movl	156(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	call	_printf
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -160(%ebp)
	cmpl	$0, -160(%ebp)
	jne	L153
	movl	16(%ebp), %eax
	movl	-340(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L136
L154:
	movl	-160(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -160(%ebp)
L153:
	movl	-160(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L154
	movl	-160(%ebp), %eax
	movl	-340(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L136
L139:
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	72(%eax), %eax
	movl	60(%eax), %eax
	cmpl	$21, %eax
	je	L155
	call	_createErrorObject
	movl	%eax, -344(%ebp)
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	72(%eax), %eax
	movl	(%eax), %edx
	movl	-344(%ebp), %eax
	movl	%edx, 156(%eax)
	movl	-344(%ebp), %eax
	addl	$4, %eax
	movl	$1953068883, (%eax)
	movl	$1663068259, 4(%eax)
	movl	$543519585, 8(%eax)
	movl	$1646292591, 12(%eax)
	movl	$1701605231, 16(%eax)
	movl	$1981836897, 20(%eax)
	movl	$1634300513, 24(%eax)
	movl	$543517794, 28(%eax)
	movl	$1852727651, 32(%eax)
	movl	$1746957423, 36(%eax)
	movl	$543520353, 40(%eax)
	movl	$1634100580, 44(%eax)
	movl	$544500853, 48(%eax)
	movl	$1702060387, 52(%eax)
	movb	$0, 56(%eax)
	movl	-344(%ebp), %eax
	leal	4(%eax), %edx
	movl	-344(%ebp), %eax
	movl	156(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	call	_printf
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -164(%ebp)
	jmp	L156
L157:
	movl	-164(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -164(%ebp)
L156:
	movl	-164(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L157
	movl	-164(%ebp), %eax
	movl	-344(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
L155:
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	60(%eax), %eax
	cmpl	$19, %eax
	jne	L158
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	64(%eax), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	60(%eax), %eax
	cmpl	$19, %eax
	jne	L158
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	64(%eax), %eax
	movl	64(%eax), %eax
	testl	%eax, %eax
	je	L159
L158:
	call	_createErrorObject
	movl	%eax, -348(%ebp)
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	(%eax), %edx
	movl	-348(%ebp), %eax
	movl	%edx, 156(%eax)
	movl	-348(%ebp), %eax
	addl	$4, %eax
	movl	$LC9, %ebx
	movl	$74, %edx
	movl	(%ebx), %ecx
	movl	%ecx, (%eax)
	movl	-4(%ebx,%edx), %ecx
	movl	%ecx, -4(%eax,%edx)
	leal	4(%eax), %edi
	andl	$-4, %edi
	subl	%edi, %eax
	subl	%eax, %ebx
	addl	%eax, %edx
	andl	$-4, %edx
	movl	%edx, %eax
	shrl	$2, %eax
	movl	%ebx, %esi
	movl	%eax, %ecx
	rep movsl
	movl	-348(%ebp), %eax
	leal	4(%eax), %edx
	movl	-348(%ebp), %eax
	movl	156(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	call	_printf
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -168(%ebp)
	cmpl	$0, -168(%ebp)
	jne	L161
	movl	16(%ebp), %eax
	movl	-348(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L159
L162:
	movl	-168(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -168(%ebp)
L161:
	movl	-168(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L162
	movl	-168(%ebp), %eax
	movl	-348(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
L159:
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	%eax, -172(%ebp)
	jmp	L163
L170:
	movl	-172(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	60(%eax), %eax
	cmpl	$19, %eax
	jne	L164
	movl	-172(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	$LC10, 4(%esp)
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	je	L165
	movl	-172(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	$LC11, 4(%esp)
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L164
L165:
	movl	-172(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -172(%ebp)
	jmp	L163
L164:
	call	_createErrorObject
	movl	%eax, -352(%ebp)
	movl	-172(%ebp), %eax
	movl	(%eax), %edx
	movl	-352(%ebp), %eax
	movl	%edx, 156(%eax)
	movl	-352(%ebp), %eax
	addl	$4, %eax
	movl	$1702060355, (%eax)
	movl	$1685016096, 4(%eax)
	movl	$1936269413, 8(%eax)
	movl	$1953459744, 12(%eax)
	movl	$544104736, 16(%eax)
	movl	$1819242338, 20(%eax)
	movl	$544104805, 24(%eax)
	movb	$0, 28(%eax)
	movl	-352(%ebp), %eax
	leal	4(%eax), %edx
	movl	-352(%ebp), %eax
	movl	156(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	call	_printf
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -176(%ebp)
	cmpl	$0, -176(%ebp)
	jne	L168
	movl	16(%ebp), %eax
	movl	-352(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L167
L169:
	movl	-176(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -176(%ebp)
L168:
	movl	-176(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L169
	movl	-176(%ebp), %eax
	movl	-352(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
L167:
	movl	-172(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -172(%ebp)
L163:
	cmpl	$0, -172(%ebp)
	jne	L170
L136:
	movl	8(%ebp), %eax
	movl	$0, 12(%esp)
	movl	$5, 8(%esp)
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_lookupBlock
	movl	%eax, -356(%ebp)
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	%eax, -180(%ebp)
	jmp	L171
L172:
	movl	-356(%ebp), %eax
	movl	88(%eax), %eax
	movl	16(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	-180(%ebp), %eax
	movl	%eax, (%esp)
	call	_analyzeAST
	movl	-180(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -180(%ebp)
L171:
	cmpl	$0, -180(%ebp)
	jne	L172
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	72(%eax), %eax
	movl	60(%eax), %eax
	cmpl	$21, %eax
	je	L196
	movl	-356(%ebp), %eax
	movl	88(%eax), %edx
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	72(%eax), %eax
	movl	16(%ebp), %ecx
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_analyzeAST
	jmp	L196
L20:
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	%eax, -184(%ebp)
	movl	-184(%ebp), %eax
	movl	60(%eax), %eax
	cmpl	$21, %eax
	je	L197
	jmp	L175
L176:
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-184(%ebp), %eax
	movl	%eax, (%esp)
	call	_analyzeAST
	movl	-184(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -184(%ebp)
L175:
	cmpl	$0, -184(%ebp)
	jne	L176
	jmp	L197
L13:
	movl	8(%ebp), %eax
	movl	$0, 12(%esp)
	movl	$3, 8(%esp)
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_lookupBlock
	movl	%eax, -360(%ebp)
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	72(%eax), %eax
	movl	%eax, -188(%ebp)
	movl	-188(%ebp), %eax
	movl	60(%eax), %eax
	cmpl	$21, %eax
	je	L198
	jmp	L178
L179:
	movl	-360(%ebp), %eax
	movl	88(%eax), %eax
	movl	16(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	-188(%ebp), %eax
	movl	%eax, (%esp)
	call	_analyzeAST
	movl	-188(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -188(%ebp)
L178:
	cmpl	$0, -188(%ebp)
	jne	L179
	jmp	L198
L14:
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	16(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_extractTypeOfExpression
	movl	%eax, -364(%ebp)
	cmpl	$2, -364(%ebp)
	je	L180
	cmpl	$-1, -364(%ebp)
	je	L199
	call	_createErrorObject
	movl	%eax, -368(%ebp)
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	-368(%ebp), %eax
	movl	%edx, 156(%eax)
	movl	-368(%ebp), %eax
	addl	$4, %eax
	movl	$1818847319, (%eax)
	movl	$1867260005, 4(%eax)
	movl	$1126199407, 8(%eax)
	movl	$1768189551, 12(%eax)
	movl	$1852795252, 16(%eax)
	movl	$1701798944, 20(%eax)
	movl	$1948741235, 24(%eax)
	movl	$1635149088, 28(%eax)
	movl	$1952544108, 32(%eax)
	movl	$1948283749, 36(%eax)
	movl	$543236207, 40(%eax)
	movl	$1819242338, 44(%eax)
	movl	$7233893, 48(%eax)
	movl	-368(%ebp), %eax
	leal	4(%eax), %edx
	movl	-368(%ebp), %eax
	movl	156(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	call	_printf
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -192(%ebp)
	cmpl	$0, -192(%ebp)
	jne	L184
	movl	16(%ebp), %eax
	movl	-368(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L200
L185:
	movl	-192(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -192(%ebp)
L184:
	movl	-192(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L185
	movl	-192(%ebp), %eax
	movl	-368(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L200
L180:
	movl	8(%ebp), %eax
	movl	$0, 12(%esp)
	movl	$4, 8(%esp)
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_lookupBlock
	movl	%eax, -372(%ebp)
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	%eax, -196(%ebp)
	movl	-196(%ebp), %eax
	movl	60(%eax), %eax
	cmpl	$21, %eax
	je	L200
	jmp	L187
L188:
	movl	-372(%ebp), %eax
	movl	88(%eax), %eax
	movl	16(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	-196(%ebp), %eax
	movl	%eax, (%esp)
	call	_analyzeAST
	movl	-196(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -196(%ebp)
L187:
	cmpl	$0, -196(%ebp)
	jne	L188
	jmp	L200
L190:
	nop
	jmp	L189
L191:
	nop
	jmp	L189
L193:
	nop
	jmp	L189
L194:
	nop
	jmp	L189
L195:
	nop
	jmp	L189
L196:
	nop
	jmp	L189
L197:
	nop
	jmp	L189
L198:
	nop
	jmp	L189
L199:
	nop
	jmp	L189
L200:
	nop
L9:
L189:
	nop
	addl	$396, %esp
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
LFE21:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_malloc;	.scl	2;	.type	32;	.endef
	.def	_getAST;	.scl	2;	.type	32;	.endef
	.def	_processAST;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_getsymbolTable;	.scl	2;	.type	32;	.endef
	.def	_initializeDeclaredList;	.scl	2;	.type	32;	.endef
	.def	_populateModuleSequenceMap;	.scl	2;	.type	32;	.endef
	.def	_checkModules;	.scl	2;	.type	32;	.endef
	.def	_computeOffsets;	.scl	2;	.type	32;	.endef
	.def	_lookupString;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_strcat;	.scl	2;	.type	32;	.endef
	.def	_extractTypeOfExpression;	.scl	2;	.type	32;	.endef
	.def	_strcmp;	.scl	2;	.type	32;	.endef
	.def	_lookupBlock;	.scl	2;	.type	32;	.endef
