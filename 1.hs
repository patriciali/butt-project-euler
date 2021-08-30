main = do
    print (let max = 10^3 in sum [x | x <- [1 .. (max - 1)], x `mod` 3 == 0 || x `mod` 5 == 0])
