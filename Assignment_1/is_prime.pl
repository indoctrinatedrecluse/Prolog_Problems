/* 22. To determine whether a given integer number is prime.
[Example:
?- is_prime(7).
true]
*/

is_prime(2).
is_prime(3).
is_prime(X):-X>3,X mod 2=\=0,prime(X,3),!.
prime(X,Y):-(Y*Y>X -> true;X mod Y =\= 0,Z is Y+2,prime(X,Z)).

is_prime2(P):-modpow(2,P,P,2).
modpow(B, 1, _, R):-!,R=B.
modpow(B, E, M, R):-E mod 2=:=1,!,F is E//2,modpow(B, F, M, H),R is (H^2*B) mod M.
modpow(B, E, M, R):-F is E//2,modpow(B, F, M, H),R is (H^2) mod M.

/* Note: isPrime2 is based on Fermat's Little Theorem and will fail
for Carmichael Numbers, but is way more efficient. I am working on
implementing Lehmer's Theorem/Lucas Primality.*/