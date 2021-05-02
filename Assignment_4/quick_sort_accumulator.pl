% 11. Implement Quick Sort using Accumulator.

quick_sort(L,L_Sorted):-
    quick_sort_acc(L,[],L_Sorted).
quick_sort_acc([],X,X):-
    !.
quick_sort_acc([H|T],Accumulator,L_Sorted):-
    partition_pivot(H,T,Less_Than_List,Greater_Than_List),
    !,
    quick_sort_acc(Greater_Than_List,Accumulator,Greater_Than_List_Sorted),
    quick_sort_acc(Less_Than_List,[H|Greater_Than_List_Sorted],L_Sorted).

partition_pivot(_,[],[],[]):-
    !.
partition_pivot(Pivot,[H|T],[H|Less_Than_List],Greater_Than_List):-
    H=<Pivot,
    !,
    partition_pivot(Pivot,T,Less_Than_List,Greater_Than_List).
partition_pivot(Pivot,[H|T],Less_Than_List,[H|Greater_Than_List]):-
    partition_pivot(Pivot,T,Less_Than_List,Greater_Than_List).