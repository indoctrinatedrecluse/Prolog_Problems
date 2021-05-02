% 13. To reverse a list in another list.

:- dynamic list_append/3.

reverse_list([H],[H]).
reverse_list([H|T],L):-reverse_list(T,M),list_append(M,[H],L),!.
reverse_list([],[]).