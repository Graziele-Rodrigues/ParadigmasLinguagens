and :: Bool -> Bool -> Bool
and False _ = False
and _ False = False
and True True = True