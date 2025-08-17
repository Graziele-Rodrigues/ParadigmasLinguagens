% Fatos sobre pai/mãe
pai(joao, jose).
pai(joao, dalia).
pai(jose, maria).
pai(jose, joana).
pai(jose, silvia).
pai(jose, rita).
pai(godofredo, alberto).

mae(dalia, rosalia).
mae(dalia, godofredo).

% Regra: avô 
avo(X, Y) :- pai(X, Z), (pai(Z, Y); mae(Z, Y)).  % Z é pai ou mãe de Y

% Regra: irmãos
irmaos(X, Y) :-
    X \= Y,
    (pai(P, X), pai(P, Y) ; mae(M, X), mae(M, Y)).

% Regra: primos
primo(X, Y) :-
    pai(P1, X), pai(P2, Y), irmaos(P1, P2).

primo(X, Y) :-
    mae(M1, X), mae(M2, Y), irmaos(M1, M2).

% Regra: sobrinho
sobrinho(X, Y) :-
    pai(P, X), irmaos(P, Y).

sobrinho(X, Y) :-
    mae(M, X), irmaos(M, Y).

% Regra: tio
tio(X, Y) :-
    irmaos(X, P), pai(P, Y).

tio(X, Y) :-
    irmaos(X, M), mae(M, Y).