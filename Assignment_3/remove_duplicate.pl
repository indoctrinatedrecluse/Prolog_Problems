% 4.To remove duplicate elements from a list without using accumulator.

remove_duplicate([],[]):- !.
remove_duplicate([H|T],Result):- member(H,T), !, remove_duplicate(T,Result).
remove_duplicate([H|T],[H|Result]):- remove_duplicate(T,Result).