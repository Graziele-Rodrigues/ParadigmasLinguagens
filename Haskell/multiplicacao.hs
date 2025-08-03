multiplicacao :: Int -> Int -> Int 
multiplicacao x y
    | y == 0 = 0
    | otherwise = x + multiplicacao x (y - 1)