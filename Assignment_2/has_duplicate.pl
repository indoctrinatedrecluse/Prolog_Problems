% 5. has_duplicate(L), that determines whether list L has duplicate elements.

has_duplicate([H|T]):-member(H,T),!.
has_duplicate([H|T]):- \+member(H,T),has_duplicate(T).