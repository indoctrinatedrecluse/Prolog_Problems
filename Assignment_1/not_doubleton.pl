% 2. To determine whether a list is not a two-element list.

not_doubleton([]).
not_doubleton([X]).
not_doubleton([X|[Y|[Z|_]]]).