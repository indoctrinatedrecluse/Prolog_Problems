% 29. To delete the middle element from an odd-numbered list L into a list L1.

delete_mid([],[]):-!.
delete_mid([X],[]):-!.
delete_mid(L,"Error: Even list"):-length(L,Len),Len>1,Len mod 2 =:= 0,!.
delete_mid(L,L1):-length(L, Len),Len1 is floor(Len/2),append(First,[Mid|Last],L),length(First, Len1),length(Last, Len1),append(First,Last,L1),!.