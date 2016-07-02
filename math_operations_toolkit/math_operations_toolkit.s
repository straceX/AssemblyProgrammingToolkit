[BITS 32]
section .text
	global add, multiply

add:
	push ebp
	mov ebp, esp
	mov eax, [ebp + 8]
	add eax, [ebp + 12]
	pop ebp
	ret

multiply:
	push ebp
	mov ebp, esp
	mov eax, [ebp + 8]
	mul dword [ebp + 12]
	pop ebp
	ret
