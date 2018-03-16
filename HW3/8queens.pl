valid_range([1,2,3,4,5,6,7,8]).
queens([1/Y1,2/Y2,3/Y3,4/Y4,5/Y5,6/Y6,7/Y7,8/Y8]).

/* rules */
list_solutions(Queens) :- queens(Queens), solutions(Queens).

solutions([]).
solutions([X/Y|Queens]) :- solutions(Queens), legal(Y), nocheck(X/Y, Queens).

nocheck(_, []).
nocheck(X/Y, [X1/Y1|Queens]) :- legal(Y), legal(Y1), Y =\= Y1,
                                Y1 - Y =\= X - X1,
                                Y1 - Y =\= X1 - X,
                                nocheck(X/Y, Queens).

member_of(X, [X|_]).
member_of(X, [_|T]) :- member_of(X, T).

legal(Y) :- valid_range(R), member_of(Y, R).
