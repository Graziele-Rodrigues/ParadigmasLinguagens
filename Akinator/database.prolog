% Autora: Graziele de Cassia Rodrigues
% Data: 19-07-2025
% Descricao: database.prolog de cientistas reais e fictícios, organizado por categoria.

% --- Entidades ---
entidade(albert_Einstein).
entidade(marie_Curie).
entidade(charles_Darwin).
entidade(stephen_Hawking).
entidade(isaac_Newton).
entidade(nikola_Tesla).
entidade(ada_Lovelace).
entidade(alan_Turing).
entidade(sigmund_Freud).
entidade(oswaldo_Cruz).
entidade(carlos_Chagas).
entidade(hedy_Lamarr).
entidade(grace_Hopper).
entidade(jane_Goodall).
entidade(rosalind_Franklin).
entidade(galileu_Galilei).
entidade(marie_Tharp).
entidade(george_Washington_Carver).
entidade(katherine_Johnson).
entidade(neil_deGrasse_Tyson).
entidade(sheldon_Cooper).
entidade(amy_Farrah_Fowler).

% --- (Real ou Fictício) ---
realouficticio(albert_Einstein, real).
realouficticio(marie_Curie, real).
realouficticio(charles_Darwin, real).
realouficticio(stephen_Hawking, real).
realouficticio(isaac_Newton, real).
realouficticio(nikola_Tesla, real).
realouficticio(ada_Lovelace, real).
realouficticio(alan_Turing, real).
realouficticio(sigmund_Freud, real).
realouficticio(oswaldo_Cruz, real).
realouficticio(carlos_Chagas, real).
realouficticio(hedy_Lamarr, real).
realouficticio(grace_Hopper, real).
realouficticio(jane_Goodall, real).
realouficticio(rosalind_Franklin, real).
realouficticio(galileu_Galilei, real).
realouficticio(marie_Tharp, real).
realouficticio(george_Washington_Carver, real).
realouficticio(katherine_Johnson, real).
realouficticio(neil_deGrasse_Tyson, real).
realouficticio(sheldon_Cooper, ficticio).
realouficticio(amy_Farrah_Fowler, ficticio).

% --- Nacionalidades ---
nacionalidade(albert_Einstein, alemao).
nacionalidade(marie_Curie, polonesa).
nacionalidade(charles_Darwin, britanico).
nacionalidade(stephen_Hawking, britanico).
nacionalidade(isaac_Newton, britanico).
nacionalidade(nikola_Tesla, servio).
nacionalidade(ada_Lovelace, britanica).
nacionalidade(alan_Turing, britanico).
nacionalidade(sigmund_Freud, austriaco).
nacionalidade(oswaldo_Cruz, brasileiro).
nacionalidade(carlos_Chagas, brasileiro).
nacionalidade(hedy_Lamarr, austriaca).
nacionalidade(grace_Hopper, americana).
nacionalidade(jane_Goodall, britanica).
nacionalidade(rosalind_Franklin, britanica).
nacionalidade(galileu_Galilei, italiano).
nacionalidade(marie_Tharp, americana).
nacionalidade(george_Washington_Carver, americano).
nacionalidade(katherine_Johnson, americana).
nacionalidade(neil_deGrasse_Tyson, americano).
nacionalidade(sheldon_Cooper, americano).
nacionalidade(amy_Farrah_Fowler, americana).

% --- Gêneros ---
genero(albert_Einstein, masculino).
genero(marie_Curie, feminino).
genero(charles_Darwin, masculino).
genero(stephen_Hawking, masculino).
genero(isaac_Newton, masculino).
genero(nikola_Tesla, masculino).
genero(ada_Lovelace, feminino).
genero(alan_Turing, masculino).
genero(sigmund_Freud, masculino).
genero(oswaldo_Cruz, masculino).
genero(carlos_Chagas, masculino).
genero(hedy_Lamarr, feminino).
genero(grace_Hopper, feminino).
genero(jane_Goodall, feminino).
genero(rosalind_Franklin, feminino).
genero(galileu_Galilei, masculino).
genero(marie_Tharp, feminino).
genero(george_Washington_Carver, masculino).
genero(katherine_Johnson, feminino).
genero(neil_deGrasse_Tyson, masculino).
genero(sheldon_Cooper, masculino).
genero(amy_Farrah_Fowler, feminino).

% --- Áreas de Atuação ---
area(albert_Einstein, fisica).
area(marie_Curie, quimica).
area(charles_Darwin, biologia).
area(stephen_Hawking, fisica).
area(isaac_Newton, fisica).
area(nikola_Tesla, engenharia).
area(ada_Lovelace, matematica).
area(alan_Turing, computacao).
area(sigmund_Freud, psicologia).
area(oswaldo_Cruz, medicina).
area(carlos_Chagas, medicina).
area(hedy_Lamarr, engenharia).
area(grace_Hopper, computacao).
area(jane_Goodall, biologia). 
area(rosalind_Franklin, quimica).
area(galileu_Galilei, fisica).
area(marie_Tharp, geologia). 
area(george_Washington_Carver, agricultura).
area(katherine_Johnson, matematica).
area(neil_deGrasse_Tyson, astrofisica).
area(sheldon_Cooper, fisica).
area(amy_Farrah_Fowler, neurociencia).

% --- Período de Maior Atividade (Século da Maior Contribuição) ---
periodomaioratividade(albert_Einstein, seculo_20).
periodomaioratividade(marie_Curie, seculo_20).
periodomaioratividade(charles_Darwin, seculo_19).
periodomaioratividade(stephen_Hawking, seculo_20).
periodomaioratividade(isaac_Newton, seculo_17).
periodomaioratividade(nikola_Tesla, seculo_19).
periodomaioratividade(ada_Lovelace, seculo_19).
periodomaioratividade(alan_Turing, seculo_20).
periodomaioratividade(sigmund_Freud, seculo_19).
periodomaioratividade(oswaldo_Cruz, seculo_19).
periodomaioratividade(carlos_Chagas, seculo_20).
periodomaioratividade(hedy_Lamarr, seculo_20).
periodomaioratividade(grace_Hopper, seculo_20).
periodomaioratividade(jane_Goodall, seculo_21).
periodomaioratividade(rosalind_Franklin, seculo_20).
periodomaioratividade(galileu_Galilei, seculo_16).
periodomaioratividade(marie_Tharp, seculo_20).
periodomaioratividade(george_Washington_Carver, seculo_20).
periodomaioratividade(katherine_Johnson, seculo_20).
periodomaioratividade(neil_deGrasse_Tyson, seculo_21).
periodomaioratividade(sheldon_Cooper, seculo_21).
periodomaioratividade(amy_Farrah_Fowler, seculo_21).

% --- Status (Vivo ou Falecido) ---
vivooufalecido(albert_Einstein, falecido).
vivooufalecido(marie_Curie, falecida).
vivooufalecido(charles_Darwin, falecido).
vivooufalecido(stephen_Hawking, falecido).
vivooufalecido(isaac_Newton, falecido).
vivooufalecido(nikola_Tesla, falecido).
vivooufalecido(ada_Lovelace, falecida).
vivooufalecido(alan_Turing, falecido).
vivooufalecido(sigmund_Freud, falecido).
vivooufalecido(oswaldo_Cruz, falecido).
vivooufalecido(carlos_Chagas, falecido).
vivooufalecido(hedy_Lamarr, falecida).
vivooufalecido(grace_Hopper, falecida).
vivooufalecido(jane_Goodall, viva).
vivooufalecido(rosalind_Franklin, falecida).
vivooufalecido(galileu_Galilei, falecido).
vivooufalecido(marie_Tharp, falecida).
vivooufalecido(george_Washington_Carver, falecido).
vivooufalecido(katherine_Johnson, falecida).
vivooufalecido(neil_deGrasse_Tyson, vivo).
vivooufalecido(sheldon_Cooper, vivo).
vivooufalecido(amy_Farrah_Fowler, viva).

% --- Conquistas Principais ---
conquista(albert_Einstein, teoria_da_relatividade).
conquista(marie_Curie, radioatividade).
conquista(charles_Darwin, teoria_da_evolucao).
conquista(stephen_Hawking, buracos_negros).
conquista(isaac_Newton, lei_da_gravidade).
conquista(nikola_Tesla, corrente_alternada).
conquista(ada_Lovelace, primeiro_programa_de_computador).
conquista(alan_Turing, quebra_de_codigos).
conquista(sigmund_Freud, psicanalise).
conquista(oswaldo_Cruz, combate_a_peste_bubonica).
conquista(carlos_Chagas, descoberta_da_doenca_de_chagas).
conquista(hedy_Lamarr, tecnologia_de_espectro_alargado).
conquista(grace_Hopper, linguagem_de_programacao_cobol).
conquista(jane_Goodall, estudo_dos_chimpanzes).
conquista(rosalind_Franklin, estrutura_do_dna).
conquista(galileu_Galilei, telescopio).
conquista(marie_Tharp, mapa_do_fundo_do_oceano).
conquista(george_Washington_Carver, cultivo_do_amendoim).
conquista(katherine_Johnson, calculos_para_missao_apolo_11).
conquista(neil_deGrasse_Tyson, divulgacao_cientifica).
conquista(sheldon_Cooper, teoria_da_supercorda).
conquista(amy_Farrah_Fowler, pesquisa_em_neurociencia).

% --- Prêmio Nobel ---
premio_nobel(albert_Einstein, tem_premio_nobel).
premio_nobel(marie_Curie, tem_premio_nobel).
premio_nobel(charles_Darwin, nao_tem_premio_nobel).
premio_nobel(stephen_Hawking, nao_tem_premio_nobel).
premio_nobel(isaac_Newton, nao_tem_premio_nobel).
premio_nobel(nikola_Tesla, nao_tem_premio_nobel).
premio_nobel(ada_Lovelace, nao_tem_premio_nobel).
premio_nobel(alan_Turing, nao_tem_premio_nobel).
premio_nobel(sigmund_Freud, nao_tem_premio_nobel).
premio_nobel(oswaldo_Cruz, nao_tem_premio_nobel).
premio_nobel(carlos_Chagas, nao_tem_premio_nobel).
premio_nobel(hedy_Lamarr, nao_tem_premio_nobel).
premio_nobel(grace_Hopper, nao_tem_premio_nobel).
premio_nobel(jane_Goodall, nao_tem_premio_nobel).
premio_nobel(rosalind_Franklin, nao_tem_premio_nobel).
premio_nobel(galileu_Galilei, nao_tem_premio_nobel).
premio_nobel(marie_Tharp, nao_tem_premio_nobel).
premio_nobel(george_Washington_Carver, nao_tem_premio_nobel).
premio_nobel(katherine_Johnson, nao_tem_premio_nobel).
premio_nobel(neil_deGrasse_Tyson, nao_tem_premio_nobel).
premio_nobel(sheldon_Cooper, tem_premio_nobel).
premio_nobel(amy_Farrah_Fowler, tem_premio_nobel).

