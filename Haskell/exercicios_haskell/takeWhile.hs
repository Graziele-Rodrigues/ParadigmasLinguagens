-- Defina a função takeWhile que retorne o prefixo da lista que satisfaz P (usando Foldr) 

takeWhilel :: (a -> Bool) -> [a] -> [a]
takeWhilel p xs = foldr f v xs 
    where f y ys = if p y then y : ys else []
          v = [] 