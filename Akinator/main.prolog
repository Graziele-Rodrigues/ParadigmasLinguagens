% Autora: Graziele de Cassia Rodrigues 
% Data: 19-07-2025
% Descricao: main.prolog para o jogo Akinator sobre cientistas reais e fictícios.

:- dynamic entidade/1, pergunta/2, contador/1.
:- [database].
:- [inferencia].


:- initialization(startGame).

carregar_base :-
    consult('database.prolog'),
    consult('inferencia.prolog'),
    consult('aprendizado.prolog').

% Predicado principal para iniciar o jogo
startGame :-
    limpar_terminal,
    writeln('Bem vindo ao Akinator sobre cientistas!'),
    writeln('Vamos descobrir qual cientista voce esta pensando....'),
    carregar_base,
    menu,
    halt.

menu :-
    writeln('Escolha dentre as opcoes:'),
    writeln('1. Jogar'),
    writeln('2. Sair'),
    read_line_to_string(user_input, OpcaoStr),
    string_lower(OpcaoStr, Opcao),
    (Opcao = "1" ->
        limpar_terminal,
        jogar
    ; Opcao = "2" ->
        writeln('Saindo...Ate a proxima.'),
        halt
    ;
        writeln('Opcao invalida. Tente novamente.'),
        menu
    ).

jogar :-
    inicializar_contador,
    perguntar.

perguntar_e_adicionar_cientista :-
    writeln('Gostaria de adicionar o cientista em que pensou a base de dados? (s/n)'),
    read_line_to_string(user_input, RespostaString),

    (RespostaString = "s" ->
        aprender_novo_cientista
    ; % else
        writeln('Certo, o cientista nao sera adicionado por enquanto.')
    ).

perguntar :-
    contador(Cont),
    ( Cont > 20 ->
        writeln('Numero maximo de perguntas atingido. Me conte sobre o cientista que voce estava pensando.'),
        perguntar_e_adicionar_cientista,
        jogar_novamente
    ;
        findall(Cientista, entidade(Cientista), ListaEntidades),
        length(ListaEntidades, NumEntidades),
        limpar_terminal,
        (
            NumEntidades = 0 ->
                writeln('Nenhum cientista corresponde aos criterios.'),
                perguntar_e_adicionar_cientista,
                jogar_novamente
            ;
            NumEntidades = 1 ->
                adivinhar
            ;
            caracteristicas(Caracteristicas),
            findall(
                (Peso, Caracteristica, Valor),
                (
                    member(Caracteristica, Caracteristicas),
                    call(Caracteristica, _, Valor),
                    \+ pergunta(Caracteristica, Valor),
                    conta_caracteristica(Caracteristica, Valor, Contagem),
                    Contagem > 0,
                    peso_pergunta(Caracteristica, Valor, Peso)
                ),
                OpcoesNaoUnicas
            ),
            ( OpcoesNaoUnicas = [] ->
                writeln('Nenhuma pergunta pode ser feita neste momento.')
            ;
                sort(OpcoesNaoUnicas, [(MelhorPeso, Carac, Valor)|_]),
                incrementar_contador,
                format('O/A cientista possui ~w igual a ~w? (s/n): ', [Carac, Valor]),
                read_line_to_string(user_input, RespostaStr),
                string_lower(RespostaStr, Resposta),
                (Resposta = "exit" ->
                    writeln('Saindo do jogo...'),
                    halt
                ;
                    assert(pergunta(Carac, Valor)),
                    processar_resposta(Resposta, Carac, Valor, MelhorPeso), 
                    perguntar % Continuar perguntando 
                )
            )
        )
    ).

limpar_terminal :-
    write('\33[2J').

resetar_jogo :-
    retractall(entidade(_)),
    retractall(pergunta(_, _)),
    retractall(contador(_)),
    carregar_base.

inicializar_contador :-
    retractall(contador(_)),
    assert(contador(0)).

incrementar_contador :-
    contador(Atual),
    Novo is Atual + 1,
    retract(contador(Atual)),
    assert(contador(Novo)).


adivinhar :-
    findall(Cientista, entidade(Cientista), ListaEntidades),
    length(ListaEntidades, NumEntidades),
    (
        NumEntidades = 1 ->
            [Cientista] = ListaEntidades,
            format('O seu cientista chama ~w. Acertei? (s/n): ', [Cientista]),
            read_line_to_string(user_input, RespostaStr),
            string_lower(RespostaStr, Resposta),
            (Resposta = "s" -> % Se o Akinator acertou.
                writeln('Uhul, Ganhei!!'), % Mensagem de vitória.
                jogar_novamente % Oferece para jogar novamente.
            ; % Se o Akinator errou.
                writeln('Oh nao, errei! Voce venceu!'), % Mensagem de derrota.
                writeln('Me conte sobre o cientista que voce estava pensando?'),
                perguntar_e_adicionar_cientista, % Pergunta se deseja adicionar o cientista.
                jogar_novamente % Oferece para jogar novamente.
            )
    ; perguntar
    ).

jogar_novamente :-
    writeln('Quer jogar novamente? (s/n):'),
    read_line_to_string(user_input, RespostaStr),
    string_lower(RespostaStr, Resposta),
    (Resposta = "s" -> % Se a resposta for "sim"
        resetar_jogo, 
        limpar_terminal, 
        jogar 
    ; % Se a resposta for "não"
        writeln('Saindo...Ate a proxima.'),
        halt
    ).