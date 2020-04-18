section .data
output: db "Output %d", 10,0

section .bss

section .text
	global main
	extern printf

main:	
	sub rsp,30
	mov rbp,rsp
	push rax
	mov ax, 5
	mov WORD[rbp+6], ax
	pop rax
	push rbp
	mov ax, WORD[rbp + 6]
	mov rdi, output
	movsx rsi, ax
	xor rax, rax
	call printf
	pop rbp
	mov rax,1
	int 80h
