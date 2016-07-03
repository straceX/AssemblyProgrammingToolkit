[BITS 32]

SECTION .text
	global _mystrlen
_mystrlen:
	push ebp
	mov ebp, esp
	xor ecx, ecx
	mov eax, [ebp + 8]
@2:
	mov dl, [eax]
	test dl, dl
	jz @1
	inc ecx
	inc eax
	jmp @2
@1:
	mov eax, ecx
	pop ebp
	ret
