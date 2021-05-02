% 7. To find whether an element is a member of a list.

is_member(X,[X|_]).
is_member(X,[_|Rest]):-is_member(X,Rest).