% retorne o maior divisor comum entre dois números

gcd(X, 0, X) :- X>0. % caso base: se Y é 0, então GCD é X
gcd(X, Y, G) :- Y > 0, Z is X mod Y, gcd(Y, Z, G). % caso recursivo: enquanto Y > 0, calcula o resto da divisão de X por Y e chama gcd recursivamente

% Z is 48 mod 18 → Z = 12
% chama gcd(18, 12, G)
% Z is 18 mod 12 → Z = 6
% chama gcd(12, 6, G)
% Z is 12 mod 6 → Z = 0
% chama gcd(6, 0, G) → bate no caso base
% G = 6