/* 16. To remove every N'th element from a list.
    Example:
    ?-remove([a,b,c,d,e,f,g,h,i,k],3,X).
    {X = [a,b,d,e,g,h,k]} */

remove_every_n(_,N,"Error"):-N<1,!.
remove_every_n(L,N,"Error"):-length(L, X),N>X,!.
remove_every_n(L,N,L1):-remove_every_n_wrapper(L,N,N,L1).
remove_every_n_wrapper([],N,_,[]):-!.
remove_every_n_wrapper([H|T],N,1,T1):-!,remove_every_n_wrapper(T,N,N,T1).
remove_every_n_wrapper([H|T],N,X,[H|T1]):-X1 is X-1, remove_every_n_wrapper(T,N,X1,T1).