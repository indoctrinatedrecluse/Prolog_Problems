% 3. To determine whether two lists are of same length.

same_length([],[]).
same_length([X|Rest1],[Y|Rest2]):-same_length(Rest1,Rest2).