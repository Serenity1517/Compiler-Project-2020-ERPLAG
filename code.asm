
section .data
	inputInt: db "Input: Enter an integer value",10,0
	output: db "Output: %d", 10, 0
	Input_Format : db "%d",0
	Input_Array1 : db "Input: Enter %d elements of", 0
	onScreenInt : db "integer", 0
	onScreenBool : db "boolean", 0
	onScreenReal : db "real", 0
	Input_Array2 : db " for range %d to %d", 10, 0
	trueOutput db "Output: true",10,0
	falseOutput db "Output: false",10,0
	lenFalseOutput equ 6
section .bss
	int1 : resd 1
section .text
	global main
	extern scanf
	extern printf

main:
	sub rsp, 40
	mov rbp, rsp

;-------assignment stmt-----
	push rax
	mov al, 1
	mov BYTE[rbp+12], al
	pop rax
;--------------

;-------assignment stmt-----
	push rax
	mov ax, 5
	mov WORD[rbp+6], ax
	pop rax
;--------------

;-------assignment stmt-----
	push rax
	mov ax, 9
	mov WORD[rbp+8], ax
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
	mov bx, WORD[rbp+8];	right operand is b
	pop rax
	mul bx
	mov WORD[rbp+16], ax
;------expression computed. result is in TI1------
	mov bx, WORD[rbp+16];	right operand is TI1
	pop rax
	add ax,bx
	mov WORD[rbp+18], ax
;------expression computed. result is in TI2------

	mov ax, WORD[rbp+18];	left operand is TI2
	push rax

;------Processing integer expression-----

;------Processing integer expression-----

	mov ax, WORD[rbp+6];	left operand is a
	push rax
	mov bx, WORD[rbp+8];	right operand is b
	pop rax
	sub ax,bx
	mov WORD[rbp+20], ax
;------expression computed. result is in TI3------

	mov ax, WORD[rbp+20];	left operand is TI3
	push rax
	mov bx, WORD[rbp+2];	right operand is y
	pop rax
	mul bx
	mov WORD[rbp+22], ax
;------expression computed. result is in TI4------
	mov bx, WORD[rbp+22];	right operand is TI4
	pop rax
	add ax,bx
	mov WORD[rbp+24], ax
;------expression computed. result is in TI5------

	mov ax, WORD[rbp+24];	left operand is TI5
	push rax

;------Processing integer expression-----

	mov ax, WORD[rbp+6];	left operand is a
	push rax
	mov bx, 2
	pop rax
	mul bx
	mov WORD[rbp+26], ax
;------expression computed. result is in TI6------
	mov bx, WORD[rbp+26];	right operand is TI6
	pop rax
	add ax,bx
	mov WORD[rbp+28], ax
;------expression computed. result is in TI7------

	mov ax, WORD[rbp+28];	left operand is TI7
	push rax

;------Processing integer expression-----

	mov ax, WORD[rbp+8];	left operand is b
	push rax
	mov bx, WORD[rbp+0];	right operand is x
	pop rax
	mul bx
	mov WORD[rbp+30], ax
;------expression computed. result is in TI8------
	mov bx, WORD[rbp+30];	right operand is TI8
	pop rax
	sub ax,bx
	mov WORD[rbp+32], ax
;------expression computed. result is in TI9------

;-----expression processed, result is stored inside temp number 9 of type 0
	mov ax, WORD[rbp+32]
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
	mov BYTE[rbp+34], al
;------expression computed. result is in TB1------

	mov al, BYTE[rbp+34];	left operand is TB1
	push rax

;------Processing boolean expression-----

	mov ax, WORD[rbp+6];	left operand is a
	push rax

	mov bx, WORD[rbp+8];	left operand is b
	pop rax
	cmp ax,bx
	jle lessereq1
	mov al,0
	jmp notlessereq1
lessereq1:
	mov al,1
notlessereq1:
	mov BYTE[rbp+35], al
;------expression computed. result is in TB2------

	mov bl, BYTE[rbp+35];	right operand is TB2
	pop rax
	or al, bl
	mov BYTE[rbp+36], al
;------expression computed. result is in TB3------

	mov al, BYTE[rbp+36];	left operand is TB3
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
	mov BYTE[rbp+37], al
;------expression computed. result is in TB4------

	mov bl, BYTE[rbp+37];	right operand is TB4
	pop rax
	and al, bl
	mov BYTE[rbp+38], al
;------expression computed. result is in TB5------

	mov al, BYTE[rbp+38];	left operand is TB5
	push rax

	mov bl, BYTE[rbp+12];	left operand is u
	pop rax
	and al, bl
	mov BYTE[rbp+39], al
;------expression computed. result is in TB6------

;-----expression processed, result is stored inside temp number 6 of type 2
	mov al, BYTE[rbp+39]
	mov BYTE[rbp+14], al
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
	mov al, BYTE[rbp + 12]
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


	mov rax, 1
	int 80h
