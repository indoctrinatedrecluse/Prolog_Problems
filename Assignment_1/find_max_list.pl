% 20. To find the maximum number from a list.

find_max_list([X],X):-!.
find_max_list([X|Rest],Max):-find_max_list(Rest,MaxRest), max(X,MaxRest,Max).
max(X,Y,X):-X>=Y.
max(X,Y,Y):-X<Y.