	.file	"symboltable.c"
	.comm	_symbolTableRoot, 4, 2
	.comm	_moduleNumber, 4, 2
	.globl	_dupOutputParamErrorFound
	.bss
_dupOutputParamErrorFound:
	.space 1
	.text
	.globl	_getsymbolTable
	.def	_getsymbolTable;	.scl	2;	.type	32;	.endef
_getsymbolTable:
LFB17:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	_symbolTableRoot, %eax
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE17:
	.globl	_computeBlockHash
	.def	_computeBlockHash;	.scl	2;	.type	32;	.endef
_computeBlockHash:
LFB18:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	$0, -4(%ebp)
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	imull	%edx, %eax
	movl	%eax, -4(%ebp)
	movl	-4(%ebp), %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$3, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, -4(%ebp)
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	addl	%edx, %eax
	addl	%eax, -4(%ebp)
	movl	-4(%ebp), %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$3, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, -4(%ebp)
	movl	-4(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.globl	_computeStringHash
	.def	_computeStringHash;	.scl	2;	.type	32;	.endef
_computeStringHash:
LFB19:
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
	jmp	L6
L7:
	movl	-16(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	addl	%eax, -12(%ebp)
	movl	-12(%ebp), %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$3, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, -12(%ebp)
	addl	$1, -16(%ebp)
L6:
	movl	-16(%ebp), %eax
	cmpl	-20(%ebp), %eax
	jl	L7
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE19:
	.globl	_createSymbolTable
	.def	_createSymbolTable;	.scl	2;	.type	32;	.endef
_createSymbolTable:
LFB20:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$104, (%esp)
	call	_malloc
	movl	%eax, -16(%ebp)
	movl	-16(%ebp), %eax
	movl	$0, (%eax)
	movl	-16(%ebp), %eax
	movl	$0, 4(%eax)
	movl	-16(%ebp), %eax
	movl	$0, 8(%eax)
	movl	$0, -12(%ebp)
	jmp	L10
L11:
	movl	-16(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	$0, 12(%eax,%edx,4)
	addl	$1, -12(%ebp)
L10:
	cmpl	$19, -12(%ebp)
	jle	L11
	movl	-16(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, 100(%eax)
	movl	-16(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE20:
	.globl	_createSymbolTableEntry
	.def	_createSymbolTableEntry;	.scl	2;	.type	32;	.endef
_createSymbolTableEntry:
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
	subl	$44, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movl	$92, (%esp)
	call	_malloc
	movl	%eax, -28(%ebp)
	movl	-28(%ebp), %eax
	movl	$0, (%eax)
	movl	-28(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$4, %eax
	movl	%edx, %ebx
	movl	$20, %edx
	movl	%eax, %edi
	movl	%ebx, %esi
	movl	%edx, %ecx
	rep movsl
	movl	-28(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, 84(%eax)
	movl	-28(%ebp), %eax
	movl	$0, 88(%eax)
	movl	-28(%ebp), %eax
	addl	$44, %esp
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
	.globl	_createSymbol
	.def	_createSymbol;	.scl	2;	.type	32;	.endef
_createSymbol:
LFB22:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$80, (%esp)
	call	_malloc
	movl	%eax, -12(%ebp)
	movl	8(%ebp), %eax
	movl	60(%eax), %eax
	cmpl	$20, %eax
	jne	L16
	movl	8(%ebp), %eax
	movl	68(%eax), %eax
	movl	60(%eax), %eax
	cmpl	$1, %eax
	je	L16
	movl	8(%ebp), %eax
	movl	68(%eax), %eax
	movl	60(%eax), %eax
	testl	%eax, %eax
	je	L16
	movl	-12(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, (%eax)
	movl	-12(%ebp), %eax
	movl	$0, 8(%eax)
	movl	-12(%ebp), %eax
	movl	$0, 4(%eax)
	movl	-12(%ebp), %eax
	movl	$0, 76(%eax)
	movl	-12(%ebp), %eax
	movb	$0, 72(%eax)
	jmp	L17
L16:
	movl	8(%ebp), %eax
	movl	60(%eax), %eax
	cmpl	$1, %eax
	jne	L18
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	leal	21(%eax), %edx
	movl	-12(%ebp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcpy
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %edx
	movl	-12(%ebp), %eax
	movl	%edx, 24(%eax)
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	72(%eax), %edx
	movl	-12(%ebp), %eax
	movl	%edx, 28(%eax)
	movl	_moduleNumber, %edx
	movl	-12(%ebp), %eax
	movl	%edx, 32(%eax)
	movl	_moduleNumber, %eax
	addl	$1, %eax
	movl	%eax, _moduleNumber
	movl	-12(%ebp), %eax
	movb	$1, 37(%eax)
	jmp	L17
L18:
	movl	8(%ebp), %eax
	movl	60(%eax), %eax
	cmpl	$7, %eax
	jne	L19
	movl	-12(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, (%eax)
	jmp	L17
L19:
	movl	8(%ebp), %eax
	movl	60(%eax), %eax
	cmpl	$8, %eax
	jne	L20
	movl	-12(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, (%eax)
	jmp	L17
L20:
	movl	8(%ebp), %eax
	movl	60(%eax), %eax
	cmpl	$16, %eax
	jne	L21
	movl	-12(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, (%eax)
	jmp	L17
L21:
	movl	8(%ebp), %eax
	movl	60(%eax), %eax
	testl	%eax, %eax
	je	L17
	movl	-12(%ebp), %eax
	jmp	L22
L17:
	movl	-12(%ebp), %eax
L22:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE22:
	.globl	_isSymbolEqual
	.def	_isSymbolEqual;	.scl	2;	.type	32;	.endef
_isSymbolEqual:
LFB23:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	12(%ebp), %eax
	cmpl	20(%ebp), %eax
	je	L24
	movl	$0, %eax
	jmp	L23
L24:
	cmpl	$5, 12(%ebp)
	ja	L26
	movl	12(%ebp), %eax
	sall	$2, %eax
	addl	$L28, %eax
	movl	(%eax), %eax
	jmp	*%eax
	.section .rdata,"dr"
	.align 4
L28:
	.long	L27
	.long	L26
	.long	L29
	.long	L30
	.long	L31
	.long	L32
	.text
L27:
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	leal	21(%eax), %edx
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	addl	$21, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L33
	movl	$1, %eax
	jmp	L23
L33:
	movl	$0, %eax
	jmp	L23
L29:
	movl	16(%ebp), %edx
	movl	8(%ebp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L34
	movl	$1, %eax
	jmp	L23
L34:
	movl	$0, %eax
	jmp	L23
L30:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	(%eax), %edx
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	cmpl	%eax, %edx
	jne	L35
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	4(%eax), %edx
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	4(%eax), %eax
	cmpl	%eax, %edx
	jne	L35
	movl	$1, %eax
	jmp	L23
L35:
	movl	$0, %eax
	jmp	L23
L31:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	(%eax), %edx
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	cmpl	%eax, %edx
	jne	L36
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	4(%eax), %edx
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	4(%eax), %eax
	cmpl	%eax, %edx
	jne	L36
	movl	$1, %eax
	jmp	L23
L36:
	movl	$0, %eax
	jmp	L23
L32:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	(%eax), %edx
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	cmpl	%eax, %edx
	jne	L37
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	4(%eax), %edx
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	4(%eax), %eax
	cmpl	%eax, %edx
	jne	L37
	movl	$1, %eax
	jmp	L23
L37:
	movl	$0, %eax
	jmp	L23
L26:
L23:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE23:
	.globl	_lookupString
	.def	_lookupString;	.scl	2;	.type	32;	.endef
_lookupString:
LFB24:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$72, %esp
	movl	20(%ebp), %eax
	movb	%al, -28(%ebp)
	cmpl	$0, 12(%ebp)
	jne	L39
	movl	$0, %eax
	jmp	L40
L39:
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_computeStringHash
	movl	%eax, %edx
	movl	12(%ebp), %eax
	movl	12(%eax,%edx,4), %eax
	movl	%eax, -12(%ebp)
	cmpl	$2, 16(%ebp)
	jne	L41
	jmp	L42
L45:
	movl	-12(%ebp), %eax
	movl	84(%eax), %eax
	cmpl	16(%ebp), %eax
	je	L43
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
	jmp	L42
L43:
	movl	-12(%ebp), %eax
	leal	4(%eax), %edx
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L44
	movl	-12(%ebp), %eax
	jmp	L40
L44:
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
L42:
	cmpl	$0, -12(%ebp)
	jne	L45
	cmpb	$0, -28(%ebp)
	je	L46
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	24(%ebp), %edx
	movl	%edx, 16(%esp)
	movl	$1, 12(%esp)
	movl	16(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_lookupString
	jmp	L40
L46:
	movl	$0, %eax
	jmp	L40
L41:
	cmpl	$0, 16(%ebp)
	jne	L47
	jmp	L48
L53:
	movl	-12(%ebp), %eax
	movl	84(%eax), %eax
	testl	%eax, %eax
	je	L49
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
	jmp	L48
L49:
	movl	-12(%ebp), %eax
	movl	4(%eax), %eax
	leal	21(%eax), %edx
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L50
	movl	-12(%ebp), %eax
	movl	80(%eax), %eax
	testl	%eax, %eax
	je	L51
	movl	-12(%ebp), %eax
	movl	80(%eax), %eax
	movl	4(%eax), %eax
	movl	44(%eax), %eax
	cmpl	24(%ebp), %eax
	jge	L52
	movl	-12(%ebp), %eax
	movl	80(%eax), %eax
	jmp	L40
L52:
	movl	-12(%ebp), %eax
	jmp	L40
L51:
	movl	-12(%ebp), %eax
	jmp	L40
L50:
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
L48:
	cmpl	$0, -12(%ebp)
	jne	L53
	cmpb	$0, -28(%ebp)
	je	L54
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	24(%ebp), %edx
	movl	%edx, 16(%esp)
	movl	$1, 12(%esp)
	movl	16(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_lookupString
	jmp	L40
L54:
	movl	$0, %eax
	jmp	L40
L47:
	cmpl	$1, 16(%ebp)
	jne	L55
	jmp	L56
L58:
	movl	-12(%ebp), %eax
	movl	84(%eax), %eax
	cmpl	16(%ebp), %eax
	je	L57
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
	jmp	L56
L57:
	movl	-12(%ebp), %eax
	jmp	L40
L56:
	cmpl	$0, -12(%ebp)
	jne	L58
	cmpb	$0, -28(%ebp)
	je	L59
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	24(%ebp), %edx
	movl	%edx, 16(%esp)
	movl	$1, 12(%esp)
	movl	16(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_lookupString
	jmp	L40
L59:
	movl	$0, %eax
	jmp	L40
L55:
	movl	$0, %eax
L40:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE24:
	.globl	_lookupBlock
	.def	_lookupBlock;	.scl	2;	.type	32;	.endef
_lookupBlock:
LFB25:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	20(%ebp), %eax
	movb	%al, -28(%ebp)
	cmpl	$0, 12(%ebp)
	jne	L61
	movl	$0, %eax
	jmp	L62
L61:
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_computeBlockHash
	movl	%eax, %edx
	movl	12(%ebp), %eax
	movl	12(%eax,%edx,4), %eax
	movl	%eax, -12(%ebp)
	cmpl	$3, 16(%ebp)
	jne	L63
	jmp	L64
L67:
	movl	-12(%ebp), %eax
	movl	84(%eax), %eax
	cmpl	$3, %eax
	je	L65
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
	jmp	L64
L65:
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	-12(%ebp), %eax
	movl	4(%eax), %eax
	movl	(%eax), %eax
	cmpl	%eax, %edx
	jne	L66
	movl	8(%ebp), %eax
	movl	4(%eax), %edx
	movl	-12(%ebp), %eax
	movl	4(%eax), %eax
	movl	4(%eax), %eax
	cmpl	%eax, %edx
	jne	L66
	movl	-12(%ebp), %eax
	jmp	L62
L66:
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
L64:
	cmpl	$0, -12(%ebp)
	jne	L67
	cmpb	$0, -28(%ebp)
	je	L68
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	$1, 12(%esp)
	movl	16(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_lookupBlock
	jmp	L62
L68:
	movl	$0, %eax
	jmp	L62
L63:
	cmpl	$4, 16(%ebp)
	jne	L69
	jmp	L70
L73:
	movl	-12(%ebp), %eax
	movl	84(%eax), %eax
	cmpl	$4, %eax
	je	L71
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
	jmp	L70
L71:
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	-12(%ebp), %eax
	movl	4(%eax), %eax
	movl	(%eax), %eax
	cmpl	%eax, %edx
	jne	L72
	movl	8(%ebp), %eax
	movl	4(%eax), %edx
	movl	-12(%ebp), %eax
	movl	4(%eax), %eax
	movl	4(%eax), %eax
	cmpl	%eax, %edx
	jne	L72
	movl	-12(%ebp), %eax
	jmp	L62
L72:
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
L70:
	cmpl	$0, -12(%ebp)
	jne	L73
	cmpb	$0, -28(%ebp)
	je	L74
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	$1, 12(%esp)
	movl	16(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_lookupBlock
	jmp	L62
L74:
	movl	$0, %eax
	jmp	L62
L69:
	cmpl	$5, 16(%ebp)
	jne	L75
	jmp	L76
L79:
	movl	-12(%ebp), %eax
	movl	84(%eax), %eax
	cmpl	$5, %eax
	je	L77
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
	jmp	L76
L77:
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	-12(%ebp), %eax
	movl	4(%eax), %eax
	movl	(%eax), %eax
	cmpl	%eax, %edx
	jne	L78
	movl	8(%ebp), %eax
	movl	4(%eax), %edx
	movl	-12(%ebp), %eax
	movl	4(%eax), %eax
	movl	4(%eax), %eax
	cmpl	%eax, %edx
	jne	L78
	movl	-12(%ebp), %eax
	jmp	L62
L78:
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
L76:
	cmpl	$0, -12(%ebp)
	jne	L79
	cmpb	$0, -28(%ebp)
	je	L80
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	$1, 12(%esp)
	movl	16(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_lookupBlock
	jmp	L62
L80:
	movl	$0, %eax
	jmp	L62
L75:
	movl	$0, %eax
L62:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE25:
	.globl	_checkForOutputParamOverloading
	.def	_checkForOutputParamOverloading;	.scl	2;	.type	32;	.endef
_checkForOutputParamOverloading:
LFB26:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	cmpl	$0, 12(%ebp)
	jne	L82
	movl	$0, %eax
	jmp	L83
L82:
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_computeStringHash
	movl	%eax, %edx
	movl	12(%ebp), %eax
	movl	12(%eax,%edx,4), %eax
	movl	%eax, -12(%ebp)
	jmp	L84
L87:
	movl	-12(%ebp), %eax
	movl	84(%eax), %eax
	testl	%eax, %eax
	je	L85
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
	jmp	L84
L85:
	movl	-12(%ebp), %eax
	movl	4(%eax), %eax
	leal	21(%eax), %edx
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L86
	movl	-12(%ebp), %eax
	jmp	L83
L86:
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
L84:
	cmpl	$0, -12(%ebp)
	jne	L87
	movl	$0, %eax
L83:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE26:
	.section .rdata,"dr"
LC0:
	.ascii "LINE %d: %s\12\0"
LC1:
	.ascii "\12SEMANTIC ERROR\0"
	.text
	.globl	_recursiveCheckOverload
	.def	_recursiveCheckOverload;	.scl	2;	.type	32;	.endef
_recursiveCheckOverload:
LFB27:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%ebx
	subl	$32, %esp
	.cfi_offset 7, -12
	.cfi_offset 3, -16
	movl	12(%ebp), %eax
	movl	%eax, -12(%ebp)
	cmpl	$0, 12(%ebp)
	je	L99
	jmp	L91
L98:
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	leal	21(%eax), %edx
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_checkForOutputParamOverloading
	testl	%eax, %eax
	jne	L92
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	movl	16(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_recursiveCheckOverload
	movzbl	_dupOutputParamErrorFound, %eax
	testb	%al, %al
	jne	L100
	movl	-12(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, -12(%ebp)
	jmp	L91
L92:
	movb	$1, _dupOutputParamErrorFound
	call	_createErrorObject
	movl	%eax, -20(%ebp)
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	leal	21(%eax), %edx
	movl	-20(%ebp), %eax
	addl	$4, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcpy
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	44(%eax), %edx
	movl	-20(%ebp), %eax
	movl	%edx, 156(%eax)
	movl	-20(%ebp), %eax
	leal	4(%eax), %edx
	movl	%edx, %eax
	movl	$-1, %ecx
	movl	%eax, %ebx
	movl	$0, %eax
	movl	%ebx, %edi
	repnz scasb
	movl	%ecx, %eax
	notl	%eax
	subl	$1, %eax
	addl	%edx, %eax
	movl	$761614880, (%eax)
	movl	$1818453348, 4(%eax)
	movl	$1952543329, 8(%eax)
	movl	$544108393, 12(%eax)
	movl	$1864394351, 16(%eax)
	movl	$1970304117, 20(%eax)
	movl	$1634738292, 24(%eax)
	movl	$1701667186, 28(%eax)
	movl	$1936876916, 32(%eax)
	movl	$544106784, 36(%eax)
	movl	$1701734764, 40(%eax)
	movw	$32, 44(%eax)
	movl	-20(%ebp), %eax
	leal	4(%eax), %edx
	movl	-20(%ebp), %eax
	movl	156(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -16(%ebp)
	cmpl	$0, -16(%ebp)
	jne	L96
	movl	16(%ebp), %eax
	movl	-20(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L95
L97:
	movl	-16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -16(%ebp)
L96:
	movl	-16(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L97
	movl	-16(%ebp), %eax
	movl	-20(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
L95:
	movl	$LC1, (%esp)
	call	_puts
	jmp	L88
L91:
	cmpl	$0, -12(%ebp)
	jne	L98
	nop
	jmp	L88
L99:
	nop
	jmp	L88
L100:
	nop
L88:
	addl	$32, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE27:
	.section .rdata,"dr"
LC2:
	.ascii "driverModule\0"
	.align 4
LC3:
	.ascii "Debugging Error.....Buggesh Code\0"
LC4:
	.ascii "\12Wrong traversal\0"
	.text
	.globl	_processAST
	.def	_processAST;	.scl	2;	.type	32;	.endef
_processAST:
LFB28:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%ebx
	subl	$448, %esp
	.cfi_offset 7, -12
	.cfi_offset 3, -16
	movl	8(%ebp), %eax
	movl	60(%eax), %eax
	cmpl	$21, %eax
	ja	L275
	movl	L104(,%eax,4), %eax
	jmp	*%eax
	.section .rdata,"dr"
	.align 4
L104:
	.long	L103
	.long	L105
	.long	L106
	.long	L107
	.long	L276
	.long	L276
	.long	L110
	.long	L111
	.long	L112
	.long	L113
	.long	L114
	.long	L276
	.long	L116
	.long	L117
	.long	L276
	.long	L119
	.long	L120
	.long	L121
	.long	L276
	.long	L276
	.long	L124
	.long	L276
	.text
L103:
	movl	$0, (%esp)
	call	_createSymbolTable
	movl	%eax, _symbolTableRoot
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	60(%eax), %eax
	cmpl	$21, %eax
	je	L126
	jmp	L127
L128:
	movl	_symbolTableRoot, %eax
	movl	16(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_processAST
	movl	-12(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -12(%ebp)
L127:
	cmpl	$0, -12(%ebp)
	jne	L128
L126:
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	%eax, -12(%ebp)
	movl	$0, _moduleNumber
	movl	-12(%ebp), %eax
	movl	60(%eax), %eax
	cmpl	$21, %eax
	je	L129
	jmp	L130
L131:
	movl	_symbolTableRoot, %eax
	movl	16(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_processAST
	movl	-12(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -12(%ebp)
L130:
	cmpl	$0, -12(%ebp)
	jne	L131
L129:
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	72(%eax), %eax
	movl	%eax, -12(%ebp)
	movl	_symbolTableRoot, %eax
	movl	16(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_processAST
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	72(%eax), %eax
	movl	72(%eax), %eax
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	60(%eax), %eax
	cmpl	$21, %eax
	je	L132
	jmp	L133
L134:
	movl	_symbolTableRoot, %eax
	movl	16(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_processAST
	movl	-12(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -12(%ebp)
L133:
	cmpl	$0, -12(%ebp)
	jne	L134
L132:
	movl	_moduleNumber, %edx
	movl	8(%ebp), %eax
	movl	%edx, (%eax)
	jmp	L102
L105:
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	60(%eax), %eax
	cmpl	$21, %eax
	jne	L135
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	60(%eax), %eax
	cmpl	$21, %eax
	jne	L135
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	72(%eax), %eax
	movl	60(%eax), %eax
	cmpl	$21, %eax
	jne	L135
	movl	$1, (%esp)
	call	_createSymbolTable
	movl	%eax, -156(%ebp)
	movl	$21, (%esp)
	call	_malloc
	movl	%eax, -360(%ebp)
	movl	-360(%ebp), %eax
	movl	$21, 4(%esp)
	movl	%eax, (%esp)
	call	_refreshBuffer
	movl	-360(%ebp), %eax
	movl	$1986622052, (%eax)
	movl	$1867346533, 4(%eax)
	movl	$1701606756, 8(%eax)
	movb	$0, 12(%eax)
	movl	-156(%ebp), %ecx
	movl	-360(%ebp), %eax
	movl	-356(%ebp), %edx
	movl	%eax, 92(%ecx)
	movl	%edx, 96(%ecx)
	movl	-156(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, (%eax)
	movl	12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -16(%ebp)
	cmpl	$0, -16(%ebp)
	jne	L138
	movl	12(%ebp), %eax
	movl	-156(%ebp), %edx
	movl	%edx, 8(%eax)
	jmp	L137
L139:
	movl	-16(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, -16(%ebp)
L138:
	movl	-16(%ebp), %eax
	movl	4(%eax), %eax
	testl	%eax, %eax
	jne	L139
	movl	-16(%ebp), %eax
	movl	-156(%ebp), %edx
	movl	%edx, 4(%eax)
L137:
	movl	$80, (%esp)
	call	_malloc
	movl	%eax, -160(%ebp)
	movl	_moduleNumber, %edx
	movl	-160(%ebp), %eax
	movl	%edx, (%eax)
	movl	_moduleNumber, %eax
	addl	$1, %eax
	movl	%eax, _moduleNumber
	movl	$1, 4(%esp)
	movl	-160(%ebp), %eax
	movl	%eax, (%esp)
	call	_createSymbolTableEntry
	movl	%eax, -164(%ebp)
	movl	$LC2, (%esp)
	call	_computeStringHash
	movl	%eax, -168(%ebp)
	movl	_symbolTableRoot, %eax
	movl	-168(%ebp), %edx
	movl	12(%eax,%edx,4), %eax
	testl	%eax, %eax
	jne	L140
	movl	_symbolTableRoot, %eax
	movl	-168(%ebp), %edx
	movl	-164(%ebp), %ecx
	movl	%ecx, 12(%eax,%edx,4)
	movl	_symbolTableRoot, %eax
	movl	-168(%ebp), %edx
	movl	12(%eax,%edx,4), %eax
	movl	-156(%ebp), %edx
	movl	%edx, 88(%eax)
	jmp	L141
L140:
	movl	_symbolTableRoot, %eax
	movl	-168(%ebp), %edx
	movl	12(%eax,%edx,4), %eax
	movl	%eax, -20(%ebp)
	jmp	L142
L143:
	movl	-20(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -20(%ebp)
L142:
	movl	-20(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L143
	movl	-20(%ebp), %eax
	movl	-164(%ebp), %edx
	movl	%edx, (%eax)
	movl	-20(%ebp), %eax
	movl	(%eax), %eax
	movl	-156(%ebp), %edx
	movl	%edx, 88(%eax)
L141:
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	72(%eax), %eax
	movl	72(%eax), %eax
	movl	%eax, -24(%ebp)
	jmp	L144
L145:
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-156(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-24(%ebp), %eax
	movl	%eax, (%esp)
	call	_processAST
	movl	-24(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -24(%ebp)
L144:
	cmpl	$0, -24(%ebp)
	jne	L145
	nop
	jmp	L102
L135:
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
	movl	%eax, -172(%ebp)
	cmpl	$0, -172(%ebp)
	jne	L146
	movl	$1, (%esp)
	call	_createSymbolTable
	movl	%eax, -176(%ebp)
	movl	$21, (%esp)
	call	_malloc
	movl	%eax, -368(%ebp)
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	leal	21(%eax), %edx
	movl	-368(%ebp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcpy
	movl	-176(%ebp), %ecx
	movl	-368(%ebp), %eax
	movl	-364(%ebp), %edx
	movl	%eax, 92(%ecx)
	movl	%edx, 96(%ecx)
	movl	-176(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, (%eax)
	movl	12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -28(%ebp)
	cmpl	$0, -28(%ebp)
	jne	L149
	movl	12(%ebp), %eax
	movl	-176(%ebp), %edx
	movl	%edx, 8(%eax)
	jmp	L148
L150:
	movl	-28(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, -28(%ebp)
L149:
	movl	-28(%ebp), %eax
	movl	4(%eax), %eax
	testl	%eax, %eax
	jne	L150
	movl	-28(%ebp), %eax
	movl	-176(%ebp), %edx
	movl	%edx, 4(%eax)
L148:
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_createSymbol
	movl	%eax, -180(%ebp)
	movl	-180(%ebp), %eax
	movl	%eax, (%esp)
	call	_computeStringHash
	movl	%eax, -184(%ebp)
	movl	$2, 4(%esp)
	movl	-180(%ebp), %eax
	movl	%eax, (%esp)
	call	_createSymbolTableEntry
	movl	%eax, -188(%ebp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_extractTypeOfFunction
	movl	%eax, -192(%ebp)
	movl	-188(%ebp), %eax
	movl	-192(%ebp), %edx
	movl	(%edx), %ecx
	movl	%ecx, 44(%eax)
	movl	4(%edx), %ecx
	movl	%ecx, 48(%eax)
	movl	8(%edx), %ecx
	movl	%ecx, 52(%eax)
	movl	12(%edx), %edx
	movl	%edx, 56(%eax)
	movl	12(%ebp), %eax
	movl	-184(%ebp), %edx
	movl	12(%eax,%edx,4), %eax
	testl	%eax, %eax
	jne	L151
	movl	12(%ebp), %eax
	movl	-184(%ebp), %edx
	movl	-188(%ebp), %ecx
	movl	%ecx, 12(%eax,%edx,4)
	movl	12(%ebp), %eax
	movl	-184(%ebp), %edx
	movl	12(%eax,%edx,4), %eax
	movl	-176(%ebp), %edx
	movl	%edx, 88(%eax)
	jmp	L152
L151:
	movl	12(%ebp), %eax
	movl	-184(%ebp), %edx
	movl	12(%eax,%edx,4), %eax
	movl	%eax, -32(%ebp)
	jmp	L153
L154:
	movl	-32(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -32(%ebp)
L153:
	movl	-32(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L154
	movl	-32(%ebp), %eax
	movl	-188(%ebp), %edx
	movl	%edx, (%eax)
	movl	-32(%ebp), %eax
	movl	(%eax), %eax
	movl	-176(%ebp), %edx
	movl	%edx, 88(%eax)
L152:
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	%eax, -36(%ebp)
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	72(%eax), %eax
	movl	%eax, -40(%ebp)
	jmp	L155
L160:
	movl	$15, (%esp)
	call	_createASTNode
	movl	%eax, -196(%ebp)
	movl	-36(%ebp), %eax
	movl	76(%eax), %edx
	movl	-196(%ebp), %eax
	movl	%edx, 76(%eax)
	movl	-196(%ebp), %eax
	movl	76(%eax), %eax
	movl	$0, 64(%eax)
	movl	-196(%ebp), %eax
	movl	76(%eax), %eax
	movl	-36(%ebp), %edx
	movl	76(%edx), %edx
	movl	72(%edx), %edx
	movl	%edx, 72(%eax)
	movl	-196(%ebp), %eax
	movl	76(%eax), %eax
	movl	-196(%ebp), %edx
	movl	%edx, 68(%eax)
	movl	-196(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	-196(%ebp), %edx
	movl	%edx, 68(%eax)
	movl	-196(%ebp), %eax
	movl	%eax, (%esp)
	call	_extractTypeOfId
	movl	%eax, -200(%ebp)
	movl	-36(%ebp), %eax
	movl	76(%eax), %eax
	movl	%eax, (%esp)
	call	_createSymbol
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	_createSymbolTableEntry
	movl	%eax, -204(%ebp)
	movl	-204(%ebp), %eax
	movb	$1, 76(%eax)
	movl	-204(%ebp), %eax
	movl	-200(%ebp), %edx
	movl	(%edx), %ecx
	movl	%ecx, 16(%eax)
	movl	4(%edx), %ecx
	movl	%ecx, 20(%eax)
	movl	8(%edx), %ecx
	movl	%ecx, 24(%eax)
	movl	12(%edx), %ecx
	movl	%ecx, 28(%eax)
	movl	16(%edx), %ecx
	movl	%ecx, 32(%eax)
	movl	20(%edx), %ecx
	movl	%ecx, 36(%eax)
	movl	24(%edx), %ecx
	movl	%ecx, 40(%eax)
	movl	28(%edx), %ecx
	movl	%ecx, 44(%eax)
	movl	32(%edx), %ecx
	movl	%ecx, 48(%eax)
	movl	36(%edx), %ecx
	movl	%ecx, 52(%eax)
	movl	40(%edx), %ecx
	movl	%ecx, 56(%eax)
	movl	44(%edx), %ecx
	movl	%ecx, 60(%eax)
	movl	48(%edx), %ecx
	movl	%ecx, 64(%eax)
	movl	52(%edx), %ecx
	movl	%ecx, 68(%eax)
	movl	56(%edx), %edx
	movl	%edx, 72(%eax)
	movl	-36(%ebp), %eax
	movl	76(%eax), %eax
	addl	$21, %eax
	movl	%eax, (%esp)
	call	_computeStringHash
	movl	%eax, %edx
	movl	-176(%ebp), %eax
	movl	12(%eax,%edx,4), %eax
	movl	%eax, -44(%ebp)
	cmpl	$0, -44(%ebp)
	jne	L158
	movl	-36(%ebp), %eax
	movl	76(%eax), %eax
	addl	$21, %eax
	movl	%eax, (%esp)
	call	_computeStringHash
	movl	%eax, %ecx
	movl	-176(%ebp), %eax
	movl	-204(%ebp), %edx
	movl	%edx, 12(%eax,%ecx,4)
	jmp	L157
L159:
	movl	-44(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -44(%ebp)
L158:
	movl	-44(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L159
	movl	-44(%ebp), %eax
	movl	-204(%ebp), %edx
	movl	%edx, (%eax)
L157:
	movl	-176(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-196(%ebp), %eax
	movl	%eax, (%esp)
	call	_processStatement
	movl	-36(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -36(%ebp)
L155:
	cmpl	$0, -36(%ebp)
	jne	L160
	movl	-40(%ebp), %eax
	movl	60(%eax), %eax
	cmpl	$21, %eax
	je	L161
	jmp	L162
L167:
	movl	$15, (%esp)
	call	_createASTNode
	movl	%eax, -208(%ebp)
	movl	-40(%ebp), %eax
	movl	76(%eax), %edx
	movl	-208(%ebp), %eax
	movl	%edx, 76(%eax)
	movl	-208(%ebp), %eax
	movl	76(%eax), %eax
	movl	$0, 64(%eax)
	movl	-208(%ebp), %eax
	movl	76(%eax), %eax
	movl	-40(%ebp), %edx
	movl	76(%edx), %edx
	movl	72(%edx), %edx
	movl	%edx, 72(%eax)
	movl	-208(%ebp), %eax
	movl	76(%eax), %eax
	movl	-208(%ebp), %edx
	movl	%edx, 68(%eax)
	movl	-208(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	-208(%ebp), %edx
	movl	%edx, 68(%eax)
	movl	-208(%ebp), %eax
	movl	%eax, (%esp)
	call	_extractTypeOfId
	movl	%eax, -212(%ebp)
	movl	-40(%ebp), %eax
	movl	76(%eax), %eax
	movl	%eax, (%esp)
	call	_createSymbol
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	_createSymbolTableEntry
	movl	%eax, -216(%ebp)
	movl	-40(%ebp), %eax
	movl	76(%eax), %eax
	addl	$21, %eax
	movl	%eax, (%esp)
	call	_computeStringHash
	movl	%eax, %edx
	movl	-176(%ebp), %eax
	movl	12(%eax,%edx,4), %eax
	movl	%eax, -48(%ebp)
	movl	-216(%ebp), %eax
	movb	$0, 76(%eax)
	movl	-216(%ebp), %eax
	movl	-212(%ebp), %edx
	movl	(%edx), %ecx
	movl	%ecx, 16(%eax)
	movl	4(%edx), %ecx
	movl	%ecx, 20(%eax)
	movl	8(%edx), %ecx
	movl	%ecx, 24(%eax)
	movl	12(%edx), %ecx
	movl	%ecx, 28(%eax)
	movl	16(%edx), %ecx
	movl	%ecx, 32(%eax)
	movl	20(%edx), %ecx
	movl	%ecx, 36(%eax)
	movl	24(%edx), %ecx
	movl	%ecx, 40(%eax)
	movl	28(%edx), %ecx
	movl	%ecx, 44(%eax)
	movl	32(%edx), %ecx
	movl	%ecx, 48(%eax)
	movl	36(%edx), %ecx
	movl	%ecx, 52(%eax)
	movl	40(%edx), %ecx
	movl	%ecx, 56(%eax)
	movl	44(%edx), %ecx
	movl	%ecx, 60(%eax)
	movl	48(%edx), %ecx
	movl	%ecx, 64(%eax)
	movl	52(%edx), %ecx
	movl	%ecx, 68(%eax)
	movl	56(%edx), %edx
	movl	%edx, 72(%eax)
	cmpl	$0, -48(%ebp)
	jne	L165
	movl	-40(%ebp), %eax
	movl	76(%eax), %eax
	addl	$21, %eax
	movl	%eax, (%esp)
	call	_computeStringHash
	movl	%eax, %ecx
	movl	-176(%ebp), %eax
	movl	-216(%ebp), %edx
	movl	%edx, 12(%eax,%ecx,4)
	jmp	L164
L166:
	movl	-48(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -48(%ebp)
L165:
	movl	-48(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L166
	movl	-48(%ebp), %eax
	movl	-216(%ebp), %edx
	movl	%edx, (%eax)
L164:
	movl	-176(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-208(%ebp), %eax
	movl	%eax, (%esp)
	call	_processStatement
	movl	-40(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -40(%ebp)
L162:
	cmpl	$0, -40(%ebp)
	jne	L167
L161:
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	72(%eax), %eax
	movl	72(%eax), %eax
	movl	%eax, -52(%ebp)
	jmp	L168
L169:
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-176(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-52(%ebp), %eax
	movl	%eax, (%esp)
	call	_processAST
	movl	-52(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -52(%ebp)
L168:
	cmpl	$0, -52(%ebp)
	jne	L169
	jmp	L102
L146:
	movl	-172(%ebp), %eax
	movzbl	41(%eax), %eax
	xorl	$1, %eax
	testb	%al, %al
	je	L171
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %edx
	movl	-172(%ebp), %eax
	movl	%edx, 28(%eax)
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	72(%eax), %edx
	movl	-172(%ebp), %eax
	movl	%edx, 32(%eax)
	movl	-172(%ebp), %eax
	movb	$1, 41(%eax)
	movl	_moduleNumber, %eax
	leal	1(%eax), %edx
	movl	%edx, _moduleNumber
	movl	-172(%ebp), %edx
	movl	%eax, 36(%edx)
	movl	$1, (%esp)
	call	_createSymbolTable
	movl	%eax, -220(%ebp)
	movl	$21, (%esp)
	call	_malloc
	movl	%eax, -376(%ebp)
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	leal	21(%eax), %edx
	movl	-376(%ebp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcpy
	movl	-220(%ebp), %ecx
	movl	-376(%ebp), %eax
	movl	-372(%ebp), %edx
	movl	%eax, 92(%ecx)
	movl	%edx, 96(%ecx)
	movl	-220(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, (%eax)
	movl	-220(%ebp), %eax
	movl	92(%eax), %eax
	movl	$-1, 16(%esp)
	movl	$0, 12(%esp)
	movl	$2, 8(%esp)
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_lookupString
	movl	%eax, -224(%ebp)
	cmpl	$0, -224(%ebp)
	jne	L172
	movl	$LC3, (%esp)
	call	_puts
	jmp	L173
L172:
	movl	-224(%ebp), %eax
	movl	-220(%ebp), %edx
	movl	%edx, 88(%eax)
L173:
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_extractTypeOfFunction
	movl	%eax, -228(%ebp)
	movl	-224(%ebp), %eax
	movl	-228(%ebp), %edx
	movl	(%edx), %ecx
	movl	%ecx, 44(%eax)
	movl	4(%edx), %ecx
	movl	%ecx, 48(%eax)
	movl	8(%edx), %ecx
	movl	%ecx, 52(%eax)
	movl	12(%edx), %edx
	movl	%edx, 56(%eax)
	movl	12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -56(%ebp)
	cmpl	$0, -56(%ebp)
	jne	L176
	movl	12(%ebp), %eax
	movl	-220(%ebp), %edx
	movl	%edx, 8(%eax)
	jmp	L175
L177:
	movl	-56(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, -56(%ebp)
L176:
	movl	-56(%ebp), %eax
	movl	4(%eax), %eax
	testl	%eax, %eax
	jne	L177
	movl	-56(%ebp), %eax
	movl	-220(%ebp), %edx
	movl	%edx, 4(%eax)
L175:
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	%eax, -60(%ebp)
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	72(%eax), %eax
	movl	%eax, -64(%ebp)
	jmp	L178
L183:
	movl	$15, (%esp)
	call	_createASTNode
	movl	%eax, -232(%ebp)
	movl	-60(%ebp), %eax
	movl	76(%eax), %edx
	movl	-232(%ebp), %eax
	movl	%edx, 76(%eax)
	movl	-232(%ebp), %eax
	movl	76(%eax), %eax
	movl	$0, 64(%eax)
	movl	-232(%ebp), %eax
	movl	76(%eax), %eax
	movl	-60(%ebp), %edx
	movl	76(%edx), %edx
	movl	72(%edx), %edx
	movl	%edx, 72(%eax)
	movl	-232(%ebp), %eax
	movl	76(%eax), %eax
	movl	-232(%ebp), %edx
	movl	%edx, 68(%eax)
	movl	-232(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	-232(%ebp), %edx
	movl	%edx, 68(%eax)
	movl	-232(%ebp), %eax
	movl	%eax, (%esp)
	call	_extractTypeOfId
	movl	%eax, -236(%ebp)
	movl	-60(%ebp), %eax
	movl	76(%eax), %eax
	movl	%eax, (%esp)
	call	_createSymbol
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	_createSymbolTableEntry
	movl	%eax, -240(%ebp)
	movl	-240(%ebp), %eax
	movb	$1, 76(%eax)
	movl	-240(%ebp), %eax
	movl	-236(%ebp), %edx
	movl	(%edx), %ecx
	movl	%ecx, 16(%eax)
	movl	4(%edx), %ecx
	movl	%ecx, 20(%eax)
	movl	8(%edx), %ecx
	movl	%ecx, 24(%eax)
	movl	12(%edx), %ecx
	movl	%ecx, 28(%eax)
	movl	16(%edx), %ecx
	movl	%ecx, 32(%eax)
	movl	20(%edx), %ecx
	movl	%ecx, 36(%eax)
	movl	24(%edx), %ecx
	movl	%ecx, 40(%eax)
	movl	28(%edx), %ecx
	movl	%ecx, 44(%eax)
	movl	32(%edx), %ecx
	movl	%ecx, 48(%eax)
	movl	36(%edx), %ecx
	movl	%ecx, 52(%eax)
	movl	40(%edx), %ecx
	movl	%ecx, 56(%eax)
	movl	44(%edx), %ecx
	movl	%ecx, 60(%eax)
	movl	48(%edx), %ecx
	movl	%ecx, 64(%eax)
	movl	52(%edx), %ecx
	movl	%ecx, 68(%eax)
	movl	56(%edx), %edx
	movl	%edx, 72(%eax)
	movl	-60(%ebp), %eax
	movl	76(%eax), %eax
	addl	$21, %eax
	movl	%eax, (%esp)
	call	_computeStringHash
	movl	%eax, %edx
	movl	-220(%ebp), %eax
	movl	12(%eax,%edx,4), %eax
	movl	%eax, -68(%ebp)
	cmpl	$0, -68(%ebp)
	jne	L181
	movl	-60(%ebp), %eax
	movl	76(%eax), %eax
	addl	$21, %eax
	movl	%eax, (%esp)
	call	_computeStringHash
	movl	%eax, %ecx
	movl	-220(%ebp), %eax
	movl	-240(%ebp), %edx
	movl	%edx, 12(%eax,%ecx,4)
	jmp	L180
L182:
	movl	-68(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -68(%ebp)
L181:
	movl	-68(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L182
	movl	-68(%ebp), %eax
	movl	-240(%ebp), %edx
	movl	%edx, (%eax)
L180:
	movl	-220(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-232(%ebp), %eax
	movl	%eax, (%esp)
	call	_processStatement
	movl	-60(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -60(%ebp)
L178:
	cmpl	$0, -60(%ebp)
	jne	L183
	movl	-64(%ebp), %eax
	movl	60(%eax), %eax
	cmpl	$21, %eax
	je	L184
	jmp	L185
L190:
	movl	$15, (%esp)
	call	_createASTNode
	movl	%eax, -244(%ebp)
	movl	-64(%ebp), %eax
	movl	76(%eax), %edx
	movl	-244(%ebp), %eax
	movl	%edx, 76(%eax)
	movl	-244(%ebp), %eax
	movl	76(%eax), %eax
	movl	$0, 64(%eax)
	movl	-244(%ebp), %eax
	movl	76(%eax), %eax
	movl	-64(%ebp), %edx
	movl	76(%edx), %edx
	movl	72(%edx), %edx
	movl	%edx, 72(%eax)
	movl	-244(%ebp), %eax
	movl	76(%eax), %eax
	movl	-244(%ebp), %edx
	movl	%edx, 68(%eax)
	movl	-244(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	-244(%ebp), %edx
	movl	%edx, 68(%eax)
	movl	-244(%ebp), %eax
	movl	%eax, (%esp)
	call	_extractTypeOfId
	movl	%eax, -248(%ebp)
	movl	-64(%ebp), %eax
	movl	76(%eax), %eax
	movl	%eax, (%esp)
	call	_createSymbol
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	_createSymbolTableEntry
	movl	%eax, -252(%ebp)
	movl	-64(%ebp), %eax
	movl	76(%eax), %eax
	addl	$21, %eax
	movl	%eax, (%esp)
	call	_computeStringHash
	movl	%eax, %edx
	movl	-220(%ebp), %eax
	movl	12(%eax,%edx,4), %eax
	movl	%eax, -72(%ebp)
	movl	-252(%ebp), %eax
	movb	$0, 76(%eax)
	movl	-252(%ebp), %eax
	movl	-248(%ebp), %edx
	movl	(%edx), %ecx
	movl	%ecx, 16(%eax)
	movl	4(%edx), %ecx
	movl	%ecx, 20(%eax)
	movl	8(%edx), %ecx
	movl	%ecx, 24(%eax)
	movl	12(%edx), %ecx
	movl	%ecx, 28(%eax)
	movl	16(%edx), %ecx
	movl	%ecx, 32(%eax)
	movl	20(%edx), %ecx
	movl	%ecx, 36(%eax)
	movl	24(%edx), %ecx
	movl	%ecx, 40(%eax)
	movl	28(%edx), %ecx
	movl	%ecx, 44(%eax)
	movl	32(%edx), %ecx
	movl	%ecx, 48(%eax)
	movl	36(%edx), %ecx
	movl	%ecx, 52(%eax)
	movl	40(%edx), %ecx
	movl	%ecx, 56(%eax)
	movl	44(%edx), %ecx
	movl	%ecx, 60(%eax)
	movl	48(%edx), %ecx
	movl	%ecx, 64(%eax)
	movl	52(%edx), %ecx
	movl	%ecx, 68(%eax)
	movl	56(%edx), %edx
	movl	%edx, 72(%eax)
	cmpl	$0, -72(%ebp)
	jne	L188
	movl	-64(%ebp), %eax
	movl	76(%eax), %eax
	addl	$21, %eax
	movl	%eax, (%esp)
	call	_computeStringHash
	movl	%eax, %ecx
	movl	-220(%ebp), %eax
	movl	-252(%ebp), %edx
	movl	%edx, 12(%eax,%ecx,4)
	jmp	L187
L189:
	movl	-72(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -72(%ebp)
L188:
	movl	-72(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L189
	movl	-72(%ebp), %eax
	movl	-252(%ebp), %edx
	movl	%edx, (%eax)
L187:
	movl	-220(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-244(%ebp), %eax
	movl	%eax, (%esp)
	call	_processStatement
	movl	-64(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -64(%ebp)
L185:
	cmpl	$0, -64(%ebp)
	jne	L190
L184:
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	72(%eax), %eax
	movl	72(%eax), %eax
	movl	%eax, -76(%ebp)
	jmp	L191
L192:
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-220(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-76(%ebp), %eax
	movl	%eax, (%esp)
	call	_processAST
	movl	-76(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -76(%ebp)
L191:
	cmpl	$0, -76(%ebp)
	jne	L192
	jmp	L102
L171:
	movl	8(%ebp), %eax
	movb	$1, (%eax)
	call	_createErrorObject
	movl	%eax, -256(%ebp)
	movl	-172(%ebp), %eax
	leal	4(%eax), %edx
	movl	-256(%ebp), %eax
	addl	$4, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcpy
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	44(%eax), %edx
	movl	-256(%ebp), %eax
	movl	%edx, 156(%eax)
	movl	-256(%ebp), %eax
	leal	4(%eax), %edx
	movl	%edx, %eax
	movl	$-1, %ecx
	movl	%eax, %ebx
	movl	$0, %eax
	movl	%ebx, %edi
	repnz scasb
	movl	%ecx, %eax
	notl	%eax
	subl	$1, %eax
	addl	%edx, %eax
	movl	$1853179424, (%eax)
	movl	$1869182051, 4(%eax)
	movl	$1984897134, 8(%eax)
	movl	$1869378149, 12(%eax)
	movl	$1852400737, 16(%eax)
	movl	$1852383335, 20(%eax)
	movl	$1852402720, 24(%eax)
	movw	$8293, 28(%eax)
	movb	$0, 30(%eax)
	movl	-256(%ebp), %eax
	leal	4(%eax), %edx
	movl	-256(%ebp), %eax
	movl	156(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -80(%ebp)
	cmpl	$0, -80(%ebp)
	jne	L194
	movl	16(%ebp), %eax
	movl	-256(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L102
L195:
	movl	-80(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -80(%ebp)
L194:
	movl	-80(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L195
	movl	-80(%ebp), %eax
	movl	-256(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L102
L106:
	movl	$LC4, (%esp)
	call	_puts
	jmp	L102
L107:
	movl	$LC4, (%esp)
	call	_puts
	jmp	L102
L110:
	movl	$LC4, (%esp)
	call	_puts
	jmp	L102
L111:
	movl	$3, (%esp)
	call	_createSymbolTable
	movl	%eax, -260(%ebp)
	movl	8(%ebp), %eax
	movl	4(%eax), %edx
	movl	(%eax), %eax
	movl	%eax, -384(%ebp)
	movl	%edx, -380(%ebp)
	movl	-260(%ebp), %ecx
	movl	-384(%ebp), %eax
	movl	-380(%ebp), %edx
	movl	%eax, 92(%ecx)
	movl	%edx, 96(%ecx)
	movl	-260(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, (%eax)
	movl	12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -84(%ebp)
	cmpl	$0, -84(%ebp)
	jne	L198
	movl	12(%ebp), %eax
	movl	-260(%ebp), %edx
	movl	%edx, 8(%eax)
	jmp	L197
L199:
	movl	-84(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, -84(%ebp)
L198:
	movl	-84(%ebp), %eax
	movl	4(%eax), %eax
	testl	%eax, %eax
	jne	L199
	movl	-84(%ebp), %eax
	movl	-260(%ebp), %edx
	movl	%edx, 4(%eax)
L197:
	movl	8(%ebp), %eax
	movl	4(%eax), %edx
	movl	(%eax), %eax
	movl	%eax, -392(%ebp)
	movl	%edx, -388(%ebp)
	leal	-392(%ebp), %eax
	movl	%eax, (%esp)
	call	_computeBlockHash
	movl	%eax, -264(%ebp)
	movl	12(%ebp), %eax
	movl	-264(%ebp), %edx
	movl	12(%eax,%edx,4), %eax
	movl	%eax, -88(%ebp)
	cmpl	$0, -88(%ebp)
	jne	L202
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_createSymbol
	movl	$3, 4(%esp)
	movl	%eax, (%esp)
	call	_createSymbolTableEntry
	movl	%eax, %ecx
	movl	12(%ebp), %eax
	movl	-264(%ebp), %edx
	movl	%ecx, 12(%eax,%edx,4)
	movl	12(%ebp), %eax
	movl	-264(%ebp), %edx
	movl	12(%eax,%edx,4), %eax
	movl	-260(%ebp), %edx
	movl	%edx, 88(%eax)
	jmp	L201
L203:
	movl	-88(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -88(%ebp)
L202:
	movl	-88(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L203
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_createSymbol
	movl	$3, 4(%esp)
	movl	%eax, (%esp)
	call	_createSymbolTableEntry
	movl	%eax, %edx
	movl	-88(%ebp), %eax
	movl	%edx, (%eax)
	movl	-88(%ebp), %eax
	movl	(%eax), %eax
	movl	-260(%ebp), %edx
	movl	%edx, 88(%eax)
L201:
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	72(%eax), %eax
	movl	%eax, -92(%ebp)
	jmp	L204
L205:
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-260(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-92(%ebp), %eax
	movl	%eax, (%esp)
	call	_processAST
	movl	-92(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -92(%ebp)
L204:
	cmpl	$0, -92(%ebp)
	jne	L205
	nop
	jmp	L102
L112:
	movl	$2, (%esp)
	call	_createSymbolTable
	movl	%eax, -268(%ebp)
	movl	8(%ebp), %eax
	movl	4(%eax), %edx
	movl	(%eax), %eax
	movl	%eax, -400(%ebp)
	movl	%edx, -396(%ebp)
	movl	-268(%ebp), %ecx
	movl	-400(%ebp), %eax
	movl	-396(%ebp), %edx
	movl	%eax, 92(%ecx)
	movl	%edx, 96(%ecx)
	movl	-268(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, (%eax)
	movl	12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -96(%ebp)
	cmpl	$0, -96(%ebp)
	jne	L208
	movl	12(%ebp), %eax
	movl	-268(%ebp), %edx
	movl	%edx, 8(%eax)
	jmp	L207
L209:
	movl	-96(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, -96(%ebp)
L208:
	movl	-96(%ebp), %eax
	movl	4(%eax), %eax
	testl	%eax, %eax
	jne	L209
	movl	-96(%ebp), %eax
	movl	-268(%ebp), %edx
	movl	%edx, 4(%eax)
L207:
	movl	8(%ebp), %eax
	movl	4(%eax), %edx
	movl	(%eax), %eax
	movl	%eax, -408(%ebp)
	movl	%edx, -404(%ebp)
	leal	-408(%ebp), %eax
	movl	%eax, (%esp)
	call	_computeBlockHash
	movl	%eax, -272(%ebp)
	movl	12(%ebp), %eax
	movl	-272(%ebp), %edx
	movl	12(%eax,%edx,4), %eax
	movl	%eax, -100(%ebp)
	cmpl	$0, -100(%ebp)
	jne	L212
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_createSymbol
	movl	$4, 4(%esp)
	movl	%eax, (%esp)
	call	_createSymbolTableEntry
	movl	%eax, %ecx
	movl	12(%ebp), %eax
	movl	-272(%ebp), %edx
	movl	%ecx, 12(%eax,%edx,4)
	movl	12(%ebp), %eax
	movl	-272(%ebp), %edx
	movl	12(%eax,%edx,4), %eax
	movl	-268(%ebp), %edx
	movl	%edx, 88(%eax)
	jmp	L211
L213:
	movl	-100(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -100(%ebp)
L212:
	movl	-100(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L213
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_createSymbol
	movl	$4, 4(%esp)
	movl	%eax, (%esp)
	call	_createSymbolTableEntry
	movl	%eax, %edx
	movl	-100(%ebp), %eax
	movl	%edx, (%eax)
	movl	-100(%ebp), %eax
	movl	(%eax), %eax
	movl	-268(%ebp), %edx
	movl	%edx, 88(%eax)
L211:
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	%eax, -104(%ebp)
	jmp	L214
L215:
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-268(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-104(%ebp), %eax
	movl	%eax, (%esp)
	call	_processAST
	movl	-104(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -104(%ebp)
L214:
	cmpl	$0, -104(%ebp)
	jne	L215
	nop
	jmp	L102
L113:
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	16(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_processAST
	jmp	L102
L114:
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	60(%eax), %eax
	cmpl	$20, %eax
	jne	L277
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	16(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_processAST
	jmp	L277
L116:
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	60(%eax), %eax
	cmpl	$20, %eax
	jne	L217
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
	movl	%eax, -276(%ebp)
	cmpl	$0, -276(%ebp)
	jne	L278
	call	_createErrorObject
	movl	%eax, -280(%ebp)
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	44(%eax), %edx
	movl	-280(%ebp), %eax
	movl	%edx, 156(%eax)
	movl	-280(%ebp), %eax
	addl	$4, %eax
	movl	$542328908, (%eax)
	movl	$1629513327, 4(%eax)
	movl	$1734964083, 8(%eax)
	movl	$1852140910, 12(%eax)
	movl	$1953702004, 16(%eax)
	movl	$1835365473, 20(%eax)
	movl	$544501349, 24(%eax)
	movl	$544432488, 28(%eax)
	movl	$544501614, 32(%eax)
	movl	$1852138850, 36(%eax)
	movl	$1667589152, 40(%eax)
	movl	$1701994860, 44(%eax)
	movl	$1700929636, 48(%eax)
	movl	$1701998438, 52(%eax)
	movb	$0, 56(%eax)
	movl	-280(%ebp), %eax
	leal	4(%eax), %edx
	movl	-280(%ebp), %eax
	movl	156(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -108(%ebp)
	cmpl	$0, -108(%ebp)
	jne	L220
	movl	16(%ebp), %eax
	movl	-280(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L278
L221:
	movl	-108(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -108(%ebp)
L220:
	movl	-108(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L221
	movl	-108(%ebp), %eax
	movl	-280(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L278
L217:
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	76(%eax), %eax
	movl	44(%eax), %eax
	movl	8(%ebp), %edx
	movl	76(%edx), %edx
	movl	76(%edx), %edx
	addl	$21, %edx
	movl	%eax, 16(%esp)
	movl	$1, 12(%esp)
	movl	$0, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_lookupString
	movl	%eax, -284(%ebp)
	cmpl	$0, -284(%ebp)
	jne	L278
	call	_createErrorObject
	movl	%eax, -288(%ebp)
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	44(%eax), %edx
	movl	-288(%ebp), %eax
	movl	%edx, 156(%eax)
	movl	-288(%ebp), %eax
	addl	$4, %eax
	movl	$542328908, (%eax)
	movl	$1629513327, 4(%eax)
	movl	$1734964083, 8(%eax)
	movl	$1852140910, 12(%eax)
	movl	$1953702004, 16(%eax)
	movl	$1835365473, 20(%eax)
	movl	$544501349, 24(%eax)
	movl	$544432488, 28(%eax)
	movl	$544501614, 32(%eax)
	movl	$1852138850, 36(%eax)
	movl	$1667589152, 40(%eax)
	movl	$1701994860, 44(%eax)
	movl	$1700929636, 48(%eax)
	movl	$1701998438, 52(%eax)
	movb	$0, 56(%eax)
	movl	-288(%ebp), %eax
	leal	4(%eax), %edx
	movl	-288(%ebp), %eax
	movl	156(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -112(%ebp)
	cmpl	$0, -112(%ebp)
	jne	L224
	movl	16(%ebp), %eax
	movl	-288(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L278
L225:
	movl	-112(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -112(%ebp)
L224:
	movl	-112(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L225
	movl	-112(%ebp), %eax
	movl	-288(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L278
L117:
	movl	12(%ebp), %eax
	movl	100(%eax), %eax
	cmpl	$1, %eax
	jne	L279
	movl	12(%ebp), %eax
	movl	92(%eax), %eax
	movl	8(%ebp), %edx
	movl	76(%edx), %edx
	movl	72(%edx), %edx
	addl	$21, %edx
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L279
	call	_createErrorObject
	movl	%eax, -292(%ebp)
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	44(%eax), %edx
	movl	-292(%ebp), %eax
	movl	%edx, 156(%eax)
	movl	-292(%ebp), %eax
	addl	$4, %eax
	movl	$1969448274, (%eax)
	movl	$1986622322, 4(%eax)
	movl	$1633886309, 8(%eax)
	movl	$1864395884, 12(%eax)
	movl	$1969627238, 16(%eax)
	movl	$1769235310, 20(%eax)
	movl	$975203951, 24(%eax)
	movb	$0, 28(%eax)
	movl	12(%ebp), %eax
	movl	92(%eax), %eax
	movl	-292(%ebp), %edx
	addl	$4, %edx
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_strcat
	movl	-292(%ebp), %eax
	leal	4(%eax), %edx
	movl	-292(%ebp), %eax
	movl	156(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -116(%ebp)
	cmpl	$0, -116(%ebp)
	jne	L228
	movl	16(%ebp), %eax
	movl	-292(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L279
L229:
	movl	-116(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -116(%ebp)
L228:
	movl	-116(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L229
	movl	-116(%ebp), %eax
	movl	-292(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L279
L119:
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	%eax, -296(%ebp)
	cmpl	$0, -296(%ebp)
	je	L280
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-296(%ebp), %eax
	movl	%eax, (%esp)
	call	_processAST
	jmp	L280
L121:
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	%eax, -120(%ebp)
	jmp	L231
L232:
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-120(%ebp), %eax
	movl	%eax, (%esp)
	call	_processAST
	movl	-120(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -120(%ebp)
L231:
	cmpl	$0, -120(%ebp)
	jne	L232
	jmp	L102
L120:
	movl	$4, (%esp)
	call	_createSymbolTable
	movl	%eax, -300(%ebp)
	movl	8(%ebp), %eax
	movl	4(%eax), %edx
	movl	(%eax), %eax
	movl	%eax, -416(%ebp)
	movl	%edx, -412(%ebp)
	movl	-300(%ebp), %ecx
	movl	-416(%ebp), %eax
	movl	-412(%ebp), %edx
	movl	%eax, 92(%ecx)
	movl	%edx, 96(%ecx)
	movl	-300(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, (%eax)
	movl	12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -124(%ebp)
	cmpl	$0, -124(%ebp)
	jne	L235
	movl	12(%ebp), %eax
	movl	-300(%ebp), %edx
	movl	%edx, 8(%eax)
	jmp	L234
L236:
	movl	-124(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, -124(%ebp)
L235:
	movl	-124(%ebp), %eax
	movl	4(%eax), %eax
	testl	%eax, %eax
	jne	L236
	movl	-124(%ebp), %eax
	movl	-300(%ebp), %edx
	movl	%edx, 4(%eax)
L234:
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_computeBlockHash
	movl	%eax, -304(%ebp)
	movl	12(%ebp), %eax
	movl	-304(%ebp), %edx
	movl	12(%eax,%edx,4), %eax
	movl	%eax, -128(%ebp)
	cmpl	$0, -128(%ebp)
	jne	L239
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_createSymbol
	movl	$5, 4(%esp)
	movl	%eax, (%esp)
	call	_createSymbolTableEntry
	movl	%eax, %ecx
	movl	12(%ebp), %eax
	movl	-304(%ebp), %edx
	movl	%ecx, 12(%eax,%edx,4)
	movl	12(%ebp), %eax
	movl	-304(%ebp), %edx
	movl	12(%eax,%edx,4), %eax
	movl	-300(%ebp), %edx
	movl	%edx, 88(%eax)
	jmp	L238
L240:
	movl	-128(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -128(%ebp)
L239:
	movl	-128(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L240
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_createSymbol
	movl	$5, 4(%esp)
	movl	%eax, (%esp)
	call	_createSymbolTableEntry
	movl	%eax, %edx
	movl	-128(%ebp), %eax
	movl	%edx, (%eax)
	movl	-128(%ebp), %eax
	movl	(%eax), %eax
	movl	-300(%ebp), %edx
	movl	%edx, 88(%eax)
L238:
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	%eax, -132(%ebp)
	jmp	L241
L242:
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-300(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-132(%ebp), %eax
	movl	%eax, (%esp)
	call	_processAST
	movl	-132(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -132(%ebp)
L241:
	cmpl	$0, -132(%ebp)
	jne	L242
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	72(%eax), %eax
	movl	16(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	-300(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_processAST
	nop
	jmp	L102
L124:
	movl	8(%ebp), %eax
	movl	68(%eax), %eax
	movl	60(%eax), %eax
	cmpl	$15, %eax
	ja	L281
	movl	L245(,%eax,4), %eax
	jmp	*%eax
	.section .rdata,"dr"
	.align 4
L245:
	.long	L244
	.long	L281
	.long	L281
	.long	L281
	.long	L281
	.long	L281
	.long	L281
	.long	L281
	.long	L281
	.long	L247
	.long	L247
	.long	L281
	.long	L281
	.long	L281
	.long	L281
	.long	L248
	.text
L244:
	movl	8(%ebp), %eax
	leal	21(%eax), %edx
	movl	$-1, 16(%esp)
	movl	$0, 12(%esp)
	movl	$2, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_lookupString
	testl	%eax, %eax
	jne	L249
	movl	8(%ebp), %eax
	addl	$21, %eax
	movl	%eax, (%esp)
	call	_computeStringHash
	movl	%eax, -308(%ebp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_createSymbol
	movl	%eax, -312(%ebp)
	movl	8(%ebp), %eax
	leal	21(%eax), %edx
	movl	-312(%ebp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcpy
	movl	-312(%ebp), %eax
	movl	$0, 24(%eax)
	movl	-312(%ebp), %eax
	movl	$0, 28(%eax)
	movl	-312(%ebp), %eax
	movb	$1, 36(%eax)
	movl	-312(%ebp), %eax
	movb	$0, 37(%eax)
	movl	12(%ebp), %eax
	movl	-308(%ebp), %edx
	movl	12(%eax,%edx,4), %eax
	testl	%eax, %eax
	jne	L250
	movl	$2, 4(%esp)
	movl	-312(%ebp), %eax
	movl	%eax, (%esp)
	call	_createSymbolTableEntry
	movl	%eax, %ecx
	movl	12(%ebp), %eax
	movl	-308(%ebp), %edx
	movl	%ecx, 12(%eax,%edx,4)
	jmp	L282
L250:
	movl	12(%ebp), %eax
	movl	-308(%ebp), %edx
	movl	12(%eax,%edx,4), %eax
	movl	%eax, -136(%ebp)
	jmp	L252
L253:
	movl	-136(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -136(%ebp)
L252:
	movl	-136(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L253
	movl	$2, 4(%esp)
	movl	-312(%ebp), %eax
	movl	%eax, (%esp)
	call	_createSymbolTableEntry
	movl	%eax, %edx
	movl	-136(%ebp), %eax
	movl	%edx, (%eax)
	jmp	L282
L249:
	call	_createErrorObject
	movl	%eax, -316(%ebp)
	movl	8(%ebp), %eax
	movl	44(%eax), %eax
	movl	8(%ebp), %edx
	addl	$21, %edx
	movl	%eax, 16(%esp)
	movl	$0, 12(%esp)
	movl	$2, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_lookupString
	movl	%eax, -320(%ebp)
	movl	-320(%ebp), %eax
	movzbl	40(%eax), %eax
	testb	%al, %al
	je	L282
	movl	-320(%ebp), %eax
	movzbl	41(%eax), %eax
	xorl	$1, %eax
	testb	%al, %al
	je	L282
	movl	8(%ebp), %eax
	movl	44(%eax), %edx
	movl	-316(%ebp), %eax
	movl	%edx, 156(%eax)
	movl	-320(%ebp), %eax
	leal	4(%eax), %edx
	movl	-316(%ebp), %eax
	addl	$4, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcpy
	movl	-316(%ebp), %eax
	leal	4(%eax), %edx
	movl	%edx, %eax
	movl	$-1, %ecx
	movl	%eax, %ebx
	movl	$0, %eax
	movl	%ebx, %edi
	repnz scasb
	movl	%ecx, %eax
	notl	%eax
	subl	$1, %eax
	addl	%edx, %eax
	movl	$1819309380, (%eax)
	movl	$1952539497, 4(%eax)
	movl	$1869422693, 8(%eax)
	movl	$1701606756, 12(%eax)
	movl	$1667589152, 16(%eax)
	movl	$1634885996, 20(%eax)
	movl	$1852795252, 24(%eax)
	movl	$544106784, 28(%eax)
	movl	$1701734764, 32(%eax)
	movw	$32, 36(%eax)
	movl	-316(%ebp), %eax
	leal	4(%eax), %edx
	movl	-316(%ebp), %eax
	movl	156(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -140(%ebp)
	cmpl	$0, -140(%ebp)
	jne	L256
	movl	16(%ebp), %eax
	movl	-316(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L282
L257:
	movl	-140(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -140(%ebp)
L256:
	movl	-140(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L257
	movl	-140(%ebp), %eax
	movl	-316(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L282
L248:
	movl	8(%ebp), %eax
	movl	44(%eax), %eax
	movl	8(%ebp), %edx
	addl	$21, %edx
	movl	%eax, 16(%esp)
	movl	$0, 12(%esp)
	movl	$0, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_lookupString
	testl	%eax, %eax
	jne	L259
	movl	8(%ebp), %eax
	addl	$21, %eax
	movl	%eax, (%esp)
	call	_computeStringHash
	movl	%eax, -324(%ebp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_createSymbol
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	_createSymbolTableEntry
	movl	%eax, -328(%ebp)
	movl	8(%ebp), %eax
	movl	68(%eax), %eax
	movl	%eax, (%esp)
	call	_extractTypeOfId
	movl	%eax, -332(%ebp)
	movl	-328(%ebp), %eax
	movl	-332(%ebp), %edx
	movl	(%edx), %ecx
	movl	%ecx, 16(%eax)
	movl	4(%edx), %ecx
	movl	%ecx, 20(%eax)
	movl	8(%edx), %ecx
	movl	%ecx, 24(%eax)
	movl	12(%edx), %ecx
	movl	%ecx, 28(%eax)
	movl	16(%edx), %ecx
	movl	%ecx, 32(%eax)
	movl	20(%edx), %ecx
	movl	%ecx, 36(%eax)
	movl	24(%edx), %ecx
	movl	%ecx, 40(%eax)
	movl	28(%edx), %ecx
	movl	%ecx, 44(%eax)
	movl	32(%edx), %ecx
	movl	%ecx, 48(%eax)
	movl	36(%edx), %ecx
	movl	%ecx, 52(%eax)
	movl	40(%edx), %ecx
	movl	%ecx, 56(%eax)
	movl	44(%edx), %ecx
	movl	%ecx, 60(%eax)
	movl	48(%edx), %ecx
	movl	%ecx, 64(%eax)
	movl	52(%edx), %ecx
	movl	%ecx, 68(%eax)
	movl	56(%edx), %edx
	movl	%edx, 72(%eax)
	movl	12(%ebp), %eax
	movl	-324(%ebp), %edx
	movl	12(%eax,%edx,4), %eax
	testl	%eax, %eax
	jne	L260
	movl	12(%ebp), %eax
	movl	-324(%ebp), %edx
	movl	-328(%ebp), %ecx
	movl	%ecx, 12(%eax,%edx,4)
	jmp	L261
L260:
	movl	12(%ebp), %eax
	movl	-324(%ebp), %edx
	movl	12(%eax,%edx,4), %eax
	movl	%eax, -144(%ebp)
	jmp	L262
L263:
	movl	-144(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -144(%ebp)
L262:
	movl	-144(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L263
	movl	-144(%ebp), %eax
	movl	-328(%ebp), %edx
	movl	%edx, (%eax)
L261:
	movl	8(%ebp), %eax
	movl	64(%eax), %eax
	testl	%eax, %eax
	je	L283
	movl	8(%ebp), %eax
	movl	64(%eax), %eax
	movl	16(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_processAST
	jmp	L283
L259:
	call	_createErrorObject
	movl	%eax, -336(%ebp)
	movl	8(%ebp), %eax
	movl	44(%eax), %eax
	movl	8(%ebp), %edx
	addl	$21, %edx
	movl	%eax, 16(%esp)
	movl	$0, 12(%esp)
	movl	$0, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_lookupString
	movl	%eax, -340(%ebp)
	movl	-340(%ebp), %eax
	movzbl	76(%eax), %eax
	testb	%al, %al
	je	L266
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_createSymbol
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	_createSymbolTableEntry
	movl	%eax, -344(%ebp)
	movl	8(%ebp), %eax
	movl	68(%eax), %eax
	movl	%eax, (%esp)
	call	_extractTypeOfId
	movl	%eax, -348(%ebp)
	movl	-344(%ebp), %eax
	movl	-348(%ebp), %edx
	movl	(%edx), %ecx
	movl	%ecx, 16(%eax)
	movl	4(%edx), %ecx
	movl	%ecx, 20(%eax)
	movl	8(%edx), %ecx
	movl	%ecx, 24(%eax)
	movl	12(%edx), %ecx
	movl	%ecx, 28(%eax)
	movl	16(%edx), %ecx
	movl	%ecx, 32(%eax)
	movl	20(%edx), %ecx
	movl	%ecx, 36(%eax)
	movl	24(%edx), %ecx
	movl	%ecx, 40(%eax)
	movl	28(%edx), %ecx
	movl	%ecx, 44(%eax)
	movl	32(%edx), %ecx
	movl	%ecx, 48(%eax)
	movl	36(%edx), %ecx
	movl	%ecx, 52(%eax)
	movl	40(%edx), %ecx
	movl	%ecx, 56(%eax)
	movl	44(%edx), %ecx
	movl	%ecx, 60(%eax)
	movl	48(%edx), %ecx
	movl	%ecx, 64(%eax)
	movl	52(%edx), %ecx
	movl	%ecx, 68(%eax)
	movl	56(%edx), %edx
	movl	%edx, 72(%eax)
	movl	-340(%ebp), %eax
	movl	-344(%ebp), %edx
	movl	%edx, 80(%eax)
	jmp	L267
L266:
	movl	8(%ebp), %eax
	movl	44(%eax), %edx
	movl	-336(%ebp), %eax
	movl	%edx, 156(%eax)
	movl	-340(%ebp), %eax
	movl	4(%eax), %eax
	leal	21(%eax), %edx
	movl	-336(%ebp), %eax
	addl	$4, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcpy
	movl	-336(%ebp), %eax
	leal	4(%eax), %edx
	movl	%edx, %eax
	movl	$-1, %ecx
	movl	%eax, %ebx
	movl	$0, %eax
	movl	%ebx, %edi
	repnz scasb
	movl	%ecx, %eax
	notl	%eax
	subl	$1, %eax
	addl	%edx, %eax
	movl	$1684361760, (%eax)
	movl	$1634493285, 4(%eax)
	movl	$1769234802, 8(%eax)
	movl	$1864396399, 12(%eax)
	movl	$1635131494, 16(%eax)
	movl	$1650551154, 20(%eax)
	movl	$1763730796, 24(%eax)
	movl	$1768693870, 28(%eax)
	movl	$538994030, 32(%eax)
	movb	$0, 36(%eax)
	movl	-336(%ebp), %eax
	leal	4(%eax), %edx
	movl	-336(%ebp), %eax
	movl	156(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -148(%ebp)
	cmpl	$0, -148(%ebp)
	jne	L269
	movl	16(%ebp), %eax
	movl	-336(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L267
L270:
	movl	-148(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -148(%ebp)
L269:
	movl	-148(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L270
	movl	-148(%ebp), %eax
	movl	-336(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
L267:
	movl	8(%ebp), %eax
	movl	64(%eax), %eax
	testl	%eax, %eax
	je	L283
	movl	8(%ebp), %eax
	movl	64(%eax), %eax
	movl	16(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_processAST
	jmp	L283
L247:
	movl	8(%ebp), %eax
	movl	44(%eax), %eax
	movl	8(%ebp), %edx
	addl	$21, %edx
	movl	%eax, 16(%esp)
	movl	$1, 12(%esp)
	movl	$0, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_lookupString
	testl	%eax, %eax
	jne	L284
	call	_createErrorObject
	movl	%eax, -352(%ebp)
	movl	8(%ebp), %eax
	movl	44(%eax), %edx
	movl	-352(%ebp), %eax
	movl	%edx, 156(%eax)
	movl	8(%ebp), %eax
	leal	21(%eax), %edx
	movl	-352(%ebp), %eax
	addl	$4, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcpy
	movl	-352(%ebp), %eax
	leal	4(%eax), %edx
	movl	%edx, %eax
	movl	$-1, %ecx
	movl	%eax, %ebx
	movl	$0, %eax
	movl	%ebx, %edi
	repnz scasb
	movl	%ecx, %eax
	notl	%eax
	subl	$1, %eax
	addl	%edx, %eax
	movl	$1918981664, (%eax)
	movl	$1818386793, 4(%eax)
	movl	$1936269413, 8(%eax)
	movl	$1953459744, 12(%eax)
	movl	$1667589152, 16(%eax)
	movl	$1701994860, 20(%eax)
	movw	$8292, 24(%eax)
	movb	$0, 26(%eax)
	movl	-352(%ebp), %eax
	leal	4(%eax), %edx
	movl	-352(%ebp), %eax
	movl	156(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -152(%ebp)
	cmpl	$0, -152(%ebp)
	jne	L273
	movl	16(%ebp), %eax
	movl	-352(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L284
L274:
	movl	-152(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -152(%ebp)
L273:
	movl	-152(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L274
	movl	-152(%ebp), %eax
	movl	-352(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L284
L281:
	nop
	jmp	L102
L282:
	nop
	jmp	L102
L283:
	nop
	jmp	L102
L284:
	nop
	jmp	L102
L276:
	nop
	jmp	L275
L277:
	nop
	jmp	L275
L278:
	nop
	jmp	L275
L279:
	nop
	jmp	L275
L280:
	nop
L102:
L275:
	nop
	addl	$448, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE28:
	.globl	_checkSymbolTable
	.def	_checkSymbolTable;	.scl	2;	.type	32;	.endef
_checkSymbolTable:
LFB29:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	call	_getAST
	movl	%eax, -12(%ebp)
	movl	8(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$0, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_processAST
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE29:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_strlen;	.scl	2;	.type	32;	.endef
	.def	_malloc;	.scl	2;	.type	32;	.endef
	.def	_strcpy;	.scl	2;	.type	32;	.endef
	.def	_strcmp;	.scl	2;	.type	32;	.endef
	.def	_createErrorObject;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_refreshBuffer;	.scl	2;	.type	32;	.endef
	.def	_extractTypeOfFunction;	.scl	2;	.type	32;	.endef
	.def	_createASTNode;	.scl	2;	.type	32;	.endef
	.def	_extractTypeOfId;	.scl	2;	.type	32;	.endef
	.def	_processStatement;	.scl	2;	.type	32;	.endef
	.def	_strcat;	.scl	2;	.type	32;	.endef
	.def	_getAST;	.scl	2;	.type	32;	.endef
