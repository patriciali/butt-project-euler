patriciaFind :: (a -> Bool) -> [a] -> a
patriciaFind propertyFunc [] = error "no element found which satisfies the property"
patriciaFind propertyFunc (x:xs)
    | propertyFunc x = x
    | otherwise = patriciaFind propertyFunc xs

isNotDivisibleByAnyOf :: [Int] -> Int -> Bool
isNotDivisibleByAnyOf (x:[]) p = p `mod` x /= 0
isNotDivisibleByAnyOf (x:xs) p
    | p `mod` x == 0 = False
    | otherwise = isNotDivisibleByAnyOf xs p

prependNextPrime :: [Int] -> [Int]
prependNextPrime xs = (patriciaFind (isNotDivisibleByAnyOf (reverse xs)) [largestElement + 2, largestElement + 4 ..]):xs
    where largestElement = xs !! 0

applyNTimes :: (a -> a) -> Int -> a -> a
applyNTimes function n accumulator
    | n == 0 = accumulator
    | otherwise = applyNTimes function (n - 1) (function accumulator)

getFirstNPrimes :: Int -> [Int]
getFirstNPrimes n = applyNTimes prependNextPrime (n - 4) [7, 5, 3, 2]

main = do
    print (head (getFirstNPrimes 10001))
