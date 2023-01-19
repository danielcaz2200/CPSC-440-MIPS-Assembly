        .text
        .globl  main

main:
        addi $t0, $zero, 0x1A # load 26 into register
        sll  $t1, $t0, 2 # SLL shift left by 2 bits, 26 * 2^2 = 104

        li $v0, 10 # load immediate value 10 into $v0 for exit syscall
        syscall
