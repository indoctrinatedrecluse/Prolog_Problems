/* 5. To determine whether two lists are of same length using the length predicate
developed in 4 (previous problem). */
:- dynamic length1/2.

same_length_2(L1,L2):-length1(L1,N),length1(L2,N).