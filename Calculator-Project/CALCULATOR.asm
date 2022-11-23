.MODEL SMALL
.STACK 100H
.DATA
    ;START END MSG
    CHUNT01 DB ,0AH,0DH, "          >>>>>>WELCOME TO CALCULATOR PROJECT <<<<<< $"
    EXIT1 DB ,0AH,0DH, "                 >>>>>GOOD BUY ---THANK-YOU---<<<<< $"  
    
    
    
    ;MAIN MENU 
    MSG02 DB ,0AH,0DH, " PRESS C FOR CALCULATOR.$"  
    
    
    
    ;FOR CALCULATOR MENU 
    MENUC DB ,0AH,0DH,"       >>>>>>CALCULATOR<<<<<< $"
    MSG1 DB ,0AH,0DH, "PRESS A FOR ADDITION .$"
    MSG2 DB ,0AH,0DH, "PRESS S FOR SUBTRACTION . $"
    MSG3 DB ,0AH,0DH, "PRESS M FOR MULTIPLICATION.$"
    MSG4 DB ,0AH,0DH, "PRESS D FOR DIVISION.$"
    MSG5 DB ,0AH,0DH, "PRESS F FOR FACTORIAL.$"
    MSG6 DB ,0AH,0DH, "PRESS P FOR POWER CALCULATE.$"
    MSG7 DB ,0AH,0DH, "PRESS E FOR EXIT PROGRAM.$"
    MSG8 DB ,0AH,0DH, "PRESS R FOR RETURN CALCULATOR MENU .$"
    
    
    
    RMAIN DB ,0AH,0DH, "PRESS T FOR TURN MAIN MENU.$"
    UND DB "UNDEFINED.$" 
    
    
    
    LEGAL1 DB ,0AH,0DH, "PLEASE ENTER A LEGAL INPUT !!!$"
    CHOICE DB ,0AH,0DH, " ENTER YOUR CHOICE :$"  
    
    
    
    MSG10 DB ,0AH,0DH, "ENTER FIRST NUMBER :$"
    MSG11 DB ,0AH,0DH, "ENTER SECOND NUMBER : $"
    MSG12 DB ,0AH,0DH, "ENTER A NUMBER FOR FACTORIAL VALUE :$"  
    MSG13 DB ,0AH,0DH, "ENTER BAGE :$"
    MSG14 DB ,0AH,0DH, "ENTER POWER : $"
    
       
    
    ADD1 DB ,0AH,0DH,  "       >>>>>>FOR ADDITION <<<<<<$"
    SUB1 DB ,0AH,0DH,  "       >>>>>>FOR SUBTRACTION<<<<<<$"
    MUL1 DB ,0AH,0DH,  "       >>>>>>FOR MULTIPLICATION<<<<<<$"
    DIV1 DB ,0AH,0DH,  "       >>>>>>FOR DIVISION<<<<<<$" 
    FAC1 DB ,0AH,0DH,  "       >>>>>>FOR FACTORIAL<<<<<<$"
    POW1 DB ,0AH,0DH,  "       >>>>>>FOR POWER<<<<<<$"
    
    
    RESULT DB ,0AH,0DH,  "RESULT IS = $"
    ISRE DB     " = IS YOUR RESULT $"
    RMNDR DB ,0AH,0DH, "REMAINDER IS = $"
    YES DB ,0AH,0DH,  "PRESS C FOR CONTINUE . $"
    NO DB ,0AH,0DH, "PRESS E FOR EXIT .$"
    
    NUM1 DB ?
    NUM2 DB ?
    FACT DB 1H
    RES DB 10 DUP <'$'>
    RSLT DB ?
    BASE DB ?
    
.CODE
    
MAIN PROC 
    
    MOV AX,@DATA
    MOV DS,AX 
    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
;START PROJECT MENU 
MENU:
         
         CALL NEWLINE
         
         LEA DX,CHUNT01
         MOV AH,09H    ;PRINT MSG
         INT 21H
         
         CALL NEWLINE 
         
         LEA DX,MSG02
         MOV AH,09H
         INT 21H
         
         LEA DX,MSG7
         MOV AH,09H
         INT 21H
         
         CALL NEWLINE
         
         LEA DX,CHOICE
         MOV AH,09H
         INT 21H 
         
         MOV AH,1 ;INPUT FROM USER
         INT 21H  
         MOV BL,AL
         
         CMP BL,'C'
         JE CALCULATOR_MENU  ;COMPARE INPUT WITH C
         
         CMP BL,'E'  ;COMPARE INPUT WITH E
         JE EXIT 
         
         CALL WRONG_MENU
          
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
         
;CALCULATOR PROJECT START HERE   ..............................................
         
CALCULATOR:
          
          
          CALL NEWLINE
          LEA DX,MENUC
          MOV AH,09H
          INT 21H
          
          CALL NEWLINE
          
          LEA DX,MSG1
          MOV AH,09H
          INT 21H
          
          LEA DX,MSG2
          MOV AH,09H
          INT 21H
          
           LEA DX,MSG3
          MOV AH,09H
          INT 21H
          
           LEA DX,MSG4
          MOV AH,09H
          INT 21H
          
           LEA DX,MSG5
          MOV AH,09H
          INT 21H 
          
           LEA DX,MSG6
          MOV AH,09H
          INT 21H  
          
           LEA DX,MSG7
          MOV AH,09H
          INT 21H  
          
          LEA DX,RMAIN
          MOV AH,09H
          INT 21H
          
          CALL NEWLINE
          
          LEA DX,CHOICE
          MOV AH,09H
          INT 21H
          
          MOV AH,1
          INT 21H
          MOV BL,AL
          
          CMP BL,'A'
          JE ADDITION
          
          CMP BL,'S'
          JE SUBTRACTION
          
          CMP BL,'M'
          JE MULTIPLICATION
          
          CMP BL,'D'
          JE DIVISION 
          
          CMP BL, 'F'
          JE FACTORIAL
          
          CMP BL,'P'
          JE POWER
          
          CMP BL,'T'
          JE MAIN_MENU
          
          CMP BL,'E'
          JE EXIT
          
          CALL WRONG_CAL  
          
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       
;LEVEL ADDITION START HERE ....................................................
          
ADDITION: 
             
             CALL NEWLINE
             
             LEA DX,ADD1
             MOV AH,09H
             INT 21H
             
             CALL NEWLINE
             
             LEA DX,MSG10
             MOV AH,09
             INT 21H
             
             MOV AH,1
             INT 21H
             MOV BL,AL
             
             CMP BL,30H
             JL WRONG_CAL
             
             CMP BL,39H
             JG WRONG_CAL
             
             LEA DX,MSG11
             MOV AH,09
             INT 21H
             
             MOV AH,1
             INT 21H
             MOV CL,AL 
             
             CMP CL,39H
             JG WRONG_CAL  
             
             CMP CL,30H
             JL WRONG_CAL
             
             ADD BL,CL
             SUB BL,30H 
             
             MOV AH,0
             MOV AL,BL
             SUB AL,30H
             
             MOV BL,10
             DIV BL
             
             MOV BL,AL
             ADD BL,30H
             
             MOV CL,AH
             ADD CL,30H
             
             LEA DX,RESULT
             MOV AH,09
             INT 21H
             
             MOV AH,2
             MOV DL,BL
             INT 21H
             
             MOV AH,2
             MOV DL,CL
             INT 21H 
             
             CALL CHOICE_ALL
             
             MOV AH,1
             INT 21H
             MOV BL,AL  
             
             CMP BL,'R'
             JE CALCULATOR_MENU
             
             CMP BL,'T'
             JE MAIN_MENU
             
             CMP BL,'C'
             JE ADDITION
             
             CMP BL,'E'
             JE EXIT
             
             CALL WRONG_CAL 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
             
               
;START SUBTRACTION FUNCTION  ................................................
             
SUBTRACTION: 
                
                CALL NEWLINE 
                
                LEA DX,SUB1
                MOV AH,09H
                INT 21H
                
                CALL NEWLINE
                
                LEA DX,MSG10
                MOV AH,09
                INT 21H
                
                MOV AH,1
                INT 21H
                MOV BL,AL
                
                CMP BL,30H
                JL WRONG_CAL
                
                LEA DX,MSG11
                MOV AH,09
                INT 21H
                
                MOV AH,1
                INT 21H
                MOV CL,AL
                
                CMP CL,30H
                JL WRONG_CAL
                
                CMP CL,39H
                JG WRONG_CAL
                
                CMP BL,CL
                JG SUBL1
                
                CMP CL,BL
                JG SUBL2
                JE SUB SUBL3
                
       SUBL1:
       ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
            
              SUB BL,CL
              ADD BL,30H
              
              LEA DX,RESULT
              MOV AH,9
              INT 21H
              
              MOV AH,2
              MOV DL,BL
              INT 21H
              
              CALL CHOICE_ALL
              
              MOV AH,1
              INT 21H
              MOV BL,AL
              
              CMP BL,'R'
              JE CALCULATOR_MENU
              
              CMP BL,'T'
              JE MAIN_MENU
              
              CMP BL,'C'
              JE SUBTRACTION
              
              CMP BL,'E'
              JE EXIT
              
              CALL WRONG_CAL
              
      SUBL2: 
      ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
             
             SUB CL,BL 
             ADD CL,30H
             
             LEA DX,RESULT
             MOV AH,9
             INT 21H
             
             MOV AH,2
             MOV DL,2DH     ;2DH SHOWS - MINUS SIGN
             INT 21H
             
             MOV AH,2
             MOV DL,CL
             INT 21H
             
             CALL CHOICE_ALL
             
             MOV AH,1
             INT 21H
             MOV BL,AL
             
             CMP BL,'R'
             JE CALCULATOR_MENU
             
             CMP BL,'T'
             JE MAIN_MENU
             
             CMP BL,'C'
             JE SUBTRACTION
             
             CMP BL,'E'
             JE EXIT
             
             CALL WRONG_CAL
             
       SUBL3:
       ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
             
             LEA DX,RESULT
             MOV AH,9
             INT 21H
             
             CALL CHOICE_ALL
             
             MOV AH,1
             INT 21H
             MOV BL,AL
             
             CMP BL,'R'
             JE CALCULATOR_MENU 
            
             CMP BL,'T'
             JE MAIN_MENU 
             
             CMP BL,'C'
             JE SUBTRACTION
             
             CMP BL,'E'
             JE EXIT
             
             CALL WRONG_CAL 
             

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;MULTIPLICATION START HERE   ...............................................
            
MULTIPLICATION:
               
               CALL NEWLINE
               
               LEA DX,MUL1
               MOV AH,09H
               INT 21H
               
               CALL NEWLINE
               
               LEA DX,MSG10
               MOV AH,09H
               INT 21H
               
               MOV AH,1
               INT 21H
               
               CMP AL,30H
               JL WRONG_CAL
               
               SUB AL,30H
               MOV NUM1,AL
               
               LEA DX,MSG11
               MOV AH,09H
               INT 21H  
               
               MOV AH,1
               INT 21H
               
               CMP AL,30H
               JL WRONG_CAL
               
               CMP AL,39H
               JG WRONG_CAL
               
               SUB AL,30H
               MOV NUM2,AL
               
               MUL NUM1
               
               MOV RSLT,AL
               AAM
               
               ADD AH,30H
               ADD AL,30H
               
               MOV BX,AX
               
               LEA DX,RESULT
               MOV AH,09H
               INT 21H
               
               MOV AH,2
               MOV DL,BH
               INT 21H
               
               MOV AH,2
               MOV DL,BL
               INT 21H
               
               CALL CHOICE_ALL
               
               MOV AH,1
               INT 21H
               MOV BL,AL
               
               CMP BL,'R'
               JE CALCULATOR_MENU
               
               CMP BL,'T'
               JE MAIN_MENU
               
               CMP BL,'C'
               JE MULTIPLICATION
               
               CMP BL,'E'
               JE EXIT
               
               CALL WRONG_CAL
               
                
               
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
             

;DIVISION START HERE ................................................
         
DIVISION:     

               
      
    CALL NEWLINE
     
    LEA DX,DIV1
    MOV AH,09H
    INT 21H 
    
    CALL NEWLINE 
     
    LEA DX,MSG10
    MOV AH,09
    INT 21H 
     
   
    MOV AH,1
    INT 21H
    MOV BL,AL
   
    CMP BL,30H
    JL WRONG_CAL
    
    CMP BL,39H
    JG WRONG_CAL
    
    LEA DX,MSG11
    MOV AH,09
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV CL,AL 
    
    CMP CL,39H
    JG WRONG_CAL 
    
    CMP CL,30H
    JE UNDEFINED
    JL WRONG_CAL
       
    MOV AL,BL
    SUB AL,30H
    MOV BL,CL
    SUB BL,30H 
         
    
    MOV AH,0              
    DIV BL
     
    MOV CL,AL       
    ADD CL,30H 
     
    MOV BL,AH        
    ADD BL,30H
                     
    LEA DX,RESULT
    MOV AH,09
    INT 21H
    
    MOV AH,2
    MOV DL,CL
    INT 21H       
    
    LEA DX,RMNDR
    MOV AH,09
    INT 21H
    
    MOV AH,2
    MOV DL,BL
    INT 21H  
     
    CALL CHOICE_ALL
    
    MOV AH,1
    INT 21H
    MOV BL,AL  
    
    CMP BL,'R'
    JE CALCULATOR_MENU
    
    CMP BL,'T'
    JE MAIN_MENU
    
    CMP BL,'C'
    JE  DIVISION
    
    CMP BL,'E'
    JE EXIT 
     
    CALL WRONG_CAL
   
  
     
              

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  


;UNDEFINED START HERE .....................................................
          
UNDEFINED:
              
              LEA DX,RESULT
              MOV AH,09
              INT 21H
              
              LEA DX,UND
              MOV AH,09
              INT 21H
              
              CALL CHOICE_ALL
              
              MOV AH,1
              INT 21H
              MOV BL,AL 
              
              CMP BL,'R'
              JE CALCULATOR_MENU
              
              CMP BL,'T'
              JE MAIN_MENU
              
              CMP BL,'C'
              JE DIVISION 
              
              CMP BL,'E'
              JE EXIT
              
              CALL WRONG_CAL 
              
              

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;FACTORIAL START HERE  ...............................................
              
FACTORIAL:
              
              CALL NEWLINE
              
              LEA DX,FAC1
              MOV AH,09H
              INT 21H 
              
              CALL NEWLINE
              
              LEA DX,MSG12
              MOV AH,09H
              INT 21H
              
              MOV BH,0
              MOV BL,10D
              
         INPUT: 
         
              
              MOV AH,1
              INT 21H
              CMP AL,13D
              JNE NUMBER
              
              AND CX,0
              MOV CL,BH
              DEC CX
              AND AX,0
              
              MOV AL,BH
              
              JMP FACTT
              
         NUMBER: 
         
              
              SUB AL,30H
              MOV CL,AL
              MOV AL,BH
              MUL BL
              ADD AL,CL
              MOV BH,AL
              
              JMP INPUT
              
         FACTT:
         
         
               MUL CX
               LOOP FACTT 
               
               AND DX,0
               MOV CX,10D    
               
               MOV BX,0000H
               
         STORE:
         
         
                                ;DX:AX/CX   REM=DX ,,, QUE=AX
               DIV CX
               MOV [0000H+BX],DX
               ADD BX,2H
               MOV DX,0
               CMP AX,0
               JNE STORE
               
               MOV AH,2
               MOV DL,0DH
               INT 21H
               MOV DL,0AH
               INT 21H
               
         PRINTF:
          
                
               SUB BX,2H
               MOV DL,[0000H+BX]
               ADD DL,30H
               INT 21H
               CMP BX,0
               JNE PRINTF
               
               LEA DX,ISRE
               MOV AH,09
               INT 21H
               
               CALL CHOICE_ALL 
               
               MOV AH,1
               INT 21H
               MOV BL,AL
               
               CMP BL,'R'
               JE CALCULATOR_MENU
               
               CMP BL,'T'
               JE MAIN_MENU
               
               CMP BL,'C'
               JE FACTORIAL
               
               CMP BL,'E'
               JE EXIT
               
               CALL WRONG_CAL

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;POWER START HERE ..........................................
               
POWER:
           
            
               
               CALL NEWLINE
               
               LEA DX,POW1
               MOV AH,09H
               INT 21H
               
               CALL NEWLINE
               
               MOV AX,0
               MOV BX,0
               MOV CX,0
               
               LEA DX,MSG13
               MOV AH,09H
               INT 21H

               MOV AH,01H
               INT 21H
    
    
               CMP AL,30H
               JL WRONG_CAL
               
               CMP AL,39H
               JG WRONG_CAL
               
               SUB AL,30H
               MOV BL,AL
               
               MOV BASE,AL
               
               LEA DX,MSG14
               MOV AH,09H
               INT 21H
               
               MOV AH,01H
               INT 21H
               
               CMP AL,30H
               JL WRONG_CAL
               
               CMP AL,39H
               JG WRONG_CAL
               
               SUB AL,30H
               
               MOV CL,AL
               DEC CL
               MOV AX,00
               MOV AL,BASE
               
               
         LBL1: 
         ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
               
               MUL BL
               LOOP LBL1
               
               MOV CL,10
               DIV CL
               MOV BX,AX
               
               ADD BH,30H
               ADD BL,30H
               
               LEA DX,RESULT
               MOV AH,09H
               INT 21H
               
               MOV AH,02H
               MOV DL,BL
               INT 21H
               
               MOV DL,BH
               INT 21H
               
               CALL CHOICE_ALL
               
               MOV AH,1
               INT 21H
               MOV BL,AL 
               
               CMP BL,'R'
               JE CALCULATOR_MENU
               
               CMP BL,'T'
               JE MAIN_MENU
               
               CMP BL,'C'
               JE POWER
               
               CMP BL,'E'
               JE EXIT
               
               CALL WRONG_CAL 
               
               

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
               
;NEW LINE CODE .....................................................................
 NEWLINE: 
               
               MOV AH,2
               MOV DL,0AH
               INT 21H
               
               MOV AH,2
               MOV DL,0DH
               INT 21H
               
               RET   
               
               
         SCS: 
         ;;;;;;;;;;;;;;;;;;;;;;;;;;
         
              
              MOV AX,0600H  ;06 TO SCROLL & 00 FOR FULL J SCREEN
              MOV BH,13H    ;ATTRIBUTE 7 FOR BACKGROUND AND 1 FOR FOREGROUND
              MOV CX,0000H   ;STARTING COORDINATES
              MOV DX,184FH   ;ENDING COORDINATES
              INT 10H
              
              RET 
              
              
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;CALCULATOR MENU START HERE .............................................

              
CALCULATOR_MENU:

              
              MOV AX,0600H   ;06 TO SCROLL & 00 FOR FULLJ SCREEN
              MOV BH,71H     ;ATTRIBUTE 7 FOR BACKGROUND AND 1 FOR FOREGROUND
              MOV CX,0000H   ;STARTING COORDINATES
              MOV DX,184FH   ;ENDING COORDINATES
              INT 10H
              
              CALL CALCULATOR    ; RETURN CALCULATOR MENU 
              
              

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;MAIN MENU START HERE ..............................................................
              
MAIN_MENU: 
              
              MOV AX,0600H   ;06 TO SCROLL & 00 FOR FULLJ SCREEN
              MOV BH,24H     ;ATTRIBUTE 7 FOR BACKGROUND AND 1 FOR FORGROUND 
              MOV CX,0000H   ;STARTING COORDINATES
              MOV DX,184FH   ;ENDING COORDINATES
              INT 10H
              
              CALL MENU      ;RETURN MAIN MENU 
              
                 
              
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
              
;CONVERTER MENU START HERE ..................................................

             
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;CHOICE_ALL CODE WRITE HERE ..................................................

CHOICE_ALL:
           
           CALL NEWLINE 
           
           LEA DX,RMAIN
           MOV AH,09
           INT 21H
           
           LEA DX,MSG8
           MOV AH,09
           INT 21H
           
           LEA DX,YES
           MOV AH,09
           INT 21H
           
           LEA DX,NO
           MOV AH,09
           INT 21H
           
           CALL NEWLINE
           
           LEA DX,CHOICE
           MOV AH,09
           INT 21H
           
           RET 
             
             

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

         
 ;SHOW WRONG INPUT MSG ........................................................   
  WRONG_CAL:
             
             CALL SCS
             
             LEA DX,LEGAL1
             MOV AH,09H
             INT 21H
             
             CALL CALCULATOR
          
         WRONG_MENU:
             
             CALL SCS 
             
             LEA DX,LEGAL1     ;PRINT WRONG MSG
             MOV AH,09H
             INT 21H
             CALL MENU          ;RETURN CALCULATOR MENU
             
         WRONG_CON: 
             
             CALL SCS
             
             LEA DX,LEGAL1
             MOV AH,09H
             INT 21H
             
             ;CALL NUMBER_SYS  
             
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

             
;EXIT EMULATOR SCREEN 
        
EXIT:
            
            CALL NEWLINE   
            
            LEA DX,EXIT1
            MOV AH,09H      ;EXIT MSG PRINT
            INT 21H
            
           ; LEA DX, PC       ;PRINT CREADIT MSG
           ;; MOV AH,09H
           ; INT 21H
            
            MOV AH,4CH      ;CLOSE CONSOLE
            INT 21H       