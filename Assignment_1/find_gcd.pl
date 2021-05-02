% 21. To find gcd of two integers.

find_gcd(X,Y,Z):-X<0,!,find_gcd(-X, Y, Z).
find_gcd(X,Y,Z):-Y<0,!,find_gcd(X,-Y,Z).
find_gcd(X,0,X):-X>0.
find_gcd(0,Y,Y):-Y>0.
find_gcd(X,Y,Z):-X>Y,Y>0,X1 is X-Y,find_gcd(Y,X1,Z).
find_gcd(X,Y,Z):-X=<Y,X>0,Y1 is Y-X,find_gcd(X,Y1,Z).