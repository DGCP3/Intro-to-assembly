.MODEL SMALL
.STACK 100h
.DATA
    question1 DB 'ENTER FIRST NO : $'
    question2 DB 'ENTER SECOND NO: $'  
    GREAT DB ' IS GREATER$'  
    EQUAL DB 'THEY ARE EQUAL$'
.CODE
MAIN PROC 
    MOV AX, @DATA
    MOV DS,AX
    LEA DX, question1
    MOV AH, 09H 
    INT 21H
    MOV AH,01H
    INT 21H
    MOV BH,AL    
    MOV AH,02H  
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    LEA DX, question2
    MOV AH,09H
    INT 21H
    MOV AH,01H
    INT 21H
    MOV BL,AL 
    MOV AH,02H   
    MOV DL,0DH  
    INT 21H   
    MOV DL,0AH
    INT 21H
    COMPARE:
        CMP BH,BL
        JL LESS
        JG GREATER
        JE EQUALITY    
    GREATER: 
        MOV DL,BH 
        INT 21H
        MOV AH,09H 
        LEA DX, GREAT
        INT 21H
        JMP EXIT
    LESS: 
        MOV DL,Bl 
        INT 21H
        MOV AH,09H 
        LEA DX, GREAT
        INT 21H
        JMP EXIT         
    EQUALITY:
        MOV AH, 09H
        LEA DX,EQUAL
        INT 21H
    EXIT: 
MAIN ENDP
END MAIN
