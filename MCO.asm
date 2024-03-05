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
    
section .text
global main
main:
    PRINT_STRING "Welcome to Collatz Conjecture Sequence Generator"
    NEWLINE
    NEWLINE
    
    PRINT_STRING "Input: "
    GET_DEC 8, RAX
    MOV [num], RAX
    PRINT_DEC 8, RAX
    NEWLINE
    
    ; TODO: Check if negative
    CMP dword [num], 0
    JL negative_input
    
    
    
    xor rax, rax
    ret
    
negative_input:
    PRINT_STRING "Error: negative number input"

invalid_input:
    PRINT_STRING "Invalid"
    

    
    
    
    