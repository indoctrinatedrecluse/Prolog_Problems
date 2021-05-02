/* 18.Transpose L1, L2 into L.
    That is, if L1= [a, b, c] and L2= [1, 2, 3],
    then L= [(a, 1), (b, 2), (c, 3)].
*/

pairwise([],[],[]):-!.
pairwise(L1,L2,"Error"):-length(L1,X1),length(L2,X2),X1 =\= X2,!.
pairwise([X|L1],[Y|L2],[(X,Y)|L3]):-!,pairwise(L1,L2,L3).