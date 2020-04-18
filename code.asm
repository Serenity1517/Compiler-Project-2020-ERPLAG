
section .data
	inputInt: db "Input: Enter an integer value",10,0
	output: db "Output: %d", 10, 0
	Input_Format : db "%d",0
	trueOutput db "Output: true",10,0
	falseOutput db "Output: false",10,0
	lenFalseOutput equ 6
section .bss
	int1 : resw 1
section .text
	global main
	extern scanf
	extern printf

main:
	sub rsp, 2
	mov rbp, rsp

;-----code for scanning integer variable----
	push rbp
	mov rdi, inputInt
	xor rax, rax
	call printf
	pop rbp
	push rbp
	mov rdi, 
	push Input_Format
	call scanf
	add esp, 6
	mov ax, WORD[int1]
	mov WORD[rbp+0],ax
;-----------

;------code for printing integer variable-----
	push rbp
	mov ax, WORD[rbp + 0]
	mov rdi, output
	movsx rsi, ax
	xor rax, rax
	call printf
	pop rbp
;------------


	mov rax, 1
	int 80h
