/*  Truth tables for logical expressions (3).
    Generalize problem P2 in such a way that the logical expression may contain any number of logical variables.
    Define table/2 in a way that table(List,Expr) prints the truth table for the expression Expr, which contains the logical variables enumerated in List.
    Example:
    ?-table([A,B,C], A and (B or C) equ A and B or A and C).
        true true true true
        true true fail true
        true fail true true
        true fail fail true
        fail true true true
        fail true fail true
        fail fail true true
        fail fail fail true
*/

:- ensure_loaded('Q2.pl').    

% first redefine the table functor to work with a list and an expression
table(Vars_List,Expression):-
    header(Vars_List,Expression),
    bind_var_list(Vars_List),
    print(Vars_List,Expression),
    fail.

% slight modification to bind, pretty straightforward
bind_var_list([]):-
    !.
bind_var_list([V|Vs]):-
    bind(V),
    bind_var_list(Vs).

% same thing for print, only modular
print(Vars_List,Expression):-
    print_var_list(Vars_List),
    print_expression(Expression), nl.

% this is the first part, to print the list of variables
print_var_list([]).
print_var_list([V|Vs]):-
    write(V),
    write('  '),
    print_var_list(Vs).

% handle the expression similarly
print_expression(Expression):-
    Expression,
    !,
    write(true).
print_expression(_):-
    write(fail).