-- funcoes de ordem superior em haskell
-- map, filter, foldr, foldl

-- map recebe uma função e uma lista e aplica essa função a todos os elementos da lista, produzindo uma nova lista

map :: (a -> b) -> [a] -> [b]
map _ [] = []
map f (x:xs) = f x : map f xs

-- a assinatura de tipo diz que map recebe uma função de tipo a -> b e uma lista de tipo [a] e retorna uma lista de tipo [b]

--  filter é uma função que recebe um predicado e uma lista e retorna os elementos que satisfazem o predicado

filter :: (a -> Bool) -> [a] -> [a]
filter _ [] = []
filter p (x:xs)
    | p x       = x : filter p xs
    | otherwise = filter p xs

-- se p x for verdadeiro, x é incluído na lista resultante, caso contrário, é descartado

quickSort :: (Ord a) => [a] -> [a]
quickSort [] = []
quickSort (x:xs) = 
    let menores = quickSort(filter (<= x) xs)
        maiores = quickSort(filter (> x) xs)
    in menores ++ [x] ++ maiores

largestDivisible :: (Integral a) => a
largestDivisible = head (filter p [100000,99999..])
  where p x = x `mod` 3829 == 0


-- lambda é uma função anônima, ou seja, não tem nome
-- é definida com a palavra-chave \ (barra invertida) seguida dos parâmetros e do corpo da função

numLongChains :: Int
numLongChains = lenght (filter (\xs -> length xs > 15) (map chain [1..100]))
  where
    chain n
      | n == 1 = [1]
      | even n = n : chain (n `div` 2)
      | odd n = n : chain (3 * n + 1)

-- foldl é uma função que reduz uma lista a um único valor, aplicando uma função acumuladora a cada elemento da lista, da esquerda para a direita

soma :: (Num a) => [a] -> a
soma xs = foldl (\acc x -> acc + x) 0 xs

-- foldr é semelhante ao foldl, mas aplica a função acumuladora da direita para a esquerda
soma' :: (Num a) => [a] -> a
soma' xs = foldr (\x acc -> x + acc) 0 xsc
