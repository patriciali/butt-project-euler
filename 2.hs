fib :: Int -> Int
fib n = floor ((phi ** n' - psi ** n') / (sqrt 5) + 1/2)
    where phi = (1 + sqrt 5) / 2
          psi = 1 - phi
          n' = fromIntegral n

main = do
    print (let max = 4 * 10^6 in sum (takeWhile (< max) (filter even (map fib [1..]))))
