[BITS 32]
SECTION .text
	global _memcpyASM,_memsetASM
	
_memcpyASM:
	push	ebp
	mov		ebp, esp
	push	esi
	push	edi

	mov		edi, [ebp + 8]
	mov		esi, [ebp + 12]
	mov		ecx, [ebp + 16]
	cld
	rep movsb
	
	mov		eax, [ebp + 8]
	pop		edi
	pop		esi
	pop		ebp
	ret
	
_memsetASM:
	push	ebp
	mov		ebp, esp
	push	edi
	
	mov		edi, [ebp + 8]
	mov		al, [ebp + 12]
	mov		ecx, [ebp + 16]
	cld
	rep		stosb
	
	mov		eax, [ebp + 8]
	
	pop		edi
	pop		ebp
	ret

