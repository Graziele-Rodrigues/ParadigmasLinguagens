% Caso base: lista vazia gera duas listas vazias
divide([], [], []).

% Caso de um elemento: vai para a primeira lista
divide([X], [X], []).

% Caso geral: distribui alternadamente os elementos
divide([X, Y|T], [X|L1], [Y|L2]) :- divide(T, L1, L2).

% Exemplo de uso:
% ?- divide([1, 2, 3, 4, 5], L1, L2).