import sys
print('original recursion limit', sys.getrecursionlimit())
sys.setrecursionlimit(1000000)

zeta_cache = -1
def compute(n, k, a, b, c):
    global zeta_cache
    zeta_cache = -1

    lookup = dict()
    lookup['fab'] = dict()
    lookup['fba'] = dict()
    lookup['fac'] = dict()
    lookup['fca'] = dict()
    lookup['fbc'] = dict()
    lookup['fcb'] = dict()

    def zeta():
        global zeta_cache
        if zeta_cache >= 0:
            return zeta_cache
        result = E_ac() + E_ca()
        zeta_cache = result
        return result
    
    def F_ab(n):
        if n == 1:
            return E_ab() + zeta()
        if n in lookup['fab']:
            return lookup['fab'][n]
        result = F_ac(n-1) + F_cb(n-1)
        lookup['fab'][n] = result
        return result

    def F_ba(n):
        if n == 1:
            return E_ba() + zeta()
        if n in lookup['fba']:
            return lookup['fba'][n]
        result = F_bc(n-1) + F_ca(n-1)
        lookup['fba'][n] = result
        return result

    def F_ac(n):
        if n == 1:
            return E_ac() + zeta()
        if n in lookup['fac']:
            return lookup['fac'][n]
        result = F_ab(n-1) + F_bc(n-1)
        lookup['fac'][n] = result
        return result

    def F_ca(n):
        if n == 1:
            return E_ca() + zeta()
        if n in lookup['fca']:
            return lookup['fca'][n]
        result = F_cb(n-1) + F_ba(n-1)
        lookup['fca'][n] = result
        return result

    def F_bc(n):
        if n == 1:
            return E_bc() + zeta()
        if n in lookup['fbc']:
            return lookup['fbc'][n]
        result = F_ba(n-1) + F_ac(n-1)
        lookup['fbc'][n] = result
        return result

    def F_cb(n):
        if n == 1:
            return E_cb() + zeta()
        if n in lookup['fcb']:
            return lookup['fcb'][n]
        result = F_ca(n-1) + F_ab(n-1)
        lookup['fcb'][n] = result
        return result
        
    def E_ab():
        return (b-1)*(b-1) - (a-1)*(a-1)

    def E_ba():
        return (k-a)*(k-a) - (k-b)*(k-b)
    
    def E_ac():
        return (c-1)*(c-1) - (a-1)*(a-1)

    def E_ca():
        return (k-a)*(k-a) - (k-c)*(k-c)

    def E_bc():
        return (c-1)*(c-1) - (b-1)*(b-1)

    def E_cb():
        return (k-b)*(k-b) - (k-c)*(k-c)

    def E_ac_n():
        return E_ba() + F_ac(n) - zeta()

    result = E_ac_n()
    return result
#    print(result)
#    print('zeta', zeta())


print('2, 5, 1, 3, 5', compute(2, 5, 1, 3, 5))
print('3, 20, 4, 9, 17', compute(3, 20, 4, 9, 17))

modulo = 10**9
result = 0
for n in range(1, 10001, 1):
    if not n % 100:
        print(n)
    k = pow(10, n, modulo)
    a = pow(3, n, modulo)
    b = pow(6, n, modulo)
    c = pow(9, n, modulo)
    result += compute(n, k, a, b, c)
    result = result % modulo
print(result)
