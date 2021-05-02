/* 12. 
    One way of representing the positive whole numbers is Prolog terms involving the integer 0 and the successor functor s with one argument.
    Thus, we represent 0 by itself, 1 by s (0), 2 by s (s (0)) and so on.
    Write definitions of standard arithmetic operations addition, multiplication and subtraction, given the above representation of numbers.
    For example, the predicate plus may be defined to exhibit the following behavior.
        ?- plus (s (s (0)), s (s (s (0))), X).
        {X= s (s (s (s (s (0)))))}
    That is, 2+3 = 5.
    Also define the predicate “less than”, “greater than”, “less than equal to” and “greater than equal to”.
    Further define arithmetic operations, like integer division, remainder of integer division, and square root.
*/

% convert from decimal to this system
convert(0,0):-
    !.
convert(N,s(N1)):-
    N2 is N-1,
    convert(N2,N1).

% revert from this system to decimal
revert(0,0):-
    !.
revert(s(N),N1):-
    revert(N,N2),
    N1 is N2+1.

% define the number system
is_natural(N):-
    convert(N,N1),
    is_natural_x(N1).
is_natural_x(0):-
    !.
is_natural_x(s(N)):-
    is_natural_x(N).

% even number
is_even(N):-
    convert(N,N1),
    is_even_x(N1).
is_even_x(0):-
    !.
is_even_x(s(s(N))):-
    is_even_x(N).

% odd number
is_odd(N):-
    convert(N,N1),
    is_odd_x(N1).
is_odd_x(s(0)):-
    !.
is_odd_x(s(s(N))):-
    is_odd_x(N).

% addition
add(X,Y,Result):-
    convert(X,N1),
    convert(Y,N2),
    add_x(N1,N2,Result1),
    revert(Result1,Result).
add_x(0,X,X):-
    !.
add_x(s(X),Y,s(Z)):-
    add_x(X,Y,Z).

% subtraction
subtract(X,Y,Result):-
    convert(X,N1),
    convert(Y,N2),
    is_less_equal_x(N1,N2),
    !,
    subtract(Y,X,Result).
subtract(X,Y,Result):-
    convert(X,N1),
    convert(Y,N2),
    subtract_x(N1,N2,Result1),
    revert(Result1,Result).
subtract_x(X,0,X):-
    !.
subtract_x(s(X),s(Y),Z):-
    subtract_x(X,Y,Z).

% less than or equal to
is_less_equal(X,Y):-
    convert(X,N1),
    convert(Y,N2),
    is_less_equal_x(N1,N2).
is_less_equal_x(0,_):-
    !.
is_less_equal_x(s(X),s(Y)):-
    is_less_equal_x(X,Y).

% greater than or equal to
is_greater_equal(X,Y):-
    convert(X,N1),
    convert(Y,N2),
    is_greater_equal_x(N1,N2).
is_greater_equal_x(_,0):-
    !.
is_greater_equal_x(s(X),s(Y)):-
    is_greater_equal_x(X,Y).

% multiplication
multiply(X,Y,Result):-
    convert(X,N1),
    convert(Y,N2),
    multiply_x(N1,N2,Result1),
    revert(Result1,Result).
multiply_x(0,_,0):-
    !.
multiply_x(_,0,0):-
    !.
multiply_x(s(0),X,X):-
    !.
multiply_x(X,s(0),X):-
    !.
multiply_x(s(X),Y,Result):-
    multiply_x(X,Y,Result1),
    add_x(Result1,Y,Result).

% equal to
is_equal(X,X):-
    !.

% less than
is_less(X,Y):-
    convert(X,N1),
    convert(Y,N2),
    is_less_x(N1,N2).
is_less_x(X,Y):-
    is_less_equal_x(X,Y),
    not(is_equal(X,Y)).

% greater than
is_greater(X,Y):-
    convert(X,N1),
    convert(Y,N2),
    is_greater_x(N1,N2).
is_greater_x(X,Y):-
    is_greater_equal_x(X,Y),
    not(is_equal(X,Y)).

% integer division
divide(_,0,"Error: Zero Quotient"):-
    !.
divide(0,_,0):-
    !.
divide(Dividend,Divisor,Quotient):-
    convert(Dividend,N1),
    convert(Divisor,N2),
    divide_x(N1,N2,0,Quotient1),
    revert(Quotient1,Quotient).
divide_x(Dividend,Divisor,Intermediate,Intermediate):-
    is_less_x(Dividend,Divisor),
    !.
divide_x(Dividend,Divisor,Intermediate,Quotient):-
    subtract_x(Dividend,Divisor,Dividend1),
    add_x(Intermediate,s(0),Intermediate1),
    !,
    divide_x(Dividend1,Divisor,Intermediate1,Quotient).

% remainder of integer division
remainder(_,0,"Error: Zero Quotient"):-
    !.
remainder(0,_,0):-
    !.
remainder(Dividend,Divisor,Remainder):-
    convert(Dividend,N1),
    convert(Divisor,N2),
    remainder_x(N1,N2,Remainder1),
    revert(Remainder1,Remainder).
remainder_x(Dividend,Divisor,Dividend):-
    is_less_x(Dividend,Divisor),
    !.
remainder_x(Dividend,Divisor,Remainder):-
    subtract_x(Dividend,Divisor,Dividend1),
    !,
    remainder_x(Dividend1,Divisor,Remainder).

% square root (floored off to nearest integer)
square(X,Result):-
    convert(X,N1),
    square_x(N1,Result1),
    revert(Result1,Result).
square_x(X,Result):-
    multiply_x(X,X,Result).
square_root(X,Result):-
    convert(X,N1),
    square_root_x(N1,0,Result1),
    revert(Result1,Result).
square_root_x(X,Intermediate,Intermediate):-
    square_x(Intermediate,Sq1),
    is_less_equal_x(Sq1,X),
    add_x(Intermediate,s(0),Intermediate1),
    square_x(Intermediate1,Sq2),
    is_greater_x(Sq2,X),
    !.
square_root_x(X,Intermediate,Result):-
    add_x(Intermediate,s(0),Intermediate1),
    !,
    square_root_x(X,Intermediate1,Result).