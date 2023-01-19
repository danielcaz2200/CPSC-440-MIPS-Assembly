#Name: Jared De Los Santos
#Class: CPSC 440-04
    .globl main


    .text


main:
    #loop
    go_again:
    #this calls print string
        li $v0, 4
        la $a0, scale   #it will print scale string
        #syscall needed for the li $v0, 4 and 
        syscall
        li $v0, 12
        syscall
        #move value into $t0 of what was typed
        move $t0, $v0 

        #Exit the loop when the user types "Q/q".
        beq $t0,'q', exit
        beq $t0,'Q', exit

        #getting next string ready
        li $v0, 4
        #stores arguments ($t0-$t7 temporary not saved)
        la $a0, temp   #it will print temp string
        syscall
        #li $v0, 5 reads integer
        li $v0, 5
        syscall  #ask user to input the temp number
        move $t1, $v0  #store temperature


        #branch if equal so that when we fill in
        #one of the values, we jump to that branch
        beq $t0, 'f', fahrenheit
        beq $t0, 'F', fahrenheit
        beq $t0, 'c', celsius
        beq $t0, 'C', celsius


    #this is when we call f/F, then we jump here
    fahrenheit:
        #formula for conversion to celsius
        #C = (5/9)(F - 32)
        # $t2 = $t1 - 32
        sub $t2, $t1, 32
        #$t2 = $t2 * 5
        mul $t2, $t2, 5
        #$t2 = $t2 / 9
        div $t2, $t2, 9

        #get next string ready
        li $v0, 4
        la $a0, cTemp   #it will print fTemp sentence
        syscall

        #store fahrenheit 
        move $a0, $t2
        #li $v0, 1 prints integer
        li $v0, 1
        syscall
        
        #prints the type for conversion
        li $v0, 4
        la $a0, strC
        syscall
        #means it printed the conversion
        #jump to go_again until they press Q/q
        j go_again


    #this is when we call c/C we jump here
    celsius:
        #formula for conversion to fahrenheit
        #F = (9/5)C + 32
        #similar process
        mul $t2, $t1, 9
        div $t2, $t2, 5
        add $t2, $t2, 32

        #get next string ready
        li $v0, 4
        la $a0, fTemp   #it will print cTemp sentence
        syscall
        #store celsius
        move $a0, $t2
        #print integer
        li $v0, 1
        syscall

        li $v0, 4
        la $a0, strF
        syscall
        # move $a0, $t2
        # li $v0, 1
        # syscall
        #same reason for fahrenheit
        j go_again

    #called only when Q/q is pressed
    exit:
        li $v0, 4
        la $a0, close   #it will print close sentence
        syscall

    li $v0, 10  #sets this register to "10" to select exit syscall
    syscall     #exit

    .data
scale: .asciiz "\n\nEnter Scale : "
temp: .asciiz "\nEnter Temperature: "
cTemp: .asciiz "Celsius Temperature: "
fTemp: .asciiz "Fahrenheit Temperature:  "
close: .asciiz "\nExiting..."
strC: .asciiz "C"
strF: .asciiz "F"


