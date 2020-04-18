
section .data
	inputInt: db "Input: Enter an integer value",10,0
	output: db "Output: %d", 10, 0
	Input_Format : db "%d",0
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
	sub rsp, 16
	mov rbp, rsp

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

;-------assignment stmt-----
	push rax

;------Processing integer expression-----

	mov ax, WORD[rbp+6];	left operand is a
	push rax

;------Processing integer expression-----

	mov ax, WORD[rbp+10];	left operand is c
	push rax
	mov bx, 2
	pop rax
	mul bx
	mov WORD[rbp+12], ax
;------expression computed. result is in TI1------
	mov bx, WORD[rbp+12];	right operand is TI1
	pop rax
	add ax,bx
	mov WORD[rbp+14], ax
;------expression computed. result is in TI2------

;-----expression processed, result is stored inside temp number 2 of type 0
	mov ax, WORD[rbp+14]
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


	mov rax, 1
	int 80h
