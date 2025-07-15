% fazer fatoração recursiva 

% Caso base: quando N é 1, não há mais fatores
factors(1, _, []).

% Caso recursivo: K divide N
factors(N, K, [K | KS]) :-
    N >= K,
    0 is N mod K,
    N1 is N // K,
    factors(N1, K, KS).

% Caso recursivo: K não divide N, tenta o próximo fator
factors(N, K, XS) :-
    N >= K,
    N mod K =\= 0,
    K1 is K + 1,
    factors(N, K1, XS).


% exemplo de uso:
% ?- factors(811136, 2, XS).
% XS = [2, 2, 2, 2, 2, 2, 2, 6337] ;