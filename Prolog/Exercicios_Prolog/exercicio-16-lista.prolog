% Caso base: qualquer lista vazia → lista final vazia
intercala([], _, []).
intercala(_, [], []).

% Caso recursivo: intercala cabeças e chama para o restante
intercala([X|XS], [Y|YS], [X, Y | ZS]) :-
    intercala(XS, YS, ZS).
