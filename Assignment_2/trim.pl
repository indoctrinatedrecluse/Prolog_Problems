% 24. trim (N, L, L1) that defines L1 to be obtained from L with first N elements removed.

trim(N,L,"Error: List too short"):-length(L,Len),N>Len,!.
trim(N,L,"Error: Invalid index"):-N<0,!.
trim(0,L,L):-!.
trim(1,[X|L],L):-!.
trim(N,[X|L],L1):-N1 is N-1,!,trim(N1,L,L1).