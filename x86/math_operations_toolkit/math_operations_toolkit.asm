[BITS 32]
section .text
	global _addASM, _multiplyASM, _gettotalASM,_swapASM,_getmaxASM,_AddPacked

_addASM:
	push ebp
	mov ebp, esp
	mov eax, [ebp + 8]
	add eax, [ebp + 12]
	pop ebp
	ret

_multiplyASM:
	push ebp
	mov ebp, esp
	mov eax, [ebp + 8]
	mul dword [ebp + 12]
	pop ebp
	ret

_gettotalASM:
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

_swapASM:
	push ebp
	mov ebp, esp
	mov eax, [ebp + 8]
	mov edx, [eax]
	mov ecx, [ebp + 12]
	xchg edx, [ecx]
	mov [eax], edx
	pop ebp
	ret
	
_getmaxASM:
	push ebp
	mov ebp, esp
	mov ecx, [ebp + 12]	
	mov eax, [ebp + 8]	
	dec ecx
	mov edx, [eax]
.@2:
	add eax, 4
	dec ecx
	jz .@1
	cmp edx, [eax]		
	jg .@2
	mov edx, [eax]
	jmp .@2
.@1:
	mov eax, edx
	pop ebp
	ret

_AddPacked:
	push		ebp
	mov		ebp, esp

	mov		eax, [ebp  + 8]
	vmovupd		ymm0, [eax]
	mov		eax, [ebp + 12]
	
	vaddps		ymm0, [eax]

	mov		eax, [ebp + 16]
	vmovupd		[eax], ymm0
	
	mov		esp, ebp
	pop		ebp
	ret
