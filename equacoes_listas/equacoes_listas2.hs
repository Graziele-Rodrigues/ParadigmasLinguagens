module Main where

-- Tipo para representar o valor de uma expressao (Int ou Bool)
data Resultado = ValInt Int | ValBool Bool deriving (Show, Eq)

-- Tipo para representar as operacoes
data Operador = Soma | Sub | Mult | Div
              | Maior | Menor | Igual
              | And | Or deriving (Eq)

-- Define como mostrar os operadores
instance Show Operador where
  show Soma   = "+"
  show Sub    = "-"
  show Mult   = "*"
  show Div    = "/"
  show Maior  = ">"
  show Menor  = "<"
  show Igual  = "=="
  show And    = "&&"
  show Or     = "||"

-- Estrutura de expressao
data Expressao = Valor Int | BoolVal Bool | Aplica Operador Expressao Expressao

-- Formatar a expressao para ser mostrada
instance Show Expressao where
  show (Valor n) = show n
  show (BoolVal b) = show b
  show (Aplica o e1 e2) = colocaParenteses e1 ++ " " ++ show o ++ " " ++ colocaParenteses e2
    where
      colocaParenteses (Valor n) = show n
      colocaParenteses (BoolVal b) = show b
      colocaParenteses e = "(" ++ show e ++ ")"

-- Aplica a operacao, retornando o novo tipo de Resultado
aplicar :: Operador -> Resultado -> Resultado -> Maybe Resultado
aplicar Soma (ValInt x) (ValInt y) = Just (ValInt (x + y))
aplicar Sub (ValInt x) (ValInt y) = Just (ValInt (x - y))
aplicar Mult (ValInt x) (ValInt y) = Just (ValInt (x * y))
aplicar Div (ValInt x) (ValInt y)
  | y /= 0    = Just (ValInt (x `div` y))
  | otherwise = Nothing
aplicar Maior (ValInt x) (ValInt y) = Just (ValBool (x > y))
aplicar Menor (ValInt x) (ValInt y) = Just (ValBool (x < y))
aplicar Igual (ValInt x) (ValInt y) = Just (ValBool (x == y))
aplicar And (ValBool x) (ValBool y) = Just (ValBool (x && y))
aplicar Or (ValBool x) (ValBool y) = Just (ValBool (x || y))
aplicar _ _ _ = Nothing -- Retorna Nothing para tipos de operando incompatíveis

-- Avalia a expressao
avaliar :: Expressao -> [Resultado]
avaliar (Valor n)  = [ValInt n]
avaliar (BoolVal b) = [ValBool b]
avaliar (Aplica o e1 e2) =
  [ res | x <- avaliar e1, y <- avaliar e2, Just res <- [aplicar o x y] ]

-- Divide a lista em todas as formas possiveis
dividir :: [a] -> [([a],[a])]
dividir [] = []
dividir [_] = []
dividir (x:xs) = ([x], xs) : [(x:ls, rs) | (ls, rs) <- dividir xs]

-- Lista de todos os operadores
operadores :: [Operador]
operadores = [Soma, Sub, Mult, Div, Maior, Menor, Igual, And, Or]

-- Gera todas as expressoes possiveis com a lista de numeros
gerarExprs :: [Int] -> [Expressao]
gerarExprs [] = []
gerarExprs [n] = [Valor n]
gerarExprs ns =
  [ Aplica o e1 e2
  | (ls, rs) <- dividir ns
  , e1 <- gerarExprs ls
  , e2 <- gerarExprs rs
  , o <- operadores
  , tipoValido o (avaliar e1) (avaliar e2)
  ]

-- Funcao de validao para a geracao de expressoes.
tipoValido :: Operador -> [Resultado] -> [Resultado] -> Bool
tipoValido o r1 r2
  | o `elem` [Soma, Sub, Mult, Div, Maior, Menor, Igual] =
      not (null r1) && isNum (head r1) && not (null r2) && isNum (head r2)
  | o `elem` [And, Or] =
      not (null r1) && isBool (head r1) && not (null r2) && isBool (head r2)
  | otherwise = False
  where
    isNum (ValInt _) = True
    isNum _          = False
    isBool (ValBool _) = True
    isBool _           = False

-- Encontra equacoes verdadeiras 
solucoes :: [Int] -> [String]
solucoes ns =
  [ show e
  | e <- gerarExprs ns
  , [res] <- [avaliar e]
  , res == ValBool True
  ]

-- Funcao principal
main :: IO ()
main = do
  putStrLn "Digite a lista de números separados por espaço:"
  entrada <- getLine
  let numeros = map read (words entrada) :: [Int]
  let eqs = solucoes numeros
  if null eqs
      then putStrLn "Nenhuma equação verdadeira encontrada."
      else mapM_ putStrLn eqs