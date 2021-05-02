/*  Truth tables for logical expressions (1).
    Define predicates and/2, or/2, nand/2, nor/2, xor/2, impl/2 and equ/2 (for logical equivalence),
    which succeed or fail according to the result of their respective operations;
    e.g.:
        and(A,B) will succeed,
        if and only if both A and B succeed.
    Note that A and B can be Prolog goals (not only the constants true and fail).
    A logical expression in two variables can then be written in prefix notation, as in the following example:
        and(or(A,B),nand(A,B)).
    Now, write a predicate table/3 which prints the truth table of a given logical expression in two variables.
    Example:
        ?-table(A,B,and(A,or(A,B))).
        true true true
        true fail true
        fail true fail
        fail fail fail
*/

% first defining the various operations

% and indicates both goals must succeed, hence A, B, where comma is the Prolog representation of and
and(A,B):-
    A,
    B,
    !.

% or represents one or both of the goals must succeed, hence if either does, the other is a don't care
or(A,_):-
    A.
or(_,B):-
    B,
    !.

% this is the equivalent to an XNOR gate, see https://en.wikipedia.org/wiki/Logical_equality
equ(A,B):-
    or(and(A,B), and(not(A),not(B))),
    !.

% since equality is xnor in logical gates, xor is the negation of equality
xor(A,B):-
    not(equ(A,B)),
    !.

% negation of or
nor(A,B):-
    not(or(A,B)),
    !.

% negation of and
nand(A,B):-
    not(and(A,B)),
    !.

% implication A->B is equivalent to ~A+B
impl(A,B):-
    or(not(A),B),
    !.

% bind(X) :- instantiate X to be true and false successively (no cuts obviously)
bind(true).
bind(fail).

% format and then print
table(A,B,Expr):-
    N is 2,
    header(N),
    bind(A),
    bind(B),
    print(A,B,Expr),
    fail.

% just to print the column descriptions
header(X):- X =:= 2, write('A     B     Result'), nl,
    !.
header(_):-
    true,
    !.
% the rest of the definitions are used in Q3.pl
header([H|T],_):-
    length(T,N1),
    N is N1+1,
    !,
    header([H|T],1,N).
header([_|T],X,N):-
    X=<N,
    write('V'),
    write(X),
    write('    '),
    X1 is X+1,
    !,
    header(T,X1,N).
header(_,X,N):-
    X =:= N+1,
    write('Result'), nl.

% print function, uses new line adjustments via failure
print(A,B,_) :- write(A), write('  '), write(B), write('  '), fail.
print(_,_,Expr) :- Expr, !, write(true), nl.
print(_,_,_) :- write(fail), nl.