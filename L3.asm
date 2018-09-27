.MODEL small
.DATA

num1 DB ?
num2 DB ?

.CODE
    programa:
    MOV AX, @DATA
    MOV DS, AX
    ;valor 1
    XOR AX, AX
    MOV AH, 1h
    INT 21h
    SUB AL, 30h
    MOV num1, AL
    ;valor 2
    XOR AX, AX
    MOV AH, 1h
    INT 21h
    SUB AL, 30h
    MOV num2, AL
    ;suma
    XOR AX, AX
    MOV AL, num2
    MOV AH, num1
    ADD AL, AH
    MOV DL, AL
    
    XOR AX, AX
    MOV AH, 02h
    ADD DL, 30h
    INT 21h
    ;resta
    XOR AX, AX
    MOV DL, num1
    SUB DL, num2
    
    XOR AX, AX
    MOV AH, 02h
    ADD DL, 30h
    INT 21h
    ;multiplicaci?n
    XOR DX, DX
    XOR AX, AX
    MOV AL, num1
    MOV BL, num2
    MUL BL
    
    MOV DL, AL
    ADD DL, 30h
    MOV AH, 02h
    INT 21h
    ;Divisi?n
    XOR DX, DX
    XOR AX, AX
    XOR BX, BX
    MOV AL, num1
    MOV BL, num2
    DIV BL
    
    MOV DL, AL
    ADD DL, 30h
    MOV DH, AH
    MOV AH, 02h
    INT 21h
    
    MOV DL, DH
    ADD DL, 30h
    MOV AH, 02h
    INT 21h
    
    MOV AH, 4Ch
    INT 21h

.STACK
END programa