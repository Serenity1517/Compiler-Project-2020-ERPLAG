	.file	"functionCheck.c"
	.comm	_isDeclared, 4, 2
	.comm	_isCorrect, 4, 2
	.comm	_modules, 4, 2
	.comm	_lines, 4, 2
	.comm	_n, 4, 2
	.globl	_currModuleNo
	.bss
	.align 4
_currModuleNo:
	.space 4
	.text
	.globl	_moduleSequenceMap
	.def	_moduleSequenceMap;	.scl	2;	.type	32;	.endef
_moduleSequenceMap:
LFB17:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$0, -12(%ebp)
	jmp	L2
L5:
	movl	_modules, %eax
	movl	-12(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L3
	movl	-12(%ebp), %eax
	jmp	L4
L3:
	addl	$1, -12(%ebp)
L2:
	movl	_n, %eax
	cmpl	%eax, -12(%ebp)
	jl	L5
	movl	$-1, %eax
L4:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE17:
	.section .rdata,"dr"
LC0:
	.ascii "driverModule\0"
	.text
	.globl	_populateModuleSequenceMap
	.def	_populateModuleSequenceMap;	.scl	2;	.type	32;	.endef
_populateModuleSequenceMap:
LFB18:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$68, %esp
	.cfi_offset 3, -12
	movl	$4, (%esp)
	call	_malloc
	movl	%eax, _modules
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, _n
	movl	_n, %eax
	sall	$2, %eax
	movl	%eax, (%esp)
	call	_malloc
	movl	%eax, _lines
	movl	$0, -12(%ebp)
	jmp	L7
L8:
	movl	_modules, %eax
	movl	-12(%ebp), %edx
	sall	$2, %edx
	leal	(%eax,%edx), %ebx
	movl	$21, (%esp)
	call	_malloc
	movl	%eax, (%ebx)
	addl	$1, -12(%ebp)
L7:
	movl	_n, %eax
	cmpl	%eax, -12(%ebp)
	jl	L8
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	%eax, -16(%ebp)
	movl	-16(%ebp), %eax
	movl	60(%eax), %eax
	cmpl	$21, %eax
	je	L9
	jmp	L10
L11:
	movl	-16(%ebp), %eax
	movl	76(%eax), %eax
	leal	21(%eax), %edx
	movl	$-1, 16(%esp)
	movl	$0, 12(%esp)
	movl	$2, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_lookupString
	movl	%eax, -20(%ebp)
	movl	-16(%ebp), %eax
	movl	76(%eax), %eax
	leal	21(%eax), %edx
	movl	_modules, %ecx
	movl	-20(%ebp), %eax
	movl	36(%eax), %eax
	sall	$2, %eax
	addl	%ecx, %eax
	movl	(%eax), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcpy
	movl	_lines, %edx
	movl	-20(%ebp), %eax
	movl	36(%eax), %eax
	sall	$2, %eax
	addl	%eax, %edx
	movl	-16(%ebp), %eax
	movl	76(%eax), %eax
	movl	44(%eax), %eax
	movl	%eax, (%edx)
	movl	-16(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -16(%ebp)
L10:
	cmpl	$0, -16(%ebp)
	jne	L11
L9:
	movl	$-1, 16(%esp)
	movl	$0, 12(%esp)
	movl	$1, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_lookupString
	movl	%eax, -24(%ebp)
	movl	_modules, %edx
	movl	-24(%ebp), %eax
	movl	4(%eax), %eax
	sall	$2, %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	$1986622052, (%eax)
	movl	$1867346533, 4(%eax)
	movl	$1701606756, 8(%eax)
	movb	$0, 12(%eax)
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	72(%eax), %eax
	movl	72(%eax), %eax
	movl	%eax, -16(%ebp)
	movl	-16(%ebp), %eax
	movl	60(%eax), %eax
	cmpl	$21, %eax
	je	L15
	jmp	L13
L14:
	movl	-16(%ebp), %eax
	movl	76(%eax), %eax
	leal	21(%eax), %edx
	movl	$-1, 16(%esp)
	movl	$0, 12(%esp)
	movl	$2, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_lookupString
	movl	%eax, -28(%ebp)
	movl	-16(%ebp), %eax
	movl	76(%eax), %eax
	leal	21(%eax), %edx
	movl	_modules, %ecx
	movl	-28(%ebp), %eax
	movl	36(%eax), %eax
	sall	$2, %eax
	addl	%ecx, %eax
	movl	(%eax), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcpy
	movl	_lines, %edx
	movl	-28(%ebp), %eax
	movl	36(%eax), %eax
	sall	$2, %eax
	addl	%eax, %edx
	movl	-16(%ebp), %eax
	movl	76(%eax), %eax
	movl	44(%eax), %eax
	movl	%eax, (%edx)
	movl	-16(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -16(%ebp)
L13:
	cmpl	$0, -16(%ebp)
	jne	L14
L15:
	nop
	addl	$68, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.section .rdata,"dr"
	.align 4
LC1:
	.ascii "\12Symbol Table not populated correctly \0"
	.text
	.globl	_initializeDeclaredList
	.def	_initializeDeclaredList;	.scl	2;	.type	32;	.endef
_initializeDeclaredList:
LFB19:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	_malloc
	movl	%eax, _isDeclared
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	_malloc
	movl	%eax, _isCorrect
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	%eax, -12(%ebp)
	movl	$0, -16(%ebp)
	jmp	L17
L18:
	movl	_isDeclared, %edx
	movl	-16(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	movl	_isCorrect, %edx
	movl	-16(%ebp), %eax
	addl	%edx, %eax
	movb	$1, (%eax)
	addl	$1, -16(%ebp)
L17:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	-16(%ebp), %eax
	jg	L18
	movl	-12(%ebp), %eax
	movl	60(%eax), %eax
	cmpl	$21, %eax
	je	L24
	jmp	L20
L23:
	movl	-12(%ebp), %eax
	leal	21(%eax), %edx
	movl	$-1, 16(%esp)
	movl	$0, 12(%esp)
	movl	$2, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_lookupString
	movl	%eax, -20(%ebp)
	cmpl	$0, -20(%ebp)
	je	L21
	movl	_isDeclared, %edx
	movl	-20(%ebp), %eax
	movl	36(%eax), %eax
	addl	%edx, %eax
	movb	$1, (%eax)
	movl	_isCorrect, %edx
	movl	-20(%ebp), %eax
	movl	36(%eax), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	jmp	L22
L21:
	movl	$LC1, (%esp)
	call	_printf
L22:
	movl	-12(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -12(%ebp)
L20:
	cmpl	$0, -12(%ebp)
	jne	L23
L24:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE19:
	.section .rdata,"dr"
LC2:
	.ascii "LINE %d: %s\0"
	.text
	.globl	_checkModules
	.def	_checkModules;	.scl	2;	.type	32;	.endef
_checkModules:
LFB20:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	%eax, -12(%ebp)
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	72(%eax), %eax
	movl	%eax, -28(%ebp)
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	72(%eax), %eax
	movl	72(%eax), %eax
	movl	%eax, -16(%ebp)
	movl	-12(%ebp), %eax
	movl	60(%eax), %eax
	cmpl	$21, %eax
	je	L26
	jmp	L27
L28:
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_processModule
	movl	-12(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -12(%ebp)
	movl	_currModuleNo, %eax
	addl	$1, %eax
	movl	%eax, _currModuleNo
L27:
	cmpl	$0, -12(%ebp)
	jne	L28
L26:
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	call	_processModule
	movl	_currModuleNo, %eax
	addl	$1, %eax
	movl	%eax, _currModuleNo
	movl	-16(%ebp), %eax
	movl	60(%eax), %eax
	cmpl	$21, %eax
	je	L29
	jmp	L30
L31:
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_processModule
	movl	-16(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -16(%ebp)
	movl	_currModuleNo, %eax
	addl	$1, %eax
	movl	%eax, _currModuleNo
L30:
	cmpl	$0, -16(%ebp)
	jne	L31
L29:
	movl	$0, -20(%ebp)
	jmp	L32
L37:
	movl	_isCorrect, %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	je	L33
	addl	$1, -20(%ebp)
	jmp	L32
L33:
	call	_createErrorObject
	movl	%eax, -32(%ebp)
	movl	_lines, %eax
	movl	-20(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %edx
	movl	-32(%ebp), %eax
	movl	%edx, 156(%eax)
	movl	-32(%ebp), %eax
	addl	$4, %eax
	movl	$1969516365, (%eax)
	movl	$1142973804, 4(%eax)
	movl	$1634493285, 8(%eax)
	movl	$1769234802, 12(%eax)
	movl	$1763733103, 16(%eax)
	movl	$1869488243, 20(%eax)
	movl	$1701716084, 24(%eax)
	movl	$1684366437, 28(%eax)
	movl	$1919903264, 32(%eax)
	movl	$1768453152, 36(%eax)
	movl	$1969627251, 40(%eax)
	movl	$1769235310, 44(%eax)
	movl	$539848303, 48(%eax)
	movb	$0, 52(%eax)
	movl	_modules, %eax
	movl	-20(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	-32(%ebp), %edx
	addl	$4, %edx
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_strcat
	movl	-32(%ebp), %eax
	leal	4(%eax), %edx
	movl	-32(%ebp), %eax
	movl	156(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_printf
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -24(%ebp)
	jmp	L34
L35:
	movl	-24(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -24(%ebp)
L34:
	movl	-24(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L35
	movl	-24(%ebp), %eax
	movl	-32(%ebp), %edx
	movl	%edx, (%eax)
	movl	12(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	12(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L36
L32:
	movl	_n, %eax
	cmpl	%eax, -20(%ebp)
	jl	L37
L36:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE20:
	.globl	_processModule
	.def	_processModule;	.scl	2;	.type	32;	.endef
_processModule:
LFB21:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	60(%eax), %eax
	cmpl	$21, %eax
	je	L43
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	72(%eax), %eax
	movl	72(%eax), %eax
	movl	%eax, -12(%ebp)
	jmp	L41
L42:
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_processStmt
	movl	-12(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -12(%ebp)
L41:
	cmpl	$0, -12(%ebp)
	jne	L42
	jmp	L38
L43:
	nop
L38:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE21:
	.section .rdata,"dr"
LC3:
	.ascii "LINE %d: %s\12\0"
	.align 4
LC4:
	.ascii "Sequence numbers not populated correctly\0"
	.text
	.globl	_processStmt
	.def	_processStmt;	.scl	2;	.type	32;	.endef
_processStmt:
LFB22:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$72, %esp
	movl	8(%ebp), %eax
	movl	60(%eax), %eax
	cmpl	$8, %eax
	je	L46
	cmpl	$8, %eax
	ja	L47
	cmpl	$7, %eax
	je	L48
	jmp	L56
L47:
	cmpl	$13, %eax
	je	L49
	cmpl	$16, %eax
	je	L50
	jmp	L56
L50:
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	%eax, -12(%ebp)
	jmp	L51
L55:
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	movl	%eax, -16(%ebp)
	movl	-16(%ebp), %eax
	movl	60(%eax), %eax
	cmpl	$21, %eax
	je	L52
	jmp	L53
L54:
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_processStmt
	movl	-16(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -16(%ebp)
L53:
	cmpl	$0, -16(%ebp)
	jne	L54
L52:
	movl	-12(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -12(%ebp)
L51:
	cmpl	$0, -12(%ebp)
	jne	L55
	jmp	L56
L48:
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	72(%eax), %eax
	movl	%eax, -20(%ebp)
	jmp	L57
L58:
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_processStmt
	movl	-20(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -20(%ebp)
L57:
	cmpl	$0, -20(%ebp)
	jne	L58
	jmp	L56
L46:
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	%eax, -24(%ebp)
	jmp	L59
L60:
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-24(%ebp), %eax
	movl	%eax, (%esp)
	call	_processStmt
	movl	-24(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -24(%ebp)
L59:
	cmpl	$0, -24(%ebp)
	jne	L60
	jmp	L56
L49:
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	addl	$21, %eax
	movl	%eax, (%esp)
	call	_moduleSequenceMap
	movl	%eax, -36(%ebp)
	cmpl	$-1, -36(%ebp)
	jne	L61
	call	_createErrorObject
	movl	%eax, -40(%ebp)
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	44(%eax), %edx
	movl	-40(%ebp), %eax
	movl	%edx, 156(%eax)
	movl	-40(%ebp), %eax
	addl	$4, %eax
	movl	$1819042115, (%eax)
	movl	$1713398885, 4(%eax)
	movl	$1952673397, 8(%eax)
	movl	$544108393, 12(%eax)
	movl	$544432488, 16(%eax)
	movl	$544501614, 20(%eax)
	movl	$1852138850, 24(%eax)
	movl	$1717920800, 28(%eax)
	movl	$1684369001, 32(%eax)
	movl	$1667589167, 36(%eax)
	movl	$1701994860, 40(%eax)
	movw	$8292, 44(%eax)
	movb	$0, 46(%eax)
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	leal	21(%eax), %edx
	movl	-40(%ebp), %eax
	addl	$4, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcat
	movl	-40(%ebp), %eax
	leal	4(%eax), %edx
	movl	-40(%ebp), %eax
	movl	156(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_printf
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -28(%ebp)
	jmp	L62
L63:
	movl	-28(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -28(%ebp)
L62:
	movl	-28(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L63
	movl	-28(%ebp), %eax
	movl	-40(%ebp), %edx
	movl	%edx, (%eax)
	movl	12(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	12(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L56
L61:
	movl	_currModuleNo, %eax
	cmpl	%eax, -36(%ebp)
	jl	L71
	movl	_currModuleNo, %eax
	cmpl	%eax, -36(%ebp)
	jle	L65
	movl	_isDeclared, %edx
	movl	-36(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	je	L66
	movl	_isCorrect, %edx
	movl	-36(%ebp), %eax
	addl	%edx, %eax
	movb	$1, (%eax)
	jmp	L56
L66:
	call	_createErrorObject
	movl	%eax, -44(%ebp)
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	44(%eax), %edx
	movl	-44(%ebp), %eax
	movl	%edx, 156(%eax)
	movl	-44(%ebp), %eax
	addl	$4, %eax
	movl	$1969516365, (%eax)
	movl	$1847616876, 4(%eax)
	movl	$1679848559, 8(%eax)
	movl	$1852401253, 12(%eax)
	movl	$2122853, 16(%eax)
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	leal	21(%eax), %edx
	movl	-44(%ebp), %eax
	addl	$4, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcat
	movl	-44(%ebp), %eax
	leal	4(%eax), %edx
	movl	-44(%ebp), %eax
	movl	156(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC3, (%esp)
	call	_printf
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -32(%ebp)
	jmp	L68
L69:
	movl	-32(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -32(%ebp)
L68:
	movl	-32(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L69
	movl	-32(%ebp), %eax
	movl	-44(%ebp), %edx
	movl	%edx, (%eax)
	movl	12(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	12(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L56
L65:
	movl	_currModuleNo, %eax
	cmpl	%eax, -36(%ebp)
	je	L72
	movl	$LC4, (%esp)
	call	_puts
	jmp	L72
L71:
	nop
	jmp	L56
L72:
	nop
L56:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE22:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_strcmp;	.scl	2;	.type	32;	.endef
	.def	_malloc;	.scl	2;	.type	32;	.endef
	.def	_lookupString;	.scl	2;	.type	32;	.endef
	.def	_strcpy;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_createErrorObject;	.scl	2;	.type	32;	.endef
	.def	_strcat;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
