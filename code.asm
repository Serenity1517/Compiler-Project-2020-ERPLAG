
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
	sub rsp, 13
	mov rbp, rsp

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
	mov WORD[rbp + 1], ax

;-----inputting A[11]----
	push rbp
	mov rdi, Input_Format
	lea rsi, [int1]
	xor rax, rax
	call scanf
	pop rbp
	mov ax, WORD[int1]
	mov WORD[rbp + 3], ax

;-----inputting A[12]----
	push rbp
	mov rdi, Input_Format
	lea rsi, [int1]
	xor rax, rax
	call scanf
	pop rbp
	mov ax, WORD[int1]
	mov WORD[rbp + 5], ax

;-----inputting A[13]----
	push rbp
	mov rdi, Input_Format
	lea rsi, [int1]
	xor rax, rax
	call scanf
	pop rbp
	mov ax, WORD[int1]
	mov WORD[rbp + 7], ax

;-----inputting A[14]----
	push rbp
	mov rdi, Input_Format
	lea rsi, [int1]
	xor rax, rax
	call scanf
	pop rbp
	mov ax, WORD[int1]
	mov WORD[rbp + 9], ax

;-----inputting A[15]----
	push rbp
	mov rdi, Input_Format
	lea rsi, [int1]
	xor rax, rax
	call scanf
	pop rbp
	mov ax, WORD[int1]
	mov WORD[rbp + 11], ax

;-------code for printing static array---------
	push rbp
	mov rdi, output_array
	xor rax, rax
	call printf
	pop rbp
;------------
;----printing A[10]---
	push rbp
	mov ax, WORD[rbp + 1]
	mov rdi, array_value
	movsx rsi, ax
	xor rax, rax
	call printf
	pop rbp
;------------
;----printing A[11]---
	push rbp
	mov ax, WORD[rbp + 3]
	mov rdi, array_value
	movsx rsi, ax
	xor rax, rax
	call printf
	pop rbp
;------------
;----printing A[12]---
	push rbp
	mov ax, WORD[rbp + 5]
	mov rdi, array_value
	movsx rsi, ax
	xor rax, rax
	call printf
	pop rbp
;------------
;----printing A[13]---
	push rbp
	mov ax, WORD[rbp + 7]
	mov rdi, array_value
	movsx rsi, ax
	xor rax, rax
	call printf
	pop rbp
;------------
;----printing A[14]---
	push rbp
	mov ax, WORD[rbp + 9]
	mov rdi, array_value
	movsx rsi, ax
	xor rax, rax
	call printf
	pop rbp
;------------
;----printing A[15]---
	push rbp
	mov ax, WORD[rbp + 11]
	mov rdi, array_value
	movsx rsi, ax
	xor rax, rax
	call printf
	pop rbp
;------------


	mov rax, 1
	int 80h
