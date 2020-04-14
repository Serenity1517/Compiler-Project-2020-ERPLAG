	.file	"offsetComputer.c"
	.comm	_offset, 4, 2
	.text
	.globl	_computeOffsets
	.def	_computeOffsets;	.scl	2;	.type	32;	.endef
_computeOffsets:
LFB17:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$0, -20(%ebp)
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	%eax, -12(%ebp)
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	72(%eax), %eax
	movl	%eax, -24(%ebp)
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	72(%eax), %eax
	movl	72(%eax), %eax
	movl	%eax, -16(%ebp)
	jmp	L2
L3:
	movl	$0, _offset
	movl	$0, -20(%ebp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_calcOffsets
	movl	-12(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -12(%ebp)
L2:
	cmpl	$0, -12(%ebp)
	jne	L3
	movl	$0, _offset
	movl	$0, -20(%ebp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-24(%ebp), %eax
	movl	%eax, (%esp)
	call	_calcOffsets
	jmp	L4
L5:
	movl	$0, _offset
	movl	$0, -20(%ebp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_calcOffsets
	movl	-16(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -16(%ebp)
L4:
	cmpl	$0, -16(%ebp)
	jne	L5
	nop
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
	.globl	_calcOffsets
	.def	_calcOffsets;	.scl	2;	.type	32;	.endef
_calcOffsets:
LFB18:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$72, %esp
	movl	8(%ebp), %eax
	movl	60(%eax), %eax
	cmpl	$21, %eax
	je	L14
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	72(%eax), %eax
	movl	72(%eax), %eax
	movl	%eax, -12(%ebp)
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	60(%eax), %eax
	cmpl	$21, %eax
	jne	L9
	movl	$-1, 16(%esp)
	movl	$0, 12(%esp)
	movl	$1, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_lookupString
	movl	%eax, -16(%ebp)
	movl	-16(%ebp), %eax
	movl	88(%eax), %eax
	movl	%eax, -20(%ebp)
	jmp	L10
L11:
	movl	-20(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_processStatement
	movl	-12(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -12(%ebp)
L10:
	cmpl	$0, -12(%ebp)
	jne	L11
	movl	_offset, %edx
	movl	-16(%ebp), %eax
	movl	%edx, 60(%eax)
	jmp	L6
L9:
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
	movl	%eax, -24(%ebp)
	movl	-24(%ebp), %eax
	movl	88(%eax), %eax
	movl	%eax, -28(%ebp)
	jmp	L12
L13:
	movl	-28(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_processStatement
	movl	-12(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -12(%ebp)
L12:
	cmpl	$0, -12(%ebp)
	jne	L13
	movl	_offset, %edx
	movl	-24(%ebp), %eax
	movl	%edx, 60(%eax)
	jmp	L6
L14:
	nop
L6:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.globl	_processStatement
	.def	_processStatement;	.scl	2;	.type	32;	.endef
_processStatement:
LFB19:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$120, %esp
	movl	8(%ebp), %eax
	movl	60(%eax), %eax
	subl	$7, %eax
	cmpl	$10, %eax
	ja	L51
	movl	L18(,%eax,4), %eax
	jmp	*%eax
	.section .rdata,"dr"
	.align 4
L18:
	.long	L17
	.long	L19
	.long	L51
	.long	L51
	.long	L51
	.long	L51
	.long	L51
	.long	L51
	.long	L20
	.long	L21
	.long	L22
	.text
L20:
	movl	8(%ebp), %eax
	movl	%eax, -44(%ebp)
	movl	-44(%ebp), %eax
	movl	56(%eax), %eax
	cmpl	$1, %eax
	jne	L23
	movl	-44(%ebp), %eax
	movl	8(%eax), %eax
	testl	%eax, %eax
	js	L24
	movl	-44(%ebp), %eax
	movl	4(%eax), %eax
	testl	%eax, %eax
	js	L24
	movl	-44(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$1, %eax
	je	L26
	cmpl	$1, %eax
	jb	L27
	cmpl	$2, %eax
	je	L28
	jmp	L25
L27:
	movl	$2, -12(%ebp)
	jmp	L25
L26:
	movl	$4, -12(%ebp)
	jmp	L25
L28:
	movl	$1, -12(%ebp)
	nop
L25:
	movl	-44(%ebp), %eax
	movl	8(%eax), %edx
	movl	-44(%ebp), %eax
	movl	4(%eax), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	addl	$1, %eax
	imull	-12(%ebp), %eax
	movl	%eax, -48(%ebp)
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	%eax, -16(%ebp)
	jmp	L29
L30:
	movl	-16(%ebp), %eax
	movl	44(%eax), %eax
	movl	-16(%ebp), %edx
	addl	$21, %edx
	movl	%eax, 16(%esp)
	movl	$0, 12(%esp)
	movl	$0, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_lookupString
	movl	%eax, -52(%ebp)
	movl	_offset, %edx
	movl	-52(%ebp), %eax
	movl	%edx, 12(%eax)
	movl	-52(%ebp), %eax
	movl	-48(%ebp), %edx
	movl	%edx, 8(%eax)
	movl	_offset, %edx
	movl	-48(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, _offset
	movl	-16(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -16(%ebp)
L29:
	cmpl	$0, -16(%ebp)
	jne	L30
	jmp	L50
L24:
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	%eax, -20(%ebp)
	jmp	L32
L33:
	movl	-20(%ebp), %eax
	movl	44(%eax), %eax
	movl	-20(%ebp), %edx
	addl	$21, %edx
	movl	%eax, 16(%esp)
	movl	$0, 12(%esp)
	movl	$0, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_lookupString
	movl	%eax, -56(%ebp)
	movl	_offset, %edx
	movl	-56(%ebp), %eax
	movl	%edx, 12(%eax)
	movl	-56(%ebp), %eax
	movl	$2, 8(%eax)
	movl	_offset, %eax
	addl	$2, %eax
	movl	%eax, _offset
	movl	-20(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -20(%ebp)
L32:
	cmpl	$0, -20(%ebp)
	jne	L33
	jmp	L40
L23:
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	%eax, -24(%ebp)
	jmp	L35
L39:
	movl	-24(%ebp), %eax
	movl	44(%eax), %eax
	movl	-24(%ebp), %edx
	addl	$21, %edx
	movl	%eax, 16(%esp)
	movl	$0, 12(%esp)
	movl	$0, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_lookupString
	movl	%eax, -60(%ebp)
	movl	-60(%ebp), %eax
	movl	16(%eax), %eax
	movl	%eax, -64(%ebp)
	cmpl	$0, -64(%ebp)
	jne	L36
	movl	_offset, %edx
	movl	-60(%ebp), %eax
	movl	%edx, 12(%eax)
	movl	-60(%ebp), %eax
	movl	$2, 8(%eax)
	movl	_offset, %eax
	addl	$2, %eax
	movl	%eax, _offset
	jmp	L37
L36:
	cmpl	$2, -64(%ebp)
	jne	L38
	movl	_offset, %edx
	movl	-60(%ebp), %eax
	movl	%edx, 12(%eax)
	movl	-60(%ebp), %eax
	movl	$1, 8(%eax)
	movl	_offset, %eax
	addl	$1, %eax
	movl	%eax, _offset
	jmp	L37
L38:
	movl	_offset, %edx
	movl	-60(%ebp), %eax
	movl	%edx, 12(%eax)
	movl	-60(%ebp), %eax
	movl	$4, 8(%eax)
	movl	_offset, %eax
	addl	$4, %eax
	movl	%eax, _offset
L37:
	movl	-24(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -24(%ebp)
L35:
	cmpl	$0, -24(%ebp)
	jne	L39
	jmp	L40
L50:
	jmp	L40
L17:
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	72(%eax), %eax
	movl	%eax, -28(%ebp)
	movl	8(%ebp), %eax
	movl	$0, 12(%esp)
	movl	$3, 8(%esp)
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_lookupBlock
	movl	%eax, -68(%ebp)
	movl	-68(%ebp), %eax
	movl	88(%eax), %eax
	movl	%eax, -72(%ebp)
	jmp	L41
L42:
	movl	-72(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	call	_processStatement
	movl	-28(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -28(%ebp)
L41:
	cmpl	$0, -28(%ebp)
	jne	L42
	jmp	L40
L19:
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	%eax, -32(%ebp)
	movl	8(%ebp), %eax
	movl	$0, 12(%esp)
	movl	$4, 8(%esp)
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_lookupBlock
	movl	%eax, -76(%ebp)
	movl	-76(%ebp), %eax
	movl	88(%eax), %eax
	movl	%eax, -80(%ebp)
	jmp	L43
L44:
	movl	-80(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-32(%ebp), %eax
	movl	%eax, (%esp)
	call	_processStatement
	movl	-32(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -32(%ebp)
L43:
	cmpl	$0, -32(%ebp)
	jne	L44
	jmp	L40
L21:
	movl	8(%ebp), %eax
	movl	$0, 12(%esp)
	movl	$5, 8(%esp)
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_lookupBlock
	movl	%eax, -84(%ebp)
	movl	-84(%ebp), %eax
	movl	88(%eax), %eax
	movl	%eax, -88(%ebp)
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	%eax, -36(%ebp)
	jmp	L45
L46:
	movl	-88(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	_processStatement
	movl	-36(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -36(%ebp)
L45:
	cmpl	$0, -36(%ebp)
	jne	L46
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	72(%eax), %eax
	movl	60(%eax), %eax
	cmpl	$21, %eax
	je	L52
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	72(%eax), %eax
	movl	-88(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_processStatement
	jmp	L52
L22:
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	%eax, -40(%ebp)
	jmp	L48
L49:
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-40(%ebp), %eax
	movl	%eax, (%esp)
	call	_processStatement
	movl	-40(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -40(%ebp)
L48:
	cmpl	$0, -40(%ebp)
	jne	L49
L51:
	nop
	jmp	L40
L52:
	nop
L40:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE19:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_lookupString;	.scl	2;	.type	32;	.endef
	.def	_lookupBlock;	.scl	2;	.type	32;	.endef
