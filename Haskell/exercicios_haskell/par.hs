-- defina uma função f n tal que 
    -- se n < 10 entao f(n) = n
    -- se n é par o resultado é f(n-1/3) 
    -- se n é ímpar o resultado é f(2*(n+1))


-- Função f conforme as regras definidas
f :: Int -> [Int]
f n
  | n < 10 = [n]
  | n `mod` 2 == 0 = n : f ((n-1) `div` 3)
  | otherwise = n : f (2 * (n + 1))


-- pega um n e uma lista e retorna os n primeiros elementos da lista
upto :: Int -> [Int] -> [Int]
upto 0 _ = []
upto _ [] = []
upto n (x:xs) = x : upto (n-1) xs



