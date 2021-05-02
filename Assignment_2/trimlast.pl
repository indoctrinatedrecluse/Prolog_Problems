% 25.trimlast (N, L, L1) that defines L1 to be obtained from L with last N elements removed.
:- dynamic trim/3.

trimlast(N,L,"Error: List too short"):-length(L,Len),N>Len,!.
trimlast(N,L,"Error: Invalid index"):-N<0,!.
trimlast(N,L,L1):-length(L,Len),X is Len-N,trim(X,L,L2),subtract(L,L2,L1).