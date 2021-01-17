import math

k = 10**8
n = 10**16
modulo = 1000000007
pow_2 = pow(2, -2*n//k, modulo)
print(pow_2)

current_term = pow(2, n, modulo)
result = 0
for i in range(0, int(k/2) + 1, 1):
    result += current_term
    result = result % modulo
    
    numerator = (k - 2*i)*(k - 2*i - 1)
    denominator = pow((i+1) * (i+1), -1, modulo) * pow_2
    current_term = current_term * numerator * denominator % modulo

print(result)
