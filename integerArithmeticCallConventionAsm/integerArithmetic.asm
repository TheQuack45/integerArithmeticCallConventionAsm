.586
.MODEL FLAT, C

.DATA
a DD 5 ;first value
b DD 5 ;second value

orderOneSwitch DB 0 ;set to 0 if addition, 1 if subtraction

.CODE

MAIN PROC
	push b
	push a

	cmp orderOneSwitch, 0
	je addExec
	jmp subExec

	addExec:
		call ADDITION
		jmp endSect

	subExec:
		call SUBTRACTION
		jmp endSect

	endSect:
		mov eax, eax
MAIN ENDP

ADDITION PROC
	push ebp
	mov ebp, esp
	push ebx

	mov eax, [ebp+8]
	mov ebx, [ebp+12]
	add eax, ebx

	pop ebx
	mov esp, ebp
	pop ebp
	ret
ADDITION ENDP

SUBTRACTION PROC
	push ebp
	mov ebp, esp
	push ebx

	mov eax, [ebp+8]
	mov ebx, [ebp+12]
	sub eax, ebx

	pop ebx
	mov esp, ebp
	pop ebp
	ret
SUBTRACTION ENDP

END