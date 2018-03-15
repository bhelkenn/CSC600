/* testing list([1,2,3,4,5])
rules */
member_of(X, [X|_]).
member_of(X, [_|T]) :- member_of(X, T).
first_element([X|_], X).

last_element([X], X).
last_element([_|T], X) :- last_element(T, X).
two_adjacent(X, Y, [X, Y|_]).
two_adjacent(X, Y, [_|T]) :- two_adjacent(X, Y, T).
three_adjacent(X, Y, Z, [X, Y, Z|_]).
three_adjacent(X, Y, Z, [_|T]) :- three_adjacent(X, Y, Z, T).
