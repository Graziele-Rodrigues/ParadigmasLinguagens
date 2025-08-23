sum :: [Int] -> Int
sum = foldr (+) 0

reverse :: [a] -> [a]
reverse = foldr (\x acc -> acc ++ [x]) []

last :: [a] -> a
last = foldr1 (\_ y -> y)


half :: [a] -> ([a],[a])
half xs = foldr (\x (l,r) -> if length l <= length r then (x:l,r) else (l,x:r)) ([],[]) xs


freq :: Eq a => [a] -> [(a,Int)]
freq = foldr insere []
  where
    insere x [] = [(x,1)]
    insere x ((y,n):ys)
      | x == y    = (y,n+1):ys
      | otherwise = (y,n):insere x ys


data Tree a = Leaf a | Node (Tree a) (Tree a)
    deriving (Show)

toTree :: [a] -> Tree a
toTree = foldr (\x acc -> Node (Leaf x) acc) (error "lista vazia")
