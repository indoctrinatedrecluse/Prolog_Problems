% 3. To delete all occurrences of an element from a list.

delete_all(X,[],[]).
delete_all(X,[X|Rest],Rest1):-delete_all(X,Rest,Rest1),!.
delete_all(X,[Y|Rest],[Y|Rest1]):-delete_all(X,Rest,Rest1),!.