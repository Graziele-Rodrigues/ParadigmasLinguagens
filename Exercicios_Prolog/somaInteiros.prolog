% Caso base: A soma de 0 até 0 é 0.
soma_inteiros_0_n(0, 0).

soma_inteiros_0_n(N, Soma) :-
    N > 0,                  % Garante que N é positivo para esta regra.
    N_menos_1 is N - 1,     % Calcula N - 1 e unifica com N_menos_1.
    soma_inteiros_0_n(N_menos_1, Soma_parcial), % Chamada recursiva.
    Soma is N + Soma_parcial. % Calcula a soma final.