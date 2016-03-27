.586
.MODEL FLAT, C

.DATA
a DW 5 ;first value
b DW 5 ;second value

.CODE

MAIN PROC
	push b
	push a
	call ADDITION

	mov eax, eax
MAIN ENDP

;TODO: make it work

ADDITION PROC
	push ebp
	mov ebp, esp
	push eax
	push ebx

	mov eax, [ebp+8]
	mov ebx, [ebp+12]
	add eax, ebx

	pop ebx
	mov esp, ebp
	pop ebp
	ret
ADDITION ENDP

END