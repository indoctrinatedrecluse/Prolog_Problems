% 30. To delete two middle elements from an even-numbered list L into a list L1.

delete_mid([],[]):-!.
delete_mid(L,"Error: Odd List"):-length(L,Len),Len>0,Len mod 2 =\= 0,!.
delete_mid(L,L1):-length(L,Len),Len1 is Len/2-1,append(First,[Mid1|[Mid2|Last]],L),length(First,Len1),append(First,Last,L1),!.