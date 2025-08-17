module Main where -- define modulo main

-- Tipo para representar as operações matemáticas e deriving permite comparar operadores 
data Operador = Soma | Sub | Mult | Div deriving (Eq)

-- define como mostrar os operacoes
instance Show Operador where
  show Soma = "+"
  show Sub  = "-"
  show Mult = "*"
  show Div  = "/"

-- Aplica a operação escolhida sobre dois inteiros
aplicar :: Operador -> Int -> Int -> Int
aplicar Soma x y = x + y
aplicar Sub  x y = x - y
aplicar Mult x y = x * y
aplicar Div  x y = x `div` y   -- divisão inteira, falha se y == 0

-- Estrutura que representa uma expressão
-- Pode ser apenas um valor, ou a aplicação de um operador entre duas expressões
-- Valor 3
-- Aplica Soma (Valor 1) (Valor 2)
data Expressao = Valor Int | Aplica Operador Expressao Expressao

-- formatar expressao a ser mostrada
instance Show Expressao where
  show (Valor n) = show n
  show (Aplica o e1 e2) = colocaParenteses e1 ++ show o ++ colocaParenteses e2
    where
      -- Se for só um número, mostra direto. Se for expressão, põe parênteses.
      colocaParenteses (Valor n) = show n
      colocaParenteses e         = "(" ++ show e ++ ")"

-- Avalia uma expressão, retornando uma lista de resultados possíveis
-- (descarta divisões por zero)
-- o é o operador, e1 e 2 sao subexpressoes
-- avaliar e1 devolve lista de valores possiveis para e1
-- avaliar e2 devolve lista de valores possiveis e2 
-- para cada x percorre todos valores possiveis de e2, um y de cada vez e guarda apenas se for valido
avaliar :: Expressao -> [Int]
avaliar (Valor n) = [n]
avaliar (Aplica o e1 e2) = [aplicar o x y | x <- avaliar e1, y <- avaliar e2, valido o x y] 

-- Validação dos operadores
valido :: Operador -> Int -> Int -> Bool
valido Soma _ _ = True
valido Sub  _ _ = True
valido Mult _ _ = True
valido Div  _ y = y /= 0

-- Divide uma lista em todas as formas possíveis, preservando a ordem
dividir :: [a] -> [([a],[a])]
dividir [] = []
dividir [_] = []
dividir (x:xs) = ([x], xs) : [(x:ls, rs) | (ls, rs) <- dividir xs]

-- Lista de todos os operadores
operadores :: [Operador]
operadores = [Soma, Sub, Mult, Div]

-- Gera todas as expressoes possiveis com a lista de números
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

-- Função principal
main :: IO ()
main = do
  putStrLn "Digite a lista de números separados por espaço:"
  entrada <- getLine
  let numeros = map read (words entrada) :: [Int] -- transforma a entrada em lista de Int
  let eqs = solucoes numeros
  if null eqs
     then putStrLn "Nenhuma equação válida encontrada."
     else mapM_ putStrLn eqs
