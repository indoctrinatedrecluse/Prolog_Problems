% 27. To count numbers greater than 100.0 in a list.

greater_than_hunnid([],[]).
greater_than_hunnid([X|L1],[X|L2]):-X>100.0,greater_than_hunnid(L1,L2),!.
greater_than_hunnid([X|L1],L2):-greater_than_hunnid(L1,L2).

greater_than_hunnid_2([],0).
greater_than_hunnid_2([X|L1],Count):-greater_than_hunnid_2(L1,Count1),(X>100.0 -> Count is Count1+1; Count is Count1).

% Note: Again, wasn't sure about the output so did both.