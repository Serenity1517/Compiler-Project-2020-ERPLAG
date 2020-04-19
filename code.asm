
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
	bool_true : db "true ", 0
	bool_false : db "false ", 0
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
<<<<<<< HEAD
	sub rsp, 49
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

=======
	sub rsp, 15
	mov rbp, rsp

>>>>>>> 1e4466d2c9fe880aecd5e3ef7770a09c40f205f3
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
<<<<<<< HEAD

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
	mov WORD[rbp+21], ax
;------expression computed. result is in TI1------
	mov bx, WORD[rbp+21];	right operand is TI1
	pop rax
	add ax,bx
	mov WORD[rbp+23], ax
;------expression computed. result is in TI2------

	mov ax, WORD[rbp+23];	left operand is TI2
	push rax

;------Processing integer expression-----

;------Processing integer expression-----

	mov ax, WORD[rbp+6];	left operand is a
	push rax
	mov bx, WORD[rbp+8];	right operand is b
	pop rax
	sub ax,bx
	mov WORD[rbp+25], ax
;------expression computed. result is in TI3------

	mov ax, WORD[rbp+25];	left operand is TI3
	push rax
	mov bx, WORD[rbp+2];	right operand is y
	pop rax
	mul bx
	mov WORD[rbp+27], ax
;------expression computed. result is in TI4------
	mov bx, WORD[rbp+27];	right operand is TI4
	pop rax
	add ax,bx
	mov WORD[rbp+29], ax
;------expression computed. result is in TI5------
=======
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
>>>>>>> 1e4466d2c9fe880aecd5e3ef7770a09c40f205f3

	mov ax, WORD[rbp+29];	left operand is TI5
	push rax

;------Processing integer expression-----

<<<<<<< HEAD
	mov ax, WORD[rbp+6];	left operand is a
	push rax
	mov bx, 2
	pop rax
	mul bx
	mov WORD[rbp+31], ax
;------expression computed. result is in TI6------
	mov bx, WORD[rbp+31];	right operand is TI6
	pop rax
	add ax,bx
	mov WORD[rbp+33], ax
;------expression computed. result is in TI7------

	mov ax, WORD[rbp+33];	left operand is TI7
	push rax

;------Processing integer expression-----

	mov ax, WORD[rbp+8];	left operand is b
	push rax
	mov bx, WORD[rbp+0];	right operand is x
	pop rax
	mul bx
	mov WORD[rbp+35], ax
;------expression computed. result is in TI8------
	mov bx, WORD[rbp+35];	right operand is TI8
	pop rax
	sub ax,bx
	mov WORD[rbp+37], ax
;------expression computed. result is in TI9------

;-----expression processed, result is stored inside temp number 9 of type 0
	mov ax, WORD[rbp+37]
	mov WORD[rbp+4], ax
=======
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
>>>>>>> 1e4466d2c9fe880aecd5e3ef7770a09c40f205f3
	pop rax
;--------------
	jmp endSwitchCase0:
	nextCase0:
	mov dx, 2
	cmp ax, dx
	jne nextCase1:

;-------assignment stmt-----
	push rax

;------Processing boolean expression-----

<<<<<<< HEAD
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
	mov BYTE[rbp+39], al
;------expression computed. result is in TB1------

	mov al, BYTE[rbp+39];	left operand is TB1
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
	mov BYTE[rbp+40], al
;------expression computed. result is in TB2------

	mov bl, BYTE[rbp+40];	right operand is TB2
	pop rax
	or al, bl
	mov BYTE[rbp+41], al
;------expression computed. result is in TB3------

	mov al, BYTE[rbp+41];	left operand is TB3
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
	mov BYTE[rbp+42], al
;------expression computed. result is in TB4------

	mov bl, BYTE[rbp+42];	right operand is TB4
	pop rax
	and al, bl
	mov BYTE[rbp+43], al
;------expression computed. result is in TB5------

	mov al, BYTE[rbp+43];	left operand is TB5
	push rax

	mov bl, BYTE[rbp+12];	left operand is u
	pop rax
	and al, bl
	mov BYTE[rbp+44], al
;------expression computed. result is in TB6------

;-----expression processed, result is stored inside temp number 6 of type 2
	mov al, BYTE[rbp+44]
	mov BYTE[rbp+13], al
=======
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
>>>>>>> 1e4466d2c9fe880aecd5e3ef7770a09c40f205f3
	pop rax
;--------------
	jmp endSwitchCase0:
	nextCase1:

;------code for printing integer variable-----
	push rbp
<<<<<<< HEAD
	mov ax, WORD[rbp + 4]
=======
	mov ax, WORD[rbp + 0]
>>>>>>> 1e4466d2c9fe880aecd5e3ef7770a09c40f205f3
	mov rdi, output
	movsx rsi, ax
	xor rax, rax
	call printf
	pop rbp
;------------
	endSwitchCase0:

;------code for printing Boolean variable-----
	mov al, BYTE[rbp + 13]
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

;-------code for scanning boolean array-------
	push rbp
	mov rdi, Input_Array1
	mov rsi, 6
	xor rax, rax
	call printf
	pop rbp
	push rbp
	mov rdi, onScreenBool
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
	lea rsi, [bool1]
	xor rax, rax
	call scanf
	pop rbp
	mov al, BYTE[bool1]
	mov BYTE[rbp + 15], al

;-----inputting A[11]----
	push rbp
	mov rdi, Input_Format
	lea rsi, [bool1]
	xor rax, rax
	call scanf
	pop rbp
	mov al, BYTE[bool1]
	mov BYTE[rbp + 16], al

;-----inputting A[12]----
	push rbp
	mov rdi, Input_Format
	lea rsi, [bool1]
	xor rax, rax
	call scanf
	pop rbp
	mov al, BYTE[bool1]
	mov BYTE[rbp + 17], al

;-----inputting A[13]----
	push rbp
	mov rdi, Input_Format
	lea rsi, [bool1]
	xor rax, rax
	call scanf
	pop rbp
	mov al, BYTE[bool1]
	mov BYTE[rbp + 18], al

;-----inputting A[14]----
	push rbp
	mov rdi, Input_Format
	lea rsi, [bool1]
	xor rax, rax
	call scanf
	pop rbp
	mov al, BYTE[bool1]
	mov BYTE[rbp + 19], al

;-----inputting A[15]----
	push rbp
	mov rdi, Input_Format
	lea rsi, [bool1]
	xor rax, rax
	call scanf
	pop rbp
	mov al, BYTE[bool1]
	mov BYTE[rbp + 20], al

;------code for printing integer variable-----
	push rbp
	mov ax, WORD[rbp + 2]
	mov rdi, output
	movsx rsi, ax
	xor rax, rax
	call printf
	pop rbp
;------------

;-------code for printing static boolean array---------
	push rbp
<<<<<<< HEAD
	mov rdi, output_array
=======
	mov ax, WORD[rbp + 4]
	mov rdi, output
	movsx rsi, ax
>>>>>>> 1e4466d2c9fe880aecd5e3ef7770a09c40f205f3
	xor rax, rax
	call printf
	pop rbp
;------------
<<<<<<< HEAD
;----printing A[10]---
	push rbp
	mov al, BYTE[rbp + 15]
	cmp al, 1
	jne zero5
	push rbp
	mov rdi, bool_true
	xor rax, rax
	call printf
	pop rbp
	jmp empty6
	zero5:
	push rbp
	mov rdi, bool_false
		xor rax, rax
		call printf
	pop rbp
	empty6:
;----printing A[11]---
	push rbp
	mov al, BYTE[rbp + 16]
	cmp al, 1
	jne zero7
	push rbp
	mov rdi, bool_true
	xor rax, rax
	call printf
	pop rbp
	jmp empty8
	zero7:
	push rbp
	mov rdi, bool_false
		xor rax, rax
		call printf
	pop rbp
	empty8:
;----printing A[12]---
	push rbp
	mov al, BYTE[rbp + 17]
	cmp al, 1
	jne zero9
	push rbp
	mov rdi, bool_true
	xor rax, rax
	call printf
	pop rbp
	jmp empty10
	zero9:
	push rbp
	mov rdi, bool_false
		xor rax, rax
		call printf
	pop rbp
	empty10:
;----printing A[13]---
	push rbp
	mov al, BYTE[rbp + 18]
	cmp al, 1
	jne zero11
	push rbp
	mov rdi, bool_true
	xor rax, rax
	call printf
	pop rbp
	jmp empty12
	zero11:
	push rbp
	mov rdi, bool_false
		xor rax, rax
		call printf
	pop rbp
	empty12:
;----printing A[14]---
	push rbp
	mov al, BYTE[rbp + 19]
	cmp al, 1
	jne zero13
	push rbp
	mov rdi, bool_true
	xor rax, rax
	call printf
	pop rbp
	jmp empty14
	zero13:
	push rbp
	mov rdi, bool_false
		xor rax, rax
		call printf
	pop rbp
	empty14:
;----printing A[15]---
	push rbp
	mov al, BYTE[rbp + 20]
	cmp al, 1
	jne zero15
	push rbp
	mov rdi, bool_true
	xor rax, rax
	call printf
	pop rbp
	jmp empty16
	zero15:
	push rbp
	mov rdi, bool_false
		xor rax, rax
		call printf
	pop rbp
	empty16:
;----printing newline character---
	push rbp
	mov rdi, newline_char
	xor rax,rax
	call printf
	pop rbx
=======
>>>>>>> 1e4466d2c9fe880aecd5e3ef7770a09c40f205f3


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
