quicksorted :: (Ord a) => [a] -> [a]
quicksorted [] = []
quicksorted (x:xs) = 
    let menoresOuIguais = quicksorted [a | a <- xs, a <= x]
        maiores = quicksorted [a | a <- xs, a > x]
    in menoresOuIguais ++ [x] ++ maiores