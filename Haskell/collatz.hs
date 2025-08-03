collatz :: Int -> Int
collatz 1 = 1
collatz n
  | even n    = n `div` 2 -- se n é par, divide por 2
  | otherwise = 3 * n + 1 -- se n é ímpar, multiplica por 3 e soma 1