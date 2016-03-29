.586
.MODEL FLAT, C

.DATA
a DD 10 ;first value
b DD 4 ;second value

switch DB 5 ;set to 0 if addition, 1 if subtraction, 2 if multiplication, 3 if division, 4 if exponentiation, 5 if modulo

.CODE

MAIN PROC
	push b
	push a

	cmp switch, 0
	je addExec

	cmp switch, 2
	jl subExec
	je multiExec

	cmp switch, 4
	jl diviExec
	je exponExec
	jg moduExec

	addExec:
		call ADDITION
		jmp endSect

	subExec:
		call SUBTRACTION
		jmp endSect

	multiExec:
		call MULTIPLICATION
		jmp endSect

	diviExec:
		call DIVISION
		jmp endSect

	exponExec:
		call EXPONENTIATION
		jmp endSect

	moduExec:
		call MODULO
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

DIVISION PROC
	push ebp
	mov ebp, esp
	push ebx
	push ecx

	mov eax, [ebp+8]
	mov ebx, [ebp+12]
	mov ecx, 0
	divi:
		sub eax, ebx
		inc ecx
		cmp eax, 0
		jg divi
	mov eax, ecx

	pop ecx
	pop ebx
	mov esp, ebp
	pop ebp
	ret
DIVISION ENDP

EXPONENTIATION PROC
	push ebp
	mov ebp, esp
	push ebx
	push ecx

	mov ecx, b
	dec ecx
	push a
	push a
	expon:
		call MULTIPLICATION
		push a
		push eax
		loop expon

	pop ecx
	pop ebx
	mov esp, ebp
	pop ebp
	ret
EXPONENTIATION ENDP

MODULO PROC
	push ebp
	mov ebp, esp
	push ebx

	mov eax, [ebp+8]
	mov ebx, [ebp+12]
	modu:
		sub eax, ebx
		cmp eax, 0
		jg modu
	neg eax

	pop ebx
	mov esp, ebp
	pop ebp
	ret
MODULO ENDP

END