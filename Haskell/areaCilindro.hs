cilindro :: (RealFloat a) => a -> a -> a -- recebe 2 valores tipo a e retorna um valor tipo a, realFloat é para garantir que a função funcione com tipos de números reais
cilindro r h = 
    let areaBase = pi * r^2 -- calcula a área da base do cilindro
        areaLateral = 2 * pi * r * h -- calcula a área lateral do cilindro
    in areaBase + areaLateral -- retorna a soma das áreas

-- a let/in permite definir variáveis locais dentro de uma expressão, onde 'areaBase' e 'areaLateral' são definidas e usadas para calcular a área total do cilindro.