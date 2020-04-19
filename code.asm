
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
	newline_char : db "",10,0
	runTimeErrorMsg : db "RUN TIME ERROR: Array Index out of bound",10,0
section .bss
	int1 : resd 1
section .text
	global main
	extern scanf
	extern printf

main:
	sub rsp, 43
	mov rbp, rsp

;-------code for scanning integer array-------
	push rbp
	mov rdi, Input_Array1
	mov rsi, 5
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
	mov rsi, 6
	mov rdx, 10
	xor rax, rax
	call printf
	pop rbp

;-----inputting A[6]----
	push rbp
	mov rdi, Input_Format
	lea rsi, [int1]
	xor rax, rax
	call scanf
	pop rbp
	mov ax, WORD[int1]
	mov WORD[rbp + 5], ax

;-----inputting A[7]----
	push rbp
	mov rdi, Input_Format
	lea rsi, [int1]
	xor rax, rax
	call scanf
	pop rbp
	mov ax, WORD[int1]
	mov WORD[rbp + 7], ax

;-----inputting A[8]----
	push rbp
	mov rdi, Input_Format
	lea rsi, [int1]
	xor rax, rax
	call scanf
	pop rbp
	mov ax, WORD[int1]
	mov WORD[rbp + 9], ax

;-----inputting A[9]----
	push rbp
	mov rdi, Input_Format
	lea rsi, [int1]
	xor rax, rax
	call scanf
	pop rbp
	mov ax, WORD[int1]
	mov WORD[rbp + 11], ax

;-----inputting A[10]----
	push rbp
	mov rdi, Input_Format
	lea rsi, [int1]
	xor rax, rax
	call scanf
	pop rbp
	mov ax, WORD[int1]
	mov WORD[rbp + 13], ax

;-------code for scanning integer array-------
	push rbp
	mov rdi, Input_Array1
	mov rsi, 5
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
	mov rsi, 6
	mov rdx, 10
	xor rax, rax
	call printf
	pop rbp

;-----inputting B[6]----
	push rbp
	mov rdi, Input_Format
	lea rsi, [int1]
	xor rax, rax
	call scanf
	pop rbp
	mov ax, WORD[int1]
	mov WORD[rbp + 16], ax

;-----inputting B[7]----
	push rbp
	mov rdi, Input_Format
	lea rsi, [int1]
	xor rax, rax
	call scanf
	pop rbp
	mov ax, WORD[int1]
	mov WORD[rbp + 18], ax

;-----inputting B[8]----
	push rbp
	mov rdi, Input_Format
	lea rsi, [int1]
	xor rax, rax
	call scanf
	pop rbp
	mov ax, WORD[int1]
	mov WORD[rbp + 20], ax

;-----inputting B[9]----
	push rbp
	mov rdi, Input_Format
	lea rsi, [int1]
	xor rax, rax
	call scanf
	pop rbp
	mov ax, WORD[int1]
	mov WORD[rbp + 22], ax

;-----inputting B[10]----
	push rbp
	mov rdi, Input_Format
	lea rsi, [int1]
	xor rax, rax
	call scanf
	pop rbp
	mov ax, WORD[int1]
	mov WORD[rbp + 24], ax
;---------------Code for ForLoop-------------------
	mov WORD[rbp + 0], 6
forLoopEntry0:
	mov ax, WORD[rbp + 0]
	cmp ax, 11
	je forLoopExit0
;-------assignment stmt-----
	push rax

;------Processing integer expression-----

;-------Processing arrayIdNode(array element)-------

;----code for dynamic bound checking of static array element A[m]----
	mov ax, WORD[rbp+0]
	cmp ax, 6
	jl runTimeError
	cmp ax, 10
	jg runTimeError
;----index is within bounds---
	mov cx,4
	and rcx,000000000000FFFFh
	add cx,1
	and rax,000000000000FFFFh
	sub ax,6
	mov bx,2
	mul bx
	add rcx,rax
	mov ax,WORD[rbp+rcx]
	mov WORD[rbp+37], ax
;------array element fetched and stored in TI1------

	mov ax, WORD[rbp+37];	left operand is TI1
	push rax

;-------Processing arrayIdNode(array element)-------

;----code for dynamic bound checking of static array element B[m]----
	mov ax, WORD[rbp+0]
	cmp ax, 6
	jl runTimeError
	cmp ax, 10
	jg runTimeError
;----index is within bounds---
	mov cx,15
	and rcx,000000000000FFFFh
	add cx,1
	and rax,000000000000FFFFh
	sub ax,6
	mov bx,2
	mul bx
	add rcx,rax
	mov ax,WORD[rbp+rcx]
	mov WORD[rbp+39], ax
;------array element fetched and stored in TI2------

	mov bx, WORD[rbp+39];	left operand is TI2
	pop rax
	add ax,bx
	mov WORD[rbp+41], ax
;------expression computed. result is in TI3------

;-----expression processed, result is stored inside temp number 3 of type 0
	mov ax, WORD[rbp+41]
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

;-------assignment stmt-----
	push rax
	mov ax, WORD[rbp+2]

;----code for dynamic bound checking of static array element C[m]----
	push rax	;saving rhs result (rax)
	mov ax, WORD[rbp+0]
	cmp ax, 6
	jl runTimeError
	cmp ax, 10
	jg runTimeError
;----index is within bounds----
	mov cx,26
	and rcx,000000000000FFFFh
	add cx,1
	and rax,000000000000FFFFh
	sub ax,6
	mov bx,2
	mul bx
	add rcx,rax
	pop rax	;restoring rhs result into rax
	mov WORD[rbp+rcx], ax	;performing the assignment to C[m]
	pop rax
;--------------
	mov ax, WORD[rbp + 0]
	inc ax
	mov WORD[rbp + 0], ax
	jmp forLoopEntry0
forLoopExit0:

;-------code for printing static array---------
	push rbp
	mov rdi, output_array
	xor rax, rax
	call printf
	pop rbp
;------------
;----printing C[6]---
	push rbp
	mov ax, WORD[rbp + 27]
	mov rdi, array_value
	movsx rsi, ax
	xor rax, rax
	call printf
	pop rbp
;------------
;----printing C[7]---
	push rbp
	mov ax, WORD[rbp + 29]
	mov rdi, array_value
	movsx rsi, ax
	xor rax, rax
	call printf
	pop rbp
;------------
;----printing C[8]---
	push rbp
	mov ax, WORD[rbp + 31]
	mov rdi, array_value
	movsx rsi, ax
	xor rax, rax
	call printf
	pop rbp
;------------
;----printing C[9]---
	push rbp
	mov ax, WORD[rbp + 33]
	mov rdi, array_value
	movsx rsi, ax
	xor rax, rax
	call printf
	pop rbp
;------------
;----printing C[10]---
	push rbp
	mov ax, WORD[rbp + 35]
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

;---runtime error (array index out of bounds)----
runTimeError: 
	push rbp
	mov rdi, runTimeErrorMsg
	xor rax,rax
	call printf
	pop rbp
	mov rax, 1
	int 80h
