densidade :: (RealFloat a) => a -> String -- Função que recebe um número real e retorna uma string representando a densidade
densidade x 
    | x < 1.2 = "Baixa densidade"
    | x < 2.5 = "Densidade média"
    | x <= 10 = "Densidade alta"
    | otherwise = "Densidade muito alta"