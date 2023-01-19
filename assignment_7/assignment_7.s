    .data
prompt1: .asciiz "\nPlease enter the first value (A): "
prompt2: .asciiz "\nPlease enter the second value (X): "
prompt3: .asciiz "\nPlease enter the third value (Z): "
executing_sub: .asciiz "\nExecuting subroutine...\n"
product: .asciiz "\nThe product is A*X*Z: "
endmsg: .asciiz "\n\nThe program finished successfully."
goagain: .asciiz "\n\nEnter q to quit, or any other key to run it again: "

    .text
main:
    # prompt 1
    li $v0, 4
    la $a0, prompt1
    syscall

    # get input 1
    li $v0, 5
    syscall

    # store in arg register
    move $t0, $v0

    # prompt 2
    li $v0, 4
    la $a0, prompt2
    syscall
    
    # get input 2
    li $v0, 5
    syscall

    # store in arg register
    move $a1, $v0
    
    # prompt 2
    li $v0, 4
    la $a0, prompt3
    syscall

    # get input 2
    li $v0, 5
    syscall

    # store in arg register
    move $a2, $v0

    # message to execute subroutine
    li $v0, 4
    la $a0, executing_sub
    syscall

    # put correct value into $a0
    move $a0, $t0

    jal procedure

    # store return val
    move $s0, $v0

    # product string
    li $v0, 4
    la $a0, product
    syscall

    # print num
    li $v0, 1
    move $a0, $s0
    syscall

    # print message asking
    # user if they want to loop again
    li $v0, 4
    la $a0, goagain
    syscall

    # take in char input
    li $v0, 12
    syscall

    # compare to literal 'q'
    beq $v0, 'q', endprog

    j main

endprog:
    # end of prog execution
    li $v0, 4
    la $a0, endmsg
    syscall

    li $v0, 10
    syscall

procedure:
    # $v0 = A * X
    mul $v0, $a0, $a1

    # $v0 = A * X * Z
    mul $v0, $v0, $a2
    
    jr $ra # return to call point
