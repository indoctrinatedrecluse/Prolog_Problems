% 6. To find the last element of a list.

last_member([X], X).
last_member([_|Rest],X):-last_member(Rest,X),!.
last_member([],"Empty List").