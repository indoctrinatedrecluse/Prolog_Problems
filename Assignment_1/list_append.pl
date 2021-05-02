% 9. To append two lists in a third list.

list_append([],L,L).
list_append([X|L1],L2,[X|L3]):-list_append(L1,L2,L3).