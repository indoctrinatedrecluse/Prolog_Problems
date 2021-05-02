/* 26. exchange_first_last(L, L1), defines that L1 to be obtained from L with first and last elements exchanged.
    Example:
    ?-exchange_first_last([a, b, c, d, e], X).
    {X= [e, b, c, d, a]}
*/

exchange_first_last([],[]):-!.
exchange_first_last([X],[X]):-!.
exchange_first_last([X|A],[Y|B]):-exchange_first_last(A,X,Y,B).
exchange_first_last([Y],X,Y,[X]):-!.
exchange_first_last([Z|A],X,Y,[Z|B]):-exchange_first_last(A,X,Y,B).

exchange_first_last_2([],[]):-!.
exchange_first_last_2([X],[X]):-!.
exchange_first_last_2(A,B):-append([First|Rest],[Last],A),append([Last|Rest],[First],B),!.