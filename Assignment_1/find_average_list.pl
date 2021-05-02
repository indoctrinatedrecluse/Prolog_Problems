/* 19. To find the average of all elements of a list using sum and length defined in Problem
17 and 18. */
:- dynamic find_sum_list/2, find_list_length/2.

find_average_list(L,X):-find_sum_list(L,Y), find_list_length(L,Z), X is Y/Z.