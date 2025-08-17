data Tree a =  Nil | Branch (Tree a) a (Tree a) deriving (Show, Eq)

foldT :: (a -> b -> b -> b) -> b -> Tree a -> b 
foldT f v Nil = v 
foldT f v (Branch te r td) = f r (foldT f v te) (foldT f v td)

texA :: Tree Int
texA = Branch (Branch (Branch Nil 5 Nil) 2 (Branch Nil 3 Nil)) 1 (Branch Nil 4 Nil)

-- calculo altura arvore usando foldT 
-- Calcule a altura da subárvore esquerda (h_esquerda).
-- Calcule a altura da subárvore direita (h_direita).
-- A altura do nó atual é 1 + max(h_esquerda, h_direita). 

altura :: Tree a -> Int
altura = foldT f 0
  where f _ h_esq h_dir = 1 + max h_esq h_dir