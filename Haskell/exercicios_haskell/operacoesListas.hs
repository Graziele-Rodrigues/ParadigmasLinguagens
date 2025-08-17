-- pega uma lista e retorna a soma dos seus elementos
summation :: [Int] -> Int
summation [] = 0
summation (x:xs) = x + summation xs

-- faz o produto dos elementos de uma lista
prods :: [Int] -> Int
prods [] = 1
prods (x:xs) = x * prods xs


-- retorna maior elemento de uma lista
maxElement :: [Int] -> Int
maxElement [] = 0  
maxElement [x] = x  
maxElement (x:xs) = if x > maxElement xs then x else maxElement xs

-- retorna menor elemento de uma lista
minElement :: [Int] -> Int
minElement [] = 0 
minElement [x] = x  
minElement (x:xs) = if x < minElement xs then x else minElement xs

-- retorna o maior e o menor elemento de uma lista
minMax :: [Int] -> (Int, Int)
minMax [] = (0, 0)  
minMax [x] = (x, x)  
minMax (x:xs) = (minElement (x:xs), maxElement (x:xs))



-- minMax do professor

aux :: (Int, Int) -> Int -> (Int, Int)
aux (x,y) z 
    | z < x = (z,y)
    | z > y = (x,z)
    | otherwise = (x,y)

minMaxElementos :: [Int] -> (Int, Int)
minMaxElementos (x:xs) = mn (x,x) xs

mn p [] = p
mn p (x:xs) = mn (aux p x) xs
