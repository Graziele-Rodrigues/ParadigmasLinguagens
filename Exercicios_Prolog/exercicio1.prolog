% caso base: a soma de uma lista vazia eh 0
soma_lista([], 0).
% caso recursivo: a soma de uma lista eh o primeiro elemento mais a soma do resto da lista
soma_lista([X|Y], S) :- soma_lista(Y, SomaY), S is X + SomaY.