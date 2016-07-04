[BITS 32]
section .text
	global _add, _multiply, _gettotal

_add:
	push ebp
	mov ebp, esp
	mov eax, [ebp + 8]
	add eax, [ebp + 12]
	pop ebp
	ret

_multiply:
	push ebp
	mov ebp, esp
	mov eax, [ebp + 8]
	mul dword [ebp + 12]
	pop ebp
	ret

_gettotal:
	push ebp
	mov ebp, esp
	mov eax, [ebp + 8]
	mov ecx, [ebp + 12]
	test ecx, ecx
	jz .@1
	fldz
.@2:
	fadd qword [eax]
	add eax, 8
	dec ecx
	jnz .@2
.@1:
	pop ebp
	ret

_swap:
	push ebp
	mov ebp, esp
	mov eax, [ebp + 8]
	mov edx, [eax]
	mov ecx, [ebp + 12]
	xchg edx, [ecx]
	mov [eax], edx
	pop ebp
	ret
