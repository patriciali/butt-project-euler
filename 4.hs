_reverseList :: [a] -> [a]
_reverseList [] = []
_reverseList (x:xs) = (_reverseList xs) ++ [x]

isPalindrome :: Int -> Bool
isPalindrome n = _reverseList (show n) == show n

maxElement :: Ord a => [a] -> a
maxElement (x:[]) = x
maxElement (x:xs) = max x (maxElement xs)

main = do
    print (maxElement (filter isPalindrome [x*y | x <- [999, 998 .. 1], y <- [999, 998 .. 1]]))
