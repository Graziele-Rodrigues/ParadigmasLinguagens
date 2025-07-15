% crie predicato que retorne uma lista com intervalo de valores entre dois números
% Exemplo: range(1, 5, Lista) deve retornar Lista = [1, 2, 3, 4, 5].

range(X, X, [X]). % Caso base: quando os dois números são iguais, a lista contém apenas esse número.
% compara X1 com Y, se for menor, coloca X1 na lista e chama recursivamente ate que X1 seja igual a Y
range(X, Y, [X|Rest]) :- 
    X < Y, % Verifica se X é menor que Y
    X1 is X + 1, % Incrementa X
    range(X1, Y, Rest). % Chama recursivamente para o próximo número

