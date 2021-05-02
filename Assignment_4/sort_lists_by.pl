/* 5.
    Sorting a list of lists according to length of sublists:
    a) We suppose that a list (InList) contains elements that are lists themselves.
    The objective is to sort the elements of InList according to their length.
    E.g.: short lists first, longer lists later, or vice versa.
    Example:
    ?-lsort([[a,b,c],[d,e],[f,g,h],[d,e],[i,j,k,l],[m,n],[o]],L).
    {L = [[o], [d, e], [d, e], [m, n], [a, b, c], [f, g, h], [i, j, k, l]]}.
*/

lsort([],[],_):-
    !.
lsort(L,L_Sorted,asc):-
    maplist(len_prefix,L,L_length_mapped),
    sort(0,@=<,L_length_mapped,L_length_mapped_sorted),
    maplist(remove_prefix,L_length_mapped_sorted,L_Sorted),
    !.
lsort(L,L_Sorted,desc):-
    maplist(len_prefix,L,L_length_mapped),
    sort(0,@>=,L_length_mapped,L_length_mapped_sorted),
    maplist(remove_prefix,L_length_mapped_sorted,L_Sorted).

len_prefix(List,[Length,List]):-
    length(List,Length),
    !.
remove_prefix([_,List],List):-
    !.
remove_prefix2([_|List],List):-
    !.
flatten_one_depth([], []):-
    !.
flatten_one_depth([X|Rest],L):-
    is_list(X),
    flatten_one_depth(Rest,Rest1),
    !,
    append(X,Rest1,L).
flatten_one_depth([X|_],[X|Rest1]):-
    flatten_one_depth(X,Rest1).

/* b)
    Again, we suppose that a list (InList) contains elements that are lists themselves.
    But this time the objective is to sort the elements of InList according to their length frequency;
    i.e. in the default, where sorting is done ascendingly, lists with rare lengths are placed first, others with a more frequent length come later.
    Example:
    ?-lfsort([[a,b,c],[d,e],[f,g,h],[d,e],[i,j,k,l],[m,n],[o]],L).
    {L = [[i, j, k, l], [o], [a, b, c], [f, g, h], [d, e], [d, e], [m, n]]}.
    Note that in the above example, the first two lists in the result L have length 4 and 1, both lengths appear just once.
    The third and forth list have length 3 which appears, there are two list of this length.
    And finally, the last three lists have length 2.
    This is the most frequent length.
*/

test:-
    L = [[a,b,c],[d,e],[f,g,h],[d,e],[i,j,k,l],[m,n],[o]],
    write('L = '), write(L), nl,
    maplist(len_prefix,L,L_length_mapped),
    write('L_length_mapped = '), write(L_length_mapped), nl,
    sort(0,@=<,L_length_mapped,L_length_mapped_sorted),
    write('L_length_mapped_sorted = '), write(L_length_mapped_sorted), nl,
    accumulate(L_length_mapped_sorted,L_accumulated),
    write('L_accumulated = '), write(L_accumulated), nl,
    lsort(L_accumulated,L_re_sorted,asc),
    write('L_re_sorted = '), write(L_re_sorted), nl,
    maplist(remove_prefix2,L_re_sorted,L_key_removed),
    write('L_key_removed = '), write(L_key_removed), nl,
    flatten_one_depth(L_key_removed,Result),
    write('Result = '), write(Result), nl.

accumulate([],[]):-
    !.
accumulate([[Length,Rest]|Rest_Lists],[[Length,Rest|Rest_Identical]|Rest_Processed]):-
    transfer([Length,Rest],Rest_Lists,Rest_Unprocessed,Rest_Identical),
    !,
    accumulate(Rest_Unprocessed,Rest_Processed).
transfer(_,[],[],[]):-
    !.
transfer([Length,_],[[Length1,Rest]|Rest_Lists],[[Length1,Rest]|Rest_Lists],[]):-
    Length \= Length1,
    !.
transfer([Length,_],[[Length,Rest]|Rest_Lists],Identical_Removed,[Rest|Identical_Length_List]):-
    transfer([Length,Rest],Rest_Lists,Identical_Removed,Identical_Length_List).
% transfer([Length,List],Rest,Identical_Removed,Identical_Length_List):
% Identical_Removed is the list that is a cut subset of the list Rest,
% when all leading copies of length Length are removed from Rest and transfered to Identical_Length_List.

lfsort([],[],_):-
    !.
lfsort(L,L_F_Sorted,asc):-
    maplist(len_prefix,L,L_length_mapped),
    sort(0,@=<,L_length_mapped,L_length_mapped_sorted),
    accumulate(L_length_mapped_sorted,L_accumulated),
    lsort(L_accumulated,L_re_sorted,asc),
    maplist(remove_prefix2,L_re_sorted,L_key_removed),
    flatten_one_depth(L_key_removed,L_F_Sorted),
    !.
lfsort(L,L_F_Sorted,desc):-
    maplist(len_prefix,L,L_length_mapped),
    sort(0,@=<,L_length_mapped,L_length_mapped_sorted),
    accumulate(L_length_mapped_sorted,L_accumulated),
    lsort(L_accumulated,L_re_sorted,desc),
    maplist(remove_prefix2,L_re_sorted,L_key_removed),
    flatten_one_depth(L_key_removed,L_F_Sorted).