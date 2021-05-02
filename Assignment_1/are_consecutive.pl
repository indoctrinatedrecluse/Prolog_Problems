% 8. To find whether two elements are next to each other in a list.

next_to(X,Y,[X|[Y|_]]).
next_to(X,Y,[Z|Rest]):-next_to(X,Y,Rest).