import Text.XHtml.Strict (p)
getFila = F [1,2,3,4]

novaFila :: Fila t
novaFila = F []

inserirFila :: Fila t -> t -> Fila t
inserirFila (F xs) x = F (xs ++ [x])

removerFila :: Fila t -> Fila t
removerFila (F []) = error "Fila vazia"
removerFila (F (_:xs)) = F xs

primeiroFila :: Fila t -> t
primeiroFila (F []) = error "Fila vazia"
primeiroFila (F (x:_)) = x

filaVazia :: Fila t -> Bool
filaVazia (F []) = True
filaVazia (F _) = False
