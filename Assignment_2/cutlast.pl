% 23. cutlast (L, L1) that defines L1 to be obtained from L with last element removed.

cutlast([], "Error: Empty List"):-!.
cutlast([X], []):-!.
cutlast([X|Rest], [X|Rest1]):-cutlast(Rest,Rest1).