.MODEL SMALL
 .STACK 100H

 .DATA
   PROMPT_1  DB  'Enter the character : $'
   PROMPT_2  DB  0DH,0AH,'The ASCII code of the given number in binary form is : $'
   PROMPT_3  DB  0DH,0AH,'The number of 1 bits in ASCII code are : $'

 .CODE
   MAIN PROC
     MOV AX, @DATA                ; initialize DS  
     MOV DS, AX

     LEA DX, PROMPT_1             ; load and display PROMPT_1   
     MOV AH, 9
     INT 21H

     MOV AH, 1                    ; read a character
     INT 21H

     XOR BX, BX                   ; clear BX
     MOV BL, AL                   ; move AL to BL

     LEA DX, PROMPT_2             ; load and display PROMPT_2
     MOV AH, 9
     INT 21H

     XOR BH, BH                   ; clear BH
     MOV CX, 8                    ; initialize loop counter
     MOV AH, 2                    ; set output function

     @OUTPUT:                     ; jump label
       SHL BL, 1                  ; shift left BX by 1 bit

       JNC @ZERO                  ; jump to label @ZERO if CF=0
       INC BH                     ; increment BH
       MOV DL, 31H                ; set DL=1
       JMP @DISPLAY               ; jump to label @DISPLAY

       @ZERO:                     ; jump label
         MOV DL, 30H              ; set DL=0

       @DISPLAY:                  ; jump label
         INT 21H                  ; display digit
     LOOP @OUTPUT                 ; jump to label @OUTPUT

     LEA DX, PROMPT_3             ; load and display the string PROMPT_3
     MOV AH, 9
     INT 21H

     OR BH, 30H                   ; convert the decimal to ascii code

     MOV AH, 2                    ; print the contents of BH
     MOV DL, BH
     INT 21H

     MOV AH, 4CH                  ; return control to DOS
     INT 21H
   MAIN ENDP
 END MAIN