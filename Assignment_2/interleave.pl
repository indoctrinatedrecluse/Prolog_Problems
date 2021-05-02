/* 17. Interleave alternate elements of L1 and L2 into L.
    For example, if L1= [a, b, c] and L2= [1, 2],
    then L= [a, 1, b, 2, c].
*/

interleave([],L,L):-!.
interleave(L,[],L):-!.
interleave([X|L1],[Y|L2],[X|[Y|L3]]):-interleave(L1,L2,L3).