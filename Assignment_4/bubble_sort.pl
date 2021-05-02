% 7.  Implement Bubble Sort.

bubble_sort([],[]):-
    !.
bubble_sort([X],[X]):-
    !.
bubble_sort(L,L_Sorted):-
    append(L1,[X1,X2|L2],L),
    X2<X1,
    append(L1,[X2,X1|L2],L_Dual_Mini),
    !,
    bubble_sort(L_Dual_Mini,L_Sorted).
bubble_sort(L,L).

/* The logic behind this is:
    We take two adjacent elements X1 and X2, ensure they are in ascending order.
    We create a flipped version of this pair, and create a mini dual of sorts.
    We ensure the sorted version of the dual is the sorted list,
    that is,
    if the rest of the list is sorted. flipping this pair gives us the sorted list.
    This is ensured for every pair via backtracking.
*/