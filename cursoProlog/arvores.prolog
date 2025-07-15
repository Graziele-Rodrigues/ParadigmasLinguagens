% predicato que verifica se um elemento pertence a uma arvore binária 
istree(nil). % caso base: uma árvore vazia é uma árvore
istree(t(X, L, R)) :-
    istree(L), % verifica se o lado esquerdo é uma árvore
    istree(R). % verifica se o lado direito é uma árvore


% predicado que retorna o número de folhas de uma árvore binária
folhas(nil, 0). % caso base: uma árvore vazia tem 0 folhas
folhas(t(X, L, R), N) :-
    folhas(L, NL), % conta as folhas do lado esquerdo
    folhas(R, NR), % conta as folhas do lado direito
    N is NL + NR. % o número total de folhas é a soma das folhas dos dois lados