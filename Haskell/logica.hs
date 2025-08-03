not3 :: Int -> Int
not3 0 = 1
not3 1 = 0
not3 2 = 2
not3 _ = error "Entrada inválida: use 0 (F), 1 (V) ou 2 (I)"

and3 :: Int -> Int -> Int
and3 0 _ = 0
and3 _ 0 = 0
and3 1 1 = 1
and3 1 2 = 2
and3 2 1 = 2
and3 2 2 = 2
and3 _ _ = error "Entradas inválidas: use 0 (F), 1 (V) ou 2 (I)"

or3 :: Int -> Int -> Int
or3 1 _ = 1
or3 _ 1 = 1
or3 0 0 = 0
or3 0 2 = 2
or3 2 0 = 2
or3 2 2 = 2
or3 _ _ = error "Entradas inválidas: use 0 (F), 1 (V) ou 2 (I)"