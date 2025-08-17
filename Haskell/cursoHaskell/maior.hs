maior :: [Int] -> Int 
maior [x] = x 
maior (x:xs) | (x > maior xs) = x
             | otherwise = maior xs
