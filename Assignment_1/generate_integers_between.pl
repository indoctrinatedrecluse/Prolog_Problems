/* 26. To generate all integers between two integers N1 and N2, both N1 and N2 included and
N2>N1. */

generate_int(X,X,[X]).
generate_int(N1,N2,[N1|Rest]):-N1=<N2,N3 is N1+1,generate_int(N3,N2,Rest).

range(Low,Low,High).
range(L,Low,High):-NewLow is Low+1,NewLow=<High,range(L,NewLow,High).

/* Note: Wasn't sure about the output implementation in this one, so
one's a list and one is a one-by-one implementation, the latter inspired
by the 'between/3' predicate in SWI-Prolog. */

% Note: Need to implement safeguards.