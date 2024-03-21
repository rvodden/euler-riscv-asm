.global gcd
.text

# gcd(A, B):
#     if A == B: return A  
#     if (A < B): swap A and B
#     if (B == 0) return A
#     return gcd (A - B, B)

gcd:
    # a0 - first value
    # a1 - second value    
    beq     a0, a1, lcm_end             # if A == B then lcm_end
    bgt     a0, a1, a_greater_than_b    # if A > B then jump to a_greater_than_b

    mv      t0, a0                      # swap A and B
    mv      a0, a1
    mv      a1, t0

a_greater_than_b:
    beq     a1, zero, lcm_end           # if B is zero then we are done, A is the lcm
    sub     a0, a0, a1                  # A = A - B
    j       lcm

lcm_end:
    ret
