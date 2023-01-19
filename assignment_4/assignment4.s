        .text

        .globl  main

main:
        ori $t0, $zero, 0x5 # avg number
        ori $t1, $zero, 0x0 # sum

        li $t2, 0x10010000 # load symbolic address of first byte of .data
        
        lbu $t3, 0($t2) # load 12 into t3

        addu $t1, $t1, $t3

        lbu $t3, 1($t2) # load 97 into t3

        addu $t1, $t1, $t3

        lbu $t3, 2($t2) # load 133 into t3

        addu $t1, $t1, $t3

        lbu $t3, 3($t2) # load 82 into t3

        addu $t1, $t1, $t3

        lbu $t3, 4($t2) # load 236 into t3

        addu $t1, $t1, $t3 # t1 now holds sum

        divu $t1, $t0

        mflo $t4

        # store byte in res
        la $s0, res
        sb $t4, 0($s0)

        # li $v0, 4 # syscall code for string
        # la $a0, avg # print avg message
        # syscall

        # li $v0, 1 # print int to test
        # move $a0, $t4 # move number to print to $a0
        # syscall

        li $v0, 10 # load immediate value 10 into $v0 for exit syscall
        syscall

        .data
b1:     .byte 12
b2:     .byte 97
b3:     .byte 133
b4:     .byte 82
b5:     .byte 236
res:    .byte 0
avg:    .asciiz "The average is: "
