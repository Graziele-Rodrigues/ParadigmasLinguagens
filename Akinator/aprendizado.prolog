% Autora: Graziele de Cassia Rodrigues 
% Data: 19-07-2025
% Descricao: aprendizado.prolog para o jogo Akinator sobre cientistas reais e fictícios.

:- dynamic entidade/1.
:- dynamic realouficticio/2.
:- dynamic nacionalidade/2.
:- dynamic genero/2.
:- dynamic area/2.
:- dynamic periodomaioratividade/2.
:- dynamic vivooufalecido/2.
:- dynamic conquista/2.
:- dynamic premio_nobel/2.

aprender_novo_cientista :-
    write('Qual o nome do cientista? (use underscore "_" no lugar de espacos e inicie letra minuscula, ex: marie_Curie): '),
    read_line_to_string(user_input, NomeStr),
    atom_string(Nome, NomeStr),
    assert(entidade(Nome)),
    caracteristicas(Lista),
    aprender_caracteristicas(Nome, Lista),
    salvar_novo_cientista(Nome),
    writeln('Obrigado! Aprendi um novo cientista!').

aprender_caracteristicas(_, []).
aprender_caracteristicas(Nome, [Carac | Resto]) :- % passa o nome do cientista e a lista de características
    format('Qual o valor de "~w" para ~w? ', [Carac, Nome]),
    read_line_to_string(user_input, ValorStr),
    atom_string(Valor, ValorStr),
    Termo =.. [Carac, Nome, Valor],
    assert(Termo),
    aprender_caracteristicas(Nome, Resto).  %chama recursivamente para o próximo atributo

salvar_novo_cientista(Nome) :-
    open('database.prolog', append, Stream),
    format(Stream, '~n% Novo cientista aprendido~n', []),
    format(Stream, 'entidade(~q).~n', [Nome]),
    caracteristicas(Caracs),
    forall(
        (member(Carac, Caracs), Termo =.. [Carac, Nome, Valor], call(Termo)),
        format(Stream, '~w(~q, ~q).~n', [Carac, Nome, Valor])
    ),
    close(Stream).
