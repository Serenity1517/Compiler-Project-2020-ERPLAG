
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
	sub rsp, 18
	mov rbp, rsp
	sub rsp,1

;-------assignment stmt-----
	push rax
	mov ax, 2
	mov WORD[rbp+0], ax
	pop rax
;--------------

;-------assignment stmt-----
	push rax
	mov ax, 4
	mov WORD[rbp+2], ax
	pop rax
;--------------

;-----Dynamic array declaration----
	mov bx,WORD[rbp+0]	;----left index----
	mov ax,WORD[rbp+2]	;----right index----
	cmp ax,bx
	jl runTimeError
	sub ax,bx
	inc ax
	mov cx,2
	mul cx
	and rax,000000000000FFFFh
	sub rsp,rax
	inc rsp
	mov QWORD[rbp+4],rsp
	dec rsp

;--------End of Dynamic array declaration--------


	mov cx, WORD[rbp+0]
	and rcx,000000000000FFFFh
	mov dx, WORD[rbp+2]
	and rdx,000000000000FFFFh

;-------code for scanning integer array-------
	mov bx,dx
	sub bx,cx
	add bx,1	;bx contains high-low+1 (dx-cx+1)
	push rbp
	mov rdi, Input_Array1
	movsx rsi, bx
	xor rax, rax
	call printf
	pop rbp
	push rbp
	mov rdi, onScreenInt
	xor rax, rax
	call printf
	pop rbp
	mov cx, WORD[rbp+0]
	and rcx,000000000000FFFFh
	mov dx, WORD[rbp+2]
	and rdx,000000000000FFFFh
	push rbp
	mov rdi, Input_Array2
	mov rsi, rcx
	xor rax, rax
	call printf
	pop rbp

;---code for inputing elements of dynamic array---
	mov rdx, QWORD[rbp+4]
	mov WORD[rbp+12], bx
	mov cx,bx
takeInput0:
	cmp cx,0
	jle stopInput0
	push rbp
	mov rdi, Input_Format
	lea rsi, [int1]
	xor rax, rax
	call scanf
	pop rbp

	mov ax,WORD[int1]
	mov WORD[rdx],ax
	add rdx,2
	sub cx,1
	
	push rbp
	mov rdi, output
	movsx rsi, cx
	xor rax,rax
	call printf
	pop rbp
	jmp takeInput0
stopInput0:


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
