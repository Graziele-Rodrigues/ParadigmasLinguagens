-- estrategia divisao e conquista

qsort :: Ord a => [a] -> [a]
qsort [] = []
qsort (x:xs) = qsort esq_x ++ [x] ++ qsort dir_x
  where
    esq_x = [y | y <- xs, y <= x]
    dir_x = [y | y <- xs, y > x]