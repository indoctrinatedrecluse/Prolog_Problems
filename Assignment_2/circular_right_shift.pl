/* 28. circular_right_shift(L, L1).
    That is, if L= [a, b, c, d, e, f] then L1= [f, a, b, c, d, e]
*/
:- dynamic circular_left_shift/2.

circular_right_shift(L,L1):-reverse(L,L2),circular_left_shift(L2,L3),reverse(L3,L1).