module Main where -- define modulo main

-- Tipo para representar as operacoes matematicas e deriving permite comparar operadores 
data Operador = Soma | Sub | Mult | Div deriving (Eq)

-- define como mostrar os operacoes
instance Show Operador where
  show Soma = "+"
  show Sub  = "-"
  show Mult = "*"
  show Div  = "/"

-- Aplica a operacao escolhida sobre dois inteiros
aplicar :: Operador -> Int -> Int -> Int
aplicar Soma x y = x + y
aplicar Sub  x y = x - y
aplicar Mult x y = x * y
aplicar Div  x y = x `div` y   -- divisao inteira, falha se y == 0

-- Estrutura que representa uma expressao
-- Pode ser apenas um valor, ou a aplicacao de um operador entre duas expressoes
-- Valor 3
-- Aplica Soma (Valor 1) (Valor 2)
data Expressao = Valor Int | Aplica Operador Expressao Expressao

-- formatar expressao a ser mostrada
instance Show Expressao where
  show (Valor n) = show n
  show (Aplica o e1 e2) = colocaParenteses e1 ++ show o ++ colocaParenteses e2
    where
      -- Se for so um num, mostra direto. Se for expressao, coloca parenteses.
      colocaParenteses (Valor n) = show n
      colocaParenteses e         = "(" ++ show e ++ ")"

-- Avalia uma expressao, retornando uma lista de resultados possíveis
-- (descarta divisoes por zero)
-- Caso base: Se a expressao for apenas um valor, a lista de resultados e o proprio valor.
 -- O `concatMap` externo itera sobre cada valor 'x' possivel da sub-expressao `e1`.
-- Para cada `x`, ele aplica a funcao lambda (a parte `\x -> ...`).
-- O `concatMap` interno itera sobre cada valor 'y' possivel da sub-expressao `e2`.
 -- Para cada `y`, ele aplica a funcao lambda interna (a parte `\y -> ...`).
avaliar :: Expressao -> [Int]
avaliar (Valor n) = [n]
avaliar (Aplica o e1 e2) =
  concatMap (\x ->
    concatMap (\y ->
      if valido o x y then [aplicar o x y] else []
    ) (avaliar e2)
  ) (avaliar e1)

-- Validacao dos operadores
valido :: Operador -> Int -> Int -> Bool
valido Soma _ _ = True
valido Sub  _ _ = True
valido Mult _ _ = True
valido Div  _ y = y /= 0

-- Divide uma lista em todas as formas possiveis, preservando a ordem
dividir :: [a] -> [([a],[a])]
dividir [] = []
dividir [_] = []
dividir (x:xs) = ([x], xs) : [(x:ls, rs) | (ls, rs) <- dividir xs]

-- Lista de todos os operadores
operadores :: [Operador]
operadores = [Soma, Sub, Mult, Div]

-- Gera todas as expressoes possiveis com a lista de numeros
gerarExprs :: [Int] -> [Expressao]
gerarExprs []  = []
gerarExprs [n] = [Valor n]
gerarExprs ns  = [ Aplica o e1 e2
                 | (ls, rs) <- dividir ns
                 , e1 <- gerarExprs ls
                 , e2 <- gerarExprs rs
                 , o <- operadores ]

-- Encontra equacoes verdadeiras da forma "expr1 = expr2"
solucoes :: [Int] -> [String]
solucoes ns =
  [ show e1 ++ " = " ++ show e2
  | (ls, rs) <- dividir ns
  , e1 <- gerarExprs ls
  , e2 <- gerarExprs rs
  , v1 <- avaliar e1
  , v2 <- avaliar e2
  , v1 == v2
  ]

-- Funcao principal
main :: IO ()
main = do
  putStrLn "Digite a lista de números separados por espaço:"
  entrada <- getLine
  let numeros = map read (words entrada) :: [Int] -- transforma a entrada em lista de Int
  let eqs = solucoes numeros
  if null eqs
     then putStrLn "Nenhuma equação válida encontrada."
     else mapM_ putStrLn eqs
