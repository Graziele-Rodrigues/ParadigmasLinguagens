% escreva prolog que divida a lista contendo elementos no tamanho indicado, por exemplo:
% split([1, 2, 3, 4, 5], 2, L1, L2) deve retornar L1 = [1, 2] e L2 = [3, 4, 5].
% split([1,2,3,4,5], 3, L1, L2) deve retornar L1 = [1, 2, 3] e L2 = [4, 5].

split(L, 0, [], L). % caso base: se o tamanho for 0, L1 é vazio e L2 é a lista original.
split([X|XS], N, [X|YS], ZS) :-
    N >0, 
    N1 is N-1,
    split(XS, N1, YS, ZS). % adiciona o primeiro elemento à primeira lista e continua com o restante da lista e o tamanho decrementado.