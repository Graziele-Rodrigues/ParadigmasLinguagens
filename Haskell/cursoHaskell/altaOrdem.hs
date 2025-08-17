-- map recebe uma lista e aplica uma funcao a cada elemento da lista
dobraLista :: [Int] -> [Int]
dobraLista [] = []
dobraLista (x:xs) = (2*x) : dobraLista xs

-- imagine que queria agora fazer uma quadratica, seria semelhante a anterior, e ai que entra o map

mapInt :: (Int -> Int) -> [Int] -> [Int]
mapInt _ [] = []
mapInt f (x:xs) = f x : mapInt f xs

-- exemplo uso: mapInt (^2) [1..5]

-- filter recebe como argumento que testa cada elemento da lista e seleciona apenas aqueles que satisfazem a condição

filterInt :: (Int -> Bool) -> [Int] -> [Int]
filterInt _ [] = []
filterInt f (x:xs)
  | f x = x : filterInt f xs -- elemento satisfaz a condicao coloca logo ele entra na lista e analisa o restante da cauda
  | otherwise = filterInt f xs -- elemento nao satisfaz a condicao o elemento nao entra na lista, analisa apenas a cauda

-- exemplo uso: filterInt (>5) [1..10] 

-- foldr serve para reduzir (ou "dobrar") uma lista aplicando uma função acumuladora.
-- foldr :: (a -> b -> b) -> b -> [a] -> b
-- O primeiro argumento é uma função  que combina um elemento da lista (a) com o acumulador (b).
-- O segundo argumento é o valor inicial do acumulador
-- O terceiro argumento é a lista a ser percorrida.
-- Ele processa a lista da direita para a esquerda (por isso o r → right).

foldr' :: (a -> b -> b) -> b -> [a] -> b
foldr' f v []     = v
foldr' f v (x:xs) = f x (foldr' f v xs)

-- exemplo uso: foldr' (+) 0 [1..5] -- 15

length' :: [a] -> Int
length' = foldr' (\_ acc -> acc + 1) 0

-- foldl funciona da mesma forma que foldr, mas processa a lista da esquerda para a direita.