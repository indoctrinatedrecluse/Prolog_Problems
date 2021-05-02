% 2. To delete first occurrence of an element from a list.

delete_first(X,[],[]).
delete_first(X,[X|Rest],Rest):-!.
delete_first(X,[Y|L],[Y|L_]):-delete_first(X,L,L_).