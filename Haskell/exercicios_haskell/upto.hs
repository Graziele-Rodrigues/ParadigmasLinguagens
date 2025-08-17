-- pega um n e uma lista e retorna os n primeiros elementos da lista
upto :: Int -> [Int] -> [Int]
upto 0 _ = []
upto _ [] = []
upto n (x:xs) = x : upto (n-1) xs
