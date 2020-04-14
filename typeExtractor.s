	.file	"typeExtractor.c"
	.text
	.globl	_createTypeof
	.def	_createTypeof;	.scl	2;	.type	32;	.endef
_createTypeof:
LFB17:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	cmpl	$0, 8(%ebp)
	jne	L2
	cmpl	$0, 32(%ebp)
	je	L3
	movl	36(%ebp), %eax
	imull	$60, %eax, %edx
	movl	32(%ebp), %eax
	addl	%edx, %eax
	movl	$0, 56(%eax)
	movl	36(%ebp), %eax
	imull	$60, %eax, %edx
	movl	32(%ebp), %eax
	addl	%eax, %edx
	movl	12(%ebp), %eax
	movl	%eax, (%edx)
	movl	32(%ebp), %eax
	jmp	L4
L3:
	movl	$60, (%esp)
	call	_malloc
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	$0, 56(%eax)
	movl	-12(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, (%eax)
	movl	-12(%ebp), %eax
	jmp	L4
L2:
	cmpl	$1, 8(%ebp)
	jne	L5
	cmpl	$0, 32(%ebp)
	je	L6
	movl	36(%ebp), %eax
	imull	$60, %eax, %edx
	movl	32(%ebp), %eax
	addl	%edx, %eax
	movl	$1, 56(%eax)
	movl	36(%ebp), %eax
	imull	$60, %eax, %edx
	movl	32(%ebp), %eax
	addl	%eax, %edx
	movl	20(%ebp), %eax
	movl	%eax, 8(%edx)
	movl	36(%ebp), %eax
	imull	$60, %eax, %edx
	movl	32(%ebp), %eax
	addl	%eax, %edx
	movl	16(%ebp), %eax
	movl	%eax, 4(%edx)
	movl	36(%ebp), %eax
	imull	$60, %eax, %edx
	movl	32(%ebp), %eax
	addl	%eax, %edx
	movl	12(%ebp), %eax
	movl	%eax, (%edx)
	cmpl	$0, 24(%ebp)
	jne	L7
	movl	36(%ebp), %eax
	imull	$60, %eax, %edx
	movl	32(%ebp), %eax
	addl	%edx, %eax
	addl	$12, %eax
	movl	$21, 4(%esp)
	movl	%eax, (%esp)
	call	_refreshBuffer
	jmp	L8
L7:
	movl	36(%ebp), %eax
	imull	$60, %eax, %edx
	movl	32(%ebp), %eax
	addl	%edx, %eax
	leal	12(%eax), %edx
	movl	24(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_strcpy
L8:
	cmpl	$0, 28(%ebp)
	jne	L9
	movl	36(%ebp), %eax
	imull	$60, %eax, %edx
	movl	32(%ebp), %eax
	addl	%edx, %eax
	addl	$33, %eax
	movl	$21, 4(%esp)
	movl	%eax, (%esp)
	call	_refreshBuffer
	jmp	L10
L9:
	movl	36(%ebp), %eax
	imull	$60, %eax, %edx
	movl	32(%ebp), %eax
	addl	%edx, %eax
	leal	33(%eax), %edx
	movl	28(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_strcpy
L10:
	movl	32(%ebp), %eax
	jmp	L4
L6:
	movl	$60, (%esp)
	call	_malloc
	movl	%eax, -16(%ebp)
	movl	-16(%ebp), %eax
	movl	$1, 56(%eax)
	movl	-16(%ebp), %eax
	movl	20(%ebp), %edx
	movl	%edx, 8(%eax)
	movl	-16(%ebp), %eax
	movl	16(%ebp), %edx
	movl	%edx, 4(%eax)
	movl	-16(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, (%eax)
	cmpl	$0, 24(%ebp)
	jne	L11
	movl	-16(%ebp), %eax
	addl	$12, %eax
	movl	$21, 4(%esp)
	movl	%eax, (%esp)
	call	_refreshBuffer
	jmp	L12
L11:
	movl	-16(%ebp), %eax
	leal	12(%eax), %edx
	movl	24(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_strcpy
L12:
	cmpl	$0, 28(%ebp)
	jne	L13
	movl	-16(%ebp), %eax
	addl	$33, %eax
	movl	$21, 4(%esp)
	movl	%eax, (%esp)
	call	_refreshBuffer
	jmp	L14
L13:
	movl	-16(%ebp), %eax
	leal	33(%eax), %edx
	movl	28(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_strcpy
L14:
	movl	-16(%ebp), %eax
	jmp	L4
L5:
	movl	$0, %eax
L4:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE17:
	.section .rdata,"dr"
LC0:
	.ascii "INTEGER\0"
LC1:
	.ascii "REAL\0"
LC2:
	.ascii "BOOLEAN\0"
	.text
	.globl	_extractTypeOfId
	.def	_extractTypeOfId;	.scl	2;	.type	32;	.endef
_extractTypeOfId:
LFB18:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$136, %esp
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	60(%eax), %eax
	cmpl	$5, %eax
	jne	L16
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	movl	76(%eax), %eax
	movl	60(%eax), %eax
	cmpl	$20, %eax
	jne	L17
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	60(%eax), %eax
	cmpl	$18, %eax
	jne	L17
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	flds	48(%eax)
	fnstcw	-90(%ebp)
	movzwl	-90(%ebp), %eax
	movb	$12, %ah
	movw	%ax, -92(%ebp)
	fldcw	-92(%ebp)
	fistpl	-16(%ebp)
	fldcw	-90(%ebp)
	movl	-12(%ebp), %eax
	movl	72(%eax), %eax
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	$LC0, 4(%esp)
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L18
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	76(%eax), %eax
	movl	76(%eax), %eax
	addl	$21, %eax
	movl	$-1, 28(%esp)
	movl	$0, 24(%esp)
	movl	%eax, 20(%esp)
	movl	$0, 16(%esp)
	movl	$-1, 12(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$0, 4(%esp)
	movl	$1, (%esp)
	call	_createTypeof
	movl	%eax, -20(%ebp)
	movl	8(%ebp), %eax
	movl	-20(%ebp), %edx
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
	movl	36(%edx), %ecx
	movl	%ecx, 36(%eax)
	movl	40(%edx), %ecx
	movl	%ecx, 40(%eax)
	movl	44(%edx), %ecx
	movl	%ecx, 44(%eax)
	movl	48(%edx), %ecx
	movl	%ecx, 48(%eax)
	movl	52(%edx), %ecx
	movl	%ecx, 52(%eax)
	movl	56(%edx), %edx
	movl	%edx, 56(%eax)
	movl	-20(%ebp), %eax
	jmp	L19
L18:
	movl	-12(%ebp), %eax
	movl	$LC1, 4(%esp)
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L20
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	76(%eax), %eax
	movl	76(%eax), %eax
	addl	$21, %eax
	movl	$-1, 28(%esp)
	movl	$0, 24(%esp)
	movl	%eax, 20(%esp)
	movl	$0, 16(%esp)
	movl	$-1, 12(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$1, 4(%esp)
	movl	$1, (%esp)
	call	_createTypeof
	movl	%eax, -24(%ebp)
	movl	8(%ebp), %eax
	movl	-24(%ebp), %edx
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
	movl	36(%edx), %ecx
	movl	%ecx, 36(%eax)
	movl	40(%edx), %ecx
	movl	%ecx, 40(%eax)
	movl	44(%edx), %ecx
	movl	%ecx, 44(%eax)
	movl	48(%edx), %ecx
	movl	%ecx, 48(%eax)
	movl	52(%edx), %ecx
	movl	%ecx, 52(%eax)
	movl	56(%edx), %edx
	movl	%edx, 56(%eax)
	movl	-24(%ebp), %eax
	jmp	L19
L20:
	movl	-12(%ebp), %eax
	movl	$LC2, 4(%esp)
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L21
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	76(%eax), %eax
	movl	76(%eax), %eax
	addl	$21, %eax
	movl	$-1, 28(%esp)
	movl	$0, 24(%esp)
	movl	%eax, 20(%esp)
	movl	$0, 16(%esp)
	movl	$-1, 12(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$2, 4(%esp)
	movl	$1, (%esp)
	call	_createTypeof
	movl	%eax, -28(%ebp)
	movl	8(%ebp), %eax
	movl	-28(%ebp), %edx
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
	movl	36(%edx), %ecx
	movl	%ecx, 36(%eax)
	movl	40(%edx), %ecx
	movl	%ecx, 40(%eax)
	movl	44(%edx), %ecx
	movl	%ecx, 44(%eax)
	movl	48(%edx), %ecx
	movl	%ecx, 48(%eax)
	movl	52(%edx), %ecx
	movl	%ecx, 52(%eax)
	movl	56(%edx), %edx
	movl	%edx, 56(%eax)
	movl	-28(%ebp), %eax
	jmp	L19
L21:
	movl	$0, %eax
	jmp	L19
L17:
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	60(%eax), %eax
	cmpl	$20, %eax
	jne	L22
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	movl	76(%eax), %eax
	movl	60(%eax), %eax
	cmpl	$18, %eax
	jne	L22
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	flds	48(%eax)
	fnstcw	-90(%ebp)
	movzwl	-90(%ebp), %eax
	movb	$12, %ah
	movw	%ax, -92(%ebp)
	fldcw	-92(%ebp)
	fistpl	-32(%ebp)
	fldcw	-90(%ebp)
	movl	-12(%ebp), %eax
	movl	72(%eax), %eax
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	$LC0, 4(%esp)
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L23
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	76(%eax), %eax
	movl	76(%eax), %eax
	addl	$21, %eax
	movl	$-1, 28(%esp)
	movl	$0, 24(%esp)
	movl	$0, 20(%esp)
	movl	%eax, 16(%esp)
	movl	-32(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	$-1, 8(%esp)
	movl	$0, 4(%esp)
	movl	$1, (%esp)
	call	_createTypeof
	movl	%eax, -36(%ebp)
	movl	8(%ebp), %eax
	movl	-36(%ebp), %edx
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
	movl	36(%edx), %ecx
	movl	%ecx, 36(%eax)
	movl	40(%edx), %ecx
	movl	%ecx, 40(%eax)
	movl	44(%edx), %ecx
	movl	%ecx, 44(%eax)
	movl	48(%edx), %ecx
	movl	%ecx, 48(%eax)
	movl	52(%edx), %ecx
	movl	%ecx, 52(%eax)
	movl	56(%edx), %edx
	movl	%edx, 56(%eax)
	movl	-36(%ebp), %eax
	jmp	L19
L23:
	movl	-12(%ebp), %eax
	movl	$LC1, 4(%esp)
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L24
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	76(%eax), %eax
	movl	76(%eax), %eax
	addl	$21, %eax
	movl	$-1, 28(%esp)
	movl	$0, 24(%esp)
	movl	$0, 20(%esp)
	movl	%eax, 16(%esp)
	movl	-32(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	$-1, 8(%esp)
	movl	$1, 4(%esp)
	movl	$1, (%esp)
	call	_createTypeof
	movl	%eax, -40(%ebp)
	movl	8(%ebp), %eax
	movl	-40(%ebp), %edx
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
	movl	36(%edx), %ecx
	movl	%ecx, 36(%eax)
	movl	40(%edx), %ecx
	movl	%ecx, 40(%eax)
	movl	44(%edx), %ecx
	movl	%ecx, 44(%eax)
	movl	48(%edx), %ecx
	movl	%ecx, 48(%eax)
	movl	52(%edx), %ecx
	movl	%ecx, 52(%eax)
	movl	56(%edx), %edx
	movl	%edx, 56(%eax)
	movl	-40(%ebp), %eax
	jmp	L19
L24:
	movl	-12(%ebp), %eax
	movl	$LC2, 4(%esp)
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L25
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	76(%eax), %eax
	movl	76(%eax), %eax
	addl	$21, %eax
	movl	$-1, 28(%esp)
	movl	$0, 24(%esp)
	movl	$0, 20(%esp)
	movl	%eax, 16(%esp)
	movl	-32(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	$-1, 8(%esp)
	movl	$2, 4(%esp)
	movl	$1, (%esp)
	call	_createTypeof
	movl	%eax, -44(%ebp)
	movl	8(%ebp), %eax
	movl	-44(%ebp), %edx
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
	movl	36(%edx), %ecx
	movl	%ecx, 36(%eax)
	movl	40(%edx), %ecx
	movl	%ecx, 40(%eax)
	movl	44(%edx), %ecx
	movl	%ecx, 44(%eax)
	movl	48(%edx), %ecx
	movl	%ecx, 48(%eax)
	movl	52(%edx), %ecx
	movl	%ecx, 52(%eax)
	movl	56(%edx), %edx
	movl	%edx, 56(%eax)
	movl	-44(%ebp), %eax
	jmp	L19
L25:
	movl	$0, %eax
	jmp	L19
L22:
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	60(%eax), %eax
	cmpl	$20, %eax
	jne	L26
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	movl	76(%eax), %eax
	movl	60(%eax), %eax
	cmpl	$20, %eax
	jne	L26
	movl	-12(%ebp), %eax
	movl	72(%eax), %eax
	movl	$LC0, 4(%esp)
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L27
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	leal	21(%eax), %edx
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	addl	$21, %eax
	movl	$-1, 28(%esp)
	movl	$0, 24(%esp)
	movl	%edx, 20(%esp)
	movl	%eax, 16(%esp)
	movl	$-1, 12(%esp)
	movl	$-1, 8(%esp)
	movl	$0, 4(%esp)
	movl	$1, (%esp)
	call	_createTypeof
	movl	%eax, -48(%ebp)
	movl	8(%ebp), %eax
	movl	-48(%ebp), %edx
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
	movl	36(%edx), %ecx
	movl	%ecx, 36(%eax)
	movl	40(%edx), %ecx
	movl	%ecx, 40(%eax)
	movl	44(%edx), %ecx
	movl	%ecx, 44(%eax)
	movl	48(%edx), %ecx
	movl	%ecx, 48(%eax)
	movl	52(%edx), %ecx
	movl	%ecx, 52(%eax)
	movl	56(%edx), %edx
	movl	%edx, 56(%eax)
	movl	-48(%ebp), %eax
	jmp	L19
L27:
	movl	-12(%ebp), %eax
	movl	72(%eax), %eax
	movl	$LC1, 4(%esp)
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L28
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	leal	21(%eax), %edx
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	addl	$21, %eax
	movl	$-1, 28(%esp)
	movl	$0, 24(%esp)
	movl	%edx, 20(%esp)
	movl	%eax, 16(%esp)
	movl	$-1, 12(%esp)
	movl	$-1, 8(%esp)
	movl	$1, 4(%esp)
	movl	$1, (%esp)
	call	_createTypeof
	movl	%eax, -52(%ebp)
	movl	8(%ebp), %eax
	movl	-52(%ebp), %edx
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
	movl	36(%edx), %ecx
	movl	%ecx, 36(%eax)
	movl	40(%edx), %ecx
	movl	%ecx, 40(%eax)
	movl	44(%edx), %ecx
	movl	%ecx, 44(%eax)
	movl	48(%edx), %ecx
	movl	%ecx, 48(%eax)
	movl	52(%edx), %ecx
	movl	%ecx, 52(%eax)
	movl	56(%edx), %edx
	movl	%edx, 56(%eax)
	movl	-52(%ebp), %eax
	jmp	L19
L28:
	movl	-12(%ebp), %eax
	movl	72(%eax), %eax
	movl	$LC2, 4(%esp)
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L29
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	leal	21(%eax), %edx
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	addl	$21, %eax
	movl	$-1, 28(%esp)
	movl	$0, 24(%esp)
	movl	%edx, 20(%esp)
	movl	%eax, 16(%esp)
	movl	$-1, 12(%esp)
	movl	$-1, 8(%esp)
	movl	$2, 4(%esp)
	movl	$1, (%esp)
	call	_createTypeof
	movl	%eax, -56(%ebp)
	movl	8(%ebp), %eax
	movl	-56(%ebp), %edx
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
	movl	36(%edx), %ecx
	movl	%ecx, 36(%eax)
	movl	40(%edx), %ecx
	movl	%ecx, 40(%eax)
	movl	44(%edx), %ecx
	movl	%ecx, 44(%eax)
	movl	48(%edx), %ecx
	movl	%ecx, 48(%eax)
	movl	52(%edx), %ecx
	movl	%ecx, 52(%eax)
	movl	56(%edx), %edx
	movl	%edx, 56(%eax)
	movl	-56(%ebp), %eax
	jmp	L19
L29:
	movl	$0, %eax
	jmp	L19
L26:
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	flds	48(%eax)
	fnstcw	-90(%ebp)
	movzwl	-90(%ebp), %eax
	movb	$12, %ah
	movw	%ax, -92(%ebp)
	fldcw	-92(%ebp)
	fistpl	-60(%ebp)
	fldcw	-90(%ebp)
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	flds	48(%eax)
	fldcw	-92(%ebp)
	fistpl	-64(%ebp)
	fldcw	-90(%ebp)
	movl	-12(%ebp), %eax
	movl	72(%eax), %eax
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	$LC0, 4(%esp)
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L30
	movl	$-1, 28(%esp)
	movl	$0, 24(%esp)
	movl	$0, 20(%esp)
	movl	$0, 16(%esp)
	movl	-64(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-60(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$0, 4(%esp)
	movl	$1, (%esp)
	call	_createTypeof
	movl	%eax, -68(%ebp)
	movl	8(%ebp), %eax
	movl	-68(%ebp), %edx
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
	movl	36(%edx), %ecx
	movl	%ecx, 36(%eax)
	movl	40(%edx), %ecx
	movl	%ecx, 40(%eax)
	movl	44(%edx), %ecx
	movl	%ecx, 44(%eax)
	movl	48(%edx), %ecx
	movl	%ecx, 48(%eax)
	movl	52(%edx), %ecx
	movl	%ecx, 52(%eax)
	movl	56(%edx), %edx
	movl	%edx, 56(%eax)
	movl	-68(%ebp), %eax
	jmp	L19
L30:
	movl	-12(%ebp), %eax
	movl	$LC1, 4(%esp)
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L31
	movl	$-1, 28(%esp)
	movl	$0, 24(%esp)
	movl	$0, 20(%esp)
	movl	$0, 16(%esp)
	movl	-64(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-60(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$1, 4(%esp)
	movl	$1, (%esp)
	call	_createTypeof
	movl	%eax, -72(%ebp)
	movl	8(%ebp), %eax
	movl	-72(%ebp), %edx
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
	movl	36(%edx), %ecx
	movl	%ecx, 36(%eax)
	movl	40(%edx), %ecx
	movl	%ecx, 40(%eax)
	movl	44(%edx), %ecx
	movl	%ecx, 44(%eax)
	movl	48(%edx), %ecx
	movl	%ecx, 48(%eax)
	movl	52(%edx), %ecx
	movl	%ecx, 52(%eax)
	movl	56(%edx), %edx
	movl	%edx, 56(%eax)
	movl	-72(%ebp), %eax
	jmp	L19
L31:
	movl	-12(%ebp), %eax
	movl	$LC2, 4(%esp)
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L32
	movl	$-1, 28(%esp)
	movl	$0, 24(%esp)
	movl	$0, 20(%esp)
	movl	$0, 16(%esp)
	movl	-64(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-60(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$2, 4(%esp)
	movl	$1, (%esp)
	call	_createTypeof
	movl	%eax, -76(%ebp)
	movl	8(%ebp), %eax
	movl	-76(%ebp), %edx
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
	movl	36(%edx), %ecx
	movl	%ecx, 36(%eax)
	movl	40(%edx), %ecx
	movl	%ecx, 40(%eax)
	movl	44(%edx), %ecx
	movl	%ecx, 44(%eax)
	movl	48(%edx), %ecx
	movl	%ecx, 48(%eax)
	movl	52(%edx), %ecx
	movl	%ecx, 52(%eax)
	movl	56(%edx), %edx
	movl	%edx, 56(%eax)
	movl	-76(%ebp), %eax
	jmp	L19
L32:
	movl	$0, %eax
	jmp	L19
L16:
	movl	-12(%ebp), %eax
	movl	60(%eax), %eax
	cmpl	$4, %eax
	jne	L33
	movl	-12(%ebp), %eax
	movl	$LC0, 4(%esp)
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L34
	movl	$-1, 28(%esp)
	movl	$0, 24(%esp)
	movl	$0, 20(%esp)
	movl	$0, 16(%esp)
	movl	$-1, 12(%esp)
	movl	$-1, 8(%esp)
	movl	$0, 4(%esp)
	movl	$0, (%esp)
	call	_createTypeof
	movl	%eax, -80(%ebp)
	movl	8(%ebp), %eax
	movl	-80(%ebp), %edx
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
	movl	36(%edx), %ecx
	movl	%ecx, 36(%eax)
	movl	40(%edx), %ecx
	movl	%ecx, 40(%eax)
	movl	44(%edx), %ecx
	movl	%ecx, 44(%eax)
	movl	48(%edx), %ecx
	movl	%ecx, 48(%eax)
	movl	52(%edx), %ecx
	movl	%ecx, 52(%eax)
	movl	56(%edx), %edx
	movl	%edx, 56(%eax)
	movl	-80(%ebp), %eax
	jmp	L19
L34:
	movl	-12(%ebp), %eax
	movl	$LC1, 4(%esp)
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L35
	movl	$-1, 28(%esp)
	movl	$0, 24(%esp)
	movl	$0, 20(%esp)
	movl	$0, 16(%esp)
	movl	$-1, 12(%esp)
	movl	$-1, 8(%esp)
	movl	$1, 4(%esp)
	movl	$0, (%esp)
	call	_createTypeof
	movl	%eax, -84(%ebp)
	movl	8(%ebp), %eax
	movl	-84(%ebp), %edx
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
	movl	36(%edx), %ecx
	movl	%ecx, 36(%eax)
	movl	40(%edx), %ecx
	movl	%ecx, 40(%eax)
	movl	44(%edx), %ecx
	movl	%ecx, 44(%eax)
	movl	48(%edx), %ecx
	movl	%ecx, 48(%eax)
	movl	52(%edx), %ecx
	movl	%ecx, 52(%eax)
	movl	56(%edx), %edx
	movl	%edx, 56(%eax)
	movl	-84(%ebp), %eax
	jmp	L19
L35:
	movl	-12(%ebp), %eax
	movl	$LC2, 4(%esp)
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L36
	movl	$-1, 28(%esp)
	movl	$0, 24(%esp)
	movl	$0, 20(%esp)
	movl	$0, 16(%esp)
	movl	$-1, 12(%esp)
	movl	$-1, 8(%esp)
	movl	$2, 4(%esp)
	movl	$0, (%esp)
	call	_createTypeof
	movl	%eax, -88(%ebp)
	movl	8(%ebp), %eax
	movl	-88(%ebp), %edx
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
	movl	36(%edx), %ecx
	movl	%ecx, 36(%eax)
	movl	40(%edx), %ecx
	movl	%ecx, 40(%eax)
	movl	44(%edx), %ecx
	movl	%ecx, 44(%eax)
	movl	48(%edx), %ecx
	movl	%ecx, 48(%eax)
	movl	52(%edx), %ecx
	movl	%ecx, 52(%eax)
	movl	56(%edx), %edx
	movl	%edx, 56(%eax)
	movl	-88(%ebp), %eax
	jmp	L19
L36:
	movl	$0, %eax
	jmp	L19
L33:
	movl	$0, %eax
L19:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.globl	_extractTypeOfFunction
	.def	_extractTypeOfFunction;	.scl	2;	.type	32;	.endef
_extractTypeOfFunction:
LFB19:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$104, %esp
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	%eax, -12(%ebp)
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	72(%eax), %eax
	movl	%eax, -16(%ebp)
	movl	$16, (%esp)
	call	_malloc
	movl	%eax, -40(%ebp)
	movl	$0, -20(%ebp)
	jmp	L38
L39:
	addl	$1, -20(%ebp)
	movl	-12(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -12(%ebp)
L38:
	cmpl	$0, -12(%ebp)
	jne	L39
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	%eax, -12(%ebp)
	movl	-40(%ebp), %eax
	movl	-20(%ebp), %edx
	movl	%edx, 8(%eax)
	movl	$0, -24(%ebp)
	movl	-16(%ebp), %eax
	movl	60(%eax), %eax
	cmpl	$21, %eax
	je	L40
	jmp	L41
L42:
	addl	$1, -24(%ebp)
	movl	-16(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -16(%ebp)
L41:
	cmpl	$0, -16(%ebp)
	jne	L42
L40:
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	72(%eax), %eax
	movl	%eax, -16(%ebp)
	movl	-40(%ebp), %eax
	movl	-24(%ebp), %edx
	movl	%edx, 12(%eax)
	movl	-20(%ebp), %eax
	imull	$60, %eax, %eax
	movl	%eax, (%esp)
	call	_malloc
	movl	%eax, -28(%ebp)
	movl	-24(%ebp), %eax
	imull	$60, %eax, %eax
	movl	%eax, (%esp)
	call	_malloc
	movl	%eax, -32(%ebp)
	movl	$0, -36(%ebp)
	jmp	L43
L72:
	cmpl	$0, -12(%ebp)
	je	L81
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	60(%eax), %eax
	cmpl	$4, %eax
	jne	L46
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	$LC2, 4(%esp)
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L47
	movl	-36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	-28(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	$0, 20(%esp)
	movl	$0, 16(%esp)
	movl	$-1, 12(%esp)
	movl	$-1, 8(%esp)
	movl	$2, 4(%esp)
	movl	$0, (%esp)
	call	_createTypeof
	movl	%eax, -28(%ebp)
	jmp	L48
L47:
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	$LC1, 4(%esp)
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L49
	movl	-36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	-28(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	$0, 20(%esp)
	movl	$0, 16(%esp)
	movl	$-1, 12(%esp)
	movl	$-1, 8(%esp)
	movl	$1, 4(%esp)
	movl	$0, (%esp)
	call	_createTypeof
	movl	%eax, -28(%ebp)
	jmp	L48
L49:
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	$LC0, 4(%esp)
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L50
	movl	-36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	-28(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	$0, 20(%esp)
	movl	$0, 16(%esp)
	movl	$-1, 12(%esp)
	movl	$-1, 8(%esp)
	movl	$0, 4(%esp)
	movl	$0, (%esp)
	call	_createTypeof
	movl	%eax, -28(%ebp)
	jmp	L48
L50:
	movl	$0, %eax
	jmp	L51
L46:
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	60(%eax), %eax
	cmpl	$5, %eax
	jne	L52
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	76(%eax), %eax
	movl	76(%eax), %eax
	flds	48(%eax)
	fnstcw	-58(%ebp)
	movzwl	-58(%ebp), %eax
	movb	$12, %ah
	movw	%ax, -60(%ebp)
	fldcw	-60(%ebp)
	fistpl	-44(%ebp)
	fldcw	-58(%ebp)
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	76(%eax), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	flds	48(%eax)
	fldcw	-60(%ebp)
	fistpl	-48(%ebp)
	fldcw	-58(%ebp)
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	$LC2, 4(%esp)
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L53
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	76(%eax), %eax
	movl	76(%eax), %eax
	movl	60(%eax), %eax
	cmpl	$18, %eax
	jne	L54
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	76(%eax), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	60(%eax), %eax
	cmpl	$18, %eax
	jne	L54
	movl	-36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	-28(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	$0, 20(%esp)
	movl	$0, 16(%esp)
	movl	-48(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$2, 4(%esp)
	movl	$1, (%esp)
	call	_createTypeof
	movl	%eax, -28(%ebp)
	jmp	L48
L54:
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	76(%eax), %eax
	movl	76(%eax), %eax
	movl	60(%eax), %eax
	cmpl	$18, %eax
	jne	L56
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	76(%eax), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	60(%eax), %eax
	cmpl	$20, %eax
	jne	L56
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	76(%eax), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	leal	21(%eax), %edx
	movl	-36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	-28(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	%edx, 20(%esp)
	movl	$0, 16(%esp)
	movl	$-1, 12(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$2, 4(%esp)
	movl	$1, (%esp)
	call	_createTypeof
	movl	%eax, -28(%ebp)
	jmp	L48
L56:
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	76(%eax), %eax
	movl	76(%eax), %eax
	movl	60(%eax), %eax
	cmpl	$20, %eax
	jne	L57
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	76(%eax), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	60(%eax), %eax
	cmpl	$18, %eax
	jne	L57
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	76(%eax), %eax
	movl	76(%eax), %eax
	leal	21(%eax), %edx
	movl	-36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	-28(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	$0, 20(%esp)
	movl	%edx, 16(%esp)
	movl	-48(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	$-1, 8(%esp)
	movl	$2, 4(%esp)
	movl	$1, (%esp)
	call	_createTypeof
	movl	%eax, -28(%ebp)
	jmp	L48
L57:
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	76(%eax), %eax
	movl	76(%eax), %eax
	movl	60(%eax), %eax
	cmpl	$20, %eax
	jne	L58
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	76(%eax), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	60(%eax), %eax
	cmpl	$20, %eax
	jne	L58
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	76(%eax), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	leal	21(%eax), %ecx
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	76(%eax), %eax
	movl	76(%eax), %eax
	leal	21(%eax), %edx
	movl	-36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	-28(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	%ecx, 20(%esp)
	movl	%edx, 16(%esp)
	movl	$-1, 12(%esp)
	movl	$-1, 8(%esp)
	movl	$2, 4(%esp)
	movl	$1, (%esp)
	call	_createTypeof
	movl	%eax, -28(%ebp)
	jmp	L48
L58:
	movl	$0, %eax
	jmp	L51
L53:
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	$LC1, 4(%esp)
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L60
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	76(%eax), %eax
	movl	76(%eax), %eax
	movl	60(%eax), %eax
	cmpl	$18, %eax
	jne	L61
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	76(%eax), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	60(%eax), %eax
	cmpl	$18, %eax
	jne	L61
	movl	-36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	-28(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	$0, 20(%esp)
	movl	$0, 16(%esp)
	movl	-48(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$1, 4(%esp)
	movl	$1, (%esp)
	call	_createTypeof
	movl	%eax, -28(%ebp)
	jmp	L48
L61:
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	76(%eax), %eax
	movl	76(%eax), %eax
	movl	60(%eax), %eax
	cmpl	$18, %eax
	jne	L63
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	76(%eax), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	60(%eax), %eax
	cmpl	$20, %eax
	jne	L63
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	76(%eax), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	leal	21(%eax), %edx
	movl	-36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	-28(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	%edx, 20(%esp)
	movl	$0, 16(%esp)
	movl	$-1, 12(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$1, 4(%esp)
	movl	$1, (%esp)
	call	_createTypeof
	movl	%eax, -28(%ebp)
	jmp	L48
L63:
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	76(%eax), %eax
	movl	76(%eax), %eax
	movl	60(%eax), %eax
	cmpl	$20, %eax
	jne	L64
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	76(%eax), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	60(%eax), %eax
	cmpl	$18, %eax
	jne	L64
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	76(%eax), %eax
	movl	76(%eax), %eax
	leal	21(%eax), %edx
	movl	-36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	-28(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	$0, 20(%esp)
	movl	%edx, 16(%esp)
	movl	-48(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	$-1, 8(%esp)
	movl	$1, 4(%esp)
	movl	$1, (%esp)
	call	_createTypeof
	movl	%eax, -28(%ebp)
	jmp	L48
L64:
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	76(%eax), %eax
	movl	76(%eax), %eax
	movl	60(%eax), %eax
	cmpl	$20, %eax
	jne	L65
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	76(%eax), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	60(%eax), %eax
	cmpl	$20, %eax
	jne	L65
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	76(%eax), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	leal	21(%eax), %ecx
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	76(%eax), %eax
	movl	76(%eax), %eax
	leal	21(%eax), %edx
	movl	-36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	-28(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	%ecx, 20(%esp)
	movl	%edx, 16(%esp)
	movl	$-1, 12(%esp)
	movl	$-1, 8(%esp)
	movl	$1, 4(%esp)
	movl	$1, (%esp)
	call	_createTypeof
	movl	%eax, -28(%ebp)
	jmp	L48
L65:
	movl	$0, %eax
	jmp	L51
L60:
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	$LC0, 4(%esp)
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L66
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	76(%eax), %eax
	movl	76(%eax), %eax
	movl	60(%eax), %eax
	cmpl	$18, %eax
	jne	L67
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	76(%eax), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	60(%eax), %eax
	cmpl	$18, %eax
	jne	L67
	movl	-36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	-28(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	$0, 20(%esp)
	movl	$0, 16(%esp)
	movl	-48(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$0, 4(%esp)
	movl	$1, (%esp)
	call	_createTypeof
	movl	%eax, -28(%ebp)
	jmp	L48
L67:
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	76(%eax), %eax
	movl	76(%eax), %eax
	movl	60(%eax), %eax
	cmpl	$18, %eax
	jne	L69
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	76(%eax), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	60(%eax), %eax
	cmpl	$20, %eax
	jne	L69
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	76(%eax), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	leal	21(%eax), %edx
	movl	-36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	-28(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	%edx, 20(%esp)
	movl	$0, 16(%esp)
	movl	$-1, 12(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$0, 4(%esp)
	movl	$1, (%esp)
	call	_createTypeof
	movl	%eax, -28(%ebp)
	jmp	L48
L69:
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	76(%eax), %eax
	movl	76(%eax), %eax
	movl	60(%eax), %eax
	cmpl	$20, %eax
	jne	L70
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	76(%eax), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	60(%eax), %eax
	cmpl	$18, %eax
	jne	L70
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	76(%eax), %eax
	movl	76(%eax), %eax
	leal	21(%eax), %edx
	movl	-36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	-28(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	$0, 20(%esp)
	movl	%edx, 16(%esp)
	movl	-48(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	$-1, 8(%esp)
	movl	$0, 4(%esp)
	movl	$1, (%esp)
	call	_createTypeof
	movl	%eax, -28(%ebp)
	jmp	L48
L70:
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	76(%eax), %eax
	movl	76(%eax), %eax
	movl	60(%eax), %eax
	cmpl	$20, %eax
	jne	L71
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	76(%eax), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	60(%eax), %eax
	cmpl	$20, %eax
	jne	L71
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	76(%eax), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	leal	21(%eax), %ecx
	movl	-12(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	76(%eax), %eax
	movl	76(%eax), %eax
	leal	21(%eax), %edx
	movl	-36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	-28(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	%ecx, 20(%esp)
	movl	%edx, 16(%esp)
	movl	$-1, 12(%esp)
	movl	$-1, 8(%esp)
	movl	$0, 4(%esp)
	movl	$1, (%esp)
	call	_createTypeof
	movl	%eax, -28(%ebp)
	jmp	L48
L71:
	movl	$0, %eax
	jmp	L51
L66:
	movl	$0, %eax
	jmp	L51
L52:
	movl	$0, %eax
	jmp	L51
L48:
	movl	-12(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -12(%ebp)
	addl	$1, -36(%ebp)
L43:
	movl	-36(%ebp), %eax
	cmpl	-20(%ebp), %eax
	jl	L72
	jmp	L45
L81:
	nop
L45:
	movl	$0, -36(%ebp)
	jmp	L73
L80:
	cmpl	$0, -16(%ebp)
	je	L82
	movl	-16(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	$LC2, 4(%esp)
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L76
	movl	-36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	-32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	$0, 20(%esp)
	movl	$0, 16(%esp)
	movl	$-1, 12(%esp)
	movl	$-1, 8(%esp)
	movl	$2, 4(%esp)
	movl	$0, (%esp)
	call	_createTypeof
	movl	%eax, -32(%ebp)
	jmp	L77
L76:
	movl	-16(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	$LC1, 4(%esp)
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L78
	movl	-36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	-32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	$0, 20(%esp)
	movl	$0, 16(%esp)
	movl	$-1, 12(%esp)
	movl	$-1, 8(%esp)
	movl	$1, 4(%esp)
	movl	$0, (%esp)
	call	_createTypeof
	movl	%eax, -32(%ebp)
	jmp	L77
L78:
	movl	-16(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	$LC0, 4(%esp)
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L79
	movl	-36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	-32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	$0, 20(%esp)
	movl	$0, 16(%esp)
	movl	$-1, 12(%esp)
	movl	$-1, 8(%esp)
	movl	$0, 4(%esp)
	movl	$0, (%esp)
	call	_createTypeof
	movl	%eax, -32(%ebp)
	jmp	L77
L79:
	movl	$0, %eax
	jmp	L51
L77:
	movl	-16(%ebp), %eax
	movl	64(%eax), %eax
	movl	%eax, -16(%ebp)
	addl	$1, -36(%ebp)
L73:
	movl	-36(%ebp), %eax
	cmpl	-24(%ebp), %eax
	jl	L80
	jmp	L75
L82:
	nop
L75:
	movl	-40(%ebp), %eax
	movl	-28(%ebp), %edx
	movl	%edx, (%eax)
	movl	-40(%ebp), %eax
	movl	-32(%ebp), %edx
	movl	%edx, 4(%eax)
	movl	8(%ebp), %eax
	movl	-40(%ebp), %edx
	movl	%edx, 4(%eax)
	movl	-40(%ebp), %eax
L51:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE19:
	.section .rdata,"dr"
LC4:
	.ascii "NUM\0"
LC5:
	.ascii "LINE %d: %s %s\12\0"
	.align 4
LC6:
	.ascii "Variable used in this expression has been declared later. line no\0"
LC7:
	.ascii "LINE %d: %s\12\0"
LC8:
	.ascii "PLUS\0"
LC9:
	.ascii "MINUS\0"
LC10:
	.ascii "MUL\0"
LC11:
	.ascii "DIV\0"
LC12:
	.ascii "OR\0"
LC13:
	.ascii "AND\0"
LC14:
	.ascii "NE\0"
LC15:
	.ascii "EQ\0"
LC16:
	.ascii "LT\0"
LC17:
	.ascii "LE\0"
LC18:
	.ascii "GT\0"
LC19:
	.ascii "GE\0"
	.text
	.globl	_extractTypeOfExpression
	.def	_extractTypeOfExpression;	.scl	2;	.type	32;	.endef
_extractTypeOfExpression:
LFB20:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$252, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movl	8(%ebp), %eax
	movl	60(%eax), %eax
	cmpl	$21, %eax
	jne	L84
	movl	$-1, %eax
	jmp	L83
L84:
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	testl	%eax, %eax
	jne	L86
	movl	8(%ebp), %eax
	movl	60(%eax), %eax
	cmpl	$19, %eax
	je	L87
	cmpl	$20, %eax
	je	L88
	cmpl	$18, %eax
	je	L89
	jmp	L86
L87:
	movl	$2, %eax
	jmp	L83
L89:
	movl	8(%ebp), %eax
	movl	$LC4, 4(%esp)
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L90
	movl	$0, %eax
	jmp	L83
L90:
	movl	$1, %eax
	jmp	L83
L88:
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
	movl	%eax, -96(%ebp)
	cmpl	$0, -96(%ebp)
	jne	L91
	movl	$160, (%esp)
	call	_malloc
	movl	%eax, -100(%ebp)
	movl	-100(%ebp), %eax
	movl	$0, (%eax)
	movl	8(%ebp), %eax
	movl	44(%eax), %edx
	movl	-100(%ebp), %eax
	movl	%edx, 156(%eax)
	movl	-100(%ebp), %eax
	addl	$4, %eax
	movl	$1769103702, (%eax)
	movl	$1701601889, 4(%eax)
	movl	$1702065440, 8(%eax)
	movl	$1852383332, 12(%eax)
	movl	$1768453152, 16(%eax)
	movl	$2019893363, 20(%eax)
	movl	$1936028272, 24(%eax)
	movl	$1852795251, 28(%eax)
	movl	$1935763488, 32(%eax)
	movl	$1953459744, 36(%eax)
	movl	$1701143072, 40(%eax)
	movl	$1701060718, 44(%eax)
	movl	$1918987363, 48(%eax)
	movl	$539911269, 52(%eax)
	movl	$1701734764, 56(%eax)
	movl	$7302688, 60(%eax)
	movl	-100(%ebp), %eax
	leal	4(%eax), %ecx
	movl	8(%ebp), %eax
	leal	21(%eax), %edx
	movl	-100(%ebp), %eax
	movl	156(%eax), %eax
	movl	%ecx, 12(%esp)
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC5, (%esp)
	call	_printf
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -28(%ebp)
	cmpl	$0, -28(%ebp)
	jne	L94
	movl	16(%ebp), %eax
	movl	-100(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L93
L95:
	movl	-28(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -28(%ebp)
L94:
	movl	-28(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L95
	movl	-28(%ebp), %eax
	movl	-100(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
L93:
	movl	$-1, %eax
	jmp	L83
L91:
	movl	-96(%ebp), %eax
	movl	4(%eax), %eax
	movl	44(%eax), %edx
	movl	8(%ebp), %eax
	movl	44(%eax), %eax
	cmpl	%eax, %edx
	jl	L96
	movl	$160, (%esp)
	call	_malloc
	movl	%eax, -104(%ebp)
	movl	-104(%ebp), %eax
	movl	$0, (%eax)
	movl	8(%ebp), %eax
	movl	44(%eax), %edx
	movl	-104(%ebp), %eax
	movl	%edx, 156(%eax)
	movl	-104(%ebp), %eax
	addl	$4, %eax
	movl	$LC6, %ebx
	movl	$66, %edx
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
	movl	-104(%ebp), %eax
	leal	4(%eax), %edx
	movl	-104(%ebp), %eax
	movl	156(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC7, (%esp)
	call	_printf
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -32(%ebp)
	cmpl	$0, -32(%ebp)
	jne	L99
	movl	16(%ebp), %eax
	movl	-104(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L98
L100:
	movl	-32(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -32(%ebp)
L99:
	movl	-32(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L100
	movl	-32(%ebp), %eax
	movl	-104(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
L98:
	movl	$-1, %eax
	jmp	L83
L96:
	movl	-96(%ebp), %eax
	movl	72(%eax), %eax
	testl	%eax, %eax
	jne	L101
	movl	-96(%ebp), %eax
	movl	16(%eax), %eax
	jmp	L83
L101:
	movl	$160, (%esp)
	call	_malloc
	movl	%eax, -108(%ebp)
	movl	-108(%ebp), %eax
	movl	$0, (%eax)
	movl	8(%ebp), %eax
	movl	44(%eax), %edx
	movl	-108(%ebp), %eax
	movl	%edx, 156(%eax)
	movl	-108(%ebp), %eax
	addl	$4, %eax
	movl	$1852727619, (%eax)
	movl	$1965061231, 4(%eax)
	movl	$1092642163, 8(%eax)
	movl	$2036429426, 12(%eax)
	movl	$1918989856, 16(%eax)
	movl	$1818386793, 20(%eax)
	movl	$1852383333, 24(%eax)
	movl	$1886938400, 28(%eax)
	movl	$1936942450, 32(%eax)
	movl	$7237481, 36(%eax)
	movl	-108(%ebp), %eax
	leal	4(%eax), %edx
	movl	-108(%ebp), %eax
	movl	156(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC7, (%esp)
	call	_printf
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -36(%ebp)
	cmpl	$0, -36(%ebp)
	jne	L104
	movl	16(%ebp), %eax
	movl	-108(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L103
L105:
	movl	-36(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -36(%ebp)
L104:
	movl	-36(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L105
	movl	-36(%ebp), %eax
	movl	-108(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
L103:
	movl	$-1, %eax
	jmp	L83
L86:
	movl	8(%ebp), %eax
	movl	60(%eax), %eax
	cmpl	$11, %eax
	jne	L106
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	60(%eax), %eax
	cmpl	$20, %eax
	jne	L107
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
	movl	%eax, -156(%ebp)
	cmpl	$0, -156(%ebp)
	jne	L108
	movl	$160, (%esp)
	call	_malloc
	movl	%eax, -160(%ebp)
	movl	-160(%ebp), %eax
	movl	$0, (%eax)
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	44(%eax), %edx
	movl	-160(%ebp), %eax
	movl	%edx, 156(%eax)
	movl	-160(%ebp), %eax
	addl	$4, %eax
	movl	$1769103702, (%eax)
	movl	$1701601889, 4(%eax)
	movl	$1702065440, 8(%eax)
	movl	$1852383332, 12(%eax)
	movl	$1768453152, 16(%eax)
	movl	$2019893363, 20(%eax)
	movl	$1936028272, 24(%eax)
	movl	$1852795251, 28(%eax)
	movl	$1935763488, 32(%eax)
	movl	$1953459744, 36(%eax)
	movl	$1701143072, 40(%eax)
	movl	$1701060718, 44(%eax)
	movl	$1918987363, 48(%eax)
	movl	$539911269, 52(%eax)
	movl	$1701734764, 56(%eax)
	movl	$7302688, 60(%eax)
	movl	-160(%ebp), %eax
	leal	4(%eax), %ecx
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	leal	21(%eax), %edx
	movl	-160(%ebp), %eax
	movl	156(%eax), %eax
	movl	%ecx, 12(%esp)
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC5, (%esp)
	call	_printf
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -40(%ebp)
	cmpl	$0, -40(%ebp)
	jne	L111
	movl	16(%ebp), %eax
	movl	-160(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L110
L112:
	movl	-40(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -40(%ebp)
L111:
	movl	-40(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L112
	movl	-40(%ebp), %eax
	movl	-160(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
L110:
	movl	$-1, %eax
	jmp	L83
L108:
	movl	-156(%ebp), %eax
	movl	72(%eax), %eax
	testl	%eax, %eax
	jne	L113
	movl	$160, (%esp)
	call	_malloc
	movl	%eax, -164(%ebp)
	movl	-164(%ebp), %eax
	movl	$0, (%eax)
	movl	8(%ebp), %eax
	movl	44(%eax), %edx
	movl	-164(%ebp), %eax
	movl	%edx, 156(%eax)
	movl	-164(%ebp), %eax
	addl	$4, %eax
	movl	$1852727619, (%eax)
	movl	$1965061231, 4(%eax)
	movl	$1881171315, 8(%eax)
	movl	$1768778098, 12(%eax)
	movl	$1702259060, 16(%eax)
	movl	$1918989856, 20(%eax)
	movl	$1818386793, 24(%eax)
	movl	$1935745125, 28(%eax)
	movl	$1920098592, 32(%eax)
	movl	$1763735905, 36(%eax)
	movl	$2019893358, 40(%eax)
	movl	$1936028272, 44(%eax)
	movl	$1852795251, 48(%eax)
	movb	$0, 52(%eax)
	movl	-164(%ebp), %eax
	leal	4(%eax), %edx
	movl	-164(%ebp), %eax
	movl	156(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC7, (%esp)
	call	_printf
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -44(%ebp)
	cmpl	$0, -44(%ebp)
	jne	L116
	movl	16(%ebp), %eax
	movl	-164(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L115
L117:
	movl	-44(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -44(%ebp)
L116:
	movl	-44(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L117
	movl	-44(%ebp), %eax
	movl	-164(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
L115:
	movl	$-1, %eax
	jmp	L83
L113:
	movl	-156(%ebp), %eax
	movl	4(%eax), %eax
	movl	44(%eax), %edx
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	44(%eax), %eax
	cmpl	%eax, %edx
	jl	L118
	movl	$160, (%esp)
	call	_malloc
	movl	%eax, -168(%ebp)
	movl	-168(%ebp), %eax
	movl	$0, (%eax)
	movl	8(%ebp), %eax
	movl	44(%eax), %edx
	movl	-168(%ebp), %eax
	movl	%edx, 156(%eax)
	movl	-168(%ebp), %eax
	addl	$4, %eax
	movl	$LC6, %ebx
	movl	$66, %edx
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
	movl	-168(%ebp), %eax
	leal	4(%eax), %edx
	movl	-168(%ebp), %eax
	movl	156(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC7, (%esp)
	call	_printf
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -48(%ebp)
	cmpl	$0, -48(%ebp)
	jne	L121
	movl	16(%ebp), %eax
	movl	-168(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L120
L122:
	movl	-48(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -48(%ebp)
L121:
	movl	-48(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L122
	movl	-48(%ebp), %eax
	movl	-168(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
L120:
	movl	$-1, %eax
	jmp	L83
L118:
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
	movl	%eax, -172(%ebp)
	cmpl	$0, -172(%ebp)
	jne	L123
	movl	$160, (%esp)
	call	_malloc
	movl	%eax, -176(%ebp)
	movl	-176(%ebp), %eax
	movl	$0, (%eax)
	movl	8(%ebp), %eax
	movl	44(%eax), %edx
	movl	-176(%ebp), %eax
	movl	%edx, 156(%eax)
	movl	-176(%ebp), %eax
	addl	$4, %eax
	movl	$1634890305, (%eax)
	movl	$1852383353, 4(%eax)
	movl	$544761188, 8(%eax)
	movl	$1769103734, 12(%eax)
	movl	$1701601889, 16(%eax)
	movl	$1935763488, 20(%eax)
	movl	$1953459744, 24(%eax)
	movl	$1701143072, 28(%eax)
	movl	$1701060718, 32(%eax)
	movl	$1918987363, 36(%eax)
	movl	$539911269, 40(%eax)
	movl	$1701734764, 44(%eax)
	movl	$7302688, 48(%eax)
	movl	-176(%ebp), %eax
	leal	4(%eax), %edx
	movl	-176(%ebp), %eax
	movl	156(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC7, (%esp)
	call	_printf
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -52(%ebp)
	cmpl	$0, -52(%ebp)
	jne	L126
	movl	16(%ebp), %eax
	movl	-176(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L125
L127:
	movl	-52(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -52(%ebp)
L126:
	movl	-52(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L127
	movl	-52(%ebp), %eax
	movl	-176(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
L125:
	movl	$-1, %eax
	jmp	L83
L123:
	movl	-172(%ebp), %eax
	movl	72(%eax), %eax
	testl	%eax, %eax
	jne	L128
	movl	-172(%ebp), %eax
	movl	16(%eax), %eax
	testl	%eax, %eax
	je	L129
L128:
	movl	$160, (%esp)
	call	_malloc
	movl	%eax, -184(%ebp)
	movl	-184(%ebp), %eax
	movl	$0, (%eax)
	movl	8(%ebp), %eax
	movl	44(%eax), %edx
	movl	-184(%ebp), %eax
	movl	%edx, 156(%eax)
	movl	-184(%ebp), %eax
	addl	$4, %eax
	movl	$1852727619, (%eax)
	movl	$1965061231, 4(%eax)
	movl	$1847616883, 8(%eax)
	movl	$1764585071, 12(%eax)
	movl	$1734702190, 16(%eax)
	movl	$1981837925, 20(%eax)
	movl	$1634300513, 24(%eax)
	movl	$543517794, 28(%eax)
	movl	$1629516641, 32(%eax)
	movl	$2036429426, 36(%eax)
	movl	$1684957472, 40(%eax)
	movw	$30821, 44(%eax)
	movb	$0, 46(%eax)
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -56(%ebp)
	cmpl	$0, -56(%ebp)
	jne	L132
	movl	16(%ebp), %eax
	movl	-184(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L131
L133:
	movl	-56(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -56(%ebp)
L132:
	movl	-56(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L133
	movl	-56(%ebp), %eax
	movl	-184(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
L131:
	movl	$-1, %eax
	jmp	L83
L129:
	movl	-172(%ebp), %eax
	movl	4(%eax), %eax
	movl	44(%eax), %edx
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	44(%eax), %eax
	cmpl	%eax, %edx
	jl	L134
	movl	$160, (%esp)
	call	_malloc
	movl	%eax, -180(%ebp)
	movl	-180(%ebp), %eax
	movl	$0, (%eax)
	movl	8(%ebp), %eax
	movl	44(%eax), %edx
	movl	-180(%ebp), %eax
	movl	%edx, 156(%eax)
	movl	-180(%ebp), %eax
	addl	$4, %eax
	movl	$1634890305, (%eax)
	movl	$1852383353, 4(%eax)
	movl	$544761188, 8(%eax)
	movl	$1769103734, 12(%eax)
	movl	$1701601889, 16(%eax)
	movl	$1935763488, 20(%eax)
	movl	$1701143072, 24(%eax)
	movl	$1701060718, 28(%eax)
	movl	$1918987363, 32(%eax)
	movl	$1814062181, 36(%eax)
	movl	$1919251553, 40(%eax)
	movl	$1768693806, 44(%eax)
	movl	$1847616878, 48(%eax)
	movw	$111, 52(%eax)
	movl	-180(%ebp), %eax
	leal	4(%eax), %edx
	movl	-180(%ebp), %eax
	movl	156(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC7, (%esp)
	call	_printf
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -60(%ebp)
	cmpl	$0, -60(%ebp)
	jne	L137
	movl	16(%ebp), %eax
	movl	-180(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L136
L138:
	movl	-60(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -60(%ebp)
L137:
	movl	-60(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L138
	movl	-60(%ebp), %eax
	movl	-180(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
L136:
	movl	$-1, %eax
	jmp	L83
L134:
	movl	-156(%ebp), %eax
	movl	16(%eax), %eax
	jmp	L83
L107:
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
	movl	%eax, -188(%ebp)
	cmpl	$0, -188(%ebp)
	jne	L139
	movl	$160, (%esp)
	call	_malloc
	movl	%eax, -192(%ebp)
	movl	-192(%ebp), %eax
	movl	$0, (%eax)
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	44(%eax), %edx
	movl	-192(%ebp), %eax
	movl	%edx, 156(%eax)
	movl	-192(%ebp), %eax
	addl	$4, %eax
	movl	$1769103702, (%eax)
	movl	$1701601889, 4(%eax)
	movl	$1702065440, 8(%eax)
	movl	$1852383332, 12(%eax)
	movl	$1768453152, 16(%eax)
	movl	$2019893363, 20(%eax)
	movl	$1936028272, 24(%eax)
	movl	$1852795251, 28(%eax)
	movl	$1935763488, 32(%eax)
	movl	$1953459744, 36(%eax)
	movl	$1701143072, 40(%eax)
	movl	$1701060718, 44(%eax)
	movl	$1918987363, 48(%eax)
	movl	$539911269, 52(%eax)
	movl	$1701734764, 56(%eax)
	movl	$7302688, 60(%eax)
	movl	-192(%ebp), %eax
	leal	4(%eax), %ecx
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	leal	21(%eax), %edx
	movl	-192(%ebp), %eax
	movl	156(%eax), %eax
	movl	%ecx, 12(%esp)
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC5, (%esp)
	call	_printf
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -64(%ebp)
	cmpl	$0, -64(%ebp)
	jne	L142
	movl	16(%ebp), %eax
	movl	-192(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L141
L143:
	movl	-64(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -64(%ebp)
L142:
	movl	-64(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L143
	movl	-64(%ebp), %eax
	movl	-192(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
L141:
	movl	$-1, %eax
	jmp	L83
L139:
	movl	-188(%ebp), %eax
	movl	72(%eax), %eax
	testl	%eax, %eax
	jne	L144
	movl	$160, (%esp)
	call	_malloc
	movl	%eax, -196(%ebp)
	movl	-196(%ebp), %eax
	movl	$0, (%eax)
	movl	8(%ebp), %eax
	movl	44(%eax), %edx
	movl	-196(%ebp), %eax
	movl	%edx, 156(%eax)
	movl	-196(%ebp), %eax
	addl	$4, %eax
	movl	$1852727619, (%eax)
	movl	$1965061231, 4(%eax)
	movl	$1881171315, 8(%eax)
	movl	$1768778098, 12(%eax)
	movl	$1702259060, 16(%eax)
	movl	$1918989856, 20(%eax)
	movl	$1818386793, 24(%eax)
	movl	$1935745125, 28(%eax)
	movl	$1920098592, 32(%eax)
	movl	$1763735905, 36(%eax)
	movl	$2019893358, 40(%eax)
	movl	$1936028272, 44(%eax)
	movl	$1852795251, 48(%eax)
	movb	$0, 52(%eax)
	movl	-196(%ebp), %eax
	leal	4(%eax), %edx
	movl	-196(%ebp), %eax
	movl	156(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC7, (%esp)
	call	_printf
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -68(%ebp)
	cmpl	$0, -68(%ebp)
	jne	L147
	movl	16(%ebp), %eax
	movl	-196(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L146
L148:
	movl	-68(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -68(%ebp)
L147:
	movl	-68(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L148
	movl	-68(%ebp), %eax
	movl	-196(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
L146:
	movl	$-1, %eax
	jmp	L83
L144:
	movl	-188(%ebp), %eax
	movl	4(%eax), %eax
	movl	44(%eax), %edx
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	44(%eax), %eax
	cmpl	%eax, %edx
	jl	L149
	movl	$160, (%esp)
	call	_malloc
	movl	%eax, -200(%ebp)
	movl	-200(%ebp), %eax
	movl	$0, (%eax)
	movl	8(%ebp), %eax
	movl	44(%eax), %edx
	movl	-200(%ebp), %eax
	movl	%edx, 156(%eax)
	movl	-200(%ebp), %eax
	addl	$4, %eax
	movl	$LC6, %ebx
	movl	$66, %edx
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
	movl	-200(%ebp), %eax
	leal	4(%eax), %edx
	movl	-200(%ebp), %eax
	movl	156(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC7, (%esp)
	call	_printf
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -72(%ebp)
	cmpl	$0, -72(%ebp)
	jne	L152
	movl	16(%ebp), %eax
	movl	-200(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L151
L153:
	movl	-72(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -72(%ebp)
L152:
	movl	-72(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L153
	movl	-72(%ebp), %eax
	movl	-200(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
L151:
	movl	$-1, %eax
	jmp	L83
L149:
	movl	-188(%ebp), %eax
	movl	20(%eax), %eax
	cmpl	$-1, %eax
	je	L154
	movl	-188(%ebp), %eax
	movl	24(%eax), %eax
	cmpl	$-1, %eax
	je	L154
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	$LC4, 4(%esp)
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L155
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	flds	48(%eax)
	movl	-188(%ebp), %eax
	movl	20(%eax), %eax
	movl	%eax, -220(%ebp)
	fildl	-220(%ebp)
	fxch	%st(1)
	fucompp
	fnstsw	%ax
	sahf
	jb	L155
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	flds	48(%eax)
	movl	-188(%ebp), %eax
	movl	24(%eax), %eax
	movl	%eax, -220(%ebp)
	fildl	-220(%ebp)
	fucompp
	fnstsw	%ax
	sahf
	jb	L155
	movl	-188(%ebp), %eax
	movl	16(%eax), %eax
	jmp	L83
L155:
	movl	$160, (%esp)
	call	_malloc
	movl	%eax, -204(%ebp)
	movl	-204(%ebp), %eax
	movl	$0, (%eax)
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	44(%eax), %edx
	movl	-204(%ebp), %eax
	movl	%edx, 156(%eax)
	movl	-204(%ebp), %eax
	addl	$4, %eax
	movl	$1634890305, (%eax)
	movl	$1852383353, 4(%eax)
	movl	$544761188, 8(%eax)
	movl	$1847620457, 12(%eax)
	movl	$1981838447, 16(%eax)
	movl	$1684630625, 20(%eax)
	movw	$46, 24(%eax)
	movl	-204(%ebp), %eax
	leal	4(%eax), %edx
	movl	-204(%ebp), %eax
	movl	156(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC7, (%esp)
	call	_printf
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -76(%ebp)
	cmpl	$0, -76(%ebp)
	jne	L160
	movl	16(%ebp), %eax
	movl	-204(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L159
L161:
	movl	-76(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -76(%ebp)
L160:
	movl	-76(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L161
	movl	-76(%ebp), %eax
	movl	-204(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
L159:
	movl	$-1, %eax
	jmp	L83
L154:
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	$LC0, 4(%esp)
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L162
	movl	-188(%ebp), %eax
	movl	16(%eax), %eax
	jmp	L83
L162:
	movl	$160, (%esp)
	call	_malloc
	movl	%eax, -208(%ebp)
	movl	-208(%ebp), %eax
	movl	$0, (%eax)
	movl	8(%ebp), %eax
	movl	44(%eax), %edx
	movl	-208(%ebp), %eax
	movl	%edx, 156(%eax)
	movl	-208(%ebp), %eax
	addl	$4, %eax
	movl	$1852534357, (%eax)
	movl	$544110447, 4(%eax)
	movl	$1869771365, 8(%eax)
	movw	$114, 12(%eax)
	movl	-208(%ebp), %eax
	leal	4(%eax), %edx
	movl	-208(%ebp), %eax
	movl	156(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC7, (%esp)
	call	_printf
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -80(%ebp)
	cmpl	$0, -80(%ebp)
	jne	L165
	movl	16(%ebp), %eax
	movl	-208(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L164
L166:
	movl	-80(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -80(%ebp)
L165:
	movl	-80(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L166
	movl	-80(%ebp), %eax
	movl	-208(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
L164:
	movl	$-1, %eax
	jmp	L83
L106:
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	%eax, -112(%ebp)
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	72(%eax), %eax
	movl	%eax, -116(%ebp)
	movl	8(%ebp), %eax
	movl	$LC8, 4(%esp)
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	je	L167
	movl	8(%ebp), %eax
	movl	$LC9, 4(%esp)
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	je	L167
	movl	8(%ebp), %eax
	movl	$LC10, 4(%esp)
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	je	L167
	movl	8(%ebp), %eax
	movl	$LC11, 4(%esp)
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L168
L167:
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-112(%ebp), %eax
	movl	%eax, (%esp)
	call	_extractTypeOfExpression
	movl	%eax, -144(%ebp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-116(%ebp), %eax
	movl	%eax, (%esp)
	call	_extractTypeOfExpression
	movl	%eax, -148(%ebp)
	cmpl	$0, -144(%ebp)
	jne	L169
	cmpl	$0, -148(%ebp)
	je	L170
L169:
	cmpl	$1, -144(%ebp)
	jne	L171
	cmpl	$1, -148(%ebp)
	jne	L171
L170:
	movl	8(%ebp), %eax
	movl	-144(%ebp), %edx
	movl	%edx, 48(%eax)
	movl	-144(%ebp), %eax
	jmp	L83
L171:
	cmpl	$-1, -144(%ebp)
	je	L172
	cmpl	$-1, -148(%ebp)
	jne	L173
L172:
	movl	$-1, %eax
	jmp	L83
L173:
	movl	$160, (%esp)
	call	_malloc
	movl	%eax, -152(%ebp)
	movl	-152(%ebp), %eax
	movl	$0, (%eax)
	movl	8(%ebp), %eax
	movl	44(%eax), %edx
	movl	-152(%ebp), %eax
	movl	%edx, 156(%eax)
	movl	-152(%ebp), %eax
	addl	$4, %eax
	movl	$1835356960, (%eax)
	movl	$1769238113, 4(%eax)
	movl	$1917132899, 8(%eax)
	movl	$980578162, 12(%eax)
	movl	$1886999584, 16(%eax)
	movl	$1766662245, 20(%eax)
	movl	$1952542067, 24(%eax)
	movl	$1763731555, 28(%eax)
	movl	$1768693870, 32(%eax)
	movl	$1847616878, 36(%eax)
	movw	$8303, 40(%eax)
	movb	$0, 42(%eax)
	movl	-152(%ebp), %eax
	leal	4(%eax), %edx
	movl	-152(%ebp), %eax
	movl	156(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC7, (%esp)
	call	_printf
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -84(%ebp)
	cmpl	$0, -84(%ebp)
	jne	L176
	movl	16(%ebp), %eax
	movl	-152(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L175
L177:
	movl	-84(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -84(%ebp)
L176:
	movl	-84(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L177
	movl	-84(%ebp), %eax
	movl	-152(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
L175:
	movl	$-1, %eax
	jmp	L83
L168:
	movl	8(%ebp), %eax
	movl	$LC12, 4(%esp)
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	je	L178
	movl	8(%ebp), %eax
	movl	$LC13, 4(%esp)
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L179
L178:
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-112(%ebp), %eax
	movl	%eax, (%esp)
	call	_extractTypeOfExpression
	movl	%eax, -132(%ebp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-116(%ebp), %eax
	movl	%eax, (%esp)
	call	_extractTypeOfExpression
	movl	%eax, -136(%ebp)
	cmpl	$2, -132(%ebp)
	jne	L180
	cmpl	$2, -136(%ebp)
	jne	L180
	movl	8(%ebp), %eax
	movl	$2, 48(%eax)
	movl	$2, %eax
	jmp	L83
L180:
	cmpl	$-1, -132(%ebp)
	je	L181
	cmpl	$-1, -136(%ebp)
	jne	L182
L181:
	movl	$-1, %eax
	jmp	L83
L182:
	movl	$160, (%esp)
	call	_malloc
	movl	%eax, -140(%ebp)
	movl	-140(%ebp), %eax
	movl	$0, (%eax)
	movl	8(%ebp), %eax
	movl	44(%eax), %edx
	movl	-140(%ebp), %eax
	movl	%edx, 156(%eax)
	movl	-140(%ebp), %eax
	addl	$4, %eax
	movl	$1835356960, (%eax)
	movl	$1769238113, 4(%eax)
	movl	$1917132899, 8(%eax)
	movl	$980578162, 12(%eax)
	movl	$1886999584, 16(%eax)
	movl	$1766662245, 20(%eax)
	movl	$1952542067, 24(%eax)
	movl	$1763731555, 28(%eax)
	movl	$1768693870, 32(%eax)
	movl	$1847616878, 36(%eax)
	movw	$8303, 40(%eax)
	movb	$0, 42(%eax)
	movl	-140(%ebp), %eax
	leal	4(%eax), %edx
	movl	-140(%ebp), %eax
	movl	156(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC7, (%esp)
	call	_printf
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -88(%ebp)
	cmpl	$0, -88(%ebp)
	jne	L185
	movl	16(%ebp), %eax
	movl	-140(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L184
L186:
	movl	-88(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -88(%ebp)
L185:
	movl	-88(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L186
	movl	-88(%ebp), %eax
	movl	-140(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
L184:
	movl	$-1, %eax
	jmp	L83
L179:
	movl	8(%ebp), %eax
	movl	$LC14, 4(%esp)
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	je	L187
	movl	8(%ebp), %eax
	movl	$LC15, 4(%esp)
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	je	L187
	movl	8(%ebp), %eax
	movl	$LC16, 4(%esp)
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	je	L187
	movl	8(%ebp), %eax
	movl	$LC17, 4(%esp)
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	je	L187
	movl	8(%ebp), %eax
	movl	$LC18, 4(%esp)
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	je	L187
	movl	8(%ebp), %eax
	movl	$LC19, 4(%esp)
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L188
L187:
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-112(%ebp), %eax
	movl	%eax, (%esp)
	call	_extractTypeOfExpression
	movl	%eax, -120(%ebp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-116(%ebp), %eax
	movl	%eax, (%esp)
	call	_extractTypeOfExpression
	movl	%eax, -124(%ebp)
	cmpl	$0, -120(%ebp)
	jne	L189
	cmpl	$0, -124(%ebp)
	je	L190
L189:
	cmpl	$1, -120(%ebp)
	jne	L191
	cmpl	$1, -124(%ebp)
	jne	L191
L190:
	movl	8(%ebp), %eax
	movl	$2, 48(%eax)
	movl	$2, %eax
	jmp	L83
L191:
	cmpl	$-1, -120(%ebp)
	je	L192
	cmpl	$-1, -124(%ebp)
	jne	L193
L192:
	movl	$-1, %eax
	jmp	L83
L193:
	movl	$160, (%esp)
	call	_malloc
	movl	%eax, -128(%ebp)
	movl	-128(%ebp), %eax
	movl	$0, (%eax)
	movl	8(%ebp), %eax
	movl	44(%eax), %edx
	movl	-128(%ebp), %eax
	movl	%edx, 156(%eax)
	movl	-128(%ebp), %eax
	addl	$4, %eax
	movl	$1835356960, (%eax)
	movl	$1769238113, 4(%eax)
	movl	$1917132899, 8(%eax)
	movl	$980578162, 12(%eax)
	movl	$1886999584, 16(%eax)
	movl	$1766662245, 20(%eax)
	movl	$1952542067, 24(%eax)
	movl	$1763731555, 28(%eax)
	movl	$1768693870, 32(%eax)
	movl	$1847616878, 36(%eax)
	movw	$8303, 40(%eax)
	movb	$0, 42(%eax)
	movl	-128(%ebp), %eax
	leal	4(%eax), %edx
	movl	-128(%ebp), %eax
	movl	156(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC7, (%esp)
	call	_printf
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -92(%ebp)
	cmpl	$0, -92(%ebp)
	jne	L196
	movl	16(%ebp), %eax
	movl	-128(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L195
L197:
	movl	-92(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -92(%ebp)
L196:
	movl	-92(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L197
	movl	-92(%ebp), %eax
	movl	-128(%ebp), %edx
	movl	%edx, (%eax)
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, 4(%eax)
L195:
	movl	$-1, %eax
	jmp	L83
L188:
L83:
	addl	$252, %esp
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
LFE20:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_malloc;	.scl	2;	.type	32;	.endef
	.def	_refreshBuffer;	.scl	2;	.type	32;	.endef
	.def	_strcpy;	.scl	2;	.type	32;	.endef
	.def	_strcmp;	.scl	2;	.type	32;	.endef
	.def	_lookupString;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
