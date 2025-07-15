% predicato que retorna o tamanho de uma lista
tamanhoLista([], 0). % caso base: lista vazia tem tamanho 0
tamanhoLista([_|XS], N) :- tamanhoLista(XS, N1), N is N1 + 1. % a cada chamada recursiva, incrementa o tamanho da lista