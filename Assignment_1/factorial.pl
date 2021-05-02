% 29. To find N!

factorial(N,"Error"):-N<0,!.
factorial(0,1).
factorial(1,1).
factorial(N,F):-N1 is N-1, factorial(N1,F1), F is F1*N.