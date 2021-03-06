/* 19.To split a list into two parts; the length of the first part is given.
    Do not use any predefined predicates.
    Example:?-split([a,b,c,d,e,f,g,h,i,k],3,L1,L2).
    {L1 = [a,b,c],L2 = [d,e,f,g,h,i,k]}
*/

split([],_,"Error","Empty List"):-!.
split(_,N,"Error","Out of bounds"):-N<0,!.
split(L,N,"Error","Out of bounds"):-length(L,Len),N>Len,!.
split(L,0,[],L):-!.
split([H|T],1,[H],T):-!.
split([H|T],N,[H|L1],L2):-N1 is N-1,split(T,N1,L1,L2).