lcmList :: [Int] -> Int
lcmList xs = foldl lcm 1 xs
    where lcm :: Int -> Int -> Int
          -- I'm doing p, 2*p, etc. because p is the accumulated value and therefore usually bigger than q
          lcm p q = find isDivisibleByQ [p, 2*p ..]
              where find :: (a -> Bool) -> [a] -> a
                    find propertyFunc [] = error "no element found which satisfies the property"
                    find propertyFunc (x:xs)
                       | propertyFunc x = x
                       | otherwise = find propertyFunc xs

                    isDivisibleByQ :: Int -> Bool
                    isDivisibleByQ x = x `mod` q == 0

main = do
    print (lcmList [1, 2 .. 20])
