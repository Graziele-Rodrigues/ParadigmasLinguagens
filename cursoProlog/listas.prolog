% se elemento L é membro da lista 
member(X, [X|_]). % X é o primeiro elemento da lista
member(X, [_|T]) :- member(X, T). % X é membro da cauda da lista


% concatenação de duas listas 
concat([], L, L). % concatenação de uma lista vazia com L resulta em L
concat([X|XS], L, [X|YS]) :- concat(XS, L, YS). % concatena X com a concatenação do resto da lista XS com L


% adição de um elemento na lista
add(X, L, [X|L]). % adiciona X no início da lista L

% adicionar um elemento no final da lista
add_end(X, [], [X]). % adiciona X no final de uma lista vazia
add_end(X, [Y|YS], [Y|ZS]) :- add_end(X, YS, ZS). % adiciona X no final da lista

% remover um elemento da lista
remove(X, [X|XS], XS). % remove X se for o primeiro elemento da lista
remove(X, [Y|YS], [Y|ZS]) :- remove(X, YS, ZS). % remove X da cauda da lista se não for o primeiro elemento