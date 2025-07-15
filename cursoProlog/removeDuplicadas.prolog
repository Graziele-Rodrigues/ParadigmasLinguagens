% remover duplicados em uma lista
compress([], []). % caso base: lista vazia
compress([X], [X]). % segundo caso base: se lista tem um elemento, retorna ela mesma

% L = [5,5,2,3,3,2,1,1] -> L = [8,5,3,2,1] -> [X, X|XS] 

compress([X, X|XS], S) :- compress([X|XS], S). % se o primeiro elemento é igual ao segundo, ignora o primeiro
compress([X, Y|YS], [X|S]) :- X \= Y, compress([Y|YS], S). % se o primeiro elemento é diferente do segundo, adiciona o primeiro à lista de saída e continua com o segundo

% a solucao é a lista S concatenada com X 