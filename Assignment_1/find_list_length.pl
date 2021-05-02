% 18. To find the length of a list.

find_list_length([],0).
find_list_length([X|Rest],Y):-find_list_length(Rest,Z), Y is Z+1.