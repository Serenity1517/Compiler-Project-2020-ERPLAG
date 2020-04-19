
section .data
	inputInt: db "Input: Enter an integer value",10,0
	inputBool: db "Input: Enter an boolean value",10,0
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
	bool1 : resd 1
section .text
	global main
	extern scanf
	extern printf

main:
	sub rsp, 15
	mov rbp, rsp

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

;-------assignment stmt-----
	push rax
	mov ax, 19
	mov WORD[rbp+2], ax
	pop rax
;--------------

;-------assignment stmt-----
	push rax
	mov ax, 56
	mov WORD[rbp+4], ax
	pop rax
;--------------
;---------Code for Switch-Case Statements----------
	mov ax, WORD[rbp + 0]
	mov dx, 1
	cmp ax, dx
	jne nextCase0:

;-------assignment stmt-----
	push rax

;------Processing integer expression-----

;------Processing integer expression-----

	mov ax, WORD[rbp+0];	left operand is x
	push rax
	mov bx, 2
	pop rax
	mul bx
	mov WORD[rbp+6], ax
;------expression computed. result is in TI1------

	mov ax, WORD[rbp+6];	left operand is TI1
	push rax
	mov bx, WORD[rbp+2];	right operand is y
	pop rax
	sub ax,bx
	mov WORD[rbp+8], ax
;------expression computed. result is in TI2------

;-----expression processed, result is stored inside temp number 2 of type 0
	mov ax, WORD[rbp+8]
	mov WORD[rbp+2], ax
	pop rax
;--------------
	jmp endSwitchCase0:
	nextCase0:
	mov dx, 2
	cmp ax, dx
	jne nextCase1:

;-------assignment stmt-----
	push rax

;------Processing integer expression-----

;------Processing integer expression-----

	mov ax, WORD[rbp+0];	left operand is x
	push rax
	mov bx, 3
	pop rax
	mul bx
	mov WORD[rbp+6], ax
;------expression computed. result is in TI1------

	mov ax, WORD[rbp+6];	left operand is TI1
	push rax
	mov bx, WORD[rbp+4];	right operand is z
	pop rax
	sub ax,bx
	mov WORD[rbp+8], ax
;------expression computed. result is in TI2------

;-----expression processed, result is stored inside temp number 2 of type 0
	mov ax, WORD[rbp+8]
	mov WORD[rbp+4], ax
	pop rax
;--------------
	jmp endSwitchCase0:
	nextCase1:

;------code for printing integer variable-----
	push rbp
	mov ax, WORD[rbp + 0]
	mov rdi, output
	movsx rsi, ax
	xor rax, rax
	call printf
	pop rbp
;------------
	endSwitchCase0:

;------code for printing integer variable-----
	push rbp
	mov ax, WORD[rbp + 2]
	mov rdi, output
	movsx rsi, ax
	xor rax, rax
	call printf
	pop rbp
;------------

;------code for printing integer variable-----
	push rbp
	mov ax, WORD[rbp + 4]
	mov rdi, output
	movsx rsi, ax
	xor rax, rax
	call printf
	pop rbp
;------------


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
