classificarIMC :: Float -> Float -> String -- recebe peso e altura e retorna a classificação do IMC
classificarIMC peso altura 
    | imc < 18.5 = "Abaixo do peso"
    | imc < 24.9 = "Peso normal"
    | imc < 29.9 = "Sobrepeso"
    | imc < 34.9 = "Obesidade grau I"
    | imc < 39.9 = "Obesidade grau II"
    | otherwise   = "Obesidade grau III ou mórbida"
    where
        imc = peso / (altura * altura)