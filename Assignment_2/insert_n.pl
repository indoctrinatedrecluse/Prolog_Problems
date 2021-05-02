/* 21. To insert an element at a given position into a list.
    Example:
    ?-insert_at(alfa,[a,b,c,d],2,L).
    {L = [a,alfa,b,c,d]
*/

insert_n(X,L,N,"Error: Out of bounds"):-N<1,!.
insert_n(X,L,N,"Error: Out of bounds"):-length(L,N1),N2 is N1+1,N>N2,!.
insert_n(X,[H|T],1,[X|[H|T]]):-!.
insert_n(X,[],1,[X]):-!.
insert_n(X,[H|T],N,[H|Rest]):-N1 is N-1,insert_n(X,T,N1,Rest).