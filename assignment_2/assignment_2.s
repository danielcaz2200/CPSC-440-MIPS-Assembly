# Daniel Cazarez assignment 2

        .text
        .globl  main

main:
        addi $8, $0, 146 # t0 = 146
        addi $9, $0, -82 # t1 = -82
        add $10, $8, $9 # t2 ($10) = 146 - 82 = 64

        li $v0, 1 # print int to test
        move $a0, $10 # move number to print to $a0
        syscall

        li $v0, 10 # load immediate value 10 into $v0 for exit syscall
        syscall

