[BITS 32]
SECTION .text
	global _memcpyASM
	
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
