.global _start      # Provide program starting address to linker
.text

# Setup the parameters to print hello world
# and then call Linux to do it.

_start: 
    li      a0, 15             # get the lcm of two numbers
    li      a1, 5
    jal     divide                          

    mv      s3,     a1
    jal     print
    mv      a0,     a3
    jal     print
    jal     exit


# print the number in a0 to the console
print:
    addi    sp,     sp,     16    # reserve a slot on the stack
    sw      s0,     16(sp)
    sw      ra,     8(sp)         # put the return address on the stack   
    mv      a1,     a0            # put the number in a0 in a1
    la      a0,     output        # put the address of the output string in a0
    call    printf
    lw      ra,     8(sp)         # put the retun address back
    lw      s0,     16(sp)
    addi    sp,     sp,     16    # free the stack
    ret                         


# Setup the parameters to exit the program
# and then call Linux to do it.
exit_success:
    li      a0, 0                         # Use 0 return code

exit:
    li      a7, 93                        # Service command code 93 terminates
    ecall                                 # Call linux to terminate the program

.section .rodata
output: .string "%d\n"
