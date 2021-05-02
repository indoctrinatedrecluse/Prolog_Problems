/* 28. To split a list of numbers in two lists such that one contains negative numbers and
other contains positive numbers. */

split_by_sign([],[],[]).
split_by_sign([X|L1],[X|L2],L3):-X>=0,split_by_sign(L1,L2,L3),!.
split_by_sign([X|L1],L2,[X|L3]):-split_by_sign(L1,L2,L3).