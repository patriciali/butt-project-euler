from math import e, factorial

def d(n): # this returns d(n, 0)
    return int(factorial(n)/e + 0.5)

def choose(n, k):
    return factorial(n)/(factorial(k)*factorial(n-k))

tits = sum([d(22 + i)*choose(75, i) for i in range(76)])
print (tits * choose(25, 3) + 0.0) / factorial(100)
