% 15. To find the last but one element of a list.
:- dynamic list_append/3.

last_but_one(L,X):-list_append(_,[X|[Y]],L).