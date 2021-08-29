phi :: Double
phi = (1 + sqrt 5) / 2
psi = 1 - phi

fib :: Int -> Int
fib n = floor ((phi ** (fromIntegral n) - psi ** (fromIntegral n)) / (sqrt 5) + 1/2)

main = do
    let max = 4 * 10^6
    print (sum (takeWhile (< max) (filter even (map fib [1..]))))
