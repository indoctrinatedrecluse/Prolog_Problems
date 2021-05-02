% 9. To determine whether a set is a subset of another set.

is_subset([],[]):-!.
is_subset([],[_]):-!.
is_subset([H|T],[H|Rest]):-prefix(T,Rest),!.
is_subset([H|T],[Y|Rest]):-is_subset([H|T],Rest).
prefix([],[]):-!.
prefix([],[_]):-!.
prefix([H|T],[H|Rest]):-prefix(T,Rest).

/* Note: This is the same as the sublist programme because although duplication is forbidden by assumption,
the set may not be ordered, thus ensuring there may be multiple configurations for the same set. */