module AulaMonads where 


readInt :: IO (Int)
readInt = do x <- getLine
             return $ read x

-- verificar o que tem em Monad usar no terminal ghci: :info Monad

main :: IO ()
main = do x <- readInt
          y <- readInt
          putStrLn $ "A soma é: " ++ show (x + y)

data Error a = Ok a | Err String deriving (Show, Eq)

instance Functor Error where
    fmap f (Ok a) = Ok (f a)
    fmap _ (Err s) = Err s

instance Applicative Error where
    pure x = Ok x
    (Ok f) <*> (Ok v) = Ok (f v)
    (Err s) <*> _ = Err s
    (Ok f) <*> (Err s) = Err s
