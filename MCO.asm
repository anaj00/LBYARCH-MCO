; start with n int
; next int (n+1) is:
;   - if n is even, n+1 is (1/2*n)
;   - if n is odd, n+1 is 3n+1
; will always reach 1

; procedure:
; prompt for input
; input should be positive int
;   - error checking
; output: the sequence

%include "io64.inc"

section .bss
    num resd 1 ;reserve

section .data
    var1 times 4     db 0

section .text

global main

main:
    mov rbp, rsp; for correct debugging
    PRINT_STRING "Welcome to Collatz Conjecture Sequence Generator"
    NEWLINE
    NEWLINE
    
    PRINT_STRING "Input: "
    GET_DEC 8, RAX
    MOV [num], RAX
    
    NEWLINE
    
    ;Check if negative
    CMP qword [num], 0
    JL negative_input
    
    ;Clear RDX before division
    XOR RDX, RDX
    
    PRINT_STRING "Collatz Sequence: "
    
seq:
    PRINT_DEC 8, RAX
    PRINT_STRING ", "
    
    ;TODO: Execute if even
    TEST RAX, 1 
    JZ if_even
    
    ;TODO: Execute Odd
    IMUL RAX, 3
    ADD RAX, 1 
    
    JMP if_end
        
    
negative_input:
    PRINT_STRING "Error: negative number input"
    NEWLINE

invalid_input:
    PRINT_STRING "Invalid"
    JMP end
    
if_even: 
    SHR RAX, 1
    JMP if_end
    
if_end:
    CMP RAX, 1
    JE end

    JMP seq
       
end:
    ;We know that last number in Sequence is 1 which should be
    ;located in the last nibble of RAX
    PRINT_DEC 1, AL 
    NEWLINE
    
    PRINT_STRING "Do you want to continue (Y/N)? "
    GET_STRING [var1], 2 ; Clear enter from first INPUT
    GET_STRING [var1], 2 ; Read Char 
   
    CMP byte [var1+0], 'Y'
    JE main
    
    NOP
    XOR RAX, RAX
    RET