/* 11. To find whether an element is a member of a list using append predicate developed
in 9. */
:- dynamic list_append/3.

is_member_append(X,L):-list_append(_,[X|_],L).