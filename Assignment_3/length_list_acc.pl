% 2.To find length of a list using accumulator.

len(L,Length):- len_acc(L,0,Length).
len_acc([],Length,Length):- !.
len_acc([H|T],L_Intermediate,Length):- L_Intermediate_1 is L_Intermediate + 1,
                                       len_acc(T,L_Intermediate_1,Length).