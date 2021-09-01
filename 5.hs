reduce :: [Int] -> (Int -> Int -> Int) -> Int -> Int
reduce (x:[]) reducer accumulator = reducer accumulator x
reduce (x:xs) reducer accumulator = reduce xs reducer (reducer accumulator x)

patriciaFind :: (a -> Bool) -> [a] -> a
patriciaFind propertyFunc [] = error "no element found which satisfies the property"
patriciaFind propertyFunc (x:xs)
    | propertyFunc x = x
    | otherwise = patriciaFind propertyFunc xs

patriciaLcm :: Int -> Int -> Int
patriciaLcm p q = patriciaFind isDivisibleByQ [p, 2*p ..]
    where isDivisibleByQ x = x `mod` q == 0

lcmList :: [Int] -> Int
lcmList xs = reduce xs patriciaLcm 1

main = do
    print (lcmList [1, 2 .. 20])
