main = do
    print (let nums = [1, 2 .. 100] in (sum nums)^2 - sum [x^2 | x <- nums])
