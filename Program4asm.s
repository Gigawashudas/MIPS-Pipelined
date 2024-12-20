addi $s0, $0, 10              # $s0 = 10
addi $s1, $0, 20              # $s1 = 20
addi $s2, $0, 30              # $s2 = 30
addi $s3, $0, 40              # $s3 = 40
addi $s4, $0, 50              # $s4 = 50
addi $s5, $0, 5               # $s5 = array size (5)
addi $t0, $0, 0               # $t0 = loop counter
li $s6, 0x10010000            # $s6 = base address of memory block

L1:
    sll $t1, $t0, 2           # $t1 = $t0 * 4 (word offset)
    add $t1, $s6, $t1         # $t1 = $s6 + $t1 (address calculation)
    sw $s0, 0($t1)            # Store $s0 at address $t1
    addi $s0, $s0, 10         # Increment $s0 by 10
    addi $t0, $t0, 1          # Increment loop counter
    bne $t0, $s5, L1          # If $t0 != $s5, repeat loop

addi $s7, $0, 20              # $s7 = 20
move $a0, $s7                 # Pass $s7 to sum function
jal sum                       # Call sum function
move $t3, $v0                 # Use $t3 for intermediate result

addi $t0, $0, 0               # Reset loop counter
L2:
    sll $t1, $t0, 2           # $t1 = $t0 * 4 (word offset)
    add $t1, $s6, $t1         # $t1 = $s6 + $t1 (address calculation)
    lw $t2, 0($t1)            # Load word from memory to $t2
    add $t3, $t3, $t2         # Add loaded value to $t3
    addi $t0, $t0, 1          # Increment loop counter
    bne $t0, $s5, L2          # If $t0 != $s5, repeat loop

# Store the final result in dmem
sw $t3, 0($s6)                # Store $t3 (final result) at base address ($s6)

j Exit                        # Jump to Exit

sum:
    add $v0, $a0, $a0         # $v0 = $a0 + $a0
    jr $ra                    # Return to caller

Exit:
    nop                       # End of program
