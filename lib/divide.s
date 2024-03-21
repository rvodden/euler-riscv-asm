.global divide
.text

divide:
    # dividend: a0
    # divisor:  a1

    mv      a2,     a1                          # remainder
    mv      a1,     a0                          # quotient
    li      a0,     -1
    beqz    a2,     divide_end                  # if the dividend is zero, then the answer is zero

    li      a3,     1
    bgeu    a2,     a1,     .L2_done_dividing   # if the divisor is bigger than the dividend, then we're done

    .L1_keep_dividing:
    blez    a2,     .L2_done_dividing           # if the remainder is less than or equal to zero, then we're done
    slli    a2,     a2,     1
    slli    a3,     a3,     1
    bgtu    a1,     a2,     .L1_keep_dividing
    
    .L2_done_dividing:
    li      a0,     0

    .L3_not_done_yet:
    bltu    a1,     a2,     .L4
    sub     a1,     a1,     a2
    or      a0,     a0,     a3

    .L4:
    srli    a3,     a3,     1
    srli    a2,     a2,     1
    bnez    a3,     .L3_not_done_yet
divide_end:
    ret