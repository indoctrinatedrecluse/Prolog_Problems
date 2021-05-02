% 15. To replace n th element by another element X in L, leaving the resultant list in L1.

replace_element_n([],_,_,"Error"):-!.
replace_element_n(L,N,X,"Error"):-length(L,Y),N>Y,!.
replace_element_n(L,N,X,"Error"):-N<1,!.
replace_element_n([H|T],1,X,[X|T]):-!.
replace_element_n([H|T],N,X,[H|T1]):-N1 is N-1,replace_element_n(T,N1,X,T1).