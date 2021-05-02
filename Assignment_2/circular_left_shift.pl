/* 27. circular_left_shift(L, L1).
    That is, if L= [a, b, c, d, e, f] then L1= [b, c, d, e, f, a]. */

circular_left_shift([],[]):-!.
circular_left_shift([X],[X]):-!.
circular_left_shift([H|T],L):-append(T,[H],L).