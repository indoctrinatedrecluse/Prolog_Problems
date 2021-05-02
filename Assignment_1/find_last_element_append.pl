/* 10. To find the last element of a list using append predicate developed in 9. */
:- dynamic list_append/3.

is_last_element_append(L,X):-list_append(_,[X],L).