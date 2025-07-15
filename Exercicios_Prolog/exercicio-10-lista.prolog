r(a,b).
r(b,c).
r(c,e).
r(f,c).
c(X, Y) :- r(X, Y).
c(X, Y) :- r(X, Z), c(Z, Y).