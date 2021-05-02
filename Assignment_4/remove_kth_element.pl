/* 1.
    Remove the K'th element from a list.
    Example:
    ?-remove_at(X,[a,b,c,d],2,R).
    {X = b, R = [a,c,d]}
*/

remove_at(_,[],_,[]):-
    !.
remove_at(X,L,Index,R):-
    append(L1,[X],L2),
    append(L2,L3,L),
    Index1 is Index-1,
    length(L1, Index1),
    append(L1,L3,R),
    !.