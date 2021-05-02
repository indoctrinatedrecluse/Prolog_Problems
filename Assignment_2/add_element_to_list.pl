% 1. To add an element to a list provided it is not present in the list.

add_element(X,[],[X]).
add_element(X,L,L):-member(X,L),!.
add_element(X,L,[X|L]).