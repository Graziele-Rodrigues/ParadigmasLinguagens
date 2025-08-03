meio :: (a,b,c) -> b 
meio (_, y, _) = y 

ultimo :: (a,b,c) -> c
ultimo (_, _, z) = z

troca :: (a,b,c) -> (c,b,a)
troca (x, y, z) = (z, y, x) 

prodEscalar :: Int -> (Int, Int, Int) -> (Int, Int, Int)
prodEscalar n (x, y, z) = (n * x, n * y, n * z)

ptEq :: (Int, Int) -> (Int, Int) -> Bool
ptEq (x1, y1) (x2, y2) = (x1 == x2) && (y1 == y2)

inBounds :: ((Int, Int), (Int, Int)) -> (Int, Int) -> Bool
inBounds ((x1, y1), (x2, y2)) (x, y) = 
    x >= x1 && x <= x2 && y >= y1 && y <= y2

rintersect :: ((Int, Int), (Int, Int)) -> ((Int, Int), (Int, Int)) -> Bool
rintersect ((x1, y1), (x2, y2)) ((x3, y3), (x4, y4)) =
    not (x2 < x3 || x4 < x1 || y2 < y3 || y4 < y1)
    