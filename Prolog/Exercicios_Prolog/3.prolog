% Valores permitidos
resistor(1000).
resistor(5000).
resistor(10000).

% Resistor simples
res(r(V), V) :-
    resistor(V).

% Série: soma as resistências
res(seq(R1, R2), V) :-
    res(R1, V1),
    res(R2, V2),
    V is V1 + V2.

% Paralelo: 1/V = 1/V1 + 1/V2
res(par(R1, R2), V) :-
    res(R1, V1),
    res(R2, V2),
    V1 > 0,
    V2 > 0,
    V is (V1 * V2) / (V1 + V2).

% Exemplo de uso:
% ?- res(N, 20500).
% N = seq(seq(par(r(1000), r(1000)), r(10000)), r(10000)) ;