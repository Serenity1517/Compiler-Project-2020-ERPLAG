
section .data
inputInt: db "Input: Enter an integer value",10,0
	output: db "Output: 50", 0
	Input_Format : db "50",0
	intInput db 'Input: Enter an integer value',10,0
	lenIntInput equ 30
	trueOutput db "true",10,0
	lenTrueOutput equ 5
	falseOutput db "false",10,0
	lenFalseOutput equ 6
section .bss
	int1 : resw 1
section .text
	global _start
	extern _scanf
	extern _printf

_start:
	sub rsp, 12
	mov rbp, rsp

;-------assignment stmt-----
	push rax
	mov ax, 5
	mov [ebp+6], ax
	pop rax
;--------------

;-------assignment stmt-----
	push rax
	mov ax, 9
	mov [ebp+8], ax
	pop rax
;--------------

;-----code for scanning integer variable----
push inputInt
	call _printf
	push int1
	push Input_Format
	call _scanf
	add esp, 6
	mov ax, [int1]
	mov [ebp+0],ax
;-----------

;-----code for scanning integer variable----
push inputInt
	call _printf
	push int1
	push Input_Format
	call _scanf
	add esp, 6
	mov ax, [int1]
	mov [ebp+2],ax
;-----------

;-------assignment stmt-----
	push rax

;------Processing integer expression-----

;------Processing integer expression-----

;------Processing integer expression-----

;------Processing integer expression-----

	mov ax, [ebp+0];	left operand is x
	push ax

;------Processing integer expression-----

	mov ax, [ebp+2];	left operand is y
	push ax
	mov bx, [ebp+8];	right operand is b
	pop ax
	mul bx
	mov [ebp+12], ax
;------expression computed. result is in TI1------	mov bx, [ebp+12];	right operand is TI1
	pop ax
	add ax,bx
	mov [ebp+14], ax
;------expression computed. result is in TI2------
	mov ax, [ebp+14];	left operand is TI2
	push ax

;------Processing integer expression-----

;------Processing integer expression-----

	mov ax, [ebp+6];	left operand is a
	push ax
	mov bx, [ebp+8];	right operand is b
	pop ax
	sub ax,bx
	mov [ebp+16], ax
;------expression computed. result is in TI3------
	mov ax, [ebp+16];	left operand is TI3
	push ax
	mov bx, [ebp+2];	right operand is y
	pop ax
	mul bx
	mov [ebp+18], ax
;------expression computed. result is in TI4------	mov bx, [ebp+18];	right operand is TI4
	pop ax
	add ax,bx
	mov [ebp+20], ax
;------expression computed. result is in TI5------
	mov ax, [ebp+20];	left operand is TI5
	push ax

;------Processing integer expression-----

	mov ax, [ebp+6];	left operand is a
	push ax
	mov bx, 2
	pop ax
	mul bx
	mov [ebp+22], ax
;------expression computed. result is in TI6------	mov bx, [ebp+22];	right operand is TI6
	pop ax
	add ax,bx
	mov [ebp+24], ax
;------expression computed. result is in TI7------
	mov ax, [ebp+24];	left operand is TI7
	push ax

;------Processing integer expression-----

	mov ax, [ebp+8];	left operand is b
	push ax
	mov bx, [ebp+0];	right operand is x
	pop ax
	mul bx
	mov [ebp+26], ax
;------expression computed. result is in TI8------	mov bx, [ebp+26];	right operand is TI8
	pop ax
	sub ax,bx
	mov [ebp+28], ax
;------expression computed. result is in TI9------
;-----expression processed, result is stored inside temp number 9 of type 0
	mov ax, [ebp+28]
	mov [ebp+4], ax
	pop rax
;--------------

;------code for printing integer variable-----
	mov bx, [ebp + 4]
	push bx
	push output
	call _printf
	add esp, 6
;------------


	mov rax, 1
	int 80h