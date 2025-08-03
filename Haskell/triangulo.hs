trianguloValido :: Float -> Float -> Float -> String
trianguloValido a b c
  | a <= 0 || b <= 0 || c <= 0 = "Valores devem ser positivos"
  | a + b > c && a + c > b && b + c > a = "Triângulo válido"
  | otherwise = "Triângulo inválido"
