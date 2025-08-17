mcCarthy91 :: Int -> Int 
mcCarthy91 n
    | n > 100 = n-10
    | otherwise = mcCarthy91 (mcCarthy91 (n+11))
