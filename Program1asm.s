.text
main:
    addi $4, $0, 27           # $4 = 27
    xori $5, $4, 5            # $5 = $4 XOR 5 -> $5 = 27 ^ 5 = 30
    add $6, $4, $5            # $6 = $4 + $5 -> $6 = 27 + 30 = 57
    sub $7, $5, $4            # $7 = $5 - $4 -> $7 = 30 - 27 = 3
    slt $8, $7, $6            # $8 = ($7 < $6) ? 1 : 0 -> $8 = 1
    or $9, $7, $0             # $9 = $7 OR $0 -> $9 = 3 | 0 = 3
    and $10, $7, $0           # $10 = $7 AND $0 -> $10 = 3 & 0 = 0
    sll $11, $7, 1            # $11 = $7 << 1 -> $11 = 3 * 2 = 6
    srl $12, $7, 1            # $12 = $7 >> 1 -> $12 = 3 / 2 = 1
    slt $13, $8, $7           # $13 = ($8 < $7) ? 1 : 0 -> $13 = 1 (since 1 < 3)
    li $14, 0x10010000        # Set base address in $14 to start of valid data segment
    li $15, 110               # $15 = 110
    li $16, 120               # $16 = 120
    sw $15, 4($14)            # Store $15 (110) into memory at address ($14 + 4)
    sw $16, 8($14)            # Store $16 (120) into memory at address ($14 + 8)
    lw $17, 4($14)            # Load memory at address ($14 + 4) into $17 -> $17 = 110
    
    # Exit or finish main routine (optional, depends on environment)
    nop                       # Placeholder to indicate end of program
