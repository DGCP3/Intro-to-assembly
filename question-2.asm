.MODEL SMALL
.STACK 100h
.DATA
    question1 DB 'ENTER A: $',0AH,0DH
    question2 DB 0AH,0DH,'ENTER B: $'
    upperCase DB 0AH,0DH,'Sum: $'
    lowerCase DB 0AH,0DH,'Difference: $'
    response3 DB 0AH,0DH,'Product: $'
    input1 DB ?
    input2 DB ?
.CODE
MAIN PROC 
    MOV AX, @DATA
    MOV DS,AX
    LEA DX,question1
    MOV AH, 09H
    INT 21H
    MOV AH,01H
    INT 21H
    SUB AL, 30H
    MOV input1,AL
    LEA DX,question2
    MOV AH,09H
    INT 21H
    MOV AH,01H
    INT 21H
    SUB AL, 30H
    MOV input2,AL
    SUM:
        LEA DX,upperCase
        MOV AH,09H
        INT 21H
        
        MOV AL, input1      
        ADD AL, input2
        
        MOV DL,AL
        ADD DL,30H
        
        MOV AH,02H
        INT 21H
    DIFF:
        LEA DX,lowerCase
        MOV AH,09H
        INT 21H
        MOV AL, input1
        CMP AL,input2
        JL LESS
        SUB AL, input2
        MOV DL,AL
        ADD DL,30H
        MOV AH,02H
        INT 21H 
        JMP PROD
        LESS:
            MOV AL,input2
            SUB AL, input1 
            MOV DL,AL
            ADD DL,30H
            MOV AH,02H
            INT 21H 
    PROD:
        LEA DX,response3
        MOV AH,09H
        INT 21H
        MOV AL, input1
        MUL input2
        MOV DL, AL
        ADD DL,30H
        MOV AH,02H
        INT 21H
        
MAIN ENDP
END MAIN
