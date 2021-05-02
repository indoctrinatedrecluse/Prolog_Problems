/* 25. Goldbach's conjecture.
Goldbach's conjecture says that every positive even number greater than 2 is the
sum of two prime numbers. Example: 28 = 5 + 23. It is one of the most famous
facts in number theory that has not been proved to be correct in the general case.
It has been numerically confirmed up to very large numbers (much larger than
we can go with our Prolog system). Write a predicate to find the two prime
numbers that sum up to a given even integer.
[Example:
?- goldbach(28, L).
{L = [5,23]} */
:- dynamic is_prime/1.

goldbach(N,[]):-N<4.
goldbach(4,[2,2]).
goldbach(N,L):-N mod 2=:=0, N>4, goldbach(N,3,L).
goldbach(N,Count,[Count,Complement]):-Count=<N/2,Complement is N-Count,is_prime(Complement).
goldbach(N,Count,L):-Count<N/2,next_count(Count,Next),goldbach(N,Next,L).

next_count(Count,Next):-Next is Count+2,is_prime(Next),!.
next_count(Count,Next):-Next_Intermediate is Count+2,next_count(Next_Intermediate,Next).