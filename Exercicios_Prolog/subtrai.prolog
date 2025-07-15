numsub(X, Y, 0) :- X =< Y.
numsub(X, Y, Cont) :-
    X > Y,                  % Garante que X ainda é maior que Y.
    X_reduzido is X - Y,    % Calcula o novo X após uma subtração.
    numsub(X_reduzido, Y, Contagem_parcial), % Chamada recursiva.
    Cont is 1 + Contagem_parcial. % Incrementa a contagem.
