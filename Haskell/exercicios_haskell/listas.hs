import System.Win32 (xBUTTON1)
-- funções para lidar com listas 

-- head: recebe uma lista e retorna o primeiro elemento
-- tail: recebe uma lista e retorna a lista sem o primeiro elemento
-- last: recebe uma lista e retorna o último elemento
-- init: recebe uma lista e retorna a lista sem o último elemento
-- length: recebe uma lista e retorna o número de elementos da lista
-- null: verifica se a lista é vazia
-- reverse: recebe uma lista e retorna a lista invertida
-- take: recebe um número n e uma lista, retorna os primeiros n elementos da lista
-- drop: recebe um número n e uma lista, retorna a lista sem os primeiros n elementos
-- maximum: recebe uma lista e retorna o maior elemento
-- minimum: recebe uma lista e retorna o menor elemento
-- sum: recebe uma lista de números e retorna a soma dos elementos
-- product: recebe uma lista de números e retorna o produto dos elementos
-- elem: recebe um elemento e uma lista, verifica se o elemento está na lista
-- compreensão em listas: [x* 2  |  x  <-  [ 1 .. 10 ]]  retorna uma lista com os elementos [2,4,6,8,10,12,14,16,18,20], 
-- [ x  |  x  <-  [ 50 .. 100 ], x  `mod` 7  ==  3 ] retorna uma lista de todos os números de 50 a 100 com o resto dividido pelo número 7 como 3


atIndex :: [a] -> Int -> a
atIndex (x:_) 0 = x
atIndex (_:xs) n
  | n > 0 = atIndex xs (n - 1)
  | otherwise = error "Index fora do limite"


idubs :: [Int] -> Bool
idubs [] = False
idubs (x:xs)
  | x `elem` xs = True -- se x ja esta em xs
  | otherwise   = idubs xs -- se x nao esta em xs, continua percorrendo a lista

inubs :: [Int] -> [Int]
inubs [] = []
inubs (x:xs)
    | x `elem` xs = inubs xs -- se x ja esta em xs, nao adiciona
    | otherwise   = x : inubs xs -- se x nao esta em xs, adiciona x e continua percorrendo a lista


iunion :: [Int] -> [Int] -> [Int]
iunion xs [] = xs
iunion xs (y:ys)
  | y `elem` xs = iunion xs ys -- se y ja esta em xs, continua percorrendo ys
  | otherwise   = iunion (xs ++ [y]) ys -- se y nao esta em xs, adiciona y ao final de xs e continua percorrendo ys


deIntercalate :: [a] -> ([a], [a])
deIntercalate [] = ([], [])
deIntercalate [x] = ([x], [])
deIntercalate (x:y:rest) =
  let (evens, odds) = deIntercalate rest
  in (x:evens, y:odds)
