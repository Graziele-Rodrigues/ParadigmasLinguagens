% caso base: o merge de uma lista com outra vazia eh a própria lista
merge([], XS, XS).
merge(YS, [], YS).
% caso recursivo: o merge de duas listas eh o menor elemento da primeira lista
merge([X|XS], [Y|YS], [X|Zs]) :- X < Y, merge(XS, [Y|YS], Zs).
merge([X|XS], [Y|YS], [Y|Zs]) :- X >= Y, merge(YS, [X|XS], Zs).