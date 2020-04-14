	.file	"lexer.c"
	.globl	_keywords
	.data
	.align 32
_keywords:
	.ascii "integer\0"
	.space 7
	.ascii "real\0"
	.space 10
	.ascii "boolean\0"
	.space 7
	.ascii "of\0"
	.space 12
	.ascii "array\0"
	.space 9
	.ascii "start\0"
	.space 9
	.ascii "end\0"
	.space 11
	.ascii "declare\0"
	.space 7
	.ascii "module\0"
	.space 8
	.ascii "driver\0"
	.space 8
	.ascii "program\0"
	.space 7
	.ascii "record\0"
	.space 8
	.ascii "tagged\0"
	.space 8
	.ascii "union\0"
	.space 9
	.ascii "get_value\0"
	.space 5
	.ascii "print\0"
	.space 9
	.ascii "use\0"
	.space 11
	.ascii "with\0"
	.space 10
	.ascii "parameters\0"
	.space 4
	.ascii "true\0"
	.space 10
	.ascii "false\0"
	.space 9
	.ascii "takes\0"
	.space 9
	.ascii "input\0"
	.space 9
	.ascii "returns\0"
	.space 7
	.ascii "AND\0"
	.space 11
	.ascii "OR\0"
	.space 12
	.ascii "for\0"
	.space 11
	.ascii "in\0"
	.space 12
	.ascii "switch\0"
	.space 8
	.ascii "case\0"
	.space 10
	.ascii "break\0"
	.space 9
	.ascii "default\0"
	.space 7
	.ascii "while\0"
	.space 9
	.globl	_tokens
	.align 32
_tokens:
	.ascii "INTEGER\0"
	.space 7
	.ascii "REAL\0"
	.space 10
	.ascii "BOOLEAN\0"
	.space 7
	.ascii "OF\0"
	.space 12
	.ascii "ARRAY\0"
	.space 9
	.ascii "START\0"
	.space 9
	.ascii "END\0"
	.space 11
	.ascii "DECLARE\0"
	.space 7
	.ascii "MODULE\0"
	.space 8
	.ascii "DRIVER\0"
	.space 8
	.ascii "PROGRAM\0"
	.space 7
	.ascii "RECORD\0"
	.space 8
	.ascii "TAGGED\0"
	.space 8
	.ascii "UNION\0"
	.space 9
	.ascii "GET_VALUE\0"
	.space 5
	.ascii "PRINT\0"
	.space 9
	.ascii "USE\0"
	.space 11
	.ascii "WITH\0"
	.space 10
	.ascii "PARAMETERS\0"
	.space 4
	.ascii "TRUE\0"
	.space 10
	.ascii "FALSE\0"
	.space 9
	.ascii "TAKES\0"
	.space 9
	.ascii "INPUT\0"
	.space 9
	.ascii "RETURNS\0"
	.space 7
	.ascii "AND\0"
	.space 11
	.ascii "OR\0"
	.space 12
	.ascii "FOR\0"
	.space 11
	.ascii "IN\0"
	.space 12
	.ascii "SWITCH\0"
	.space 8
	.ascii "CASE\0"
	.space 10
	.ascii "BREAK\0"
	.space 9
	.ascii "DEFAULT\0"
	.space 7
	.ascii "WHILE\0"
	.space 9
	.ascii "DRIVERDEF\0"
	.space 5
	.ascii "DRIVERENDDEF\0"
	.space 2
	.globl	_is_buff_empty
_is_buff_empty:
	.byte	1
	.comm	_state, 4, 2
	.globl	_lineNo
	.align 4
_lineNo:
	.long	1
	.globl	_input_buffer_ptr
	.bss
	.align 4
_input_buffer_ptr:
	.space 4
	.comm	_input_buffer, 4097, 5
	.comm	_hash_table, 140, 5
	.globl	_getNextTokenIteration
	.align 4
_getNextTokenIteration:
	.space 4
	.section .rdata,"dr"
LC0:
	.ascii "r\0"
LC1:
	.ascii "\12Error Opening File\0"
	.align 4
LC2:
	.ascii "\12 %d Line Number = %d \11Lexeme = %s \11Token_Name = %s \0"
	.align 4
LC3:
	.ascii "\12 LEXICAL ERROR - Line Number = %d Lexeme = %s,\0"
	.text
	.globl	_testLexer
	.def	_testLexer;	.scl	2;	.type	32;	.endef
_testLexer:
LFB18:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	$LC0, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_fopen
	movl	%eax, -16(%ebp)
	cmpl	$0, -16(%ebp)
	jne	L2
	movl	$LC1, (%esp)
	call	_printf
	jmp	L1
L2:
	call	_fillKeywordsHashTable
	movl	$0, -12(%ebp)
	jmp	L4
L6:
	addl	$1, -12(%ebp)
	movl	-20(%ebp), %eax
	movzbl	1(%eax), %eax
	xorl	$1, %eax
	testb	%al, %al
	je	L5
	movl	-20(%ebp), %eax
	leal	2(%eax), %ecx
	movl	-20(%ebp), %eax
	movl	24(%eax), %edx
	movl	-20(%ebp), %eax
	movl	28(%eax), %eax
	movl	%ecx, 16(%esp)
	movl	%edx, 12(%esp)
	movl	%eax, 8(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_printf
	jmp	L4
L5:
	movl	-20(%ebp), %eax
	movl	24(%eax), %edx
	movl	-20(%ebp), %eax
	movl	28(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC3, (%esp)
	call	_printf
L4:
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_getNextToken
	movl	%eax, -20(%ebp)
	cmpl	$0, -20(%ebp)
	jne	L6
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
L1:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.globl	_findValue
	.def	_findValue;	.scl	2;	.type	32;	.endef
_findValue:
LFB19:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	leal	-24(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_strtof
	fstps	-40(%ebp)
	movl	-40(%ebp), %eax
	movl	%eax, -12(%ebp)
	movl	-24(%ebp), %eax
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	_strtof
	fstps	-40(%ebp)
	movl	-40(%ebp), %eax
	movl	%eax, -16(%ebp)
	flds	-12(%ebp)
	fstpl	-40(%ebp)
	flds	-16(%ebp)
	fstpl	8(%esp)
	fldl	LC4
	fstpl	(%esp)
	call	_pow
	fmull	-40(%ebp)
	fstps	-20(%ebp)
	flds	-20(%ebp)
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE19:
	.globl	_hashFunction
	.def	_hashFunction;	.scl	2;	.type	32;	.endef
_hashFunction:
LFB20:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$0, -12(%ebp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_strlen
	movl	%eax, -20(%ebp)
	movl	$0, -16(%ebp)
	jmp	L10
L11:
	movl	-16(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	addl	%eax, -12(%ebp)
	movl	-12(%ebp), %ecx
	movl	$-368140053, %edx
	movl	%ecx, %eax
	imull	%edx
	leal	(%edx,%ecx), %eax
	sarl	$5, %eax
	movl	%eax, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	imull	$35, %eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, -12(%ebp)
	addl	$1, -16(%ebp)
L10:
	movl	-16(%ebp), %eax
	cmpl	-20(%ebp), %eax
	jl	L11
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE20:
	.section .rdata,"dr"
LC6:
	.ascii "\12Hash Table Populated\0"
	.text
	.globl	_fillKeywordsHashTable
	.def	_fillKeywordsHashTable;	.scl	2;	.type	32;	.endef
_fillKeywordsHashTable:
LFB21:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$0, -12(%ebp)
	jmp	L14
L15:
	movl	-12(%ebp), %eax
	movl	$0, _hash_table(,%eax,4)
	addl	$1, -12(%ebp)
L14:
	cmpl	$34, -12(%ebp)
	jle	L15
	movl	$0, -12(%ebp)
	jmp	L16
L21:
	movl	$40, (%esp)
	call	_malloc
	movl	%eax, -20(%ebp)
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	sall	$4, %eax
	subl	%edx, %eax
	addl	$_keywords, %eax
	movl	%eax, (%esp)
	call	_hashFunction
	movl	%eax, -24(%ebp)
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	sall	$4, %eax
	subl	%edx, %eax
	leal	_keywords(%eax), %edx
	movl	-20(%ebp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcpy
	movl	-20(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 32(%eax)
	movl	-20(%ebp), %eax
	movl	$0, 36(%eax)
	movl	-24(%ebp), %eax
	movl	_hash_table(,%eax,4), %eax
	testl	%eax, %eax
	je	L17
	movl	-24(%ebp), %eax
	movl	_hash_table(,%eax,4), %eax
	movl	%eax, -16(%ebp)
	jmp	L18
L19:
	movl	-16(%ebp), %eax
	movl	36(%eax), %eax
	movl	%eax, -16(%ebp)
L18:
	movl	-16(%ebp), %eax
	movl	36(%eax), %eax
	testl	%eax, %eax
	jne	L19
	movl	-16(%ebp), %eax
	movl	-20(%ebp), %edx
	movl	%edx, 36(%eax)
	jmp	L20
L17:
	movl	-24(%ebp), %eax
	movl	-20(%ebp), %edx
	movl	%edx, _hash_table(,%eax,4)
L20:
	addl	$1, -12(%ebp)
L16:
	cmpl	$34, -12(%ebp)
	jle	L21
	movl	$LC6, (%esp)
	call	_printf
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE21:
	.globl	_lookup
	.def	_lookup;	.scl	2;	.type	32;	.endef
_lookup:
LFB22:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_hashFunction
	movl	%eax, -16(%ebp)
	movl	-16(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
	cmpl	$0, -12(%ebp)
	jne	L25
	movl	$-1, %eax
	jmp	L24
L27:
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L26
	movl	-12(%ebp), %eax
	movl	32(%eax), %eax
	jmp	L24
L26:
	movl	-12(%ebp), %eax
	movl	36(%eax), %eax
	movl	%eax, -12(%ebp)
L25:
	movl	-12(%ebp), %eax
	movl	36(%eax), %eax
	testl	%eax, %eax
	jne	L27
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L28
	movl	-12(%ebp), %eax
	movl	32(%eax), %eax
	jmp	L24
L28:
	movl	$-1, %eax
L24:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE22:
	.globl	_refreshBuffer
	.def	_refreshBuffer;	.scl	2;	.type	32;	.endef
_refreshBuffer:
LFB23:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	12(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$0, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_memset
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE23:
	.globl	_getStream
	.def	_getStream;	.scl	2;	.type	32;	.endef
_getStream:
LFB24:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_refreshBuffer
	cmpl	$0, 8(%ebp)
	jne	L31
	movl	$1, (%esp)
	call	_exit
L31:
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	andl	$16, %eax
	testl	%eax, %eax
	je	L32
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	movl	$0, %eax
	jmp	L33
L32:
	movl	16(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, 12(%esp)
	movl	%eax, 8(%esp)
	movl	$1, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_fread
	movl	%eax, -12(%ebp)
	cmpl	$0, -12(%ebp)
	jle	L34
	movl	-12(%ebp), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	movl	8(%ebp), %eax
	jmp	L33
L34:
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	movl	$0, %eax
L33:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE24:
	.section .rdata,"dr"
LC7:
	.ascii "removedComments.txt\0"
LC8:
	.ascii "File not found\0"
	.text
	.globl	_printOnConsole
	.def	_printOnConsole;	.scl	2;	.type	32;	.endef
_printOnConsole:
LFB25:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$LC0, 4(%esp)
	movl	$LC7, (%esp)
	call	_fopen
	movl	%eax, -12(%ebp)
	movl	$1, 8(%esp)
	movl	$0, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_fseek
	cmpl	$0, -12(%ebp)
	jne	L37
	movl	$LC8, (%esp)
	call	_puts
	jmp	L37
L38:
	movsbl	-13(%ebp), %eax
	movl	%eax, (%esp)
	call	_putchar
L37:
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_fgetc
	movb	%al, -13(%ebp)
	cmpb	$-1, -13(%ebp)
	jne	L38
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE25:
	.section .rdata,"dr"
LC9:
	.ascii "w\0"
	.text
	.globl	_removeComments
	.def	_removeComments;	.scl	2;	.type	32;	.endef
_removeComments:
LFB26:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$72, %esp
	movl	$LC0, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_fopen
	movl	%eax, -12(%ebp)
	movl	$LC7, (%esp)
	call	_remove
	movl	$LC9, 4(%esp)
	movl	$LC7, (%esp)
	call	_fopen
	movl	%eax, -28(%ebp)
	cmpl	$0, -12(%ebp)
	je	L40
	cmpl	$0, -28(%ebp)
	jne	L41
L40:
	movl	$1, (%esp)
	call	_exit
L41:
	movl	$4096, (%esp)
	call	_malloc
	movl	%eax, -32(%ebp)
	movl	$4096, (%esp)
	call	_malloc
	movl	%eax, -36(%ebp)
	movl	$0, -16(%ebp)
	movl	$0, -20(%ebp)
L64:
	movl	$4096, 8(%esp)
	movl	-32(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_getStream
	movl	%eax, -12(%ebp)
	cmpl	$0, -12(%ebp)
	je	L66
	movl	-32(%ebp), %eax
	movl	%eax, (%esp)
	call	_strlen
	movl	%eax, -40(%ebp)
	movl	$0, -24(%ebp)
	jmp	L44
L57:
	movl	-24(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -24(%ebp)
	movl	%eax, %edx
	movl	-32(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movb	%al, -41(%ebp)
	movl	-20(%ebp), %eax
	cmpl	$1, %eax
	je	L45
	cmpl	$1, %eax
	jg	L46
	testl	%eax, %eax
	je	L47
	jmp	L44
L46:
	cmpl	$2, %eax
	je	L48
	cmpl	$3, %eax
	je	L49
	jmp	L44
L47:
	cmpb	$42, -41(%ebp)
	je	L50
	movl	-16(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -16(%ebp)
	movl	%eax, %edx
	movl	-36(%ebp), %eax
	addl	%eax, %edx
	movzbl	-41(%ebp), %eax
	movb	%al, (%edx)
	movl	$0, -20(%ebp)
	jmp	L44
L50:
	movl	-16(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -16(%ebp)
	movl	%eax, %edx
	movl	-36(%ebp), %eax
	addl	%eax, %edx
	movzbl	-41(%ebp), %eax
	movb	%al, (%edx)
	movl	$1, -20(%ebp)
	jmp	L44
L45:
	cmpb	$42, -41(%ebp)
	je	L52
	movl	-16(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -16(%ebp)
	movl	%eax, %edx
	movl	-36(%ebp), %eax
	addl	%eax, %edx
	movzbl	-41(%ebp), %eax
	movb	%al, (%edx)
	movl	$0, -20(%ebp)
	jmp	L44
L52:
	subl	$1, -16(%ebp)
	movl	-16(%ebp), %edx
	movl	-36(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	movl	-16(%ebp), %eax
	movl	-28(%ebp), %edx
	movl	%edx, 12(%esp)
	movl	%eax, 8(%esp)
	movl	$1, 4(%esp)
	movl	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	_fwrite
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	_refreshBuffer
	movl	$0, -16(%ebp)
	movl	$2, -20(%ebp)
	jmp	L44
L48:
	cmpb	$42, -41(%ebp)
	je	L54
	movl	$2, -20(%ebp)
	jmp	L44
L54:
	movl	$3, -20(%ebp)
	jmp	L44
L49:
	cmpb	$42, -41(%ebp)
	je	L56
	movl	$2, -20(%ebp)
	jmp	L44
L56:
	movl	$0, -20(%ebp)
L44:
	movl	-24(%ebp), %eax
	cmpl	-40(%ebp), %eax
	jl	L57
	movl	-20(%ebp), %eax
	cmpl	$1, %eax
	je	L59
	cmpl	$1, %eax
	jg	L60
	testl	%eax, %eax
	je	L61
	jmp	L58
L60:
	cmpl	$2, %eax
	je	L67
	cmpl	$3, %eax
	jmp	L58
L61:
	movl	-16(%ebp), %eax
	movl	-28(%ebp), %edx
	movl	%edx, 12(%esp)
	movl	%eax, 8(%esp)
	movl	$1, 4(%esp)
	movl	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	_fwrite
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	_refreshBuffer
	movl	$0, -16(%ebp)
	jmp	L58
L59:
	subl	$1, -16(%ebp)
	movl	-16(%ebp), %edx
	movl	-36(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	movl	-16(%ebp), %eax
	movl	-28(%ebp), %edx
	movl	%edx, 12(%esp)
	movl	%eax, 8(%esp)
	movl	$1, 4(%esp)
	movl	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	_fwrite
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	_refreshBuffer
	movl	$0, -16(%ebp)
	movl	-16(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -16(%ebp)
	movl	%eax, %edx
	movl	-36(%ebp), %eax
	addl	%edx, %eax
	movb	$42, (%eax)
	jmp	L58
L67:
	nop
L58:
	jmp	L64
L66:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE26:
	.globl	_getNextToken
	.def	_getNextToken;	.scl	2;	.type	32;	.endef
_getNextToken:
LFB27:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$72, %esp
	movzbl	_is_buff_empty, %eax
	testb	%al, %al
	je	L69
	movl	$4096, 8(%esp)
	movl	$_input_buffer, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_getStream
	movl	%eax, 8(%ebp)
	cmpl	$0, 8(%ebp)
	jne	L70
	movb	$1, _is_buff_empty
	movl	$0, %eax
	jmp	L68
L70:
	movb	$0, _is_buff_empty
L69:
	movl	$0, _state
	movl	$21, (%esp)
	call	_malloc
	movl	%eax, -12(%ebp)
	movl	$0, -16(%ebp)
	movl	$40, (%esp)
	call	_malloc
	movl	%eax, -20(%ebp)
L164:
	movl	_input_buffer_ptr, %eax
	cmpl	$4095, %eax
	jle	L72
	movl	$4096, 8(%esp)
	movl	$_input_buffer, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_getStream
	movl	%eax, 8(%ebp)
	cmpl	$0, 8(%ebp)
	jne	L73
	movl	$0, %eax
	jmp	L68
L73:
	movl	$0, _input_buffer_ptr
L72:
	movl	_input_buffer_ptr, %eax
	movzbl	_input_buffer(%eax), %eax
	movb	%al, -21(%ebp)
	cmpb	$0, -21(%ebp)
	jne	L74
	movb	$1, _is_buff_empty
	nop
	jmp	L68
L74:
	movl	_state, %eax
	cmpl	$18, %eax
	ja	L164
	movl	L78(,%eax,4), %eax
	jmp	*%eax
	.section .rdata,"dr"
	.align 4
L78:
	.long	L77
	.long	L79
	.long	L80
	.long	L81
	.long	L82
	.long	L83
	.long	L84
	.long	L85
	.long	L86
	.long	L87
	.long	L88
	.long	L89
	.long	L90
	.long	L91
	.long	L92
	.long	L93
	.long	L94
	.long	L95
	.long	L96
	.text
L77:
	movsbl	-21(%ebp), %eax
	cmpl	$122, %eax
	ja	L97
	movl	L99(,%eax,4), %eax
	jmp	*%eax
	.section .rdata,"dr"
	.align 4
L99:
	.long	L98
	.long	L97
	.long	L97
	.long	L97
	.long	L97
	.long	L97
	.long	L97
	.long	L97
	.long	L97
	.long	L100
	.long	L101
	.long	L97
	.long	L97
	.long	L100
	.long	L97
	.long	L97
	.long	L97
	.long	L97
	.long	L97
	.long	L97
	.long	L97
	.long	L97
	.long	L97
	.long	L97
	.long	L97
	.long	L97
	.long	L97
	.long	L97
	.long	L97
	.long	L97
	.long	L97
	.long	L97
	.long	L100
	.long	L102
	.long	L97
	.long	L97
	.long	L97
	.long	L97
	.long	L97
	.long	L97
	.long	L103
	.long	L104
	.long	L105
	.long	L106
	.long	L107
	.long	L108
	.long	L109
	.long	L110
	.long	L111
	.long	L111
	.long	L111
	.long	L111
	.long	L111
	.long	L111
	.long	L111
	.long	L111
	.long	L111
	.long	L111
	.long	L112
	.long	L113
	.long	L114
	.long	L115
	.long	L116
	.long	L97
	.long	L97
	.long	L117
	.long	L117
	.long	L117
	.long	L117
	.long	L117
	.long	L117
	.long	L117
	.long	L117
	.long	L117
	.long	L117
	.long	L117
	.long	L117
	.long	L117
	.long	L117
	.long	L117
	.long	L117
	.long	L117
	.long	L117
	.long	L117
	.long	L117
	.long	L117
	.long	L117
	.long	L117
	.long	L117
	.long	L117
	.long	L117
	.long	L118
	.long	L97
	.long	L119
	.long	L97
	.long	L97
	.long	L97
	.long	L117
	.long	L117
	.long	L117
	.long	L117
	.long	L117
	.long	L117
	.long	L117
	.long	L117
	.long	L117
	.long	L117
	.long	L117
	.long	L117
	.long	L117
	.long	L117
	.long	L117
	.long	L117
	.long	L117
	.long	L117
	.long	L117
	.long	L117
	.long	L117
	.long	L117
	.long	L117
	.long	L117
	.long	L117
	.long	L117
	.text
L114:
	movl	$1, _state
	movl	-16(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -16(%ebp)
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	addl	%eax, %edx
	movzbl	-21(%ebp), %eax
	movb	%al, (%edx)
	movl	_input_buffer_ptr, %eax
	addl	$1, %eax
	movl	%eax, _input_buffer_ptr
	jmp	L120
L116:
	movl	$2, _state
	movl	-16(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -16(%ebp)
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	addl	%eax, %edx
	movzbl	-21(%ebp), %eax
	movb	%al, (%edx)
	movl	_input_buffer_ptr, %eax
	addl	$1, %eax
	movl	%eax, _input_buffer_ptr
	jmp	L120
L112:
	movl	$3, _state
	movl	_input_buffer_ptr, %eax
	addl	$1, %eax
	movl	%eax, _input_buffer_ptr
	movl	-16(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -16(%ebp)
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	addl	%eax, %edx
	movzbl	-21(%ebp), %eax
	movb	%al, (%edx)
	jmp	L120
L102:
	movl	$4, _state
	movl	_input_buffer_ptr, %eax
	addl	$1, %eax
	movl	%eax, _input_buffer_ptr
	movl	-16(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -16(%ebp)
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	addl	%eax, %edx
	movzbl	-21(%ebp), %eax
	movb	%al, (%edx)
	jmp	L120
L115:
	movl	$5, _state
	movl	_input_buffer_ptr, %eax
	addl	$1, %eax
	movl	%eax, _input_buffer_ptr
	movl	-16(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -16(%ebp)
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	addl	%eax, %edx
	movzbl	-21(%ebp), %eax
	movb	%al, (%edx)
	jmp	L120
L106:
	movl	_input_buffer_ptr, %eax
	addl	$1, %eax
	movl	%eax, _input_buffer_ptr
	movl	-20(%ebp), %eax
	movb	$0, (%eax)
	movl	-20(%ebp), %eax
	movb	$0, 1(%eax)
	movl	-20(%ebp), %eax
	addl	$2, %eax
	movl	$1398099024, (%eax)
	movb	$0, 4(%eax)
	movl	_lineNo, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 28(%eax)
	movl	-16(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -16(%ebp)
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	addl	%eax, %edx
	movzbl	-21(%ebp), %eax
	movb	%al, (%edx)
	movl	-16(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	movl	$21, (%esp)
	call	_malloc
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 24(%eax)
	movl	-20(%ebp), %eax
	movl	24(%eax), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcpy
	movl	-20(%ebp), %eax
	movl	$0, 36(%eax)
	movl	-20(%ebp), %eax
	jmp	L68
L108:
	movl	_input_buffer_ptr, %eax
	addl	$1, %eax
	movl	%eax, _input_buffer_ptr
	movl	-20(%ebp), %eax
	movb	$0, (%eax)
	movl	-20(%ebp), %eax
	movb	$0, 1(%eax)
	movl	-20(%ebp), %eax
	addl	$2, %eax
	movl	$1431193933, (%eax)
	movw	$83, 4(%eax)
	movl	_lineNo, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 28(%eax)
	movl	-16(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -16(%ebp)
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	addl	%eax, %edx
	movzbl	-21(%ebp), %eax
	movb	%al, (%edx)
	movl	-16(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	movl	$21, (%esp)
	call	_malloc
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 24(%eax)
	movl	-20(%ebp), %eax
	movl	24(%eax), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcpy
	movl	-20(%ebp), %eax
	movl	$0, 36(%eax)
	movl	-20(%ebp), %eax
	jmp	L68
L110:
	movl	_input_buffer_ptr, %eax
	addl	$1, %eax
	movl	%eax, _input_buffer_ptr
	movl	-20(%ebp), %eax
	movb	$0, (%eax)
	movl	-20(%ebp), %eax
	movb	$0, 1(%eax)
	movl	-20(%ebp), %eax
	addl	$2, %eax
	movl	$5654852, (%eax)
	movl	_lineNo, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 28(%eax)
	movl	-16(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -16(%ebp)
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	addl	%eax, %edx
	movzbl	-21(%ebp), %eax
	movb	%al, (%edx)
	movl	-16(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	movl	$21, (%esp)
	call	_malloc
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 24(%eax)
	movl	-20(%ebp), %eax
	movl	24(%eax), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcpy
	movl	-20(%ebp), %eax
	movl	$0, 36(%eax)
	movl	-20(%ebp), %eax
	jmp	L68
L109:
	movl	$16, _state
	movl	_input_buffer_ptr, %eax
	addl	$1, %eax
	movl	%eax, _input_buffer_ptr
	movl	-16(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -16(%ebp)
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	addl	%eax, %edx
	movzbl	-21(%ebp), %eax
	movb	%al, (%edx)
	jmp	L120
L113:
	movl	_input_buffer_ptr, %eax
	addl	$1, %eax
	movl	%eax, _input_buffer_ptr
	movl	-20(%ebp), %eax
	movb	$0, (%eax)
	movl	-20(%ebp), %eax
	movb	$0, 1(%eax)
	movl	-20(%ebp), %eax
	addl	$2, %eax
	movl	$1229800787, (%eax)
	movl	$5001027, 4(%eax)
	movl	_lineNo, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 28(%eax)
	movl	-16(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -16(%ebp)
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	addl	%eax, %edx
	movzbl	-21(%ebp), %eax
	movb	%al, (%edx)
	movl	-16(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	movl	$21, (%esp)
	call	_malloc
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 24(%eax)
	movl	-20(%ebp), %eax
	movl	24(%eax), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcpy
	movl	-20(%ebp), %eax
	movl	$0, 36(%eax)
	movl	-20(%ebp), %eax
	jmp	L68
L107:
	movl	_input_buffer_ptr, %eax
	addl	$1, %eax
	movl	%eax, _input_buffer_ptr
	movl	-20(%ebp), %eax
	movb	$0, (%eax)
	movl	-20(%ebp), %eax
	movb	$0, 1(%eax)
	movl	-20(%ebp), %eax
	addl	$2, %eax
	movl	$1296912195, (%eax)
	movw	$65, 4(%eax)
	movl	_lineNo, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 28(%eax)
	movl	-16(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -16(%ebp)
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	addl	%eax, %edx
	movzbl	-21(%ebp), %eax
	movb	%al, (%edx)
	movl	-16(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	movl	$21, (%esp)
	call	_malloc
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 24(%eax)
	movl	-20(%ebp), %eax
	movl	24(%eax), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcpy
	movl	-20(%ebp), %eax
	movl	$0, 36(%eax)
	movl	-20(%ebp), %eax
	jmp	L68
L118:
	movl	_input_buffer_ptr, %eax
	addl	$1, %eax
	movl	%eax, _input_buffer_ptr
	movl	-20(%ebp), %eax
	movb	$0, (%eax)
	movl	-20(%ebp), %eax
	movb	$0, 1(%eax)
	movl	-20(%ebp), %eax
	addl	$2, %eax
	movl	$1329746259, (%eax)
	movb	$0, 4(%eax)
	movl	_lineNo, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 28(%eax)
	movl	-16(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -16(%ebp)
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	addl	%eax, %edx
	movzbl	-21(%ebp), %eax
	movb	%al, (%edx)
	movl	-16(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	movl	$21, (%esp)
	call	_malloc
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 24(%eax)
	movl	-20(%ebp), %eax
	movl	24(%eax), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcpy
	movl	-20(%ebp), %eax
	movl	$0, 36(%eax)
	movl	-20(%ebp), %eax
	jmp	L68
L119:
	movl	_input_buffer_ptr, %eax
	addl	$1, %eax
	movl	%eax, _input_buffer_ptr
	movl	-20(%ebp), %eax
	movb	$0, (%eax)
	movl	-20(%ebp), %eax
	movb	$0, 1(%eax)
	movl	-20(%ebp), %eax
	addl	$2, %eax
	movl	$1128419667, (%eax)
	movb	$0, 4(%eax)
	movl	_lineNo, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 28(%eax)
	movl	-16(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -16(%ebp)
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	addl	%eax, %edx
	movzbl	-21(%ebp), %eax
	movb	%al, (%edx)
	movl	-16(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	movl	$21, (%esp)
	call	_malloc
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 24(%eax)
	movl	-20(%ebp), %eax
	movl	24(%eax), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcpy
	movl	-20(%ebp), %eax
	movl	$0, 36(%eax)
	movl	-20(%ebp), %eax
	jmp	L68
L103:
	movl	_input_buffer_ptr, %eax
	addl	$1, %eax
	movl	%eax, _input_buffer_ptr
	movl	-20(%ebp), %eax
	movb	$0, (%eax)
	movl	-20(%ebp), %eax
	movb	$0, 1(%eax)
	movl	-20(%ebp), %eax
	addl	$2, %eax
	movw	$20290, (%eax)
	movb	$0, 2(%eax)
	movl	_lineNo, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 28(%eax)
	movl	-16(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -16(%ebp)
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	addl	%eax, %edx
	movzbl	-21(%ebp), %eax
	movb	%al, (%edx)
	movl	-16(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	movl	$21, (%esp)
	call	_malloc
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 24(%eax)
	movl	-20(%ebp), %eax
	movl	24(%eax), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcpy
	movl	-20(%ebp), %eax
	movl	$0, 36(%eax)
	movl	-20(%ebp), %eax
	jmp	L68
L104:
	movl	_input_buffer_ptr, %eax
	addl	$1, %eax
	movl	%eax, _input_buffer_ptr
	movl	-20(%ebp), %eax
	movb	$0, (%eax)
	movl	-20(%ebp), %eax
	movb	$0, 1(%eax)
	movl	-20(%ebp), %eax
	addl	$2, %eax
	movw	$17218, (%eax)
	movb	$0, 2(%eax)
	movl	_lineNo, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 28(%eax)
	movl	-16(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -16(%ebp)
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	addl	%eax, %edx
	movzbl	-21(%ebp), %eax
	movb	%al, (%edx)
	movl	-16(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	movl	$21, (%esp)
	call	_malloc
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 24(%eax)
	movl	-20(%ebp), %eax
	movl	24(%eax), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcpy
	movl	-20(%ebp), %eax
	movl	$0, 36(%eax)
	movl	-20(%ebp), %eax
	jmp	L68
L117:
	movl	$9, _state
	movl	_input_buffer_ptr, %eax
	addl	$1, %eax
	movl	%eax, _input_buffer_ptr
	movl	-16(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -16(%ebp)
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	addl	%eax, %edx
	movzbl	-21(%ebp), %eax
	movb	%al, (%edx)
	jmp	L120
L111:
	movl	$10, _state
	movl	_input_buffer_ptr, %eax
	addl	$1, %eax
	movl	%eax, _input_buffer_ptr
	movl	-16(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -16(%ebp)
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	addl	%eax, %edx
	movzbl	-21(%ebp), %eax
	movb	%al, (%edx)
	jmp	L120
L100:
	movl	_input_buffer_ptr, %eax
	addl	$1, %eax
	movl	%eax, _input_buffer_ptr
	movl	$0, _state
	jmp	L120
L101:
	movl	_input_buffer_ptr, %eax
	addl	$1, %eax
	movl	%eax, _input_buffer_ptr
	movl	_lineNo, %eax
	addl	$1, %eax
	movl	%eax, _lineNo
	movl	$0, _state
	jmp	L120
L105:
	movl	$6, _state
	movl	_input_buffer_ptr, %eax
	addl	$1, %eax
	movl	%eax, _input_buffer_ptr
	movl	-16(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -16(%ebp)
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	addl	%eax, %edx
	movzbl	-21(%ebp), %eax
	movb	%al, (%edx)
	jmp	L120
L98:
	movl	$0, _state
	jmp	L120
L97:
	movl	-16(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	movl	$21, (%esp)
	call	_malloc
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 24(%eax)
	movl	-20(%ebp), %eax
	movl	24(%eax), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcpy
	movl	-20(%ebp), %eax
	movb	$1, 1(%eax)
	movl	-20(%ebp), %eax
	movb	$0, (%eax)
	movl	_lineNo, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 28(%eax)
	movl	$21, (%esp)
	call	_malloc
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 36(%eax)
	movl	-20(%ebp), %eax
	movl	36(%eax), %eax
	movl	$1635151433, (%eax)
	movl	$543451500, 4(%eax)
	movl	$1701539668, 8(%eax)
	movw	$110, 12(%eax)
	movl	-20(%ebp), %eax
	jmp	L68
L120:
	jmp	L76
L79:
	cmpb	$60, -21(%ebp)
	jne	L121
	movl	$17, _state
	movl	_input_buffer_ptr, %eax
	addl	$1, %eax
	movl	%eax, _input_buffer_ptr
	movl	-16(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -16(%ebp)
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	addl	%eax, %edx
	movzbl	-21(%ebp), %eax
	movb	%al, (%edx)
	jmp	L76
L121:
	cmpb	$61, -21(%ebp)
	jne	L122
	movl	_input_buffer_ptr, %eax
	addl	$1, %eax
	movl	%eax, _input_buffer_ptr
	movl	-16(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -16(%ebp)
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	addl	%eax, %edx
	movzbl	-21(%ebp), %eax
	movb	%al, (%edx)
	movl	-16(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	movl	-20(%ebp), %eax
	movb	$0, (%eax)
	movl	-20(%ebp), %eax
	movb	$0, 1(%eax)
	movl	-20(%ebp), %eax
	addl	$2, %eax
	movw	$17740, (%eax)
	movb	$0, 2(%eax)
	movl	_lineNo, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 28(%eax)
	movl	$21, (%esp)
	call	_malloc
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 24(%eax)
	movl	-20(%ebp), %eax
	movl	24(%eax), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcpy
	movl	-20(%ebp), %eax
	movl	$0, 36(%eax)
	movl	-20(%ebp), %eax
	jmp	L68
L122:
	movl	-20(%ebp), %eax
	movb	$0, (%eax)
	movl	-20(%ebp), %eax
	movb	$0, 1(%eax)
	movl	-20(%ebp), %eax
	addl	$2, %eax
	movw	$21580, (%eax)
	movb	$0, 2(%eax)
	movl	_lineNo, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 28(%eax)
	movl	-16(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	movl	$21, (%esp)
	call	_malloc
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 24(%eax)
	movl	-20(%ebp), %eax
	movl	24(%eax), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcpy
	movl	-20(%ebp), %eax
	movl	$0, 36(%eax)
	movl	-20(%ebp), %eax
	jmp	L68
L80:
	cmpb	$62, -21(%ebp)
	jne	L123
	movl	$18, _state
	movl	-16(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -16(%ebp)
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	addl	%eax, %edx
	movzbl	-21(%ebp), %eax
	movb	%al, (%edx)
	movl	_input_buffer_ptr, %eax
	addl	$1, %eax
	movl	%eax, _input_buffer_ptr
	jmp	L76
L123:
	cmpb	$61, -21(%ebp)
	jne	L125
	movl	_input_buffer_ptr, %eax
	addl	$1, %eax
	movl	%eax, _input_buffer_ptr
	movl	-16(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -16(%ebp)
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	addl	%eax, %edx
	movzbl	-21(%ebp), %eax
	movb	%al, (%edx)
	movl	-16(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	movl	-20(%ebp), %eax
	movb	$0, (%eax)
	movl	-20(%ebp), %eax
	movb	$0, 1(%eax)
	movl	-20(%ebp), %eax
	addl	$2, %eax
	movw	$17735, (%eax)
	movb	$0, 2(%eax)
	movl	_lineNo, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 28(%eax)
	movl	$21, (%esp)
	call	_malloc
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 24(%eax)
	movl	-20(%ebp), %eax
	movl	24(%eax), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcpy
	movl	-20(%ebp), %eax
	movl	$0, 36(%eax)
	movl	-20(%ebp), %eax
	jmp	L68
L125:
	movl	-20(%ebp), %eax
	movb	$0, (%eax)
	movl	-20(%ebp), %eax
	movb	$0, 1(%eax)
	movl	-20(%ebp), %eax
	addl	$2, %eax
	movw	$21575, (%eax)
	movb	$0, 2(%eax)
	movl	_lineNo, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 28(%eax)
	movl	-16(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	movl	$21, (%esp)
	call	_malloc
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 24(%eax)
	movl	-20(%ebp), %eax
	movl	24(%eax), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcpy
	movl	-20(%ebp), %eax
	movl	$0, 36(%eax)
	movl	-20(%ebp), %eax
	jmp	L68
L81:
	cmpb	$61, -21(%ebp)
	jne	L126
	movl	_input_buffer_ptr, %eax
	addl	$1, %eax
	movl	%eax, _input_buffer_ptr
	movl	-16(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -16(%ebp)
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	addl	%eax, %edx
	movzbl	-21(%ebp), %eax
	movb	%al, (%edx)
	movl	-16(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	movl	-20(%ebp), %eax
	movb	$0, (%eax)
	movl	-20(%ebp), %eax
	movb	$0, 1(%eax)
	movl	-20(%ebp), %eax
	addl	$2, %eax
	movl	$1230197569, (%eax)
	movl	$1347374663, 4(%eax)
	movb	$0, 8(%eax)
	movl	_lineNo, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 28(%eax)
	movl	$21, (%esp)
	call	_malloc
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 24(%eax)
	movl	-20(%ebp), %eax
	movl	24(%eax), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcpy
	movl	-20(%ebp), %eax
	movl	$0, 36(%eax)
	movl	-20(%ebp), %eax
	jmp	L68
L126:
	movl	-20(%ebp), %eax
	movb	$0, (%eax)
	movl	-20(%ebp), %eax
	movb	$0, 1(%eax)
	movl	-20(%ebp), %eax
	addl	$2, %eax
	movl	$1330401091, (%eax)
	movw	$78, 4(%eax)
	movl	_lineNo, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 28(%eax)
	movl	-16(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	movl	$21, (%esp)
	call	_malloc
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 24(%eax)
	movl	-20(%ebp), %eax
	movl	24(%eax), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcpy
	movl	-20(%ebp), %eax
	movl	$0, 36(%eax)
	movl	-20(%ebp), %eax
	jmp	L68
L82:
	cmpb	$61, -21(%ebp)
	jne	L127
	movl	_input_buffer_ptr, %eax
	addl	$1, %eax
	movl	%eax, _input_buffer_ptr
	movl	-16(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -16(%ebp)
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	addl	%eax, %edx
	movzbl	-21(%ebp), %eax
	movb	%al, (%edx)
	movl	-16(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	movl	-20(%ebp), %eax
	movb	$0, (%eax)
	movl	-20(%ebp), %eax
	movb	$0, 1(%eax)
	movl	-20(%ebp), %eax
	addl	$2, %eax
	movw	$17742, (%eax)
	movb	$0, 2(%eax)
	movl	_lineNo, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 28(%eax)
	movl	$21, (%esp)
	call	_malloc
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 24(%eax)
	movl	-20(%ebp), %eax
	movl	24(%eax), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcpy
	movl	-20(%ebp), %eax
	movl	$0, 36(%eax)
	movl	-20(%ebp), %eax
	jmp	L68
L127:
	movl	-16(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	movl	-20(%ebp), %eax
	movb	$1, 1(%eax)
	movl	_lineNo, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 28(%eax)
	movl	$21, (%esp)
	call	_malloc
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 24(%eax)
	movl	-20(%ebp), %eax
	movl	24(%eax), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcpy
	movl	$21, (%esp)
	call	_malloc
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 36(%eax)
	movl	-20(%ebp), %eax
	movl	36(%eax), %eax
	movl	$1635151433, (%eax)
	movl	$543451500, 4(%eax)
	movl	$1701539668, 8(%eax)
	movw	$110, 12(%eax)
	movl	-20(%ebp), %eax
	jmp	L68
L83:
	cmpb	$61, -21(%ebp)
	jne	L128
	movl	_input_buffer_ptr, %eax
	addl	$1, %eax
	movl	%eax, _input_buffer_ptr
	movl	-16(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -16(%ebp)
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	addl	%eax, %edx
	movzbl	-21(%ebp), %eax
	movb	%al, (%edx)
	movl	-16(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	movl	-20(%ebp), %eax
	movb	$0, (%eax)
	movl	-20(%ebp), %eax
	movb	$0, 1(%eax)
	movl	-20(%ebp), %eax
	addl	$2, %eax
	movw	$20805, (%eax)
	movb	$0, 2(%eax)
	movl	_lineNo, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 28(%eax)
	movl	$21, (%esp)
	call	_malloc
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 24(%eax)
	movl	-20(%ebp), %eax
	movl	24(%eax), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcpy
	movl	-20(%ebp), %eax
	movl	$0, 36(%eax)
	movl	-20(%ebp), %eax
	jmp	L68
L128:
	movl	-16(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	movl	-20(%ebp), %eax
	movb	$1, 1(%eax)
	movl	_lineNo, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 28(%eax)
	movl	$21, (%esp)
	call	_malloc
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 24(%eax)
	movl	-20(%ebp), %eax
	movl	24(%eax), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcpy
	movl	$21, (%esp)
	call	_malloc
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 36(%eax)
	movl	-20(%ebp), %eax
	movl	36(%eax), %eax
	movl	$1635151433, (%eax)
	movl	$543451500, 4(%eax)
	movl	$1701539668, 8(%eax)
	movw	$110, 12(%eax)
	movl	-20(%ebp), %eax
	jmp	L68
L84:
	cmpb	$42, -21(%ebp)
	jne	L129
	movl	_input_buffer_ptr, %eax
	addl	$1, %eax
	movl	%eax, _input_buffer_ptr
	movl	-16(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -16(%ebp)
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	addl	%eax, %edx
	movzbl	-21(%ebp), %eax
	movb	%al, (%edx)
	movl	_lineNo, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 28(%eax)
	movl	$7, _state
	jmp	L76
L129:
	movl	-20(%ebp), %eax
	movb	$0, (%eax)
	movl	-20(%ebp), %eax
	movb	$0, 1(%eax)
	movl	-20(%ebp), %eax
	addl	$2, %eax
	movl	$5002573, (%eax)
	movl	_lineNo, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 28(%eax)
	movl	-16(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	movl	$21, (%esp)
	call	_malloc
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 24(%eax)
	movl	-20(%ebp), %eax
	movl	24(%eax), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcpy
	movl	-20(%ebp), %eax
	movl	$0, 36(%eax)
	movl	-20(%ebp), %eax
	jmp	L68
L85:
	cmpb	$42, -21(%ebp)
	jne	L131
	movl	_input_buffer_ptr, %eax
	addl	$1, %eax
	movl	%eax, _input_buffer_ptr
	movl	-16(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -16(%ebp)
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	addl	%eax, %edx
	movzbl	-21(%ebp), %eax
	movb	%al, (%edx)
	movl	_lineNo, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 28(%eax)
	movl	$8, _state
	jmp	L76
L131:
	cmpb	$10, -21(%ebp)
	jne	L133
	movl	_lineNo, %eax
	addl	$1, %eax
	movl	%eax, _lineNo
L133:
	movl	_input_buffer_ptr, %eax
	addl	$1, %eax
	movl	%eax, _input_buffer_ptr
	movl	_lineNo, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 28(%eax)
	movl	$7, _state
	jmp	L76
L86:
	cmpb	$42, -21(%ebp)
	jne	L134
	movl	_input_buffer_ptr, %eax
	addl	$1, %eax
	movl	%eax, _input_buffer_ptr
	movl	-16(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -16(%ebp)
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	addl	%eax, %edx
	movzbl	-21(%ebp), %eax
	movb	%al, (%edx)
	movl	-16(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	movl	-20(%ebp), %eax
	movb	$0, (%eax)
	movl	-20(%ebp), %eax
	movb	$0, 1(%eax)
	movl	-20(%ebp), %eax
	addl	$2, %eax
	movl	$1296912195, (%eax)
	movl	$1297370693, 4(%eax)
	movl	$4936257, 8(%eax)
	movl	_lineNo, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 28(%eax)
	movl	$21, (%esp)
	call	_malloc
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 24(%eax)
	movl	-20(%ebp), %eax
	movl	24(%eax), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcpy
	movl	-20(%ebp), %eax
	movl	$0, 36(%eax)
	movl	-20(%ebp), %eax
	jmp	L68
L134:
	cmpb	$10, -21(%ebp)
	jne	L135
	movl	_lineNo, %eax
	addl	$1, %eax
	movl	%eax, _lineNo
L135:
	movl	_input_buffer_ptr, %eax
	addl	$1, %eax
	movl	%eax, _input_buffer_ptr
	movl	_lineNo, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 28(%eax)
	movl	$7, _state
	jmp	L76
L87:
	movsbl	-21(%ebp), %eax
	movl	%eax, (%esp)
	call	_isalnum
	testl	%eax, %eax
	jne	L136
	cmpb	$95, -21(%ebp)
	jne	L137
L136:
	cmpl	$19, -16(%ebp)
	jle	L138
	movl	$105, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_realloc
	movl	%eax, -12(%ebp)
L138:
	movl	_input_buffer_ptr, %eax
	addl	$1, %eax
	movl	%eax, _input_buffer_ptr
	movl	-16(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -16(%ebp)
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	addl	%eax, %edx
	movzbl	-21(%ebp), %eax
	movb	%al, (%edx)
	movl	$9, _state
	jmp	L76
L137:
	cmpl	$19, -16(%ebp)
	jle	L139
	movl	_input_buffer_ptr, %eax
	addl	$1, %eax
	movl	%eax, _input_buffer_ptr
	movl	-20(%ebp), %eax
	movb	$1, 1(%eax)
	movl	_lineNo, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 28(%eax)
	movl	-16(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	movl	$105, (%esp)
	call	_malloc
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 24(%eax)
	movl	-20(%ebp), %eax
	movl	24(%eax), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcpy
	movl	$40, (%esp)
	call	_malloc
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 36(%eax)
	movl	-20(%ebp), %eax
	movl	36(%eax), %eax
	movl	$1852138569, (%eax)
	movl	$1768319348, 4(%eax)
	movl	$1663070821, 8(%eax)
	movl	$1869508193, 12(%eax)
	movl	$1700929652, 16(%eax)
	movl	$1852795936, 20(%eax)
	movl	$544367975, 24(%eax)
	movl	$1851877492, 28(%eax)
	movl	$3158560, 32(%eax)
	movl	-20(%ebp), %eax
	jmp	L68
L139:
	movl	-16(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	movl	$_hash_table, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_lookup
	movl	%eax, -28(%ebp)
	cmpl	$-1, -28(%ebp)
	je	L140
	movl	-20(%ebp), %eax
	movb	$0, (%eax)
	movl	-20(%ebp), %eax
	movb	$0, 1(%eax)
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	sall	$4, %eax
	subl	%edx, %eax
	leal	_tokens(%eax), %edx
	movl	-20(%ebp), %eax
	addl	$2, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcpy
	movl	_lineNo, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 28(%eax)
	movl	$21, (%esp)
	call	_malloc
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 24(%eax)
	movl	-20(%ebp), %eax
	movl	24(%eax), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcpy
	movl	-20(%ebp), %eax
	movl	$0, 36(%eax)
	movl	-20(%ebp), %eax
	jmp	L68
L140:
	movl	-20(%ebp), %eax
	movb	$0, (%eax)
	movl	-20(%ebp), %eax
	movb	$0, 1(%eax)
	movl	-20(%ebp), %eax
	addl	$2, %eax
	movw	$17481, (%eax)
	movb	$0, 2(%eax)
	movl	_lineNo, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 28(%eax)
	movl	$21, (%esp)
	call	_malloc
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 24(%eax)
	movl	-20(%ebp), %eax
	movl	24(%eax), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcpy
	movl	-20(%ebp), %eax
	movl	$0, 36(%eax)
	movl	-20(%ebp), %eax
	jmp	L68
L88:
	movsbl	-21(%ebp), %eax
	subl	$48, %eax
	cmpl	$9, %eax
	ja	L141
	movl	_input_buffer_ptr, %eax
	addl	$1, %eax
	movl	%eax, _input_buffer_ptr
	movl	-16(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -16(%ebp)
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	addl	%eax, %edx
	movzbl	-21(%ebp), %eax
	movb	%al, (%edx)
	movl	$10, _state
	jmp	L76
L141:
	cmpb	$46, -21(%ebp)
	jne	L143
	movl	$11, _state
	movl	_input_buffer_ptr, %eax
	addl	$1, %eax
	movl	%eax, _input_buffer_ptr
	movl	-16(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -16(%ebp)
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	addl	%eax, %edx
	movzbl	-21(%ebp), %eax
	movb	%al, (%edx)
	jmp	L76
L143:
	cmpb	$101, -21(%ebp)
	je	L144
	cmpb	$69, -21(%ebp)
	jne	L145
L144:
	movl	$13, _state
	movl	_input_buffer_ptr, %eax
	addl	$1, %eax
	movl	%eax, _input_buffer_ptr
	movl	-16(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -16(%ebp)
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	addl	%eax, %edx
	movzbl	-21(%ebp), %eax
	movb	%al, (%edx)
	jmp	L76
L145:
	movl	-20(%ebp), %eax
	movb	$1, (%eax)
	movl	-20(%ebp), %eax
	movb	$0, 1(%eax)
	movl	-20(%ebp), %eax
	addl	$2, %eax
	movl	$5068110, (%eax)
	movl	_lineNo, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 28(%eax)
	movl	-16(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	movl	$21, (%esp)
	call	_malloc
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 24(%eax)
	movl	-20(%ebp), %eax
	movl	24(%eax), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcpy
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_findValue
	fstps	-44(%ebp)
	movl	-44(%ebp), %edx
	movl	-20(%ebp), %eax
	movl	%edx, 32(%eax)
	movl	-20(%ebp), %eax
	movl	$0, 36(%eax)
	movl	-20(%ebp), %eax
	jmp	L68
L89:
	movsbl	-21(%ebp), %eax
	subl	$48, %eax
	cmpl	$9, %eax
	ja	L146
	movl	_input_buffer_ptr, %eax
	addl	$1, %eax
	movl	%eax, _input_buffer_ptr
	movl	-16(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -16(%ebp)
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	addl	%eax, %edx
	movzbl	-21(%ebp), %eax
	movb	%al, (%edx)
	movl	$12, _state
	jmp	L76
L146:
	cmpb	$46, -21(%ebp)
	jne	L148
	movl	_input_buffer_ptr, %eax
	subl	$1, %eax
	movl	%eax, _input_buffer_ptr
	movl	-16(%ebp), %eax
	leal	-1(%eax), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	movl	-16(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	movl	-20(%ebp), %eax
	movb	$1, (%eax)
	movl	-20(%ebp), %eax
	movb	$0, 1(%eax)
	movl	-20(%ebp), %eax
	addl	$2, %eax
	movl	$5068110, (%eax)
	movl	_lineNo, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 28(%eax)
	movl	$21, (%esp)
	call	_malloc
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 24(%eax)
	movl	-20(%ebp), %eax
	movl	24(%eax), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcpy
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_findValue
	fstps	-44(%ebp)
	movl	-44(%ebp), %edx
	movl	-20(%ebp), %eax
	movl	%edx, 32(%eax)
	movl	-20(%ebp), %eax
	movl	$0, 36(%eax)
	movl	-20(%ebp), %eax
	jmp	L68
L148:
	movl	-16(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	movl	-20(%ebp), %eax
	movb	$1, 1(%eax)
	movl	_lineNo, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 28(%eax)
	movl	$21, (%esp)
	call	_malloc
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 24(%eax)
	movl	-20(%ebp), %eax
	movl	24(%eax), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcpy
	movl	$21, (%esp)
	call	_malloc
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 36(%eax)
	movl	-20(%ebp), %eax
	movl	36(%eax), %eax
	movl	$1635151433, (%eax)
	movl	$543451500, 4(%eax)
	movl	$1701539668, 8(%eax)
	movw	$110, 12(%eax)
	movl	-20(%ebp), %eax
	jmp	L68
L90:
	movsbl	-21(%ebp), %eax
	subl	$48, %eax
	cmpl	$9, %eax
	ja	L149
	movl	$12, _state
	movl	_input_buffer_ptr, %eax
	addl	$1, %eax
	movl	%eax, _input_buffer_ptr
	movl	-16(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -16(%ebp)
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	addl	%eax, %edx
	movzbl	-21(%ebp), %eax
	movb	%al, (%edx)
	jmp	L76
L149:
	cmpb	$69, -21(%ebp)
	je	L151
	cmpb	$101, -21(%ebp)
	jne	L152
L151:
	movl	$13, _state
	movl	_input_buffer_ptr, %eax
	addl	$1, %eax
	movl	%eax, _input_buffer_ptr
	movl	-16(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -16(%ebp)
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	addl	%eax, %edx
	movzbl	-21(%ebp), %eax
	movb	%al, (%edx)
	jmp	L76
L152:
	movl	-20(%ebp), %eax
	movb	$1, (%eax)
	movl	-20(%ebp), %eax
	movb	$0, 1(%eax)
	movl	-20(%ebp), %eax
	addl	$2, %eax
	movl	$1297436242, (%eax)
	movb	$0, 4(%eax)
	movl	_lineNo, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 28(%eax)
	movl	-16(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	movl	$21, (%esp)
	call	_malloc
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 24(%eax)
	movl	-20(%ebp), %eax
	movl	24(%eax), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcpy
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_findValue
	fstps	-44(%ebp)
	movl	-44(%ebp), %edx
	movl	-20(%ebp), %eax
	movl	%edx, 32(%eax)
	movl	-20(%ebp), %eax
	movl	$0, 36(%eax)
	movl	-20(%ebp), %eax
	jmp	L68
L91:
	cmpb	$43, -21(%ebp)
	je	L153
	cmpb	$45, -21(%ebp)
	jne	L154
L153:
	movl	$14, _state
	movl	_input_buffer_ptr, %eax
	addl	$1, %eax
	movl	%eax, _input_buffer_ptr
	movl	-16(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -16(%ebp)
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	addl	%eax, %edx
	movzbl	-21(%ebp), %eax
	movb	%al, (%edx)
	jmp	L76
L154:
	movsbl	-21(%ebp), %eax
	subl	$48, %eax
	cmpl	$9, %eax
	ja	L156
	movl	$15, _state
	movl	_input_buffer_ptr, %eax
	addl	$1, %eax
	movl	%eax, _input_buffer_ptr
	movl	-16(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -16(%ebp)
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	addl	%eax, %edx
	movzbl	-21(%ebp), %eax
	movb	%al, (%edx)
	jmp	L76
L156:
	movl	-16(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	movl	-20(%ebp), %eax
	movb	$1, 1(%eax)
	movl	_lineNo, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 28(%eax)
	movl	$21, (%esp)
	call	_malloc
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 24(%eax)
	movl	-20(%ebp), %eax
	movl	24(%eax), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcpy
	movl	$21, (%esp)
	call	_malloc
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 36(%eax)
	movl	-20(%ebp), %eax
	movl	36(%eax), %eax
	movl	$1635151433, (%eax)
	movl	$543451500, 4(%eax)
	movl	$1701539668, 8(%eax)
	movw	$110, 12(%eax)
	movl	-20(%ebp), %eax
	jmp	L68
L92:
	movsbl	-21(%ebp), %eax
	subl	$48, %eax
	cmpl	$9, %eax
	ja	L157
	movl	$15, _state
	movl	_input_buffer_ptr, %eax
	addl	$1, %eax
	movl	%eax, _input_buffer_ptr
	movl	-16(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -16(%ebp)
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	addl	%eax, %edx
	movzbl	-21(%ebp), %eax
	movb	%al, (%edx)
	jmp	L76
L157:
	movl	-16(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	movl	-20(%ebp), %eax
	movb	$1, 1(%eax)
	movl	_lineNo, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 28(%eax)
	movl	$21, (%esp)
	call	_malloc
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 24(%eax)
	movl	-20(%ebp), %eax
	movl	24(%eax), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcpy
	movl	$21, (%esp)
	call	_malloc
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 36(%eax)
	movl	-20(%ebp), %eax
	movl	36(%eax), %eax
	movl	$1635151433, (%eax)
	movl	$543451500, 4(%eax)
	movl	$1701539668, 8(%eax)
	movw	$110, 12(%eax)
	movl	-20(%ebp), %eax
	jmp	L68
L93:
	movsbl	-21(%ebp), %eax
	subl	$48, %eax
	cmpl	$9, %eax
	ja	L159
	movl	$15, _state
	movl	_input_buffer_ptr, %eax
	addl	$1, %eax
	movl	%eax, _input_buffer_ptr
	movl	-16(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -16(%ebp)
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	addl	%eax, %edx
	movzbl	-21(%ebp), %eax
	movb	%al, (%edx)
	jmp	L76
L159:
	movl	-20(%ebp), %eax
	movb	$1, (%eax)
	movl	-20(%ebp), %eax
	movb	$0, 1(%eax)
	movl	-20(%ebp), %eax
	addl	$2, %eax
	movl	$1297436242, (%eax)
	movb	$0, 4(%eax)
	movl	_lineNo, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 28(%eax)
	movl	-16(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	movl	$21, (%esp)
	call	_malloc
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 24(%eax)
	movl	-20(%ebp), %eax
	movl	24(%eax), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcpy
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_findValue
	fstps	-44(%ebp)
	movl	-44(%ebp), %edx
	movl	-20(%ebp), %eax
	movl	%edx, 32(%eax)
	movl	-20(%ebp), %eax
	movl	$0, 36(%eax)
	movl	-20(%ebp), %eax
	jmp	L68
L94:
	cmpb	$46, -21(%ebp)
	jne	L161
	movl	_input_buffer_ptr, %eax
	addl	$1, %eax
	movl	%eax, _input_buffer_ptr
	movl	-16(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -16(%ebp)
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	addl	%eax, %edx
	movzbl	-21(%ebp), %eax
	movb	%al, (%edx)
	movl	-16(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	movl	-20(%ebp), %eax
	movb	$0, (%eax)
	movl	-20(%ebp), %eax
	movb	$0, 1(%eax)
	movl	-20(%ebp), %eax
	addl	$2, %eax
	movl	$1196310866, (%eax)
	movl	$5263173, 4(%eax)
	movl	_lineNo, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 28(%eax)
	movl	$21, (%esp)
	call	_malloc
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 24(%eax)
	movl	-20(%ebp), %eax
	movl	24(%eax), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcpy
	movl	-20(%ebp), %eax
	movl	$0, 36(%eax)
	movl	-20(%ebp), %eax
	jmp	L68
L161:
	movl	-16(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	movl	-20(%ebp), %eax
	movb	$1, 1(%eax)
	movl	_lineNo, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 28(%eax)
	movl	$21, (%esp)
	call	_malloc
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 24(%eax)
	movl	-20(%ebp), %eax
	movl	24(%eax), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcpy
	movl	$21, (%esp)
	call	_malloc
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 36(%eax)
	movl	-20(%ebp), %eax
	movl	36(%eax), %eax
	movl	$1635151433, (%eax)
	movl	$543451500, 4(%eax)
	movl	$1701539668, 8(%eax)
	movw	$110, 12(%eax)
	movl	-20(%ebp), %eax
	jmp	L68
L95:
	cmpb	$60, -21(%ebp)
	jne	L162
	movl	_input_buffer_ptr, %eax
	addl	$1, %eax
	movl	%eax, _input_buffer_ptr
	movl	-16(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -16(%ebp)
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	addl	%eax, %edx
	movzbl	-21(%ebp), %eax
	movb	%al, (%edx)
	movl	-16(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	movl	-20(%ebp), %eax
	movb	$0, (%eax)
	movl	-20(%ebp), %eax
	movb	$0, 1(%eax)
	movl	-20(%ebp), %eax
	addl	$2, %eax
	movl	$1447645764, (%eax)
	movl	$1162105413, 4(%eax)
	movw	$70, 8(%eax)
	movl	_lineNo, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 28(%eax)
	movl	$21, (%esp)
	call	_malloc
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 24(%eax)
	movl	-20(%ebp), %eax
	movl	24(%eax), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcpy
	movl	-20(%ebp), %eax
	movl	$0, 36(%eax)
	movl	-20(%ebp), %eax
	jmp	L68
L162:
	movl	-20(%ebp), %eax
	movb	$0, (%eax)
	movl	-20(%ebp), %eax
	movb	$0, 1(%eax)
	movl	-20(%ebp), %eax
	addl	$2, %eax
	movl	$4605252, (%eax)
	movl	_lineNo, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 28(%eax)
	movl	-16(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	movl	$21, (%esp)
	call	_malloc
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 24(%eax)
	movl	-20(%ebp), %eax
	movl	24(%eax), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcpy
	movl	-20(%ebp), %eax
	movl	$0, 36(%eax)
	movl	-20(%ebp), %eax
	jmp	L68
L96:
	cmpb	$62, -21(%ebp)
	jne	L163
	movl	_input_buffer_ptr, %eax
	addl	$1, %eax
	movl	%eax, _input_buffer_ptr
	movl	-16(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -16(%ebp)
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	addl	%eax, %edx
	movzbl	-21(%ebp), %eax
	movb	%al, (%edx)
	movl	-16(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	movl	-20(%ebp), %eax
	movb	$0, (%eax)
	movl	-20(%ebp), %eax
	movb	$0, 1(%eax)
	movl	-20(%ebp), %eax
	addl	$2, %eax
	movl	$1447645764, (%eax)
	movl	$1313165893, 4(%eax)
	movl	$1178944580, 8(%eax)
	movb	$0, 12(%eax)
	movl	_lineNo, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 28(%eax)
	movl	$21, (%esp)
	call	_malloc
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 24(%eax)
	movl	-20(%ebp), %eax
	movl	24(%eax), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcpy
	movl	-20(%ebp), %eax
	movl	$0, 36(%eax)
	movl	-20(%ebp), %eax
	jmp	L68
L163:
	movl	-20(%ebp), %eax
	movb	$0, (%eax)
	movl	-20(%ebp), %eax
	movb	$0, 1(%eax)
	movl	-20(%ebp), %eax
	addl	$2, %eax
	movl	$1145327173, (%eax)
	movw	$17989, 4(%eax)
	movb	$0, 6(%eax)
	movl	_lineNo, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 28(%eax)
	movl	-16(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	movl	$21, (%esp)
	call	_malloc
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 24(%eax)
	movl	-20(%ebp), %eax
	movl	24(%eax), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcpy
	movl	-20(%ebp), %eax
	movl	$0, 36(%eax)
	movl	-20(%ebp), %eax
	jmp	L68
L76:
	jmp	L164
L68:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE27:
	.section .rdata,"dr"
	.align 8
LC4:
	.long	0
	.long	1076101120
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_fopen;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_fclose;	.scl	2;	.type	32;	.endef
	.def	_strtof;	.scl	2;	.type	32;	.endef
	.def	_pow;	.scl	2;	.type	32;	.endef
	.def	_strlen;	.scl	2;	.type	32;	.endef
	.def	_malloc;	.scl	2;	.type	32;	.endef
	.def	_strcpy;	.scl	2;	.type	32;	.endef
	.def	_strcmp;	.scl	2;	.type	32;	.endef
	.def	_memset;	.scl	2;	.type	32;	.endef
	.def	_exit;	.scl	2;	.type	32;	.endef
	.def	_fread;	.scl	2;	.type	32;	.endef
	.def	_fseek;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_putchar;	.scl	2;	.type	32;	.endef
	.def	_fgetc;	.scl	2;	.type	32;	.endef
	.def	_remove;	.scl	2;	.type	32;	.endef
	.def	_fwrite;	.scl	2;	.type	32;	.endef
	.def	_isalnum;	.scl	2;	.type	32;	.endef
	.def	_realloc;	.scl	2;	.type	32;	.endef
