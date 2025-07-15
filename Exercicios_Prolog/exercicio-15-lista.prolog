% Caso base: lista vazia tem 0 ocorrências
count(_, [], 0).

% Caso 1: a cabeça da lista é igual a X
count(X, [X|T], N) :-
    count(X, T, N1),
    N is N1 + 1.

% Caso 2: a cabeça é diferente de X
count(X, [Y|T], N) :-
    X \= Y,
    count(X, T, N).
