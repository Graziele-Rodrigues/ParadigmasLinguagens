% caso base: a concatenação de duas listas vazias é uma lista vazia
concatena([], L, L).
% caso recursivo: a concatenação de uma lista com outra é o primeiro elemento da primeira
concatena([X|Xs], Ys, [X|Zs]) :- concatena(Xs, Ys, Zs).
