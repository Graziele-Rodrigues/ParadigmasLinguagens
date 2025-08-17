inv_lista :: [a] -> [a]
inv_lista [] = []
inv_lista (x:xs) = inv_lista xs ++ [x]