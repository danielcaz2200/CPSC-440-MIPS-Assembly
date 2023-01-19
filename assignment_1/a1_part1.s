# Daniel Cazarez assignment 1
    
    .globl main

    .text

main:   # execution begins here
    li $t1, 3 # load immediate 3 into register t0
    li $t2, 2 # load immediate 2 into register t1
    add $t1, $t1, $t2 # t1 += t2

    li $v0, 10 # load immediate value 10 into $v0 for exit syscall
    syscall
