/* 6. Next Higher Permutation:
    A positive integer is represented by a list of decimal digits.
    It's next higher permutation is defined to be the next greater integer composed of exactly the same digits.
    For example, the next higher permutation of 123542 is 124235.
    Write : 
    a) a declarative Prolog program,
    b) an efficient procedural Prolog program,
    that receive a list of decimal digits and return its next higher permutation in a list.*/

% A declarative approach:

next_higher_permutation(L,L1):-
    once(next_higher_permutation_wrapper(L,L1)).

next_higher_permutation_wrapper(L,L1):-
    higher_permutation(L,L1),
    not(far_higher_permutation(L1,L)).

higher_permutation(L,L1):-
    permutation(L,L1),
    higher(L1,L).

higher([H1|T1], [H2|T2]):-
    H1>H2,
    !.
higher([H|T1],[H|T2]):- higher(T1,T2).

far_higher_permutation(L1,L):-
    higher_permutation(L,L2),
    higher(L1,L2).


% An efficient approach:

nhp(L,L1):-
    rightmost_prefix(L,Index,Prefix),
    swap_point(L,Index,Prefix,1,Index_swap),
    swap(L,Index,Index_swap,L2),
    sort_after(L2,Index,1,L1).

rightmost_prefix(L,Index,Prefix):-
    reverse(L,L1),
    check_right_prefix(L1,1,Index1,Prefix),
    length(L, Length),
    Index is Length-Index1.

check_right_prefix([X,Y|_],N,N,Y):-
    X>Y,
    !.
check_right_prefix([X,Y|Rest],N,Index,Prefix):-
    N1 is N+1,
    check_right_prefix([Y|Rest],N1,Index,Prefix).

swap_point([X|Rest],Index,Prefix,Index_current,Index_swap):-
    Index_current=<Index,
    !,
    Index_current1 is Index_current+1,
    swap_point(Rest,Index,Prefix,Index_current1,Index_swap).
swap_point(L,Index,Prefix,Index_current,Index_swap):-
    !,
    shorten(L,Prefix,L1),
    min_list(L1,Min),
    find_index(L,Min,Index_current,Index_swap).
find_index([X|_],X,Index_current,Index_current):-
    !.
find_index([X|Rest],Min,Index_current,Index_swap):-
    !,
    Index_current1 is Index_current+1,
    find_index(Rest,Min,Index_current1,Index_swap).
shorten([],_,[]):-
    !.
shorten([X|Rest],Prefix,[X|Rest1]):-
    X>Prefix,
    !,
    shorten(Rest,Prefix,Rest1).
shorten([X|Rest],Prefix,Rest1):-
    shorten(Rest,Prefix,Rest1).

swap(As,I,J,Cs) :-
    same_length(As,Cs),
    append(BeforeI,[AtI|PastI],As),
    append(BeforeI,[AtJ|PastI],Bs),
    append(BeforeJ,[AtJ|PastJ],Bs),
    append(BeforeJ,[AtI|PastJ],Cs),
    I1 is I-1,
    J1 is J-1,
    length(BeforeI,I1),
    length(BeforeJ,J1),
    !.

sort_after([X|Rest],Index,N,[X|Result]):-
    N=<Index,
    !,
    N1 is N+1,
    sort_after(Rest,Index,N1,Result).
sort_after(L,Index,N,Result):-
    !,
    sort(L,Result).