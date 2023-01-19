        .text

        .globl  main

main:
    # print original string
    li $v0, 4
    la $a0, string
    syscall

    la $t0, string
    li $s0, 0 #iterator
    li $s1, 6
tolower:
    # branch if iterator > last index
    bgt $s0, $s1, end

    # else load byte
    add $t1, $t0, $s0
    lb $s2, 0($t1)

    # add value to loaded byte and store
    addiu $s2, 0x20
    sb $s2, 0($t1)
    addi $s0, $s0, 1

    # jump to loop begin
    j tolower
end:
    # print new string
    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 4
    la $a0, string
    syscall

    li $v0, 10
    syscall

        .data
newline: .asciiz "\n"
string: .asciiz "ABCDEFG"
