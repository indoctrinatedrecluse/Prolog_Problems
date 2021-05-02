% 1.To find factorial N using accumulator.

factorial(0,1):-!.
factorial(1,1):-!.
factorial(N,"Error"):-N<0,!.
factorial(N,X):-N>1, factorial_acc(0,1,N,X).
factorial_acc(N,X,N,X):-!.
factorial_acc(N1,X1,N2,X2):-N3 is N1+1, X3 is N3*X1, !, factorial_acc(N3,X3,N2,X2).