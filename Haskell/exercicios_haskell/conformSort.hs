conformSort :: (a -> a -> Bool) -> [a] -> Bool
conformSort _ []       = True
conformSort _ [_]      = True
conformSort cmp (x:y:xs) = cmp x y && conformSort cmp (y:xs)