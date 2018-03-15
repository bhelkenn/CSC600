/* lists */
m([brady, john, will, charles, richard, kenneth, frank, husband1, husband2, rando_dude, william, helkenn]).
f([nadine, patricia, rose, beers, wife1, wife2, sydrah]).
family([charles, nadine, [brady, john, will]]).
family([frank, rose, [charles, patricia]]).
family([william, wife1, [frank]]).
family([helkenn, wife2, [william]]).
family([husband1, beers, [nadine, richard]]).
family([husband2, beers, [kenneth]]).
family([rando_dude, patricia, [sydrah]]).

/* rules */
member_of(X, [X|_]).
member_of(X, [_|T]) :- member_of(X, T).

male(X) :- m(L), member_of(X, L).
female(X) :- f(L), member_of(X, L).
father(F, C) :- family([F, _ | [T]]), male(F), member_of(C, T).
mother(M, C) :- family([_, M | [T]]), female(M), member_of(C, T).
parent(P, C) :- father(P, C).
parent(P, C) :- mother(P, C).
siblings1(X, Y, P) :- family([_, _ | [C1]]), family([_, _ | [C2]]), C1 \= C2, member_of(X, C1),
                      member_of(Y, C2), X \= Y, parent(P, X), parent(P, Y).
siblings2(X, Y) :- family([_, _ | [C]]), member_of(X, C), member_of(Y, C), X \= Y.
brother1(X, Y) :- siblings1(X, Y, _), male(X).
sister1(X, Y) :- siblings1(X, Y, _), female(X).
brother2(X, Y) :- siblings2(X, Y), male(X).
sister2(X, Y) :- siblings2(X, Y), female(X).
cousins(X, Y) :- parent(P1, X), parent(P2, Y), X \= Y, siblings2(P1, P2).
uncle(U, N) :- brother2(U, P), parent(P, N).
aunt(A, N) :- sister2(A, P), parent(P, N).
grandchild(C, G) :- parent(G, P), parent(P, C).
grandson(GS, G) :- grandchild(GS, G), male(GS).
granddaughter(GD, G) :- grandchild(GD, G), female(GD).
greatgrandparent(GGP, C) :- parent(GGP, GP), parent(GP, P), parent(P, C).
ancestor(A, D) :- greatgrandparent(A, P), parent(P, D).
ancestor(A, D) :- greatgrandparent(A, X), ancestor(X, D).
