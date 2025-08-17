import Distribution.ModuleName (main)

-- obtem sequencia numeros
getSeq :: [Int]
getSeq = [x | x <- [1..10]]

binSearch :: [Int] -> Int -> Int -> Int -> Int -> Int
binSearch vet num lim_baixo lim_alto tentativas
  | vet!!meio > num = binSearch vet num lim_baixo meio (tentativas + 1)
  | vet!!meio < num = binSearch vet num meio lim_alto (tentativas + 1)
  | otherwise = tentativas
  where
    meio = div (lim_baixo + lim_alto) 2

main :: IO ()
main = do
  let seq = getSeq
  print seq
  let resultado = binSearch seq 5 0 (length seq - 1) 0
  print resultado