% 17. To find the sum of all elements of a list.

find_sum_list([],0).
find_sum_list([X|Rest],Y):-find_sum_list(Rest,Z), Y is X+Z.