-- guarda eh uma forma de condicional de casamento de padrões

guarda x | (x == 0) = 0
         | (x == 1) = 1
         | otherwise = x + 1