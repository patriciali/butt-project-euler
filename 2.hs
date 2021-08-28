main = do
    let phi = (1 + sqrt 5) / 2
    let psi = 1 - phi
    let fib n = floor ((phi ** n - psi ** n) / (sqrt 5) + 1/2)

    let max = 4 * 10^6
    print (sum (takeWhile (< max) (filter even (map fib [1..]))))
