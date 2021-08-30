isPalindrome :: Int -> Bool
isPalindrome n = reverseList nStringified == nStringified
    where nStringified = show n
          reverseList [] = []
          reverseList (x:xs) = (reverseList xs) ++ [x]

maxElement :: Ord a => [a] -> a
maxElement (x:[]) = x
maxElement (x:xs) = max x (maxElement xs)

main = do
    print (maxElement (filter isPalindrome [x*y | x <- [999, 998 .. 1], y <- [999, 998 .. 1]]))
