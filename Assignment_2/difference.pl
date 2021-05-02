% 13.To determine difference of two sets.

difference([],L,[]).
difference([X|L1],L2,L3):-member(X,L2),!,difference(L1,L2,L3).
difference([X|L1],L2,[X|L3]):-difference(L1,L2,L3).

% Note: [a,b,c,d] - [c,d,e,f] = [a,b] is an example.