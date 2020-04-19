
section .data
	inputInt: db "Input: Enter an integer value",10,0
	output: db "Output: %d", 10, 0
output_array : db "Output: ",0
array_value : db " %d",0
	Input_Format : db "%d",0
	Input_Array1 : db "Input: Enter %d elements of ", 0
	onScreenInt : db "integer", 0
	onScreenBool : db "boolean", 0
	onScreenReal : db "real", 0
	Input_Array2 : db " for range %d to %d", 10, 0
	trueOutput : db "Output: true",10,0
	falseOutput : db "Output: false",10,0
	newline_char db "",10,0

section .bss
	int1 : resd 1
section .text
	global main
	extern scanf
	extern printf

main:
	sub rsp, 59
	mov rbp, rsp

;-------assignment stmt-----
	push rax
	mov al, 1
	mov BYTE[rbp+14], al
	pop rax
;--------------

;-------assignment stmt-----
	push rax
	mov ax, 5
	mov WORD[rbp+8], ax
	pop rax
;--------------

;-------assignment stmt-----
	push rax
	mov ax, 9
	mov WORD[rbp+10], ax
	pop rax
;--------------

;-----code for scanning integer variable----
	push rbp
	mov rdi, inputInt
	xor rax, rax
	call printf
	pop rbp
	push rbp
	mov rdi, Input_Format
	lea rsi,[int1]
	xor rax,rax
	call scanf
	pop rbp
	mov ax, WORD[int1]
	mov WORD[rbp+0],ax
;-----------

;-----code for scanning integer variable----
	push rbp
	mov rdi, inputInt
	xor rax, rax
	call printf
	pop rbp
	push rbp
	mov rdi, Input_Format
	lea rsi,[int1]
	xor rax,rax
	call scanf
	pop rbp
	mov ax, WORD[int1]
	mov WORD[rbp+2],ax
;-----------

;-------assignment stmt-----
	push rax

;------Processing integer expression-----

;------Processing integer expression-----

;------Processing integer expression-----

;------Processing integer expression-----

	mov ax, WORD[rbp+0];	left operand is x
	push rax

;------Processing integer expression-----

	mov ax, WORD[rbp+2];	left operand is y
	push rax
	mov bx, WORD[rbp+10];	right operand is b
	pop rax
	mul bx
	mov WORD[rbp+35], ax
;------expression computed. result is in TI1------
	mov bx, WORD[rbp+35];	right operand is TI1
	pop rax
	add ax,bx
	mov WORD[rbp+37], ax
;------expression computed. result is in TI2------

	mov ax, WORD[rbp+37];	left operand is TI2
	push rax

;------Processing integer expression-----

;------Processing integer expression-----

	mov ax, WORD[rbp+8];	left operand is a
	push rax
	mov bx, WORD[rbp+10];	right operand is b
	pop rax
	sub ax,bx
	mov WORD[rbp+39], ax
;------expression computed. result is in TI3------

	mov ax, WORD[rbp+39];	left operand is TI3
	push rax
	mov bx, WORD[rbp+2];	right operand is y
	pop rax
	mul bx
	mov WORD[rbp+41], ax
;------expression computed. result is in TI4------
	mov bx, WORD[rbp+41];	right operand is TI4
	pop rax
	add ax,bx
	mov WORD[rbp+43], ax
;------expression computed. result is in TI5------

	mov ax, WORD[rbp+43];	left operand is TI5
	push rax

;------Processing integer expression-----

	mov ax, WORD[rbp+8];	left operand is a
	push rax
	mov bx, 2
	pop rax
	mul bx
	mov WORD[rbp+45], ax
;------expression computed. result is in TI6------
	mov bx, WORD[rbp+45];	right operand is TI6
	pop rax
	add ax,bx
	mov WORD[rbp+47], ax
;------expression computed. result is in TI7------

	mov ax, WORD[rbp+47];	left operand is TI7
	push rax

;------Processing integer expression-----

	mov ax, WORD[rbp+10];	left operand is b
	push rax
	mov bx, WORD[rbp+0];	right operand is x
	pop rax
	mul bx
	mov WORD[rbp+49], ax
;------expression computed. result is in TI8------
	mov bx, WORD[rbp+49];	right operand is TI8
	pop rax
	sub ax,bx
	mov WORD[rbp+51], ax
;------expression computed. result is in TI9------

;-----expression processed, result is stored inside temp number 9 of type 0
	mov ax, WORD[rbp+51]
	mov WORD[rbp+4], ax
	pop rax
;--------------

;------code for printing integer variable-----
	push rbp
	mov ax, WORD[rbp + 4]
	mov rdi, output
	movsx rsi, ax
	xor rax, rax
	call printf
	pop rbp
;------------
;---------------Code for ForLoop-------------------
	mov WORD[rbp + 6], 10
forLoopEntry0:
	mov ax, WORD[rbp + 6]
	cmp ax, 16
	je forLoopExit0
;-------assignment stmt-----
	push rax
	mov ax, 7
	mov WORD[rbp+31], ax
	pop rax
;--------------

;-----code for scanning integer variable----
	push rbp
	mov rdi, inputInt
	xor rax, rax
	call printf
	pop rbp
	push rbp
	mov rdi, Input_Format
	lea rsi,[int1]
	xor rax,rax
	call scanf
	pop rbp
	mov ax, WORD[int1]
	mov WORD[rbp+33],ax
;-----------

;-------assignment stmt-----
	push rax

;------Processing integer expression-----

	mov ax, WORD[rbp+31];	left operand is a
	push rax
	mov bx, WORD[rbp+33];	right operand is b
	pop rax
	add ax,bx
	mov WORD[rbp+35], ax
;------expression computed. result is in TI1------

;-----expression processed, result is stored inside temp number 1 of type 0
	mov ax, WORD[rbp+35]
	mov WORD[rbp+31], ax
	pop rax
;--------------

;------code for printing integer variable-----
	push rbp
	mov ax, WORD[rbp + 31]
	mov rdi, output
	movsx rsi, ax
	xor rax, rax
	call printf
	pop rbp
;------------

;-------assignment stmt-----
	push rax

;------Processing integer expression-----

;------Processing integer expression-----

	mov ax, WORD[rbp+4];	left operand is z
	push rax
	mov bx, WORD[rbp+6];	right operand is k
	pop rax
	add ax,bx
	mov WORD[rbp+35], ax
;------expression computed. result is in TI1------

	mov ax, WORD[rbp+35];	left operand is TI1
	push rax

;------Processing integer expression-----

	mov ax, WORD[rbp+31];	left operand is a
	push rax
	mov bx, 2
	pop rax
	mul bx
	mov WORD[rbp+37], ax
;------expression computed. result is in TI2------
	mov bx, WORD[rbp+37];	right operand is TI2
	pop rax
	add ax,bx
	mov WORD[rbp+39], ax
;------expression computed. result is in TI3------

;-----expression processed, result is stored inside temp number 3 of type 0
	mov ax, WORD[rbp+39]
	mov WORD[rbp+4], ax
	pop rax
;--------------

;------code for printing integer variable-----
	push rbp
	mov ax, WORD[rbp + 4]
	mov rdi, output
	movsx rsi, ax
	xor rax, rax
	call printf
	pop rbp
;------------
	mov ax, WORD[rbp + 6]
	inc ax
	mov [rbp + 6], ax
	jmp forLoopEntry0
forLoopExit0:

;-------assignment stmt-----
	push rax

;------Processing integer expression-----

;------Processing integer expression-----

;------Processing integer expression-----

;------Processing integer expression-----

	mov ax, WORD[rbp+0];	left operand is x
	push rax

;------Processing integer expression-----

	mov ax, WORD[rbp+2];	left operand is y
	push rax
	mov bx, WORD[rbp+10];	right operand is b
	pop rax
	mul bx
	mov WORD[rbp+35], ax
;------expression computed. result is in TI1------
	mov bx, WORD[rbp+35];	right operand is TI1
	pop rax
	add ax,bx
	mov WORD[rbp+37], ax
;------expression computed. result is in TI2------

	mov ax, WORD[rbp+37];	left operand is TI2
	push rax

;------Processing integer expression-----

;------Processing integer expression-----

	mov ax, WORD[rbp+8];	left operand is a
	push rax
	mov bx, WORD[rbp+10];	right operand is b
	pop rax
	sub ax,bx
	mov WORD[rbp+39], ax
;------expression computed. result is in TI3------

	mov ax, WORD[rbp+39];	left operand is TI3
	push rax
	mov bx, WORD[rbp+2];	right operand is y
	pop rax
	mul bx
	mov WORD[rbp+41], ax
;------expression computed. result is in TI4------
	mov bx, WORD[rbp+41];	right operand is TI4
	pop rax
	add ax,bx
	mov WORD[rbp+43], ax
;------expression computed. result is in TI5------

	mov ax, WORD[rbp+43];	left operand is TI5
	push rax

;------Processing integer expression-----

	mov ax, WORD[rbp+8];	left operand is a
	push rax
	mov bx, 2
	pop rax
	mul bx
	mov WORD[rbp+45], ax
;------expression computed. result is in TI6------
	mov bx, WORD[rbp+45];	right operand is TI6
	pop rax
	add ax,bx
	mov WORD[rbp+47], ax
;------expression computed. result is in TI7------

	mov ax, WORD[rbp+47];	left operand is TI7
	push rax

;------Processing integer expression-----

	mov ax, WORD[rbp+10];	left operand is b
	push rax
	mov bx, WORD[rbp+0];	right operand is x
	pop rax
	mul bx
	mov WORD[rbp+49], ax
;------expression computed. result is in TI8------
	mov bx, WORD[rbp+49];	right operand is TI8
	pop rax
	sub ax,bx
	mov WORD[rbp+51], ax
;------expression computed. result is in TI9------

;-----expression processed, result is stored inside temp number 9 of type 0
	mov ax, WORD[rbp+51]
	mov WORD[rbp+4], ax
	pop rax
;--------------

;-------assignment stmt-----
	push rax

;------Processing boolean expression-----

;------Processing boolean expression-----

;------Processing boolean expression-----

;------Processing boolean expression-----

	mov ax, WORD[rbp+4];	left operand is z
	push rax

	mov bx, 10
	pop rax
	cmp ax,bx
	jg greater0
	mov al,0
	jmp notgreater0
greater0:
	mov al,1
notgreater0:
	mov BYTE[rbp+53], al
;------expression computed. result is in TB1------

	mov al, BYTE[rbp+53];	left operand is TB1
	push rax

;------Processing boolean expression-----

	mov ax, WORD[rbp+8];	left operand is a
	push rax

	mov bx, WORD[rbp+10];	left operand is b
	pop rax
	cmp ax,bx
	jle lessereq1
	mov al,0
	jmp notlessereq1
lessereq1:
	mov al,1
notlessereq1:
	mov BYTE[rbp+54], al
;------expression computed. result is in TB2------

	mov bl, BYTE[rbp+54];	right operand is TB2
	pop rax
	or al, bl
	mov BYTE[rbp+55], al
;------expression computed. result is in TB3------

	mov al, BYTE[rbp+55];	left operand is TB3
	push rax

;------Processing boolean expression-----

	mov ax, WORD[rbp+0];	left operand is x
	push rax

	mov bx, WORD[rbp+2];	left operand is y
	pop rax
	cmp ax,bx
	jl lesser2
	mov al,0
	jmp notlesser2
lesser2:
	mov al,1
notlesser2:
	mov BYTE[rbp+56], al
;------expression computed. result is in TB4------

	mov bl, BYTE[rbp+56];	right operand is TB4
	pop rax
	and al, bl
	mov BYTE[rbp+57], al
;------expression computed. result is in TB5------

	mov al, BYTE[rbp+57];	left operand is TB5
	push rax

	mov bl, BYTE[rbp+14];	left operand is u
	pop rax
	and al, bl
	mov BYTE[rbp+58], al
;------expression computed. result is in TB6------

;-----expression processed, result is stored inside temp number 6 of type 2
	mov al, BYTE[rbp+58]
	mov BYTE[rbp+16], al
	pop rax
;--------------

;------code for printing integer variable-----
	push rbp
	mov ax, WORD[rbp + 4]
	mov rdi, output
	movsx rsi, ax
	xor rax, rax
	call printf
	pop rbp
;------------

;------code for printing Boolean variable-----
	mov al, BYTE[rbp + 14]
	cmp al, 1
	jne zero3
	push rbp
	mov rdi, trueOutput
	xor rax, rax
	call printf
	pop rbp
	jmp empty4
	zero3:
	push rbp
	mov rdi, falseOutput
		xor rax, rax
		call printf
	pop rbp
	empty4:

;-------code for scanning integer array-------
	push rbp
	mov rdi, Input_Array1
	mov rsi, 6
	xor rax, rax
	call printf
	pop rbp
	push rbp
	mov rdi, onScreenInt
	xor rax, rax
	call printf
	pop rbp
	push rbp
	mov rdi, Input_Array2
	mov rsi, 10
	mov rdx, 15
	xor rax, rax
	call printf
	pop rbp

;-----inputting A[10]----
	push rbp
	mov rdi, Input_Format
	lea rsi, [int1]
	xor rax, rax
	call scanf
	pop rbp
	mov ax, WORD[int1]
	mov WORD[rbp + 19], ax

;-----inputting A[11]----
	push rbp
	mov rdi, Input_Format
	lea rsi, [int1]
	xor rax, rax
	call scanf
	pop rbp
	mov ax, WORD[int1]
	mov WORD[rbp + 21], ax

;-----inputting A[12]----
	push rbp
	mov rdi, Input_Format
	lea rsi, [int1]
	xor rax, rax
	call scanf
	pop rbp
	mov ax, WORD[int1]
	mov WORD[rbp + 23], ax

;-----inputting A[13]----
	push rbp
	mov rdi, Input_Format
	lea rsi, [int1]
	xor rax, rax
	call scanf
	pop rbp
	mov ax, WORD[int1]
	mov WORD[rbp + 25], ax

;-----inputting A[14]----
	push rbp
	mov rdi, Input_Format
	lea rsi, [int1]
	xor rax, rax
	call scanf
	pop rbp
	mov ax, WORD[int1]
	mov WORD[rbp + 27], ax

;-----inputting A[15]----
	push rbp
	mov rdi, Input_Format
	lea rsi, [int1]
	xor rax, rax
	call scanf
	pop rbp
	mov ax, WORD[int1]
	mov WORD[rbp + 29], ax

;-------assignment stmt-----
	push rax

;------Processing integer expression-----

;------Processing integer expression-----

;------Processing integer expression-----

;------Processing integer expression-----

	mov ax, WORD[rbp+8];	left operand is a
	push rax
	mov bx, WORD[rbp+0];	right operand is x
	pop rax
	add ax,bx
	mov WORD[rbp+35], ax
;------expression computed. result is in TI1------

	mov ax, WORD[rbp+35];	left operand is TI1
	push rax

;------Processing integer expression-----

;-------Processing arrayIdNode(array element)-------
	mov ax, WORD[rbp+25]
	mov WORD[rbp+37], ax
;------expression computed. result is in TI2------

	mov ax, WORD[rbp+37];	left operand is TI2
	push rax
	mov bx, 2
	pop rax
	mul bx
	mov WORD[rbp+39], ax
;------expression computed. result is in TI3------
	mov bx, WORD[rbp+39];	right operand is TI3
	pop rax
	add ax,bx
	mov WORD[rbp+41], ax
;------expression computed. result is in TI4------

	mov ax, WORD[rbp+41];	left operand is TI4
	push rax

;------Processing integer expression-----

;-------Processing arrayIdNode(array element)-------
	mov ax, WORD[rbp+27]
	mov WORD[rbp+43], ax
;------expression computed. result is in TI5------

	mov ax, WORD[rbp+43];	left operand is TI5
	push rax
	mov bx, 3
	pop rax
	mul bx
	mov WORD[rbp+45], ax
;------expression computed. result is in TI6------
	mov bx, WORD[rbp+45];	right operand is TI6
	pop rax
	add ax,bx
	mov WORD[rbp+47], ax
;------expression computed. result is in TI7------

	mov ax, WORD[rbp+47];	left operand is TI7
	push rax

;-------Processing arrayIdNode(array element)-------
	mov ax, WORD[rbp+29]
	mov WORD[rbp+49], ax
;------expression computed. result is in TI8------

	mov bx, WORD[rbp+49];	left operand is TI8
	pop rax
	add ax,bx
	mov WORD[rbp+51], ax
;------expression computed. result is in TI9------

;-----expression processed, result is stored inside temp number 9 of type 0
	mov ax, WORD[rbp+51]
	mov WORD[rbp+2], ax
	pop rax
;--------------

;------code for printing integer variable-----
	push rbp
	mov ax, WORD[rbp + 2]
	mov rdi, output
	movsx rsi, ax
	xor rax, rax
	call printf
	pop rbp
;------------

;-------code for printing static array---------
	push rbp
	mov rdi, output_array
	xor rax, rax
	call printf
	pop rbp
;------------
;----printing A[10]---
	push rbp
	mov ax, WORD[rbp + 19]
	mov rdi, array_value
	movsx rsi, ax
	xor rax, rax
	call printf
	pop rbp
;------------
;----printing A[11]---
	push rbp
	mov ax, WORD[rbp + 21]
	mov rdi, array_value
	movsx rsi, ax
	xor rax, rax
	call printf
	pop rbp
;------------
;----printing A[12]---
	push rbp
	mov ax, WORD[rbp + 23]
	mov rdi, array_value
	movsx rsi, ax
	xor rax, rax
	call printf
	pop rbp
;------------
;----printing A[13]---
	push rbp
	mov ax, WORD[rbp + 25]
	mov rdi, array_value
	movsx rsi, ax
	xor rax, rax
	call printf
	pop rbp
;------------
;----printing A[14]---
	push rbp
	mov ax, WORD[rbp + 27]
	mov rdi, array_value
	movsx rsi, ax
	xor rax, rax
	call printf
	pop rbp
;------------
;----printing A[15]---
	push rbp
	mov ax, WORD[rbp + 29]
	mov rdi, array_value
	movsx rsi, ax
	xor rax, rax
	call printf
	pop rbp
;------------
;----printing newline character---
	push rbp
	mov rdi, newline_char
	xor rax,rax
	call printf
	pop rbx


	mov rax, 1
	int 80h
