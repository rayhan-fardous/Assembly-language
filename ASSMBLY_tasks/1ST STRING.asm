.MODEL SMALL
.STACK 100H
.DATA 

A DB 'RAYHAN $'
B DB 'FARDOUS $'

.CODE
MAIN PROC
    
    MOV AX,@DATA      ;INITIALISATION OF DATA SEGMENT
    MOV DS,AX
    
    LEA DX,A
    MOV AH,9
    INT 21H            ;OUTPUT
    
    MOV AH,2
    MOV DL,10
    INT 21H            ;NEWLINE
    MOV DL,13
    INT 21H
    
    LEA DX,B
    MOV AH,9
    INT 21H            ;OUTPUT
    
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN