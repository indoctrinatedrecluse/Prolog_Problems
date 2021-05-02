/* 20. To extract a slice from a list.
    Given two indices, I and K, the slice is the list containing the elements between the I'th and K'th element of the original list (both limits included).
    Start counting the elements with 1.
    Example:?-slice([a,b,c,d,e,f,g,h,i,k],3,7,L).
    {L = [c,d,e,f,g]}
*/

slice([],_,_,"Error: Empty List"):-!.
slice(L,N1,N2,"Error: Use low, high format"):-N2<N1,!.
slice(L,N1,N2,"Error: Index out of bounds"):-N1<1,!.
slice(L,N1,N2,"Error: Index out of bounds"):-N2<1,!.
slice(L,N1,N2,"Error: Low out of bounds"):-length(L,Len),N1>Len,!.
slice(L,N1,N2,"Error: High out of bounds"):-length(L,Len),N2>Len,!.
slice(L,N1,N2,Result):-slice_wrapper(L,N1,N2,1,Result),!.
slice_wrapper([H|T],N1,N2,Count,[H]):-Count =:= N2,Count =:= N1,!.
slice_wrapper([H|T],N1,N2,Count,Result):-Count<N1,!,Count1 is Count+1,slice_wrapper(T,N1,N2,Count1,Result).
slice_wrapper(L,N1,N2,Count,[]):-Count>N2,!.
slice_wrapper([H|T],N1,N2,Count,[H|X]):-Count>=N1,Count=<N2,Count1 is Count+1,!,slice_wrapper(T,N1,N2,Count1,X).