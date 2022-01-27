.MODEL SMALL
.STACK 100h
.DATA
    question DB 'Enter number: $'
    upperCase DB 'Successor: $' 
    lowerCase DB ' Predecessor: $'
.CODE
MAIN PROC 
    MOV AX, @DATA
    MOV DS,AX
    
    LEA DX,question
    MOV AH, 09H
    INT 21H
    
    MOV AH,01H
    INT 21H
    
    MOV BL,AL
    
    MOV AH,02H
    MOV DL, 0AH
    INT 21H 

    MOV DL,0DH
    INT 21H
    
    MOV AH,09H
    LEA DX,upperCase
    INT 21H
    
    MOV DL,BL
    INC DL
    
    MOV AH,02H
    INT 21H 
    
    
    MOV AH,09H
    LEA DX,lowerCase
    INT 21H
    
    MOV DL,BL
    DEC DL
    
    MOV AH,02H
    INT 21H
MAIN ENDP
END MAIN
