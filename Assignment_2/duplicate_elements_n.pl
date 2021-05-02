/* 7, To duplicate the elements of a list a given number of times.
Example:
?- duplicate2([a,b,c],3,X).
{X = [a,a,a,b,b,b,c,c,c]}
What are the results of the goal:
?- duplicate2(X,3,Y). */

duplicate_n(L,N,"Error"):-N<0,!.
duplicate_n(L,0,[]):-!.
duplicate_n(L,1,L):-!.
duplicate_n([],_,[]):-!.
duplicate_n([H|T],N,L1):-multiply(H,N,H_M),duplicate_n(T,N,Rest),!,append(H_M,Rest,L1).
multiply(H,0,[]):-!.
multiply(H,N,[H|Rest]):-N1 is N-1,multiply(H,N1,Rest),!.
append([],L,L):-!.
append([X|Rest],L,[X|L1]):-append(Rest,L,L1),!.