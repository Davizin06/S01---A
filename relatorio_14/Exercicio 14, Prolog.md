progenitor(urano, cronos).
progenitor(gaia, cronos).
progenitor(urano, oceano).
progenitor(gaia, oceano).
progenitor(cronos, zeus).
progenitor(reia, zeus).
progenitor(cronos, poseidon).
progenitor(reia, poseidon).
progenitor(zeus, atena).
progenitor(zeus, apolo).
progenitor(hera, apolo).
progenitor(zeus, artemis).
progenitor(letó, artemis).
progenitor(zeus, ares).
progenitor(hera, ares).
progenitor(zeus, hefesto).
progenitor(hera, hefesto).
progenitor(poseidon, tritao).
progenitor(zeus, perseu). 
progenitor(dânae, perseu).
progenitor(atena, erictônio).

dominio(zeus, ceu).
dominio(zeus, trovão).
dominio(poseidon, mar).
dominio(poseidon, terremoto).
dominio(hades, submundo).
dominio(atena, sabedoria).
dominio(atena, guerra_estrategica).
dominio(ares, guerra_brutal).
dominio(apolo, sol).
dominio(apolo, musica).
dominio(artemis, caça).
dominio(artemis, lua).
dominio(hefesto, fogo).
dominio(hefesto, forja).
dominio(afrodite, beleza).
dominio(afrodite, amor).
dominio(cronos, tempo).

arma(zeus, raio).
arma(poseidon, tridente).
arma(hades, elmo_escuridao).
arma(atena, escudo_aegis).
arma(perseu, espada_adamantina).

caracteristica(zeus, rei).
caracteristica(hera, rainha).
caracteristica(hades, invisivel).
caracteristica(hefesto, ferreiro).
caracteristica(artemis, virgem).
caracteristica(perseu, mortal).

aliado(zeus, poseidon).
aliado(poseidon, zeus).
aliado(atena, apolo).
aliado(apolo, atena).
aliado(ares, hades).
aliado(hades, ares).
aliado(hefesto, atena).
aliado(atena, hefesto).

local_principal(zeus, olimpo).
local_principal(poseidon, atlântida).
local_principal(hades, submundo).
local_principal(apolo, olimpo).
local_principal(artemis, florestas).


% RESOLUÇÃO DOS EXERCÍCIOS


% ---EXERCÍCIO 1: DIVINDADE OLÍMPICA---
progenitor(cronos, hades).
progenitor(reia, hades).

divindade_olimpica(Deus) :-
    progenitor(cronos, Deus),
    (dominio(Deus, ceu); dominio(Deus, mar); dominio(Deus, submundo)).

ivindade_olimpica(Deus).


% ---EXERCÍCIO 2: DEUS MAIOR---
deus_maior(Deus) :-
    local_principal(Deus, olimpo),
    dominio(Deus, Dom1),
    dominio(Deus, Dom2),
    Dom1 \= Dom2.

% QUERY = deus_maior(Deus).


% --- EXERCÍCIO 3: IRMÃOS DE SANGUE ---
irmaos_germanos(A, B) :-
    progenitor(Pai, A), progenitor(Pai, B),
    progenitor(Mae, A), progenitor(Mae, B),
    Pai \= Mae,
    A \= B.

% QUERY = irmaos_germanos(zeus, Irmao).


% --- EXERCÍCIO 4: ANCESTRALIDADE ---
%Caso base
ancestral(A, D) :- 
    progenitor(A, D).

%Passo recursivo 
ancestral(A, D) :- 
    progenitor(A, Z), 
    ancestral(Z, D).

% QUERY = ancestral(urano, Descendente).
