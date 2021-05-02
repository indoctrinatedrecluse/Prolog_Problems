% 8. Implement Selection Sort.

selection_sort([],[]):-
    !.
% select least element of L, store in X, the rest of the list is in Rest
selection_sort(L,[X|L1]):-
    select_least(X,L,Rest),
    !,
    selection_sort(Rest,L1).

select_least(_,[],[]):-
    !.
select_least(X,L,Rest):-
    select(X,L,Rest),
    less(X,Rest).

less(_,[]):-
    !.
less(X,[H|Rest]):-
    X=<H,
    !,
    less(X,Rest).