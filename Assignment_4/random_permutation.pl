/* 3.
    Generate a random permutation of the elements of a list.
    Example:
    ?-rnd_permu([a,b,c,d,e,f],L).
    {L = [b,a,d,c,e,f]}.
    Hint:Use the solution of problem P2.
*/

:-ensure_loaded('random_subset.pl').

rnd_permu(L,L1):-
    length(L,Length),    
    rnd_select(L,Length,L1).