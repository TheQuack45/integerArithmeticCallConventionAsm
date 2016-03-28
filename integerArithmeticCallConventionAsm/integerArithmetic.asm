.586
.MODEL FLAT, C

.DATA
a DD 5 ;first value
b DD 5 ;second value

switch DB 2 ;set to 0 if addition, 1 if subtraction, 2 if multiplication

.CODE

MAIN PROC
	push b
	push a

	cmp switch, 0
	je addExec

	cmp switch, 2
	jl subExec
	je multiExec

	addExec:
		call ADDITION
		jmp endSect

	subExec:
		call SUBTRACTION
		jmp endSect

	multiExec:
		call MULTIPLICATION
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

MULTIPLICATION PROC
	push ebp
	mov ebp, esp
	push ebx
	push ecx

	mov eax, 0
	mov ebx, [ebp+8]
	mov ecx, [ebp+12]
	multi:
		add eax, ebx
		loop multi

	pop ecx
	pop ebx
	mov esp, ebp
	pop ebp
	ret
MULTIPLICATION ENDP

END