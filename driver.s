	.file	"driver.c"
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC0:
	.ascii "Please Select Option\0"
LC1:
	.ascii "***********************\0"
	.align 4
LC2:
	.ascii "1. Press 1 to check for removal of comments.  \0"
	.align 4
LC3:
	.ascii "2. Press 2 to print the list of tokens on the console. \0"
	.align 4
LC4:
	.ascii "3. Press 3 to parse the input file. \0"
	.align 4
LC5:
	.ascii "4. Press 4 to find the time taken for parsing the input. \0"
LC6:
	.ascii "5. Press 5 to find AST. \0"
	.align 4
LC7:
	.ascii "6. Press 6 to test symboltable. \0"
	.align 4
LC8:
	.ascii "7. Press 7 to test semantic analyzer.\0"
LC9:
	.ascii "8. Press 0 for exit. \0"
LC10:
	.ascii "%d\0"
LC11:
	.ascii "Exiting!\0"
	.align 4
LC12:
	.ascii "Please check file named removedComments.txt for output\12`\0"
	.align 4
LC14:
	.ascii "\12 total_CPU_time = %f Total_CPU_time_in_seconds = %f\12\12\0"
LC15:
	.ascii "Compression Ratio: %d\12\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB15:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$96, %esp
	call	___main
L13:
	movl	$LC0, (%esp)
	call	_puts
	movl	$LC1, (%esp)
	call	_puts
	movl	$LC2, (%esp)
	call	_puts
	movl	$LC3, (%esp)
	call	_puts
	movl	$LC4, (%esp)
	call	_puts
	movl	$LC5, (%esp)
	call	_puts
	movl	$LC6, (%esp)
	call	_puts
	movl	$LC7, (%esp)
	call	_puts
	movl	$LC8, (%esp)
	call	_puts
	movl	$LC9, (%esp)
	call	_puts
	movl	$10, (%esp)
	call	_putchar
	leal	60(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC10, (%esp)
	call	_scanf
	movl	60(%esp), %eax
	cmpl	$7, %eax
	ja	L13
	movl	L4(,%eax,4), %eax
	jmp	*%eax
	.section .rdata,"dr"
	.align 4
L4:
	.long	L3
	.long	L5
	.long	L6
	.long	L7
	.long	L8
	.long	L9
	.long	L10
	.long	L11
	.text
L3:
	movl	$LC11, (%esp)
	call	_puts
	movl	$0, %eax
	jmp	L14
L5:
	movl	12(%ebp), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	_removeComments
	movl	$LC12, (%esp)
	call	_printf
	movl	$0, %eax
	jmp	L14
L6:
	movl	12(%ebp), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	_testLexer
	movl	$0, %eax
	jmp	L14
L7:
	movl	12(%ebp), %eax
	addl	$8, %eax
	movl	(%eax), %edx
	movl	12(%ebp), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_testParseTree
	movl	$0, %eax
	jmp	L14
L8:
	call	_clock
	movl	%eax, 92(%esp)
	movl	12(%ebp), %eax
	addl	$8, %eax
	movl	(%eax), %edx
	movl	12(%ebp), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_testParseTree
	call	_clock
	movl	%eax, 88(%esp)
	movl	88(%esp), %eax
	subl	92(%esp), %eax
	movl	%eax, 44(%esp)
	fildl	44(%esp)
	fstpl	80(%esp)
	fldl	80(%esp)
	fldl	LC13
	fdivrp	%st, %st(1)
	fstpl	72(%esp)
	fldl	72(%esp)
	fstpl	12(%esp)
	fldl	80(%esp)
	fstpl	4(%esp)
	movl	$LC14, (%esp)
	call	_printf
	movl	$0, %eax
	jmp	L14
L9:
	movl	12(%ebp), %eax
	addl	$8, %eax
	movl	(%eax), %edx
	movl	12(%ebp), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_testAST
	movl	$0, %eax
	jmp	L14
L10:
	movl	12(%ebp), %eax
	addl	$8, %eax
	movl	(%eax), %edx
	movl	12(%ebp), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_testAST
	movl	$0, %eax
	jmp	L14
L11:
	movl	12(%ebp), %eax
	addl	$8, %eax
	movl	(%eax), %edx
	movl	12(%ebp), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_testAST
	call	_semanticAnalyzer
	call	_getSemanticErrorObject
	movl	%eax, 68(%esp)
	call	_getCompressionRatio
	movl	%eax, 64(%esp)
	movl	64(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC15, (%esp)
	call	_printf
	movl	$0, %eax
L14:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE15:
	.section .rdata,"dr"
	.align 8
LC13:
	.long	0
	.long	1083129856
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_putchar;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
	.def	_removeComments;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_testLexer;	.scl	2;	.type	32;	.endef
	.def	_testParseTree;	.scl	2;	.type	32;	.endef
	.def	_clock;	.scl	2;	.type	32;	.endef
	.def	_testAST;	.scl	2;	.type	32;	.endef
	.def	_semanticAnalyzer;	.scl	2;	.type	32;	.endef
	.def	_getSemanticErrorObject;	.scl	2;	.type	32;	.endef
	.def	_getCompressionRatio;	.scl	2;	.type	32;	.endef
