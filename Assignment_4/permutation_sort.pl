% 6. Implement Permutation Sort.

permutation_sort(L,L_Sorted):-
    permutation(L,L_Sorted),
    ordered(L_Sorted),
    !.

ordered([]):-
    !.
ordered([_]):-
    !.
ordered([X1,X2|Rest]):-
    X1=<X2,
    !,
    ordered([X2|Rest]).