% 30. To generate first N Fibonacci numbers.
:- dynamic reverse_list/2.

fibonacci(N,"Error"):-N<0,!.
fibonacci(0,[]).
fibonacci(1,[0]).
fibonacci(2,[0,1]).
fibonacci(N,L):-fibonacci_1(N,L1),reverse_list(L1,L).
fibonacci_1(0,[]).
fibonacci_1(1,[0]).
fibonacci_1(2,[1,0]).
fibonacci_1(N, [New,X,Y|Rest]):-N>2,N1 is N-1,fibonacci_1(N1,[X,Y|Rest]),New is X+Y.

/* Note: Need to check if other implementation of tail recursion improves efficiency. */