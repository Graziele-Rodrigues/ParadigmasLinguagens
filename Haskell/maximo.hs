maximo :: (Ord a) => a -> a -> a -- Ord a é uma classe de tipos que suporta comparação, recbe dois valores do tipo a e retorna o maior deles 
maximo x y 
    | x > y = x
    | otherwise = y -- se x não for maior que y, então y é o maior
