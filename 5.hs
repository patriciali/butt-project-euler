lcmList :: [Int] -> Int
lcmList xs = reduce xs lcm 1
    where lcm p q = find isDivisibleByQ [p, 2*p ..]
              where find :: (a -> Bool) -> [a] -> a
                    find propertyFunc [] = error "no element found which satisfies the property"
                    find propertyFunc (x:xs)
                       | propertyFunc x = x
                       | otherwise = find propertyFunc xs

                    isDivisibleByQ :: Int -> Bool
                    isDivisibleByQ x = x `mod` q == 0

          reduce :: [Int] -> (Int -> Int -> Int) -> Int -> Int
          reduce (x:[]) reducer accumulator = reducer accumulator x
          reduce (x:xs) reducer accumulator = reduce xs reducer (reducer accumulator x)

main = do
    print (lcmList [1, 2 .. 20])
