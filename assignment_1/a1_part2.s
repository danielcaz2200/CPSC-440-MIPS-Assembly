# Daniel Cazarez assignment 1
    
    .globl main

    .text

main:   # execution begins here
    li $8, 0x0000000A # load immediate value 10 into $8
    or $9, $8, 0x00000007 # perform OR between 10 and 7, store result in $9

    li $v0, 10 # load immediate value 10 into $v0 for exit syscall
    syscall
