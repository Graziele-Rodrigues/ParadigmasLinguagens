maxRecursivo :: (Ord a) => [a] -> a  -- Ord a permite que a função funcione com qualquer tipo que tenha uma ordem definida
maxRecursivo [] = error "lista vazia"  
maxRecursivo [x] = x  
maxRecursivo (x:xs)  
    | x > maxTail = x  
    | otherwise = maxTail  
    where maxTail = maxRecursivo xs 