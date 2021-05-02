/* 23. To determine whether two positive integer numbers are coprime.
[Two numbers are coprime if their greatest common divisor equals 1.
Example:
?- coprime(35, 64).
true]
*/
:- dynamic find_gcd/3.

are_coprime(X,Y):-find_gcd(X,Y,1).

% Note to self: Lazy implementation, do better.