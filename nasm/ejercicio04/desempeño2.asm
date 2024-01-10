section .data
	userMsg1 db "dame un numero ", 0xA, 0xD
	lenl equ $ - userMsg1
	dispRes1 db "El incremento es ", 0xA, 0xD
	len2 equ $ - dispRes1
	dispRes2 db "El decremento es ", 0xA, 0xD
	len3 equ $ - dispRes2

section .bss
	numl resb 5
	resl resb 5
	res2 resb 5

section .text
	global _start

_start:
	;impresion de userMsgl
	mov eax, 4
	mov ebx, 1
	mov edx, lenl
	int 0x80

	;teclado lectura
	mov eax, 3
	mov ebx, 1
	mov ecx, numl
	mov edx, 5
	int 0x80

	;incremento de numero
	mov eax, [numl]
	inc eax
	mov [resl], eax

	;comentario
	mov eax, 4
	mov ebx, 1
	mov ecx, dispRes1
	mov edx, len2
	int 0x80

	;imprime incremento
	mov eax, 4
	mov ebx, 1
	mov ecx, resl
	mov edx, 5
	int 0x80

	;decremento de num
	mov eax, [resl]
	dec eax
	mov [res2], eax

	;comentario
	mov eax, 4
	mov ebx, 1
	mov ecx, dispRes2
	mov edx, len3
	int 0x80

	;imprimir decremento
	mov eax, 4
	mov ebx, 1
	mov ecx, res2
	mov edx, 5
	int 0x80

	mov eax, 1
	int 0x80
