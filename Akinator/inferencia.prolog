% Autora: Graziele de Cassia Rodrigues 
% Data: 19-07-2025
% Descricao: inferencia.prolog para o jogo Akinator sobre cientistas reais e fictícios.

:- dynamic entidade/1, pergunta/2.

conta_caracteristica(Caracteristica, Valor, Contagem) :-
    findall(Cientista, (
        entidade(Cientista),
        call(Caracteristica, Cientista, Valor)
    ), Lista),
    length(Lista, Contagem).


peso_pergunta(Caracteristica, Valor, Peso) :-
    conta_caracteristica(Caracteristica, Valor, Sim),
    findall(Cientista, (
        entidade(Cientista),
        \+ call(Caracteristica, Cientista, Valor)
    ), ListaNao),
    length(ListaNao, Nao),
    Peso is min(Sim, Nao). % usa minimo para dar valor baixo para perguntas que dividem bem as entidades - mede o pior caso (quantos você com certeza elimina).


processar_resposta(Resposta, Caracteristica, Valor, _) :-
    (Resposta = "s" ->
        findall(Cientista, (
            entidade(Cientista),
            call(Caracteristica, Cientista, Valor)
        ), Lista),
        atualizar_base(Lista)
    ;
        findall(Cientista, (
            entidade(Cientista),
            call(Caracteristica, Cientista, Valor)
        ), Lista),
        remover_da_base(Lista)
    ).

atualizar_base(Lista) :-
    forall(entidade(Cientista), (
        \+ member(Cientista, Lista) -> retract(entidade(Cientista)) ; true
    )).

remover_da_base(Lista) :-
    forall(member(Cientista, Lista), retract(entidade(Cientista))).

caracteristicas([realouficticio, nacionalidade, genero, area, periodomaioratividade, vivooufalecido, conquista, premio_nobel]).

