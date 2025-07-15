elemento_na_posicao(0, [X|_], X).
elemento_na_posicao(Pos, [_|XS], Elem) :-
    Pos > 0,
    Pos1 is Pos - 1,
    elemento_na_posicao(Pos1, XS, Elem).
