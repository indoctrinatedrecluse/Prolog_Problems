/* 12. To find whether two elements are next to each other in a list using append predicate
developed in 9. */
:- dynamic list_append/3.

are_consecutive_append(X,Y,L):-list_append(_,[X|[Y|_]],L).