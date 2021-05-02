/* 22. To remove_every_other (L, L1).
    List L1 is just list L with every other element removed (the two lists should have the same first element).
*/

remove_every_other([],[]):-!.
remove_every_other(L,L1):-remove_every_other_wrapper(L,L1,1).
remove_every_other_wrapper([X],[X],1):-!.
remove_every_other_wrapper([X],[],0):-!.
remove_every_other_wrapper([X|Rest],Rest1,Flag):-Flag =:= 0, Flag1 is Flag+1,!,remove_every_other_wrapper(Rest,Rest1,Flag1).
remove_every_other_wrapper([X|Rest],[X|Rest1],Flag):-Flag =:= 1,Flag1 is Flag-1,!,remove_every_other_wrapper(Rest,Rest1,Flag1).