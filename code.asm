
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
	sub rsp, 19
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

;-----Dynamic array declaration----
	mov bx,WORD[rbp+0]	;----left index----
	mov ax,WORD[rbp+2]	;----right index----
	cmp ax,bx
	jl runTimeErrorMsg
	sub ax,bx
	mov dx,2
	mul dx
	and ax,000000000000FFFFh
	add rsp,rax
	mov [rbp+4],rsp
	sub rsp,1

;--------End of Dynamic array declaration--------


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
