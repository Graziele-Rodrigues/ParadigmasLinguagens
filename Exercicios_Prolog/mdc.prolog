% Caso base do Algoritmo de Euclides: gcd(a, 0) = a.
mdc(X, 0, X).

% Caso recursivo do Algoritmo de Euclides: gcd(a, b) = gcd(b, a mod b).
mdc(X, Y, MDC) :-
    Y > 0,                  % Garante que Y é positivo para esta regra.
    Resto is X mod Y,       % Calcula o resto da divisão de X por Y.
    mdc(Y, Resto, MDC).     % Chamada recursiva com Y e o Resto.
