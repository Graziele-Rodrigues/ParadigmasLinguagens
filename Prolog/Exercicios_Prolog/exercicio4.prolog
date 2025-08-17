flatten(nil, []).
flatten(branch(nil, R, nil), [R]).
flatten(branch(L, RT, R), ZS) :-
    flatten(L, XS),
    flatten(R, YS),
    concat(YS, [RT], WS),
    concat(XS, WS, ZS).
