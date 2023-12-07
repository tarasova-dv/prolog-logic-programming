DOMAINS

    person = symbol

PREDICATES 
    man(person) 
    woman(person)
    married(person, person)
    parent(person, person)
    grandparent(person, person)
    grandgrandparent(person, person)

    mother(person, person) 
    father(person, person) 
    daughter(person, person) 
    son(person, person) 
    sister(person, person) 
    brother(person, person) 
    grandmother(person, person)
    grandfather(person, person) 
    granddaughter(person, person)
    grandson(person, person) 
    grandgrandmother(person, person)
    grandgrandfother(person, person)
    grandgranddaughter(person, person)
    grandgrandson(person, person) 
    aunt(person, person) 
    uncle(person, person) 
    nephew(person, person) 
    niece(person, person) 
    great_aunt(person, person)
    great_uncle(person, person)
    great_grandson(person, person)
    great_granddaughter(person, person)
    svekrov(person, person) 
    svyokr(person, person) 
    teshcha(person, person) 
    test(person, person) 
    svatya(person, person) 
    svat(person, person)
    zyat(person, person)
    svoyachenica(person, person) 
    shurin(person, person) 
    zolovka(person, person) 
    nevestka(person, person)

CLAUSES
    man(aleksandr).
    man(vladimir).
    man(valerii).
    man(sergey).
    man(sasha).
    man(igor).

    woman(nina).
    woman(lubov).
    woman(nelli).
    woman(emma).
    woman(elena).
    woman(anna).
    woman(viktoria).
    woman(daria).
    woman(olga).

    married(aleksandr, nina).
    married(vladimir, lubov).
    married(valerii, elena).
    married(sasha, olga).
    married(sergey, anna).
    married(X, Y) :- woman(X), man(Y), married(Y, X).

    mother(nina, nelli).
    mother(nina, emma).
    mother(nina, valerii).
    mother(lubov, elena).
    mother(lubov, viktoria).
    mother(lubov, sergey).
    mother(elena, daria).
    mother(elena, sasha).
    mother(olga, igor).

    father(aleksandr, nelli).
    father(aleksandr, emma).
    father(aleksandr, valerii).
    father(vladimir, elena).
    father(vladimir, sergey).
    father(vladimir, viktoria).
    father(valerii, daria).
    father(valerii, sasha).
    father(sasha, igor).

    parent(X, Y) :- mother(X, Y); father(X, Y).
    son(X, Y) :- man(X), parent(Y, X).
    daughter(X, Y) :- woman(X), parent(Y, X).
    brother(X, Y) :- man(X), parent(P, X), parent(P, Y), X<>Y.
    sister(X, Y) :-  woman(X), parent(P, X), parent(P, Y), X<>Y.

    grandparent(X, Y) :- parent(X, P), parent(P, Y).
    grandmother(X, Y) :- woman(X), grandparent(X, Y).
    grandfather(X, Y) :- man(X), grandparent(X, Y).
    granddaughter(X, Y) :- woman(X), grandparent(Y, X).
    grandson(X, Y) :- man(X), grandparent(Y, X).

    grandgrandparent(X, Y) :- grandparent(X, P), parent(P, Y).
    grandgrandmother(X, Y) :- woman(X), grandgrandparent(X, Y).
    grandgrandfother(X, Y) :- man(X), grandgrandparent(X, Y).
    grandgranddaughter(X, Y) :- woman(X), grandgrandparent(Y, X).
    grandgrandson(X, Y) :- man(X), grandgrandparent(Y, X).

    aunt(X, Y) :- sister(X, P), parent(P, Y); married(X, D), brother(D, P), parent(P, Y).
    uncle(X, Y) :- brother(X, P), parent(P, Y); married(X, T), sister(T, P), parent(P, Y).
    nephew(X, Y) :- man(X), aunt(Y, X); man(X), uncle(Y, X).
    niece(X, Y) :- woman(X), aunt(Y, X); woman(X), uncle(Y, X).
    

    great_aunt(X, Y) :- grandparent(G, Y), sister(X, G).
    great_uncle(X, Y) :- grandparent(G, Y), brother(X, G).
    great_grandson(X, Y) :- man(X), great_aunt(Y, X); man(X), great_uncle(Y, X).
    great_granddaughter(X, Y) :- woman(X), great_aunt(Y, X); woman(X), great_uncle(Y, X).

    svekrov(X, Y) :- mother(X, H), man(H), married(H, Y).
    svyokr(X, Y) :- father(X, H), man(H), married(H, Y).

    teshcha(X, Y) :- mother(X, W), woman(W), married(W, Y).
    test(X, Y) :- father(X, W), woman(W), married(W, Y).

    svatya(X, Y) :- mother(X, M), married(M, W), parent(Y, W).
    svat(X, Y) :- father(X, M), married(M, W), parent(Y, W).

    zolovka(X, Y) :- sister(X, H), man(H), married(H, Y). 
    svoyachenica(X, Y) :- sister(X, W), woman(W), married(W, Y).
    shurin(X, Y) :- brother(X, W), woman(W), married(W, Y).

    zyat(X, Y) :- man(X), married(X, W), daughter(W, Y); man(X), married(X, S), sister(S, Y); man(X), married(X, Z), zolovka(Z, Y).
    nevestka(X, Y) :- woman(X), married(X, H), parent(Y, H);
		woman(X), married(X, H), brother(H, Y);
		woman(X), married(X, H), grandparent(Y, H);
		woman(X), married(X, H), shurin(H, Y). 