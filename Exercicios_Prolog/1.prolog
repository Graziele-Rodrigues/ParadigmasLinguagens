prefixo([], _). % Uma lista vazia é sempre um prefixo de qualquer lista.
prefixo([X|XS], [X|YS]) :- prefixo(XS, YS). % O prefixo de uma lista é a cabeça da lista seguida do prefixo do resto da lista.

% exemplo uso bagof(P, prefixo(P, [1,2,3,]), TodosPrefixos).
% retorno: X = [[], [1], [1, 2], [1, 2, 3], [1, 2, 3, 4]].