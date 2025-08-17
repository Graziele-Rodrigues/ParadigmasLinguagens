descreverLista :: [a] -> String
descreverLista xs = "A lista é " ++ qualTipo xs
  where
    qualTipo []     = "vazia."
    qualTipo [x]    = "uma lista com um único elemento."
    qualTipo _      = "uma lista com vários elementos."