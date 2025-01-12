; Binary to Decimal Converter in EMU8086
        
include 'emu8086.inc'
ORG 100h

START:  
    MOV CX, 0         
    MOV BX, 0         
    MOV DX, 0       

    MOV AH, 09h
    LEA DX, MESSAGE_1
    INT 21h

INPUT:  
    MOV AH, 1      
    INT 21h
    CMP AL, 13        
    JE CONVERT
    CMP AL, '0'       
    JB INPUT        
    CMP AL, '1'      
    JA INPUT           
    SUB AL, '0'       
    SHL BX, 1         
    OR  BL, AL       
    JMP INPUT

CONVERT: 
    MOV CX, 10d       

TO_DECIMAL: 
    MOV AX, BX   
    MOV BX, 0      
    MOV SI, 1   

CONVERT_LOOP: 
    TEST AX, 1   
    JZ SKIP_ADD
    ADD BX, SI  
             
             
SKIP_ADD:   
    SHL SI, 1     
    SHR AX, 1       
    JNZ CONVERT_LOOP

    MOV AH, 09h
    LEA DX, MESSAGE_2
    INT 21h

PRINT_DEC: 
    MOV AX, BX
    MOV CX, 10d     
    MOV SI, 0       

PRINT_LOOP: 
    XOR DX, DX     
    DIV CX         
    ADD DL, '0'    
    PUSH DX       
    INC SI         
    CMP AX, 0
    JNE PRINT_LOOP 

PRINT_RESULT: 
    DEC SI
    POP DX       
    MOV AH, 2    
    INT 21h
    CMP SI, 0    
    JNZ PRINT_RESULT

END_PROGRAM: 
    MOV AH, 4Ch
    INT 21h

MESSAGE_1 DB 'Enter your binary number:', 0Dh, 0Ah, '$'
MESSAGE_2 DB 0Dh, 0Ah, 'DECIMAL NUMBER:', 0Dh, 0Ah, '$'

DEFINE_SCAN_NUM
DEFINE_PRINT_STRING
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
DEFINE_PTHIS

END
