[BITS 32]
SECTION .text
	global _strlenASM,_strlenASMv2
_strlenASM:
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

_strlenASMv2:
	push	ebp
	mov		ebp, esp
	push	edi
	
	xor		ecx, ecx
	dec		ecx		; ecx = 0xFFFFFFFF
	mov		edi, [ebp + 8]
	xor		al, al
	cld		
	repnz	scasb

	sub		edi, [ebp + 8]
	lea		eax, [edi - 1]
	
	;neg	ecx ;Second way
	;lea	eax, [ecx - 2] ;Second way


	pop		edi
	pop		ebp
	ret