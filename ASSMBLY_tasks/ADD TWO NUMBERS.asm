.MODEL SMALL
.STACK 100H
.CODE

MAIN PROC
    
    MOV AH,1      ;INPUT
    INT 21H
    
    MOV BL,AL     ;FIRST INPUT
    INT 21H
    
    
    MOV CL,AL      ;SECOND INPUT
    
    
    ADD BL,CL      ;BL=BL+CL
    
    
    MOV AH,2
    
    SUB BL,48
    
    MOV DL,BL
    INT 21H
    
       
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN