type Nome = String
type Idade = Int
type Linguagem = String
type Pessoa = (Nome, Idade, Linguagem)

pessoa :: Pessoa
pessoa = ("Carlos", 30, "Haskell")

my_fst :: Pessoa -> Nome
my_fst (nome, _, _) = nome

my_snd :: Pessoa -> Idade
my_snd (_, idade, _) = idade

my_thd :: Pessoa -> Linguagem
my_thd (_, _, linguagem) = linguagem