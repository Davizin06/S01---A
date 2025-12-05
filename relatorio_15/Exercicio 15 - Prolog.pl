% BANCO DE DADOS (Grade, Pré-Requisitos e Histórico)

% Fatos: Disciplinas (nome, créditos, area)
disciplina(programacao1, 6, fundamental).
disciplina(calculo1, 8, matematica).
disciplina(estrutura_dados, 6, computacao).
disciplina(algoritmos, 4, computacao).
disciplina(banco_dados, 6, aplicacoes).
disciplina(redes, 4, aplicacoes).
disciplina(inteligencia_artificial, 8, computacao).
disciplina(compiladores, 6, computacao).
disciplina(teoria_grafos, 4, matematica).
disciplina(estatistica, 6, matematica).
disciplina(sistemas_operacionais, 6, computacao).
disciplina(projeto_integrador, 10, aplicacoes).

% Fatos: Pré-Requisitos (disciplina_principal, pre_requisito)
prerequisito(estrutura_dados, programacao1).
prerequisito(algoritmos, estrutura_dados).
prerequisito(banco_dados, programacao1).
prerequisito(inteligencia_artificial, algoritmos).
prerequisito(inteligencia_artificial, calculo1).
prerequisito(compiladores, algoritmos).
prerequisito(compiladores, estrutura_dados).
prerequisito(sistemas_operacionais, estrutura_dados).
prerequisito(teoria_grafos, calculo1).
prerequisito(estatistica, calculo1).
prerequisito(projeto_integrador, banco_dados).
prerequisito(projeto_integrador, sistemas_operacionais).

% Fatos: Conhecimento de Alunos (aluno, disciplina_concluida)
concluiu(maria, programacao1).
concluiu(maria, calculo1).
concluiu(joao, programacao1).
concluiu(joao, estrutura_dados).
concluiu(joao, calculo1).
concluiu(ana, programacao1).
concluiu(ana, redes).
concluiu(ana, teoria_grafos).
concluiu(pedro, calculo1).
concluiu(pedro, estatistica).
concluiu(pedro, teoria_grafos).
concluiu(lucas, estrutura_dados).
concluiu(lucas, algoritmos).
concluiu(lucas, redes).
concluiu(lucas, banco_dados).


% =======================================================
% RESOLUÇÃO DOS EXERCÍCIOS
% =======================================================

% EXERCÍCIO 1: DISCIPLINAS DE ALTO VALOR 
% Regra: Mais de 5 créditos E pré-requisito de pelo menos duas outras distintas
alto_impacto(D) :-
    disciplina(D, Creditos, _),
    Creditos > 5,
    prerequisito(D1, D),
    prerequisito(D2, D),
    D1 \= D2.

% QUERY DO EXERCÍCIO 1:
% disciplina(D, 4, matematica), \+ prerequisito(_, D).


% EXERCÍCIO 2: ALUNO APTO
% Regra Auxiliar: Verdadeira se a Disciplina é pré-req de algo e o aluno não fez
falta_concluir(Aluno, Disciplina) :-
    prerequisito(_, Disciplina),
    \+ concluiu(Aluno, Disciplina).

% Regra Principal: 
aluno_apto(Aluno, Disciplina) :-
    disciplina(Disciplina, _, Area),
    Area \= fundamental,
    disciplina(Disciplina, _, _), 
    \+ (prerequisito(Disciplina, Pre), \+ concluiu(Aluno, Pre)).

% QUERYS DO EXERCÍCIO 2:
% aluno_apto(joao, D).

% aluno_apto(maria, inteligencia_artificial).


% EXERCÍCIO 3: ESPECIALIZAÇÃO VS. DEPENDÊNCIA
especialista_comp(Aluno) :-
    concluiu(Aluno, D1), disciplina(D1, _, computacao),
    concluiu(Aluno, D2), disciplina(D2, _, computacao),
    D1 \= D2.

deficiencia_mat(Aluno) :-
    concluiu(Aluno, _), % Garante que 'Aluno' é alguém válido no sistema
    \+ (concluiu(Aluno, D), disciplina(D, _, matematica)).

% QUERY DO EXERCÍCIO 3:
% especialista_comp(Aluno), deficiencia_mat(Aluno).


% EXERCÍCIO 4: DISCIPLINA RAIZ E FOLHA
disciplina_raiz(D) :-
    disciplina(D, _, _),
    \+ prerequisito(D, _).
    
disciplina_folha(D) :-
    disciplina(D, _, _),
    \+ prerequisito(_, D).

% QUERY DO EXERCÍCIO 4:
% disciplina_raiz(D), disciplina(D, _, Area), Area \= aplicacoes.
