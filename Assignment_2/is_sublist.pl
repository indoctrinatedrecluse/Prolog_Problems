/* 8. To determine whether a list is a sub list of another list. A list is a sub list of another list if
it’s elements are present in another list consecutively and in the same order. */

is_sublist([],[]):-!.
is_sublist([],[_]):-!.
is_sublist(L1,L2):-append([_,L1,_],L2),!.