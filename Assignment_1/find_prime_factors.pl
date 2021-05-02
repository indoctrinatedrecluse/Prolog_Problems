/* 24. To determine the prime factors of a given positive integer.
[Construct a flat list containing the prime factors in ascending order.
Example:
?- prime_factors(315, L).
{L = [3,3,5,7]}
]
*/
:- dynamic is_prime/1.

find_prime_factors(2,[2]).
find_prime_factors(3,[3]).
find_prime_factors(N,[]):-N=<1.
find_prime_factors(N,L):-find_prime_factors(N,2,L).
find_prime_factors(N,Count,[]):-Count>N.
find_prime_factors(N,Count,[Count|Rest]):-Count=<N,O is N/Count,integer(O),is_prime(Count),find_prime_factors(O, Count, Rest).
find_prime_factors(N,Count,L):-Count=<N,N mod Count=\=0,Next is Count+1,find_prime_factors(N, Next, L).
find_prime_factors(N,Count,L):-Count=<N,\+ is_prime(Count),Next is Count+1,find_prime_factors(N, Next, L).

% Note: Could be better implemented I think. Reflect.