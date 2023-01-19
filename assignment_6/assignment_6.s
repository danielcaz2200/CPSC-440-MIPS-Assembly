	.text

	.globl	main
main:

# load needed constants

user_input:
    li $v0, 4
    la $a0, scale
    syscall

    li $v0, 12
    syscall

    move $s0, $v0
    
    li $t0, 'q'
    beq $s0, $t0, endof

    li $t0, 'Q'
    beq $s0, $t0, endof

    li $v0, 4
    la $a0, lf
    syscall

    li $v0, 4
    la $a0, temperature
    syscall

    li $v0, 6 # value will be stored in $f0
    syscall

    li $t0, 'F'
    beq $s0, $t0, conv_cels

    li $t0, 'C'
    beq $s0, $t0, conv_fahr


conv_cels:
    l.s $f1, nine
    l.s $f2, five
    l.s $f3, alpha

    # 5/9
    div.s $f1, $f2, $f1

    # F - 32
    sub.s $f0, $f0, $f3

    mul.s $f1, $f0, $f1

    # celsius string
    li $v0, 4
    la $a0, celsius
    syscall

    # print float result
    li $v0, 2
    mov.s $f12, $f1
    syscall

    # newline
    li $v0, 4
    la $a0, lf
    syscall

    j user_input

conv_fahr:
    l.s $f1, nine
    l.s $f2, five
    l.s $f3, alpha

    # 9/5
    div.s $f1, $f1, $f2

    #(9/5)*C
    mul.s $f1, $f0, $f1

    #(9/5)*C+32
    add.s $f1, $f1, $f3

    # fahrenheit string
    li $v0, 4
    la $a0, fahrenheit
    syscall

    # print float result
    li $v0, 2
    mov.s $f12, $f1
    syscall

    # newline
    li $v0, 4
    la $a0, lf
    syscall

    j user_input

endof:
    li $v0, 4
    la $a0, done
    syscall

    li $v0, 10
    syscall

	.data
    alpha: .float 32.0
    nine: .float 9.0
    five: .float 5.0
    scale:	.asciiz	"Enter scale: "
    temperature:	.asciiz	"Enter temperature: "
    celsius: .asciiz "Celsius temp: "
    fahrenheit: .asciiz "Fahrenheit temp: "
    done: .asciiz "\nDone.\n"
    lf:     .asciiz	"\n"