data ArvBin = Nulo | No Int ArvBin ArvBin deriving (Show, Eq)

arv :: ArvBin
arv = No 10 (No 5 Nulo Nulo) (No 15 Nulo Nulo)

em_ordem :: ArvBin -> [Int]
em_ordem Nulo = []
em_ordem (No valor esq dir) = em_ordem esq ++ [valor] ++ em_ordem dir