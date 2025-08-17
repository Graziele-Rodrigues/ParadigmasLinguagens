module AlgData where 

data Boolean = Verdade | Falso 
        deriving Show

e :: Boolean -> Boolean -> Boolean 
e Verdade x = x
e Falso _ = Falso

data Nat = Z | Suc Nat
        deriving Show

int2Nat :: Int -> Nat
int2Nat 0 = Z
int2Nat n = Suc (int2Nat (n - 1))

nat2Int :: Nat -> Int
nat2Int Z = 0
nat2Int (Suc n) = 1 + nat2Int n 


data DiaSemana = Domingo | Segunda | Terca | Quarta | Quinta | Sexta | Sabado 
        deriving Show

data Mes = Janeiro | Fevereiro | Marco | Abril | Maio | Junho 
         | Julho | Agosto | Setembro | Outubro | Novembro | Dezembro
         deriving Show

data Calendario = Calendario DiaSemana Mes Int 
        deriving Show


data DuasFunc = F1 (Int -> Bool) | F2 (Int -> Char)
applyDF1 :: DuasFunc -> Int -> Char 
applyDF1 (F1 f) x = if f x then 'T' else 'F'
applyDF2 :: DuasFunc -> Int -> Char
applyDF2 (F2 f) x = f x


data Lista a = Vazia | LI Int a (Lista a)
        deriving Show

ehVazia :: Lista a -> Boolean
ehVazia Vazia = Verdade
ehVazia _ = Falso

lHead :: Lista a -> a
lHead (LI i _) = i


lConcat :: Lista a -> Lista a -> Lista a
lConcat Vazia ys = ys
lConcat xs Vazia = xs 
lConcat (LI x xs) ys = LI x (lConcat xs ys)

-- função total para casos onde a função original é parcial

data MMaybe a = MNothing | MJust a
        deriving Show

look:: (Eq a, Show a) => a -> [(a, b)] -> MMaybe b
look _ [] = MNothing
look x ((y, v):xs) = if x == y then MJust v else look x xs