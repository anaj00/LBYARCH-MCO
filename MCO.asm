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
    even_divisor dw 2
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
    PRINT_DEC 8, RAX
    
    NEWLINE
    
    ;Check if negative
    CMP qword [num], 0
    JL negative_input
    
    ;Clear RDX before division
    XOR RDX, RDX
    ;TODO: Check if even
    div word [even_divisor]
    TEST DX, DX 
    JZ if_even
    ;TODO: Execute Odd
    JMP if_odd
    XOR rax, rax
    RET
    
negative_input:
    PRINT_STRING "Error: negative number input"
    NEWLINE

invalid_input:
    PRINT_STRING "Invalid"
    JMP end
if_even: 
    PRINT_STRING "Even "
    PRINT_DEC 8, [num]
    NEWLINE
    MOV RAX, [num]
    SHR RAX, 1
    PRINT_DEC 8, RAX
    NEWLINE
    JMP end
    
if_odd:
    PRINT_STRING "Odd "
    PRINT_DEC 8, [num]
    
    ;3n+1
    XOR RDX, RDX 
    MOV RCX, 3
    MOV RAX, [num]
    MUL RCX
    JC if_carry
    ADD RAX, 1
    NEWLINE
    PRINT_DEC 8, RAX
    PRINT_STRING "HI "
    JMP end
if_carry:
    PRINT_STRING "HI "
    ADD RAX, 1
    PRINT_DEC 8, RDX
    PRINT_DEC 8, RAX
    JMP end
end:
    NOP
    XOR rax, rax
    RET


    
    
    
    