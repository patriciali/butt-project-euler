reduce :: [Int] -> (Int -> Int -> Int) -> Int -> Int
reduce (x:[]) reducer accumulator = reducer accumulator x
reduce (x:xs) reducer accumulator = reduce xs reducer (reducer accumulator x)

addElements :: [Int] -> Int
addElements xs = reduce xs (+) 0

main = do
    let nums = [1, 2 .. 100]
    print ((addElements nums)^2 - addElements [x^2 | x <- nums])
