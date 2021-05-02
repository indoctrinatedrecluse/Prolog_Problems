% 12. Implement Quick Sort without Accumulator.

quick_sort([],[]):-
    !.
quick_sort([H|T],L_Sorted):-
    partition_pivot(H,T,Less_Than_List,Greater_Than_List),
    !,
    quick_sort(Less_Than_List,Less_Than_List_Sorted),
    quick_sort(Greater_Than_List,Greater_Than_List_Sorted),
    append(Less_Than_List_Sorted,[H|Greater_Than_List_Sorted],L_Sorted).

partition_pivot(_,[],[],[]):-
    !.
partition_pivot(Pivot,[H|T],[H|Less_Than_List],Greater_Than_List):-
    H=<Pivot,
    !,
    partition_pivot(Pivot,T,Less_Than_List,Greater_Than_List).
partition_pivot(Pivot,[H|T],Less_Than_List,[H|Greater_Than_List]):-
    partition_pivot(Pivot,T,Less_Than_List,Greater_Than_List).