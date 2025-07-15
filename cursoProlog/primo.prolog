% retorne true se nuero é primo e retorne false se não for primo

isprime(N) :- 
    N > 1,
    testa_divisores(N, 2).

% Se D * D > N, então não existem divisores até sqrt(N) → N é primo
testa_divisores(N, D) :-
    D * D > N, !.

% Se N for divisível por D, então não é primo
testa_divisores(N, D) :-
    0 is N mod D, !, fail.

% Senão, tenta o próximo D
testa_divisores(N, D) :-
    D1 is D + 1,
    testa_divisores(N, D1).

% D vai de 2 até sqrt(N), é incrementado até que D * D > N por D1 is D + 1