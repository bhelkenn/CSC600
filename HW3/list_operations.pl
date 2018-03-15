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
append_list([], L, L).
append_list([X|TL], L, [X|TR]) :- append_list(TL, L, TR).
delete1(X, [X|T], T).
delete1(X, [H|T], [H|Tail]) :- delete1(X, T, Tail).
append_element(L, [X], LX) :- append_list(L, [X], LX).
insert(X, L, LX) :- delete1(X, LX, L).
length_of_list([X], 1).
length_of_list([_|T], Length) :- length_of_list(T, Rest), Length is 1 + Rest.
reverse_list([], []).
reverse_list([H|T], LR) :- reverse_list(T, TR), append_element(TR, [H], LR).
palindrome(L, LR) :- reverse_list(L, LR), L = LR.
display_list([]) :- nl.
display_list([H|T]) :- write(H), tab(1), display_list(T).
