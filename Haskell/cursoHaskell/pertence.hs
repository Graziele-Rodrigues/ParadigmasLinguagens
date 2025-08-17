pertence :: [Int] -> Int -> Bool
pertence [] _ = False
pertence (x:xs) y
    | x == y = True
    | otherwise = pertence xs y